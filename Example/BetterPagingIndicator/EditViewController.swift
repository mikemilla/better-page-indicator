//
//  EditViewController.swift
//  BetterPagingIndicator
//
//  Created by Michael Miller on 10/2/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    // MARK: Variables
    var pagingViewController:PagingViewController? = nil

    // MARK: Outlets
    @IBOutlet weak var pageCountLabel: UILabel!
    
    // MARK: Actions
    @IBAction func removePageButton(sender: AnyObject) {
        
        // Prevent user from going below 1
        if (pagingViewController!.pages.count - 1 <= 0) {
            return
        }
        
        pagingViewController?.getPageColors(pagingViewController!.pages.count - 1)
        pageCountLabel.text = String(pagingViewController!.pages.count)
    }
    
    @IBAction func addPageButton(sender: AnyObject) {
        pagingViewController?.getPageColors(pagingViewController!.pages.count + 1)
        pageCountLabel.text = String(pagingViewController!.pages.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Catch Nil View Controller
        if (pagingViewController == nil) {
            print("pagingViewController is nil. Must be set for things to work")
            return
        }
        
        // Set Views
        pageCountLabel.text = String(pagingViewController!.pages.count)
    }

}
