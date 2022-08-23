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
    
    @IBOutlet weak var minusImage: UIImageView!
    
    @IBOutlet weak var plusImage: UIImageView!
    
    @IBOutlet weak var countView: UIView!
    
    @IBOutlet weak var promotionCodeLabel: UILabel!
    
    @IBOutlet weak var applyLabel: UILabel!
    
    @IBOutlet weak var totalLabel1: UILabel!
    
    @IBOutlet weak var totalLabel2: UILabel!
    
    @IBOutlet weak var totalLabel3: UILabel!
    
    @IBOutlet weak var totalLabel4: UILabel!
    
    @IBOutlet weak var priceLabel1: UILabel!
    
    @IBOutlet weak var priceLabel2: UILabel!
    
    @IBOutlet weak var priceLabel3: UILabel!
    
    @IBOutlet weak var priceLabel4: UILabel!
    
    @IBOutlet weak var checkoutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigationBar()
    }

    func setupNavigationBar() {
        // backLabel
        backLabel.text = "Order Summary"
        backLabel.textColor = UIColor(red: 0.33/255, green: 0.69/255, blue: 0.46/255, alpha: 1)
        
        backLabel.font = UIFont(name: "Nunito", size: 17)
        
    }
    
}

//
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
//            .previewDevice("iPhone 12 mini")
//    }
//}
//
//#endif
