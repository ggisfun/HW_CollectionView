//
//  BGHCollectionViewController.swift
//  HW_CollectionView
//
//  Created by Adam Chen on 2024/9/18.
//

import UIKit

//private let reuseIdentifier = "Cell"

class BGHCollectionViewController: UICollectionViewController {

    var moneyArray = (0...4).map { Rich(name: "財富自由\($0)", image: "pic\($0)") }
    
    func configureCellSize() {
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        flowLayout?.itemSize = collectionView.bounds.size
        flowLayout?.estimatedItemSize = .zero
        flowLayout?.minimumInteritemSpacing = 0
        flowLayout?.minimumLineSpacing = 0
        
    }
    
    func setupDataForInfiniteScroll() {
        let firstItem = moneyArray.first!
        let lastItem = moneyArray.last!
        moneyArray.insert(lastItem, at: 0)
        moneyArray.append(firstItem)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDataForInfiniteScroll()
        configureCellSize()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .top, animated: false)
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
    
        // Configure the cell
        let moneyItem = moneyArray[indexPath.item]
        var backgroundConfiguration = UIBackgroundConfiguration.listCell()
        backgroundConfiguration.image = UIImage(named: moneyItem.image)
        backgroundConfiguration.imageContentMode = .scaleAspectFit
        cell.backgroundConfiguration = backgroundConfiguration
    
        return cell
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        if page == moneyArray.count - 1 {
            scrollView.contentOffset.x = scrollView.bounds.width
        } else if page == 0 {
            scrollView.contentOffset.x = CGFloat(moneyArray.count - 2) * scrollView.bounds.width
        }
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
