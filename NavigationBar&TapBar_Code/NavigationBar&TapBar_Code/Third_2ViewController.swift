//
//  Third_3ViewController.swift
//  NavigationBar&TapBar_Code
//
//  Created by Hertz on 8/25/22.
//

import UIKit

class Third_2ViewController: UIViewController {
    
    // SB1 버튼 속성 설정
    lazy var tb2: UIButton = {
        let tb2 = UIButton()
        tb2.setTitle("TB2", for: .normal)
        tb2.setTitleColor(.white, for: .normal)
        tb2.backgroundColor = .black
        tb2.addTarget(self, action: #selector(tb2ButtonTapped), for: .touchUpInside)
        return tb2
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        makeButtonUI()
        makeButtonUI()
        makeNavigationUI()

    }
    
    func makeButtonUI() {
        view.addSubview(tb2)
        tb2.snp.makeConstraints {
            // 크기
            $0.width.equalTo(120)
            $0.height.equalTo(50)
            // 위치
            $0.center.equalTo(self.view)
        }

    }
    
    func makeNavigationUI() {
        // 네비게이션바 설정
        let appearance = UINavigationBarAppearance()
        // 네비게이션바 불투명으로 설정
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        // 네비게이션바 투명으로 하는 설정
        //appearance.configureWithTransparentBackground()
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        // 네비게이션바 타이틀
        title = "Third-2"
    }
    
    @objc func tb2ButtonTapped() {
        navigationController?.pushViewController(Third_3ViewController(), animated: true)
    }

}
