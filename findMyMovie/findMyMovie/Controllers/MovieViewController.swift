//
//  ViewController.swift
//  findMyMovie
//
//  Created by Hertz on 8/29/22.
//

import UIKit

class MovieViewController: UIViewController, UISearchControllerDelegate {
    
    // ๐ ํ์ด๋ธ ๋ทฐ ์์ฑ
    @IBOutlet weak var movieTableView: UITableView!
    
    // ๐ (๋คํธ์ํฌ๋งค๋์ ) ์ ์ ๊ทผํ ์ ์๋ ๋ณ์(ํต๋ก)
    var networkManager = NetworkManager.shared

    // ๐ (์ํ ๋ฐ์ดํฐ๋ฅผ ๋ค๋ฃจ๊ธฐ ์ํด) ๋น๋ฐฐ์ด๋ก ์์ฑ
    var movieList: [Movie] = []
    
    // ๐ ์์น Results์ปจํธ๋กค๋ฌ โญ๏ธ
    let searchController = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController)
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupTableView()
        setupDatas()
    }
    
    // MARK: - setupSearchBar
    // ๐ ์์น๋ฐ ์ค์ 
    func setupSearchBar() {
        // ๋ค๋น๊ฒ์ด์ ํ์ดํ
        self.title = "Movie Search"
        // ๋ค๋น๊ฒ์ด์ ์ปจํธ๋กค๋ฌ๋ฅผ ๋ง๋ค์์ผ๋ฉด ๋ค๋น๊ฒ์ด์ ์์ดํ์ ํ ๋น(์์น๋ฐ ์์ฑํ ํ ๋น)
        navigationItem.searchController = searchController
        // โญ๏ธ ์์น๋ฐ ์ฌ์ฉํ๊ธฐ ์ํด์  ๋ธ๋ฆฌ๊ฒ์ดํธ ์ ์ธํด์ค์ผ ํ๋ค(๋๋ฆฌ์ ์ค์ )
        searchController.searchBar.delegate = self
        
        // ๐ ์์น(๊ฒฐ๊ณผ)์ปจํธ๋กค๋ฌ์ ์ฌ์ฉ (๋ณต์กํ ๊ตฌํ ๊ฐ๋ฅ)
        //     ==> ๊ธ์๋ง๋ค ๊ฒ์ ๊ธฐ๋ฅ + ์๋ก์ด ํ๋ฉด์ ๋ณด์ฌ์ฃผ๋ ๊ฒ๋ ๊ฐ๋ฅ โญ๏ธ
        searchController.searchResultsUpdater = self
        
        // ๐ ์ด๊ฑธ ์ํด์ฃผ๋ฉด ์ฒซ๊ธ์๋ฅผ ์๋ ฅํ ๋ ๋๋ฌธ์๋ก ์๋ ฅ๋๋ค
        searchController.searchBar.autocapitalizationType = .none
        
    }

    // MARK: - setupTableView
    // ๐ ํ์ด๋ธ๋ทฐ ์ค์ 
    func setupTableView() {
        movieTableView.dataSource = self
        movieTableView.delegate = self
        
        // ๐ Nibํ์ผ์ ์ฌ์ฉํ๋ค๋ฉด ๋ฑ๋ก์ ๊ณผ์ ์ด ํ์
        // ์์ ๋ฑ๋กํด์ผ ๋ํ ๊ฐ๋ฅํ๋ค
        movieTableView.register(UINib(nibName: Cell.movieCellIdentifier, bundle: nil), forCellReuseIdentifier: Cell.movieCellIdentifier)
        
    }
    
    // MARK: - setupDatas
    // ๐ ์ด๊ธฐํ๋ฉด์ ๋ณด์ฌ์ง ๋ฐ์ดํฐ ์์
    func setupDatas() {
        // ๋คํธ์ํน์ ์์
        networkManager.fetchMovie(queryValue: "lego") { result in
            print(#function)
            switch result {
            case .success(let movieDatas):
                // ๋ฐ์ดํฐ(๋ฐฐ์ด)์ ๋ฐ์์ค๊ณ  ๋ ํ
                // ๋น๋ฐฐ์ด์ ๋คํธ์ํน์ ํตํด ๋ฐ์ ๋ฐ์ดํฐ๋ฅผ ํ ๋น
                self.movieList = movieDatas
                // โญ๏ธโญ๏ธโญ๏ธํ์ด๋ธ๋ทฐ ๋ฆฌ๋ก๋ -> UI๋ฅผ ๋ค์ ๊ทธ๋ฆฌ๋๊ฑฐ๋ ๋ฉ์ธ์ฐ๋ ๋์์ ์ฒ๋ฆฌํด์ผํ๋คโญ๏ธโญ๏ธโญ๏ธ
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
        // ์์ ๊ตฌ์ฑ
        // โญ๏ธํ์ ์บ์คํ ํ์โญ๏ธ
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
    
    // ํ์ด๋ธ๋ทฐ ์์ ๋์ด๋ฅผ ์ ๋์ ์ผ๋ก ์กฐ์ ํ๊ณ  ์ถ๋ค๋ฉด ๊ตฌํํ  ์ ์๋ ๋ฉ์๋
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}

// MARK: - UISearchBarDelegate
// ์์น๋ฐ ์ฌ์ฉํ๊ธฐ ์ํด์ ํ์์์
extension MovieViewController: UISearchBarDelegate {
    
    // ์์น๋ฐ์์ ๊ธ์๊ฐ ํ๋ํ๋ ์๋ ฅํ ๋๋ง๋ค ํธ์ถ๋๋ ๋ฉ์๋
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        // ๋คํธ์ํฌ๋ฅผ ์์ํ ๋  ๋น ๋ฐฐ์ด๋ก ๋ง๋ค๊ธฐ
        self.movieList = []

        // ๋คํธ์ํน ์์
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
// ๐ ์์น๋ฐ๋ฅผ ์ฌ์ฉํ๊ธฐ ์ํด์๋ UISearchResultsUpdating ์ ์ฑํํด์ผํ๋ค
// ๐ ๊ฒ์ํ๋ ๋์ (์๋ก์ด ํ๋ฉด์ ๋ณด์ฌ์ฃผ๋) ๋ณต์กํ ๋ด์ฉ ๊ตฌํ ๊ฐ๋ฅ
extension MovieViewController: UISearchResultsUpdating {
    // ์ ์ ๊ฐ ๊ธ์๋ฅผ ์๋ ฅํ๋ ์๊ฐ๋ง๋ค ํธ์ถ๋๋ ๋ฉ์๋ ===> ์ผ๋ฐ์ ์ผ๋ก ๋ค๋ฅธ ํ๋ฉด์ ๋ณด์ฌ์ค๋ ๊ตฌํ
    func updateSearchResults(for searchController: UISearchController) {
        print("์์น๋ฐ์ ์๋ ฅ๋๋ ๋จ์ด", searchController.searchBar.text ?? "")
        // ๊ธ์๋ฅผ ์น๋ ์๊ฐ์ ๋ค๋ฅธ ํ๋ฉด์ ๋ณด์ฌ์ฃผ๊ณ  ์ถ๋ค๋ฉด (์ปฌ๋ ์๋ทฐ๋ฅผ ๋ณด์ฌ์ค)
        let vc = searchController.searchResultsController as! SearchResultViewController
        // ์ปฌ๋ ์๋ทฐ์ ์ฐพ์ผ๋ ค๋ ๋จ์ด ์ ๋ฌ
        vc.searchQueryValue = searchController.searchBar.text ?? ""
    }
}
