//
//  Third_1ViewController.swift
//  NavigationBar&TapBar_Code
//
//  Created by Hertz on 8/25/22.
//

import UIKit

class Third_1ViewController: UIViewController {
    
    // SB1 버튼 속성 설정
    lazy var tb1: UIButton = {
        let tb1 = UIButton()
        tb1.setTitle("TB1", for: .normal)
        tb1.setTitleColor(.white, for: .normal)
        tb1.backgroundColor = .black
        tb1.addTarget(self, action: #selector(tb1ButtonTapped), for: .touchUpInside)
        return tb1
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        makeButtonUI()
        makeButtonUI()
        makeNavigationUI()

    }
    
    func makeButtonUI() {
        view.addSubview(tb1)
        tb1.snp.makeConstraints {
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
        title = "Third-1"
    }

    @objc func tb1ButtonTapped() {
        self.navigationController?.pushViewController(Third_2ViewController(), animated: true)
    }
}
