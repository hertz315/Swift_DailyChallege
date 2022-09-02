//
//  ViewController.swift
//  MusicApp
//
//  Created by Hertz on 8/28/22.
//

import UIKit

class ViewController: UIViewController {
    
    // 1
    @IBOutlet weak var musicTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 3
    func setupTableView() {
        musicTableView.dataSource = self
        musicTableView.delegate = self
    }
    
}

