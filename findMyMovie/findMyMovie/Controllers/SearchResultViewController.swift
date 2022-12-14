//
//  SearchResultViewController.swift
//  findMyMovie
//
//  Created by Hertz on 8/29/22.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    // π μ»¬λ μλ·° μ°κ²° (νμ΄λΈλ·°μ μ μ¬)
    @IBOutlet weak var collectionView: UICollectionView!
    
    // π μ»¬λ μλ·°μ λͺ¨λ  λ μ΄μμμ λ΄λΉνλ κ°μ²΄
    let flowLayout = UICollectionViewFlowLayout()
    
    // π λ€νΈμν¬ λ§€λμ  (μ±κΈν€)
    let networkManager = NetworkManager.shared
    
    // π λ°μ΄ν°λ₯Ό λ€λ£¨κΈ° μν Movieνμ λ°°μ΄
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
        
        // π NibνμΌμ μ¬μ©νλ€λ©΄ λ±λ‘μ κ³Όμ μ΄ νμ
        // μμ λ±λ‘ν΄μΌ λν κ°λ₯νλ€
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: Cell.movieCollectionViewCellIdentifier)

    }

    // MARK: - setupCollectionView
    func setupCollectionView() {
        
        collectionView.dataSource = self
        
        // π μ»¬λ μλ·°μ λ°±κ·ΈλΌμ΄λ μ»¬λ¬
        
        // π μ€ν¬λ‘€ λ°©ν₯
        flowLayout.scrollDirection = .vertical
        
        // π μμ΄ν κ°λ‘ μ¬μ΄μ¦ = μ€ν¬λ¦° μ¬μ΄μ¦ - (μ μ¬μ΄ κ³΅κ° * (μ»¬λΌ μ - 1)) / μ»¬λΌ μ
        let collectionCellWidth = (UIScreen.main.bounds.width - CVCell.spacingWidth * (CVCell.cellColumns - 1)) / CVCell.cellColumns
        
        // π μμ΄ν μ¬μ΄μ¦
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        
        // π μμ΄ν μ¬μ΄ κ°κ²© μ€μ 
        flowLayout.minimumInteritemSpacing = CVCell.spacingWidth
        
        // π μμ΄ν μμλ μ¬μ΄ κ°κ²© μ€μ 
        flowLayout.minimumLineSpacing = CVCell.spacingWidth
        
        // π (μ€μ) μ»¬λ μλ·°μ μμ±μ ν λΉ β­οΈ
        collectionView.collectionViewLayout = flowLayout
        
    }
    
    // MARK: - setupDatas
    func setupDatas() {
        
        // π μ΅μλ λ°μΈλ©
        guard let queryValue = searchQueryValue else { return }
        print("λ€νΈμνΉ μμ λ¨μ΄ \(queryValue)")
        
        // π (λ€νΈμνΉ μμμ μ) λ€μ λΉλ°°μ΄λ‘ λ§λ€κΈ°
        self.movieList = []
        
        // π λ€νΈμνΉ μμ (μ°Ύκ³ μνλ λ¨μ΄λ₯Ό κ°μ§κ³ )
        networkManager.fetchMovie(queryValue: queryValue) { result in
            switch result {
            case .success(let movieDatas):
                // π κ²°κ³Όλ₯Ό λ°°μ΄μ λ΄κ³ 
                self.movieList = movieDatas
                // π μ»¬λ μλ·°λ₯Ό λ¦¬λ‘λ (λ©μΈμ°λ λμμ) β­οΈ
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
    
    // π
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // π
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.movieCollectionViewCellIdentifier, for: indexPath) as! MovieCollectionViewCell
        
        
        cell.image = movieList[indexPath.item].image
        
        return cell
    }
    
}
