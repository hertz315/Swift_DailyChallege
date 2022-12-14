//
//  ViewController.swift
//  0823Challenge
//
//  Created by Hertz on 8/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var navigationgTitle: UILabel!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    
    @IBOutlet weak var detailMiddleLabel: UILabel!
    
    @IBOutlet weak var detailPriceLabel: UILabel!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var detailProfileView: UIView!
    
    @IBOutlet weak var minusImage: UIImageView!
    
    @IBOutlet weak var plusBorder: UIView!
    
    @IBOutlet weak var minusBorder: UIView!
    
    @IBOutlet weak var plusImage: UIImageView!
    
    @IBOutlet weak var countView: UIView!
    
    @IBOutlet weak var promotionCodeLabel: UILabel!
    
    @IBOutlet weak var promotionTextFiled: UITextField!
    
    @IBOutlet weak var totalLabel1: UILabel!
    
    @IBOutlet weak var totalLabel2: UILabel!
    
    @IBOutlet weak var totalLabel3: UILabel!
    
    @IBOutlet weak var totalLabel4: UILabel!
    
    @IBOutlet weak var priceLabel1: UILabel!
    
    @IBOutlet weak var priceLabel2: UILabel!
    
    @IBOutlet weak var priceLabel3: UILabel!
    
    @IBOutlet weak var priceLabel4: UILabel!
    
    @IBOutlet weak var checkoutButton: UIButton!
    
    @IBOutlet weak var promoStackView: UIStackView!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var aaplyButton: UIButton!
    
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupBackgroundColor()
        setupdetailProfile()
        setupPromotionCode()
        setupTextField()
        setupTotalLabel()
        setupBottomButton()
        setupBottomSheet()
        setupPromoStackView()
    }
    
    // MARK: - Setting
    func setupNavigationBar() {
        // backLabel
        backLabel.text = "Back"
        backLabel.font = UIFont(name: "Nunito", size: 17)
        backLabel.textColor = UIColor.systemGreen
        
        // navigationBarTitle
        navigationgTitle.text = "Order Summary"
        navigationgTitle.font = UIFont(name: "Nunito", size: 17)
        
    }
    
    func setupBackgroundColor() {
        self.view.backgroundColor = UIColor.systemGray3
    }
    
    func setupdetailProfile() {
        // ????????? ????????? ?????? ?????? -> (??????????????? ??????)
        detailProfileView.backgroundColor = .systemGray6
        detailProfileView.clipsToBounds = true
        detailProfileView.layer.cornerRadius = 8
        
        // profile ?????????
        mainImage.image = UIImage(named: "profile")
        
        // puls, minus, count ??????
        plusBorder.clipsToBounds = true
        plusBorder.layer.cornerRadius = 8
        plusBorder.backgroundColor = .systemGray5
        
        minusBorder.clipsToBounds = true
        minusBorder.layer.cornerRadius = 8
        minusBorder.backgroundColor = .systemGray5
        
        countView.clipsToBounds = true
        countView.layer.cornerRadius = 8
        
        // ?????? ?????? ?????????
        // MARK: - ????????? ?????? ??????
        plusBorder.addSubview(plusImage)
        plusImage.image = UIImage(named: "?????????")?.withAlignmentRectInsets(UIEdgeInsets(top: -8, left: -8, bottom: -8, right: -8))
        
        minusImage.image = UIImage(named: "????????????")?.withAlignmentRectInsets(UIEdgeInsets(top: -12, left: -12, bottom: -12, right: -12))
    }
    
    func setupPromotionCode() {
        promotionCodeLabel.font = UIFont(name: "Nunito", size: 17)
    }
    
    func setupBottomSheet() {
        // ????????????
        // ????????? ?????? ?????? ????????? ??? ????????? ??????
        bottomView.clipsToBounds = true
        bottomView.layer.cornerRadius = 20
        bottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    // ???????????????
    func setupTextField() {
        promotionTextFiled.layer.cornerRadius = 8
        promotionTextFiled.clipsToBounds = true
        promotionTextFiled.attributedPlaceholder = NSAttributedString(
            string: "Entre Promo Code",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
    }
    
    // ???????????????
    func setupTotalLabel() {
        totalLabel1.textColor = .gray
        totalLabel2.textColor = .gray
        totalLabel3.textColor = .gray
        totalLabel4.textColor = .gray
    }
    
    func setupBottomButton() {
        checkoutButton.clipsToBounds = true
        checkoutButton.layer.cornerRadius = 8
        checkoutButton.setTitleColor(.white, for: .normal)
        checkoutButton.backgroundColor = .systemGreen
    }
    
    func setupPromoStackView() {
        promoStackView.layer.cornerRadius = 8
        promoStackView.clipsToBounds = true
        promoStackView.layer.borderWidth = 1
        promoStackView.layer.borderColor = UIColor.systemGray3.cgColor
        
        inputTextField.layer.borderWidth = 0
        inputTextField.borderStyle = .none
        inputTextField.textRect(forBounds: CGRect(x: 17, y: 17, width: 17, height: 17))
        
        aaplyButton.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 30)
        
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
    //}
    //
    //struct ViewConrollerPresentable_PreviewProvider: PreviewProvider {
    //    static var previews: some View {
    //        ViewControllerPresentable()
    //            .previewDevice("iPhone 13 mini")
    //
    //    }
    //}
    //
    //#endif




class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 17,
        left: 17,
        bottom: 17,
        right: 17
    )

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}



