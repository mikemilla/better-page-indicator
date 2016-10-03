//
//  PagingViewController.swift
//  BetterPagingIndicator
//
//  Created by Michael Miller on 10/2/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import BetterPagingIndicator

class PagingViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: Constants
    let PageCell:String = "PageCollectionViewCell"

    // MARK: Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var betterPagingIndicatorView: BetterPagingIndicatorView!
    
    // MARK: View Delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fixes View Controller constraint issue
        edgesForExtendedLayout = .None

        // Set Collection View Styles
        // I did all of these here so you could see how I set them up, but you can set these in XIB if you'd like as well
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .Horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.pagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.registerNib(UINib(nibName: PageCell, bundle:nil), forCellWithReuseIdentifier: PageCell)
        
        // Sync BetterPagingIndicator with UICollectionView
        betterPagingIndicatorView.scrollView = collectionView
    }

    // MARK: Collection View Delegates
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // Get Cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(PageCell, forIndexPath: indexPath) as! PageCollectionViewCell
        
        // Set Cell Styles
        cell.label.text = String(indexPath.row)
        
        // Return Cell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }

}
