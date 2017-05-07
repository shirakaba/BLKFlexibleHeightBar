//
//  FacebookStyleBar.swift
//  BLKFlexibleHeightBarSwiftDemo
//
//  Created by rabzu on 09/04/2015.
//  Copyright (c) 2015 Weshapp. All rights reserved.
//

import Foundation
import BLKFlexibleHeightBar

//Required, to make objc code work with swift
extension BLKDelegateSplitter: UITableViewDelegate{
    
}

class FacebookStyleBar: BLKFlexibleHeightBar{
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    
//     self.setUp()
//    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
     self.setUp()
        
    }

    fileprivate func setUp(){
        
        // Configure bar appearence
        self.maximumBarHeight = 105.0;
        self.minimumBarHeight = 20.0;
        self.backgroundColor = UIColor(red: 0.31, green: 0.42, blue: 0.64, alpha: 1)
        self.clipsToBounds = true
        
        
        // Add blue bar view
        let blueBarView = UIView()
        blueBarView.backgroundColor = self.backgroundColor
        
        let initialBlueBarLayoutAttributes =  BLKFlexibleHeightBarSubviewLayoutAttributes()
        initialBlueBarLayoutAttributes.frame = CGRect(x: 0.0, y: 25.0, width: self.frame.size.width, height: 40.0)
        initialBlueBarLayoutAttributes.zIndex = 1023
        blueBarView.add(initialBlueBarLayoutAttributes, forProgress:0.0)
        blueBarView.add(initialBlueBarLayoutAttributes, forProgress:40.0/(105.0-20.0))
        
        let finalBlueBarLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existing: initialBlueBarLayoutAttributes)
        finalBlueBarLayoutAttributes?.transform = CGAffineTransform(translationX: 0.0, y: -40.0)
        blueBarView.add(initialBlueBarLayoutAttributes, forProgress:1.0)
        
        self.addSubview(blueBarView)
        
        
        // Add search field and close button
        let searchField = UITextField()
        searchField.layer.cornerRadius = 5.0

        searchField.attributedPlaceholder = NSAttributedString(string: "Search",
                                                           attributes:[NSForegroundColorAttributeName: UIColor(red: 0.31, green: 0.42, blue: 0.64, alpha: 1)])
    
    
        searchField.backgroundColor = UIColor(red: 0.22, green: 0.27, blue: 0.46, alpha: 1)
        searchField.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
        
        let initialSearchFieldLayoutAttributes =  BLKFlexibleHeightBarSubviewLayoutAttributes()
        initialSearchFieldLayoutAttributes.frame = CGRect(x: 8.0, y: 25.0, width: initialBlueBarLayoutAttributes.size.width * 0.85, height: initialBlueBarLayoutAttributes.size.height-8.0)
        initialSearchFieldLayoutAttributes.zIndex = 1024
        searchField.add(initialSearchFieldLayoutAttributes, forProgress:0.0)
        searchField.add(initialSearchFieldLayoutAttributes, forProgress:40.0 / (105.0 - 20.0))
        
        let finalSearchFieldLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existing: initialSearchFieldLayoutAttributes)
        finalSearchFieldLayoutAttributes?.transform = CGAffineTransform(translationX: 0.0, y: -0.3 * (105 - 20))
        finalSearchFieldLayoutAttributes?.alpha = 0.0
        
        searchField.add(finalSearchFieldLayoutAttributes, forProgress:0.8)
        searchField.add(finalSearchFieldLayoutAttributes, forProgress:1.0)
        
        self.addSubview(searchField)
        
        
        // Add white bar view
        let whiteBarView = UIView()
        whiteBarView.backgroundColor = UIColor.white
        
         let initialWhiteBarLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes();
        initialWhiteBarLayoutAttributes.frame = CGRect(x: 0.0, y: 65.0, width: self.frame.size.width, height: 40.0)
        whiteBarView.add(initialWhiteBarLayoutAttributes, forProgress:0.0)
        
        let finalWhiteBarLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existing: initialWhiteBarLayoutAttributes)
        finalWhiteBarLayoutAttributes?.transform = CGAffineTransform(translationX: 0.0, y: -40.0)
        whiteBarView.add(finalWhiteBarLayoutAttributes, forProgress:40.0/(105.0 - 20.0))
        
        self.addSubview(whiteBarView)
        
        // Configure white bar view subviews

        let bottomBorderView = UIView(frame: CGRect(x: 0.0, y: initialWhiteBarLayoutAttributes.size.height - 0.5, width: initialWhiteBarLayoutAttributes.size.width, height: 0.5))
        bottomBorderView.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.78, alpha: 1)
        
        whiteBarView.addSubview(bottomBorderView)
        
       let leftVerticalDividerView = UIView(frame: CGRect(x: initialWhiteBarLayoutAttributes.size.width * 0.334, y: initialWhiteBarLayoutAttributes.size.height*0.1, width: 0.5, height: initialWhiteBarLayoutAttributes.size.height * 0.8))
        leftVerticalDividerView.backgroundColor = UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1)
        whiteBarView.addSubview(leftVerticalDividerView)
        
       let rightVerticalDividerView = UIView(frame: CGRect(x: initialWhiteBarLayoutAttributes.size.width * 0.667,
                                                               y: initialWhiteBarLayoutAttributes.size.height * 0.1, width: 0.5, height: initialWhiteBarLayoutAttributes.size.height*0.8))
        rightVerticalDividerView.backgroundColor = UIColor(red: 0.85, green: 0.86, blue: 0.88, alpha: 1)
        whiteBarView.addSubview(rightVerticalDividerView)

    }
    
   
}
