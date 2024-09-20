//
//  MoneyCollectionViewController.swift
//  HW_CollectionView
//
//  Created by Adam Chen on 2024/9/17.
//

import UIKit

struct Rich {
    let name: String
    let image: String
}

class MoneyCollectionViewController: UICollectionViewController {

    let moneyArray = (0...20).map { Rich(name: "財富自由\($0)", image: "pic\($0)") }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCellSize()
    }
    
    
    @IBSegueAction func showMoneyImg(_ coder: NSCoder) -> MoneyViewController? {
        guard let item = collectionView.indexPathsForSelectedItems?.first?.item else {return nil}
        let controller = MoneyViewController(coder: coder)
        controller?.moneyData = moneyArray[item]
        
        return controller
    }
    
    func configureCellSize() {
        let itemSpace: Double = 4
        let columnCount: Double = 3
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        let width = floor((collectionView.bounds.width - itemSpace * (columnCount-1)) / columnCount)
        flowLayout?.itemSize = CGSize(width: width, height: width)
        flowLayout?.estimatedItemSize = .zero
        flowLayout?.minimumInteritemSpacing = itemSpace
        flowLayout?.minimumLineSpacing = itemSpace
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return moneyArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoneyCollectionViewCell.reuseIdentifier, for: indexPath) as! MoneyCollectionViewCell
        let moneyItem = moneyArray[indexPath.item]
        cell.moneyImageView.image = UIImage(named: moneyItem.image)
        
        return cell
    }

}
