//
//  MainViewController.swift
//  SwiftyRangeFinder
//
//  Created by rg on 10/1/15.
//  Copyright © 2015 RG5D. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  @IBOutlet weak var helpView: UIView!

  @IBOutlet weak var myAssistantLabel: UILabel!

  @IBOutlet weak var distanceObjectLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    helpView.hidden = true

    // Sets up labels & initial values
    var heightUnits = "foot"
    var height = "6"
    var objectName = "Golf Flag"
    var distanceUnits = "yard"
    heightUnits = "foot"
    height = "6"
    objectName = "Golf Flag"
    distanceUnits = "yard"

    distanceObjectLabel.text = String(format: "Distant object is a %@ %@ high %@", height, heightUnits, objectName)

    myAssistantLabel.text = "Tap to open RangeFinder"

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}
