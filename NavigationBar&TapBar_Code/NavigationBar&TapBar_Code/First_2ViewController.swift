//
//  First_2ViewController.swift
//  NavigationBar&TapBar_Code
//
//  Created by Hertz on 8/25/22.
//

import UIKit

class First_2ViewController: UIViewController {
    
    
    // FB1 버튼 속성 설정
    lazy var fb2: UIButton = {
        let fb2 = UIButton()
        fb2.setTitle("FB2", for: .normal)
        fb2.setTitleColor(.white, for: .normal)
        fb2.backgroundColor = .black
        fb2.addTarget(self, action: #selector(fb2ButtonTapped), for: .touchUpInside)
        return fb2
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        makeButtonUI()
        makeButtonUI()
        makeNavigationUI()

    }
    
    func makeButtonUI() {
        view.addSubview(fb2)
        fb2.snp.makeConstraints {
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
        appearance.backgroundColor = .systemGreen
        // 네비게이션바 투명으로 하는 설정
        //appearance.configureWithTransparentBackground()
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        // 네비게이션바 타이틀
        title = "First-2"
    }
    
    @objc func fb2ButtonTapped() {
        self.navigationController?.pushViewController(First_3ViewController(), animated: true)
    }

}

