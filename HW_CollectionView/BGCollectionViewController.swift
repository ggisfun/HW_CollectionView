//
//  BGCollectionViewController.swift
//  HW_CollectionView
//
//  Created by Adam Chen on 2024/9/18.
//

import UIKit

class BGCollectionViewController: UICollectionViewController {

    let moneyArray = (0...20).map { Rich(name: "財富自由\($0)", image: "pic\($0)") }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureCellSize()
    }
    
    @IBSegueAction func showMoneyImg(_ coder: NSCoder) -> BGViewController? {
        guard let item = collectionView.indexPathsForSelectedItems?.first?.item else {return nil}
        let controller = BGViewController(coder: coder)
        controller?.moneyData = moneyArray[item]
        
        return controller
    }
    func configureCellSize() {
        let itemSpace: CGFloat = 3
        let columnCount: CGFloat = 3
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        let moneyItem = moneyArray[indexPath.item]
        var backgroundConfiguration = UIBackgroundConfiguration.listCell()
        backgroundConfiguration.image = UIImage(named: moneyItem.image)
        backgroundConfiguration.imageContentMode = .scaleAspectFill
        //backgroundConfiguration.cornerRadius = 20
        backgroundConfiguration.cornerRadius = .random(in: 1...30)
        //backgroundConfiguration.strokeWidth = 3
        backgroundConfiguration.strokeWidth = .random(in: 1...10)
        //backgroundConfiguration.strokeColor = .black
        backgroundConfiguration.strokeColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        backgroundConfiguration.backgroundInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        cell.backgroundConfiguration = backgroundConfiguration
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
