//
//  ViewController.swift
//  0824DailyChallenge
//
//  Created by Hertz on 8/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var backButtonContainerView: UIView!
    
    @IBOutlet weak var backButtonImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var numberView: UIView!
    
    @IBOutlet weak var numberView2: UIView!
    
    @IBOutlet weak var numberView3: UIView!
    
    @IBOutlet weak var numberView4: UIView!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var numberLabel2: UILabel!
    
    @IBOutlet weak var numberLabel3: UILabel!
    
    @IBOutlet weak var numberLabel4: UILabel!
    
    @IBOutlet weak var bottomButton: UIButton!
    
    @IBOutlet weak var leadingLabel: UILabel!
    

    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackButton()
        setupTitleLabel()
        setupNumberLabel()
        setupButton()
        setupBottomLabel()
    }
    
    // MARK: - Setting
    func setupBackButton() {
        backButtonImage.image = UIImage(named: "Vector")
        backButtonImage.contentMode = .scaleAspectFit
        // 이미지 패딩 처리
        backButtonImage.image = UIImage(named: "Vector")?.withAlignmentRectInsets(UIEdgeInsets(top: -13, left: -13, bottom: -13, right: -13))
                
        backButtonContainerView.clipsToBounds = true
        backButtonContainerView.layer.cornerRadius = 12
        backButtonContainerView.layer.borderWidth = 1
        backButtonContainerView.layer.borderColor = UIColor.systemGray5.cgColor
        
    }
    
    func setupTitleLabel() {
        titleLabel.font = UIFont(name: "Urbanist", size: 30)
        titleLabel.text = "OTP Verification"
        titleLabel.textColor = .black
        
        subtitleLabel.font = UIFont(name: "Urbanist", size: 16)
        subtitleLabel.text = "Enter the verification code we just sent on your\nemail address."
        subtitleLabel.textColor = .systemGray5
    }
    
    func setupNumberLabel() {
        // 넘버 레이블 보더
        numberView.layer.borderWidth = 1.2
        numberView.layer.borderColor = UIColor.green.cgColor
        numberView.layer.cornerRadius = 8
        numberView.clipsToBounds = true
        numberView.backgroundColor = .systemGray6
        
        numberView2.layer.borderWidth = 1.2
        numberView2.layer.borderColor = UIColor.green.cgColor
        numberView2.layer.cornerRadius = 8
        numberView2.clipsToBounds = true
        numberView2.backgroundColor = .systemGray6
        
        numberView3.layer.borderWidth = 1.2
        numberView3.layer.borderColor = UIColor.green.cgColor
        numberView3.layer.cornerRadius = 8
        numberView3.clipsToBounds = true
        numberView3.backgroundColor = .systemGray6
        
        numberView4.layer.borderWidth = 1.2
        numberView4.layer.borderColor = UIColor.green.cgColor
        numberView4.layer.cornerRadius = 8
        numberView4.clipsToBounds = true
        numberView4.backgroundColor = .systemGray6
        
        // 넘버 레이블 숫자
        numberLabel.font = UIFont(name: "Urbanist", size: 22)
        numberLabel.text = "5"
        
        numberLabel2.font = UIFont(name: "Urbanist", size: 22)
        numberLabel2.text = "1"
        
        numberLabel3.font = UIFont(name: "Urbanist", size: 22)
        numberLabel3.text = "3"
        
        numberLabel4.font = UIFont(name: "Urbanist", size: 22)
        numberLabel4.text = ""
    }
    
    func setupButton() {
        bottomButton.backgroundColor = .gray
        bottomButton.setTitleColor(.white, for: .normal)
        bottomButton.setTitle("Verify", for: .normal)
        
        // 보더
        bottomButton.layer.cornerRadius = 8
        bottomButton.clipsToBounds = true
    }
    
    func setupBottomLabel() {
    
        leadingLabel.text = "Didn’t received code? Resend"
        leadingLabel.font = UIFont(name: "Urbanist", size: 15)
        
        let attributedString = NSMutableAttributedString(string: leadingLabel.text!)
        attributedString.addAttribute(.foregroundColor, value: UIColor.green, range: (leadingLabel.text! as NSString).range(of:"Resend"))
        leadingLabel.attributedText = attributedString
       
    }
    
    
}

// RGB 컬러 16진수로 만드는 익스텐션
public extension UIColor {
  convenience init(r: Int, g: Int, b: Int, a: CGFloat) {
    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)
  }
  
  convenience init(hex: Int) {
    self.init(r: (hex & 0xff0000) >> 16, g: (hex & 0xff00) >> 8, b: (hex & 0xff), a: 1)
  }
}


//#if DEBUG
//
//import SwiftUI
//
//struct ViewControllerPresentable: UIViewControllerRepresentable {
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//    }
//    func makeUIViewController(context: Context) -> some UIViewController {
//        ViewController()
//    }
//
//
//    struct ViewConrollerPresentable_PreviewProvider: PreviewProvider {
//        static var previews: some View {
//            ViewControllerPresentable()
//                .previewDevice("iPhone 12 mini")
//        }
//    }
//}
//
//#endif
