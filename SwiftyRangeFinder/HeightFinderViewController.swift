//
//  HeightFinderViewController.swift
//  SwiftyRangeFinder
//
//  Created by Chris Lamb on 11/7/14.
//  Copyright (c) 2014 CPL Consulting. All rights reserved.
//
/*  This view is used for determining the height of an object using
trig, the tangent of 2 angles.  The angles are determined by tilting the iPhone
and recording the device's Y magnetometer tilt
*/
//

import UIKit

class HeightFinderViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {

  @IBOutlet weak var helpView: UIView!
  @IBOutlet weak var height: UILabel!

  @IBOutlet weak var degreeLabel: UILabel!

  @IBOutlet weak var baseLength: UITextField!
  @IBOutlet weak var angleOneLabel: UITextField!
  @IBOutlet weak var angleTwoLabel: UITextField!
  
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
    
// MARK: - Screen & UI Methods

  @IBAction func showHelpview(sender: AnyObject) {
    helpView.hidden = false
  }

  @IBAction func hideHelpView(sender: AnyObject) {
    helpView.hidden = true
  }

    @IBAction func setAngleTwoButton(sender: UIButton) {
        print("logs the iPhone Y tilt and enters it on the screen")
    }
    
    @IBAction func setAngleOneButton(sender: UIButton) {
        print("#2 - logs the iPhone Y tilt and enters it on the screen")
    }

    
    @IBAction func AddButton(sender: UIBarButtonItem) {
        print("Allows user to add measured object to the objects list")
// Most excellant tutorial - sourcefreeze.com/uialertcontroller-ios-8-using-swift/
        
        var objectTextField: UITextField?
        let alertController = UIAlertController(title: "New Distant Object", message: "Add the object's name & Press Add", preferredStyle: .Alert)
        let add = UIAlertAction(title: "Add", style: .Default, handler: { (action) -> Void in
        print("Add Button Pressed")
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
        print("Cancel Button Pressed")
        }
        alertController.addAction(add)
        alertController.addAction(cancel)
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            objectTextField = textField
            objectTextField?.placeholder = "Enter the object's name"
        }
        presentViewController(alertController, animated: true, completion: nil)
        }

    // MARK: - Custom Methods

}
