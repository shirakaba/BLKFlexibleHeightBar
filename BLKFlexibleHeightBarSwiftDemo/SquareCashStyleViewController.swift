//
//  SquareCashStyleViewController.swift
//  BLKFlexibleHeightBarSwiftDemo
//
//  Created by rabzu on 09/04/2015.
//  Copyright (c) 2015 Weshapp. All rights reserved.
//

import UIKit
import BLKFlexibleHeightBar

class SquareCashStyleViewController: UIViewController, UITableViewDataSource{

    fileprivate var myCustomBar: SquareCashStyleBar?
    fileprivate var delegateSplitter: BLKDelegateSplitter?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setNeedsStatusBarAppearanceUpdate()
        
        self.myCustomBar = SquareCashStyleBar(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: 100.0))
        
        let behaviorDefiner = SquareCashStyleBehaviorDefiner()
        behaviorDefiner.addSnappingPositionProgress(0.0, forProgressRangeStart:0.0, end:0.5)
        behaviorDefiner.addSnappingPositionProgress(1.0, forProgressRangeStart:0.5, end:1.0)
        behaviorDefiner.isSnappingEnabled = true
        behaviorDefiner.isElasticMaximumHeightAtTop = true
        self.myCustomBar!.behaviorDefiner = behaviorDefiner
        
        //Assigns to delegates
        self.delegateSplitter = BLKDelegateSplitter(firstDelegate: behaviorDefiner, secondDelegate: self)
        self.tableView.delegate =  self.delegateSplitter
        
        self.view.addSubview(self.myCustomBar!)
        
        // Setup the table view
        self.tableView.contentInset = UIEdgeInsetsMake(self.myCustomBar!.maximumBarHeight, 0.0, 0.0, 0.0);
        // Add close button - it's pinned to the top right corner, so it doesn't need to respond to bar height changes
        let closeButton = UIButton(type: .system)
        closeButton.isUserInteractionEnabled = true
        closeButton.frame = CGRect(x: self.myCustomBar!.frame.size.width - 40.0, y: 25.0, width: 30.0, height: 30.0);

        closeButton.tintColor = UIColor.white
        closeButton.setImage(UIImage(named: "Close.png"),  for: UIControlState())
        closeButton.addTarget(self, action: #selector(SquareCashStyleViewController.closeViewController(_:)), for:UIControlEvents.touchUpInside)
        
        self.myCustomBar!.addSubview(closeButton)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.backgroundColor = UIColor(red:0.95, green:0.95, blue:0.95, alpha:1)
        return cell
    }
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func closeViewController(_ sender: UIView){
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
