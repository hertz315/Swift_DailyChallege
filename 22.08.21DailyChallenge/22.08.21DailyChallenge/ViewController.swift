//
//  ViewController.swift
//  22.08.21DailyChallenge
//
//  Created by Hertz on 8/21/22.
//

import UIKit

final class ViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var paypalButton: UIButton!
    
    @IBOutlet weak var visaButton: UIButton!
    
    @IBOutlet weak var masterButton: UIButton!
    
    @IBOutlet weak var dinersButton: UIButton!
    
    @IBOutlet weak var amexButton: UIButton!
    
    @IBOutlet weak var cardholderNameLabel: UILabel!
    
    @IBOutlet weak var cardholderNameTextField: UITextField!
    
    @IBOutlet weak var cardNumberLabel: UILabel!
    
    @IBOutlet weak var cardNumberTextField: UITextField!
    

    @IBOutlet weak var expMonthView: UIView!
    
    @IBOutlet weak var expYearView: UIView!
    
    @IBOutlet weak var cvcView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTextField()
        setupView()
    }


    
    func setupTextField() {
        // 텍스트 필드 색깔 지정
        cardholderNameTextField.backgroundColor = UIColor.dividerLight1Px60
        cardNumberTextField.backgroundColor = UIColor.dividerLight1Px60
        
        // 텍스트 필드 플레이스 홀더 구현
        cardholderNameTextField.placeholder = "Tiana Rosser"
        cardNumberTextField.placeholder = "**** **** **** 3947"
    }
    
    func setupView() {
        expMonthView.layer.borderColor = UIColor.border.cgColor
        expMonthView.layer.borderWidth = 1
        expYearView.layer.borderColor = UIColor.border.cgColor
        expYearView.layer.borderWidth = 1
        cvcView.layer.borderColor = UIColor.border.cgColor
        cvcView.layer.borderWidth = 1
    }
    
}

