//
//  MoneyViewController.swift
//  HW_CollectionView
//
//  Created by Adam Chen on 2024/9/18.
//

import UIKit

class MoneyViewController: UIViewController {

    @IBOutlet weak var moneyImageView: UIImageView!
    var moneyData : Rich!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        moneyImageView.image = UIImage(named: moneyData.image)
    }
    

}
