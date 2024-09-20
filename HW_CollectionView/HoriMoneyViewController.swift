//
//  HoriMoneyViewController.swift
//  HW_CollectionView
//
//  Created by Adam Chen on 2024/9/18.
//

import UIKit

class HoriMoneyViewController: UIViewController {

    
    @IBOutlet weak var HoriMoneyCollectionView: UICollectionView!
    
    var moneyArray = [
        Rich(name: "財富自由0", image: "pic0"),
        Rich(name: "財富自由1", image: "pic1"),
        Rich(name: "財富自由2", image: "pic2"),
        Rich(name: "財富自由3", image: "pic3"),
        Rich(name: "財富自由4", image: "pic4")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupDataForInfiniteScroll()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        HoriMoneyCollectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .top, animated: false)
    }
    
    func setupDataForInfiniteScroll() {
        let firstName = moneyArray.first!
        let lastName = moneyArray.last!
        moneyArray.insert(lastName, at: 0)
        moneyArray.append(firstName)
    }

}

extension HoriMoneyViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moneyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HoriMoneyCollectionViewCell.reuseIdentifier, for: indexPath) as! HoriMoneyCollectionViewCell
        let moneyItem = moneyArray[indexPath.item]
        cell.moneyImageView.image = UIImage(named: moneyItem.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
}

extension HoriMoneyViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        if page == moneyArray.count - 1 {
            scrollView.contentOffset.x = scrollView.bounds.width
        } else if page == 0 {
            scrollView.contentOffset.x = CGFloat(moneyArray.count - 2) * scrollView.bounds.width
        }
    }
    
}
