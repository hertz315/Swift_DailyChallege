//
//  ViewController.swift
//  0824DailyChallenge_Code
//
//  Created by Hertz on 8/24/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var backButtonImage:  UIImageView = {
        let backButtonImage = UIImageView()
        backButtonImage.image = UIImage(named: "Vector")
        return backButtonImage
    }()
    
    // MARK: - ViewDidLoad
    // 앱이 실행되면 데이터를 메모리에 올려주는 역할을 한
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setupOutoLayout()
    }
    
    func setupOutoLayout() {
        // MARK: -  backButton 설정
        // backButtonContainerView
        let backButtonContainerView = UIView()
        backButtonContainerView.layer.cornerRadius = 8
        backButtonContainerView.layer.borderWidth = 1
        backButtonContainerView.layer.borderColor = UIColor.systemGray3.cgColor
        backButtonContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        // backButtonImage
        let backButtonImage = UIImageView(image: UIImage(named: "Vector"))
        backButtonImage.translatesAutoresizingMaskIntoConstraints = false
        backButtonImage.image = UIImage(named: "Vector")?.withAlignmentRectInsets(UIEdgeInsets(top: -13, left: -13, bottom: -13, right: -13))
        
        // MARK: - titleStack 설정
        // titleLabelStack
        let titleLabelStack = UIStackView()
        titleLabelStack.alignment = .leading
        titleLabelStack.axis = .vertical
        titleLabelStack.distribution = .fillEqually
        titleLabelStack.spacing = 10
        titleLabelStack.translatesAutoresizingMaskIntoConstraints = false
        
        // titleLabel
        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        titleLabel.text = "OTP Verification"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // subtitleLabel
        let subtitleLabel = UILabel()
        subtitleLabel.textColor = .systemGray3
        subtitleLabel.font = UIFont.systemFont(ofSize: 16)
        subtitleLabel.text = "Enter the verification code we just sent on your\nemail address."
        subtitleLabel.numberOfLines = 0
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - numberStack 설정
        // numberStack
        let numberStack = UIStackView()
        numberStack.axis = .horizontal
        numberStack.alignment = .fill
        numberStack.distribution = .fillEqually
        numberStack.spacing = 17
        numberStack.translatesAutoresizingMaskIntoConstraints = false
        
        // numberView
        let numberView0 = UIView()
        numberView0.layer.borderWidth = 1.2
        numberView0.clipsToBounds = true
        numberView0.layer.cornerRadius = 8
        numberView0.layer.borderColor = UIColor.green.cgColor
        numberView0.translatesAutoresizingMaskIntoConstraints = false
        
        // numberView
        let numberView1 = UIView()
        numberView1.layer.borderWidth = 1.2
        numberView1.clipsToBounds = true
        numberView1.layer.cornerRadius = 8
        numberView1.layer.borderColor = UIColor.green.cgColor
        numberView1.translatesAutoresizingMaskIntoConstraints = false
        
        // numberView2
        let numberView2 = UIView()
        numberView2.layer.borderWidth = 1.2
        numberView2.clipsToBounds = true
        numberView2.layer.cornerRadius = 8
        numberView2.layer.borderColor = UIColor.green.cgColor
        numberView2.translatesAutoresizingMaskIntoConstraints = false
        
        // numberView3
        let numberView3 = UIView()
        numberView3.layer.borderWidth = 1.2
        numberView3.clipsToBounds = true
        numberView3.layer.cornerRadius = 8
        numberView3.layer.borderColor = UIColor.green.cgColor
        numberView3.translatesAutoresizingMaskIntoConstraints = false
        
        // numberLabel0
        let numberLabel0 = UILabel()
        numberLabel0.text = "5"
        numberLabel0.textColor = .black
        numberLabel0.font = UIFont.systemFont(ofSize: 22)
        numberLabel0.translatesAutoresizingMaskIntoConstraints = false
        
        // numberLabel0
        let numberLabel1 = UILabel()
        numberLabel1.text = "1"
        numberLabel1.textColor = .black
        numberLabel1.font = UIFont.systemFont(ofSize: 22)
        numberLabel1.translatesAutoresizingMaskIntoConstraints = false
        
        // numberLabel0
        let numberLabel2 = UILabel()
        numberLabel2.text = "3"
        numberLabel2.textColor = .black
        numberLabel2.font = UIFont.systemFont(ofSize: 22)
        numberLabel2.translatesAutoresizingMaskIntoConstraints = false
        
        // numberLabel3
        let numberLabel3 = UILabel()
        numberLabel3.text = ""
        numberLabel3.textColor = .black
        numberLabel3.font = UIFont.systemFont(ofSize: 22)
        numberLabel3.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - button 설정
        
        // button
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .darkGray
        button.setTitle("Verify", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - 바텀레이블 설정
        
        // bottomLabel
        let bottomLabel = UILabel()
        bottomLabel.text = "Didn’t received code? Resend"
        bottomLabel.textColor = .black
        bottomLabel.font = UIFont(name: "Urbanist", size: 15)
        bottomLabel.textAlignment = .center
        
        let attributedString = NSMutableAttributedString(string: bottomLabel.text!)
        attributedString.addAttribute(.foregroundColor, value: UIColor.green, range: (bottomLabel.text! as NSString).range(of:"Resend"))
        bottomLabel.attributedText = attributedString
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        // MARK: - addSubView
        
        // 백버튼
        self.view.addSubview(backButtonContainerView)
        backButtonContainerView.addSubview(backButtonImage)
        // 타이틀
        self.view.addSubview(titleLabelStack)
        titleLabelStack.addArrangedSubview(titleLabel)
        titleLabelStack.addArrangedSubview(subtitleLabel)
        // 넘버버튼
        self.view.addSubview(numberStack)
        numberStack.addArrangedSubview(numberView0)
        numberStack.addArrangedSubview(numberView1)
        numberStack.addArrangedSubview(numberView2)
        numberStack.addArrangedSubview(numberView3)
        numberView0.addSubview(numberLabel0)
        numberView1.addSubview(numberLabel1)
        numberView2.addSubview(numberLabel2)
        numberView3.addSubview(numberLabel3)
        // Verify 버튼
        self.view.addSubview(button)
        // 바텀레이블
        self.view.addSubview(bottomLabel)
        
        // MARK: - backButtonContainView 오토레이아웃
        
        NSLayoutConstraint.activate([
            // 크기
            backButtonContainerView.heightAnchor.constraint(equalToConstant: 41),
            backButtonContainerView.widthAnchor.constraint(equalToConstant: 41),
            // 위치
            backButtonContainerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22),
            backButtonContainerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 56),
        ])
        
        // backButtonImage
        NSLayoutConstraint.activate([
            // 크기
            backButtonImage.heightAnchor.constraint(equalToConstant: 41),
            backButtonImage.widthAnchor.constraint(equalToConstant: 41),
            
            // 위치
            backButtonImage.centerXAnchor.constraint(equalTo: backButtonContainerView.centerXAnchor),
            backButtonContainerView.centerYAnchor.constraint(equalTo: backButtonContainerView.centerYAnchor),
            backButtonImage.topAnchor.constraint(equalTo: backButtonContainerView.topAnchor),
            backButtonImage.leadingAnchor.constraint(equalTo: backButtonContainerView.leadingAnchor)
        ])
        
        // MARK: - title 오토레이아웃
        
        // 타이틀 스택 라벨
        NSLayoutConstraint.activate([
            // 위치
            titleLabelStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22),
            titleLabelStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -22),
            titleLabelStack.topAnchor.constraint(equalTo: backButtonContainerView.bottomAnchor, constant: 28)
        ])
        
        // 타이틀 라벨
        
        // MARK: - 넘버 오토레이아웃
        NSLayoutConstraint.activate([
            // 위치
            numberStack.topAnchor.constraint(equalTo: titleLabelStack.bottomAnchor, constant: 32),
            numberStack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22),
            numberStack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -22)
        ])
        
        NSLayoutConstraint.activate([
            numberView0.widthAnchor.constraint(equalToConstant: 70),
            numberView0.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            
            numberLabel0.centerXAnchor.constraint(equalTo: numberView0.centerXAnchor),
            numberLabel0.centerYAnchor.constraint(equalTo: numberView0.centerYAnchor),
            
            numberLabel1.centerXAnchor.constraint(equalTo: numberView1.centerXAnchor),
            numberLabel1.centerYAnchor.constraint(equalTo: numberView1.centerYAnchor),
            
            numberLabel2.centerXAnchor.constraint(equalTo: numberView2.centerXAnchor),
            numberLabel2.centerYAnchor.constraint(equalTo: numberView2.centerYAnchor),
            
            numberLabel3.centerXAnchor.constraint(equalTo: numberView3.centerXAnchor),
            numberLabel3.centerYAnchor.constraint(equalTo: numberView3.centerYAnchor),
        ])
        
        // MARK: - 버튼 오토레이아웃
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: numberStack.bottomAnchor, constant: 38),
            button.leadingAnchor.constraint(equalTo: titleLabelStack.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: titleLabelStack.trailingAnchor)
        ])
        
        // MARK: - 바텀레이블 오토레이아웃
        NSLayoutConstraint.activate([
            bottomLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22),
            bottomLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -22),
            bottomLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -26),
        ])
    }
}


#if DEBUG
import SwiftUI

struct TestVCRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct TestPreviewProvider: PreviewProvider {
    static var previews: some View {
        TestVCRepresentable()
    }
}
#endif

extension ViewController {
    static func setupOutoLayout() {
        
    }
}
