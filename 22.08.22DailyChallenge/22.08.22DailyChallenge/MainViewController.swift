//
//  ViewController.swift
//  22.08.22DailyChallenge
//
//  Created by Hertz on 8/21/22.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBAction func codeButtonTapped(_ sender: Any) {
        // 뷰컨트롤러 생성
        let codeVC = UIViewController()
        // 뷰 백그라운드 컬러 생성
        codeVC.view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        // 네비게이션 바 타이틀 지정
        codeVC.title = "Order Summary"
        
        // 화면넘길수 있게 생성
        navigationController?.pushViewController(codeVC, animated: true)
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

