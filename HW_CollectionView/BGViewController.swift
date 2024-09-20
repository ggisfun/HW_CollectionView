//
//  BGViewController.swift
//  HW_CollectionView
//
//  Created by Adam Chen on 2024/9/18.
//

import UIKit

class BGViewController: UIViewController {

    @IBOutlet weak var moneyImageView: UIImageView!
    var moneyData : Rich!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        moneyImageView.image = UIImage(named: moneyData.image)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
