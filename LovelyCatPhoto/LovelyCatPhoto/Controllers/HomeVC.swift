//
//  ViewController.swift
//  LovelyCatPhoto
//
//  Created by Hertz on 9/2/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: MyCollectionTableViewCell.className, bundle: nil), forCellReuseIdentifier: MyCollectionTableViewCell.cellId)
        
    }

    
}


extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
