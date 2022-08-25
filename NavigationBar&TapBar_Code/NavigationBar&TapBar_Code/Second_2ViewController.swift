//
//  Second_2ViewController.swift
//  NavigationBar&TapBar_Code
//
//  Created by Hertz on 8/25/22.
//

import UIKit

class Second_2ViewController: UIViewController {
    
    // SB1 버튼 속성 설정
    lazy var sb2: UIButton = {
        let sb2 = UIButton()
        sb2.setTitle("SB2", for: .normal)
        sb2.setTitleColor(.white, for: .normal)
        sb2.backgroundColor = .black
        sb2.addTarget(self, action: #selector(sb2ButtonTapped), for: .touchUpInside)
        return sb2
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        makeButtonUI()
        makeButtonUI()
        makeNavigationUI()

    }
    
    func makeButtonUI() {
        view.addSubview(sb2)
        sb2.snp.makeConstraints {
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
        appearance.backgroundColor = .systemRed
        // 네비게이션바 투명으로 하는 설정
        //appearance.configureWithTransparentBackground()
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        // 네비게이션바 타이틀
        title = "Second-2"
    }
    
    @objc func sb2ButtonTapped() {
        self.navigationController?.pushViewController(Second_3ViewController(), animated: true)
    }

}
