//
//  ViewController.swift
//  findMyMovie
//
//  Created by Hertz on 8/29/22.
//

import UIKit

class MovieViewController: UIViewController, UISearchControllerDelegate {
    
    // 🍎 테이블 뷰 생성
    @IBOutlet weak var movieTableView: UITableView!
    
    // 🍎 (네트워크매니저) 에 접근할수 있는 변수(통로)
    var networkManager = NetworkManager.shared

    // 🍎 (영화 데이터를 다루기 위해) 빈배열로 생성
    var movieList: [Movie] = []
    
    // 🍎 서치 Results컨트롤러 ⭐️
    let searchController = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController)
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        setupDatas()
    }
    
    // MARK: - setupSearchBar
    // 🍎 서치바 설정
    func setupSearchBar() {
        // 네비게이션 타이틀
        self.title = "Movie Search"
        // 네비게이션 컨트롤러를 만들었으면 네비게이션 아이템에 할당(서치바 생성후 할당)
        navigationItem.searchController = searchController
        // ⭐️ 서치바 사용하기 위해선 델리게이트 선언해줘야 한다(대리자 설정)
        searchController.searchBar.delegate = self
        
        // 🍎 서치(결과)컨트롤러의 사용 (복잡한 구현 가능)
        //     ==> 글자마다 검색 기능 + 새로운 화면을 보여주는 것도 가능 ⭐️
        searchController.searchResultsUpdater = self
        
        // 🍎 이걸 안해주면 첫글자를 입력할때 대문자로 입력된다
        searchController.searchBar.autocapitalizationType = .none
        
    }

    // MARK: - setupTableView
    // 🍎 테이블뷰 설정
    func setupTableView() {
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        // 🍎 Nib파일을 사용한다면 등록의 과정이 필요
        // 쎌을 등록해야 디큐 가능하다
        movieTableView.register(UINib(nibName: Cell.movieCellIdentifier, bundle: nil), forCellReuseIdentifier: Cell.movieCellIdentifier)
        
    }
    
    // MARK: - setupDatas
    // 🍎 초기화면에 보여질 데이터 셋업
    func setupDatas() {
        // 네트워킹의 시작
        networkManager.fetchMovie(queryValue: "lego") { result in
            print(#function)
            switch result {
            case .success(let movieDatas):
                // 데이터(배열)을 받아오고 난 후
                // 빈배열에 네트워킹을 통해 받은 데이터를 할당
                self.movieList = movieDatas
                // ⭐️⭐️⭐️테이블뷰 리로드 -> UI를 다시 그리는거는 메인쓰레드에서 처리해야한다⭐️⭐️⭐️
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}


// MARK: - UITableViewDataSource
extension MovieViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 쎌을 구성
        // ⭐️타입 캐스팅 필수⭐️
        let cell = movieTableView.dequeueReusableCell(withIdentifier: Cell.movieCellIdentifier, for: indexPath) as! MovieCell
        
        cell.image = movieList[indexPath.row].image
        cell.actorNameLabel.text = movieList[indexPath.row].actor
        cell.movieTitleLabel.text = movieList[indexPath.row].title
        cell.directorNameLabel.text = movieList[indexPath.row].director
        cell.userRatingLabel.text = movieList[indexPath.row].userRating
        
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension MovieViewController: UITableViewDelegate {

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120
//    }
    
    // 테이블뷰 셀의 높이를 유동적으로 조절하고 싶다면 구현할 수 있는 메서드
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

// MARK: - UISearchBarDelegate
// 서치바 사용하기 위해서 필요요소
extension MovieViewController: UISearchBarDelegate {
    
    // 서치바에서 글자가 하나하나 입력할때마다 호출되는 메서드
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        // 네트워크를 시작할때  빈 배열로 만들기
        self.movieList = []

        // 네트워킹 시작
        networkManager.fetchMovie(queryValue: searchText) { result in
            switch result {
            case .success(let movieDatas):
                self.movieList = movieDatas
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }
    
}

//MARK: -  UISearchResultsUpdating
// 🍎 서치바를 사용하기 위해서는 UISearchResultsUpdating 을 채택해야한다
// 🍎 검색하는 동안 (새로운 화면을 보여주는) 복잡한 내용 구현 가능
extension MovieViewController: UISearchResultsUpdating {
    // 유저가 글자를 입력하는 순간마다 호출되는 메서드 ===> 일반적으로 다른 화면을 보여줄때 구현
    func updateSearchResults(for searchController: UISearchController) {
        print("서치바에 입력되는 단어", searchController.searchBar.text ?? "")
        // 글자를 치는 순간에 다른 화면을 보여주고 싶다면 (컬렉션뷰를 보여줌)
        let vc = searchController.searchResultsController as! SearchResultViewController
        // 컬렉션뷰에 찾으려는 단어 전달
        vc.searchQueryValue = searchController.searchBar.text ?? ""
    }
}
