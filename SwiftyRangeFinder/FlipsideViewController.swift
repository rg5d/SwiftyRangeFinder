//
//  FlipsideViewController.swift
//  SwiftyRangeFinder
//
//  Created by rg on 10/1/15.
//  Copyright © 2015 RG5D. All rights reserved.
//

import UIKit

class FlipsideViewController: UIViewController {

  @IBOutlet weak var helpView: UIView!
  @IBOutlet weak var headerLabel: UILabel!

  @IBOutlet weak var setupUINavigationItem: UINavigationItem!

  @IBOutlet weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    print(scrollView.contentSize)
    helpView.hidden = true

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}
