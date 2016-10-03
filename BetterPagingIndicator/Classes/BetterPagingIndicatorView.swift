//
//  BetterPagingIndicatorView.swift
//  MikeMilla.com
//
//  Created by Michael Miller on 7/8/16.
//  Copyright © 2016 Michael Miller. All rights reserved.
//

import UIKit

@IBDesignable
public class BetterPagingIndicatorView: UIView {
    
    // Syncing View
    // Must be set in order for paging to work
    public var scrollView:UIScrollView? {
        didSet {
            
            // Check for nil setting
            if let scrollView = self.scrollView {
                
                // Set observer to listen to scrollview offset changes
                scrollView.addObserver(self, forKeyPath: contentOffset, options: .New, context: nil)
            }
        }
    }
    
    // MARK: Constants
    let contentOffset = "contentOffset"
    
    // MARK: Views
    private var containerView:UIView = UIView()
    private let indicatorCircle:UIView = UIView()
    
    // MARK: Inspectables
    @IBInspectable var numberOfDots:Int = 3
    @IBInspectable var dotHeight:CGFloat = 8
    @IBInspectable var dotColor:UIColor = UIColor.grayColor()
    @IBInspectable var dotStrokeWidth:CGFloat = 2
    @IBInspectable var distanceBetweenDots:CGFloat = 6
    @IBInspectable var indicatorColor:UIColor = UIColor.blackColor()
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
         initialization()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
         initialization()
    }
    
    private func initialization() {
        opaque = false
        backgroundColor = UIColor.clearColor()
        userInteractionEnabled = false
    }
    
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)
        setupView()
    }
    
    // MARK: Build View
    private func setupView() {
        
        // Setup Container View Size
        let dots = CGFloat(numberOfDots)
        containerView = UIView(frame: CGRectMake(0, 0, (dotHeight * dots) + (distanceBetweenDots * (dots - 1)), dotHeight))
        containerView.center = CGPointMake(bounds.width / 2, dotHeight / 2)
        addSubview(containerView)
        
        // Add the dots
        for i in 0...numberOfDots - 1 {
            let index:CGFloat = CGFloat(i)
            let dot:UIView = UIView(frame: CGRectMake((index * dotHeight) + (index * distanceBetweenDots), 0, dotHeight, dotHeight))
            dot.layer.cornerRadius = dot.frame.width / 2
            dot.layer.borderColor = dotColor.CGColor
            dot.layer.borderWidth = dotStrokeWidth
            dot.backgroundColor = UIColor.clearColor()
            containerView.addSubview(dot)
        }
        
        // Add the indicator
        indicatorCircle.frame = CGRectMake(0, 0, dotHeight, dotHeight)
        indicatorCircle.layer.cornerRadius = dotHeight / 2
        indicatorCircle.backgroundColor = indicatorColor
        if (!subviews.contains(indicatorCircle)) {
            containerView.addSubview(indicatorCircle)
        }
    }
    
    // MARK: IBDesignable Settings
    override public func intrinsicContentSize() -> CGSize {
        super.invalidateIntrinsicContentSize()
        return CGSize(
            width: (dotHeight * CGFloat(numberOfDots)) + (distanceBetweenDots * (CGFloat(numberOfDots) - 1)),
            height: dotHeight)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.clearColor()
    }
    
    // MARK: Handle Scroll Offset Changes
    public override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        // Should always be the content offset observer, but we'll check anyway
        if (keyPath == contentOffset) {
            if let scrollView = self.scrollView {
                syncIndicatorIndex(scrollView)
            }
        }
    }
    
    // MARK: Changes View
    private func syncIndicatorIndex(scrollView: UIScrollView) {
        let percentage = scrollView.contentOffset.x / (scrollView.contentSize.width - scrollView.frame.width)
        let calc = (containerView.frame.size.width - indicatorCircle.frame.width) * percentage
        if (calc > 0 && calc <= containerView.frame.width - indicatorCircle.frame.width) {
            indicatorCircle.frame.origin.x = calc
        }
    }
}
