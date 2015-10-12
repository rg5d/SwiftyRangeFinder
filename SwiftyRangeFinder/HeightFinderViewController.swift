//
//  HeightFinderViewController.swift
//  SwiftyRangeFinder
//
//  Created by rg on 10/1/15.
//  Copyright © 2015 RG5D. All rights reserved.
//

import UIKit

class HeightFinderViewController: UIViewController {

  @IBOutlet weak var helpView: UIView!

  @IBOutlet weak var headerLabel: UILabel!
    
// MARK: - Lifecycle Methods
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    preferredInterfaceOrientationForPresentation().isLandscape

    helpView.hidden = true
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func shouldAutorotate() -> Bool {
    return false;
  }
    
// MARK: - Custom Methods

  @IBAction func showHelpview(sender: AnyObject) {
    helpView.hidden = false
  }


  @IBAction func hideHelpView(sender: AnyObject) {
    helpView.hidden = true
  }


}
