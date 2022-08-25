//
//  Second_3ViewController.swift
//  NavigationBar&TapBar_Code
//
//  Created by Hertz on 8/25/22.
//

import UIKit

class Second_3ViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        makeNavigationUI()

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
        title = "Second-3"
    }

}
