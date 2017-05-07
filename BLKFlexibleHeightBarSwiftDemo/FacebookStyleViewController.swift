//
//  FacebookStyleViewController.swift
//  BLKFlexibleHeightBarSwiftDemo
//
//  Created by rabzu on 09/04/2015.
//  Copyright (c) 2015 Weshapp. All rights reserved.
//

import UIKit
import BLKFlexibleHeightBar

class FacebookStyleViewController: UIViewController, UITableViewDataSource {

    fileprivate var myCustomBar: FacebookStyleBar?
    fileprivate var delegateSplitter: BLKDelegateSplitter?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNeedsStatusBarAppearanceUpdate()
        
        self.myCustomBar = FacebookStyleBar(frame:CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: 100.0))
        
        let behaviorDefiner = FacebookStyleBarBehaviorDefiner()
        behaviorDefiner.addSnappingPositionProgress(0.0, forProgressRangeStart:0.0, end:40.0/(105.0 - 20.0))
        behaviorDefiner.addSnappingPositionProgress(1.0, forProgressRangeStart:40.0 / (105.0 - 20.0), end: 1.0)
        behaviorDefiner.isSnappingEnabled = true
        behaviorDefiner.thresholdNegativeDirection = 140.0
        
        self.myCustomBar?.behaviorDefiner = behaviorDefiner
        
        //Assigns to delegates
        self.delegateSplitter = BLKDelegateSplitter(firstDelegate: behaviorDefiner, secondDelegate: self)
        self.tableView.delegate =  self.delegateSplitter
        
        
        self.view.addSubview(self.myCustomBar!)
        
        // Setup the table view
//        self.tableView registerClass(UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        self.tableView.contentInset = UIEdgeInsetsMake(self.myCustomBar!.maximumBarHeight, 0.0, 0.0, 0.0)
        
        
        // Add a close button to the bar
        let closeButton = UIButton(type: .system)
        closeButton.isUserInteractionEnabled = true
        closeButton.tintColor = UIColor.white
        closeButton.setImage(UIImage(named: "Close.png"),  for: UIControlState())
        closeButton.addTarget(self, action: #selector(FacebookStyleViewController.closeViewController(_:)), for:UIControlEvents.touchUpInside)
        
        let initialCloseButtonLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes()
        initialCloseButtonLayoutAttributes.frame = CGRect(x: self.myCustomBar!.frame.size.width - 35.0, y: 26.5, width: 30.0, height: 30.0)
        initialCloseButtonLayoutAttributes.zIndex = 1024
        
        closeButton.add(initialCloseButtonLayoutAttributes, forProgress: 0.0)
        
        closeButton.add(initialCloseButtonLayoutAttributes, forProgress:40.0 / (105.0 - 20.0))
        
        let finalCloseButtonLayoutAttributes = BLKFlexibleHeightBarSubviewLayoutAttributes(existing: initialCloseButtonLayoutAttributes)
        finalCloseButtonLayoutAttributes?.transform = CGAffineTransform(translationX: 0.0, y: -0.3 * (105 - 20))
        finalCloseButtonLayoutAttributes?.alpha = 0.0
        
        closeButton.add(finalCloseButtonLayoutAttributes, forProgress:0.8)
        closeButton.add(finalCloseButtonLayoutAttributes, forProgress:1.0)
        
        self.myCustomBar!.addSubview(closeButton)
     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1)
        return cell
    }

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func closeViewController(_ sender: UIView){
        self.dismiss(animated: true, completion: nil)
    }

}
