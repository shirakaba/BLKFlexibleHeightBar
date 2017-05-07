//
//  SquareCashStyleBar.swift
//  BLKFlexibleHeightBarSwiftDemo
//
//  Created by rabzu on 09/04/2015.
//  Copyright (c) 2015 Weshapp. All rights reserved.
//

import Foundation
import BLKFlexibleHeightBar

class SquareCashStyleBar: BLKFlexibleHeightBar{
    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        self.setUp()
//    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
     }
    
    fileprivate func setUp(){
        // Configure bar appearence
        self.maximumBarHeight = 200.0
        self.minimumBarHeight = 65.0
        self.backgroundColor = UIColor(red:0.17, green:0.63, blue:0.11, alpha:1)
        
        // Add and configure name label
        let nameLabel = UILabel()
        nameLabel.font = UIFont(name: "System", size: 22)
        nameLabel.textColor = UIColor.white
        nameLabel.text = "Bryan Keller"
        
        
        let initialNameLabelLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes()
        initialNameLabelLayoutAttributes.size = nameLabel.sizeThatFits(CGSize.zero)
        initialNameLabelLayoutAttributes.center = CGPoint(x: self.frame.size.width*0.5, y: self.maximumBarHeight-50.0)
        nameLabel.add(initialNameLabelLayoutAttributes,forProgress:0.0)
        
        let midwayNameLabelLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existing: initialNameLabelLayoutAttributes)
        midwayNameLabelLayoutAttributes?.center = CGPoint(x: self.frame.size.width*0.5, y: (self.maximumBarHeight-self.minimumBarHeight)*0.4+self.minimumBarHeight-50.0)
        nameLabel.add(midwayNameLabelLayoutAttributes, forProgress:0.6)
        
        let finalNameLabelLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existing: midwayNameLabelLayoutAttributes)
        finalNameLabelLayoutAttributes?.center = CGPoint(x: self.frame.size.width*0.5, y: self.minimumBarHeight-25.0)
        nameLabel.add(finalNameLabelLayoutAttributes, forProgress:1.0)
        
        self.addSubview(nameLabel)
        
        // Add and configure profile image
        let profileImageView = UIImageView(image: UIImage(named: "ProfilePicture.png"))
        profileImageView.contentMode = UIViewContentMode.scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 35.0
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.borderColor = UIColor.white.cgColor
        
        let initialProfileImageViewLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes()
        initialProfileImageViewLayoutAttributes.size = CGSize(width: 70.0, height: 70.0)
        initialProfileImageViewLayoutAttributes.center = CGPoint(x: self.frame.size.width*0.5, y: self.maximumBarHeight-110.0)
        profileImageView.add(initialProfileImageViewLayoutAttributes, forProgress:0.0)
        
        let midwayProfileImageViewLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existing: initialProfileImageViewLayoutAttributes)
        midwayProfileImageViewLayoutAttributes?.center = CGPoint(x: self.frame.size.width*0.5, y: (self.maximumBarHeight-self.minimumBarHeight)*0.8+self.minimumBarHeight-110.0)
        profileImageView.add(midwayProfileImageViewLayoutAttributes, forProgress:0.2)
        
       let finalProfileImageViewLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existing: midwayProfileImageViewLayoutAttributes)
        finalProfileImageViewLayoutAttributes?.center = CGPoint(x: self.frame.size.width*0.5, y: (self.maximumBarHeight-self.minimumBarHeight)*0.64+self.minimumBarHeight-110.0)
        finalProfileImageViewLayoutAttributes?.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        finalProfileImageViewLayoutAttributes?.alpha = 0.0
        profileImageView.add(finalProfileImageViewLayoutAttributes, forProgress:0.5)
        
        self.addSubview(profileImageView)
        
       
    }
    
}
