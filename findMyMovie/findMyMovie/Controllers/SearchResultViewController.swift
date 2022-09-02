//
//  SearchResultViewController.swift
//  findMyMovie
//
//  Created by Hertz on 8/29/22.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    // 🍏 컬렉션뷰 연결 (테이블뷰와 유사)
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 🍏 컬렉션뷰의 모든 레이아웃을 담당하는 객체
    let flowLayout = UICollectionViewFlowLayout()
    
    // 🍏 네트워크 매니저 (싱글톤)
    let networkManager = NetworkManager.shared
    
    // 🍏 데이터를 다루기 위한 Movie타입 배열
    var movieList: [Movie] = []
    
    
    
    var searchQueryValue: String? {
        didSet {
            setupDatas()
        }
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        // 🍎 Nib파일을 사용한다면 등록의 과정이 필요
        // 쎌을 등록해야 디큐 가능하다
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: Cell.movieCollectionViewCellIdentifier)

    }

    // MARK: - setupCollectionView
    func setupCollectionView() {
        
        collectionView.dataSource = self
        
        // 🍏 컬렉션뷰의 백그라운드 컬러
        
        // 🍏 스크롤 방향
        flowLayout.scrollDirection = .vertical
        
        // 🍏 아이템 가로 사이즈 = 스크린 사이즈 - (쎌 사이 공간 * (컬럼 수 - 1)) / 컬럼 수
        let collectionCellWidth = (UIScreen.main.bounds.width - CVCell.spacingWidth * (CVCell.cellColumns - 1)) / CVCell.cellColumns
        
        // 🍏 아이템 사이즈
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        
        // 🍏 아이템 사이 간격 설정
        flowLayout.minimumInteritemSpacing = CVCell.spacingWidth
        
        // 🍏 아이템 위아래 사이 간격 설정
        flowLayout.minimumLineSpacing = CVCell.spacingWidth
        
        // 🍏 (중요) 컬렉션뷰의 속성에 할당 ⭐️
        collectionView.collectionViewLayout = flowLayout
        
    }
    
    // MARK: - setupDatas
    func setupDatas() {
        
        // 🍏 옵셔널 바인딩
        guard let queryValue = searchQueryValue else { return }
        print("네트워킹 시작 단어 \(queryValue)")
        
        // 🍏 (네트워킹 시작전에) 다시 빈배열로 만들기
        self.movieList = []
        
        // 🍏 네트워킹 시작 (찾고자하는 단어를 가지고)
        networkManager.fetchMovie(queryValue: queryValue) { result in
            switch result {
            case .success(let movieDatas):
                // 🍏 결과를 배열에 담고
                self.movieList = movieDatas
                // 🍏 컬렉션뷰를 리로드 (메인쓰레드에서) ⭐️
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension SearchResultViewController: UICollectionViewDataSource {
    
    // 🍏
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 🍏
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.movieCollectionViewCellIdentifier, for: indexPath) as! MovieCollectionViewCell
        
        
        cell.image = movieList[indexPath.item].image
        
        return cell
    }
    
}
