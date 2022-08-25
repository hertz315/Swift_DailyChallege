//
//  ViewController.swift
//  NavigationBar&TapBar_Code
//
//  Created by Hertz on 8/25/22.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .black
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        makeLoginButtonUI()
    }
    
    func makeLoginButtonUI() {
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints {
            // 크기
            $0.width.equalTo(120)
            $0.height.equalTo(50)
            // 위치
            $0.center.equalTo(self.view)
        }
    }
    
    // 버튼 누르면 동작하는 코드 ===> 로그인하면, 디스미스 (탭바가 더 아래에 깔려있음)
    @objc func loginButtonTapped() {
        dismiss(animated: true)
    }
    
}



