//
//  First_1ViewController.swift
//  NavigationBar&TapBar_Code
//
//  Created by Hertz on 8/25/22.
//

import UIKit

class First_1ViewController: UIViewController {
    
    // 로그인 여부
    var isLogin = false
    
    // FB1 버튼 속성 설정
    lazy var fb1: UIButton = {
        let fb1 = UIButton()
        fb1.setTitle("FB1", for: .normal)
        fb1.setTitleColor(.white, for: .normal)
        fb1.backgroundColor = .black
        fb1.addTarget(self, action: #selector(fb1ButtonTapped), for: .touchUpInside)
        return fb1
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        makeButtonUI()
        makeButtonUI()
        makeNavigationUI()
        
        // ⭐️ 로그인이 되어있지 않다면 로그인화면 띄우기
        if !isLogin {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }

    }
    
    
    
    func makeButtonUI() {
        view.addSubview(fb1)
        fb1.snp.makeConstraints {
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
        title = "First-1"
    }
    
    @objc func fb1ButtonTapped() {
        navigationController?.pushViewController(First_2ViewController(), animated: true)
    }

}
