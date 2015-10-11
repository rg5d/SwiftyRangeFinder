//
//  FlipsideViewController.swift
//  SwiftyRangeFinder
//
//  Created by rg on 10/1/15.
//  Copyright © 2015 RG5D. All rights reserved.
//

import UIKit

class FlipsideViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

  @IBOutlet weak var helpView: UIView!
  @IBOutlet weak var headerLabel: UILabel!
  @IBOutlet weak var setupUINavigationItem: UINavigationItem!

  @IBOutlet weak var scrollView: UIScrollView!

// pickerViews setup
    @IBOutlet weak var objectPicker: UIPickerView!
    let objectPickerItems = ["Light switch", "Car","Person", "Door","Golf flag", "Utility pole", "Sailboat", "Lighthouse"]
    @IBOutlet weak var heightPicker: UIPickerView!
    let heightPickerItems = ["0", "1","2", "3","4", "5", "6", "7", "8", "9", "10", "11","12"]

    
    @IBOutlet weak var unitsSelector: UISegmentedControl!
    @IBOutlet weak var helpSwitch: UISwitch!
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUINavigationItem.title = "Setup"
    
// Additional setup after loading the view, typically from storyboard.
    objectPicker.dataSource = self;
    objectPicker.delegate = self;
    heightPicker.dataSource = self;
    heightPicker.delegate = self;

    helpView.hidden = true
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
// MARK: - Custom Methods
    
    @IBAction func test2Button(sender: UIBarButtonItem) {
        print("Tests adding a new distantObject to the objectPicker")
        let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let theDistantObject = delegate.distantObject
}
    
    @IBAction func testButton(sender: UIButton) {
        print("Tests deleting the selected row on the objectPicker")
// Need to set up selected row property
 //       [self.heightObjects removeObjectAtIndex:selectedRow];
 //       [self.objectPicker reloadAllComponents];

    }
    
    
    @IBAction func unitsSelected(sender: UISegmentedControl) {
        print("Changes the units that are displayed on the app")
    }
    

  @IBAction func editButton(sender: UIBarButtonItem) {
let objectName = "selected object"
    let ac = UIAlertController(title: title, message: "Delete \(objectName) ?", preferredStyle: .ActionSheet)
    ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: nil))
    presentViewController(ac, animated: true, completion: nil)


  }
  @IBAction func showHelpView(sender: AnyObject) {
    helpView.hidden = false
  }

  @IBAction func hideHelpView(sender: AnyObject) {
    helpView.hidden = true
  }
    
// MARK: - UIPickerViewDataSources methods
    // good tutorial - http://makeapppie.com/2014/10/21/swift-swift-formatting-a-uipickerview/
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if (pickerView == self.objectPicker) {
            return 1
        } else {
            return 1
        }
    }
   
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == self.objectPicker) {
            return objectPickerItems.count
        } else {
            return heightPickerItems.count
        }
    }
    
// MARK: - UIPickerViewDelegate methods
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == self.objectPicker) {
            return objectPickerItems[row]
        } else {
            return heightPickerItems[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == self.objectPicker) {
            let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let theDistantObject = delegate.distantObject
            theDistantObject.objectName = objectPickerItems[row]
 //           theDistantObject.heightUnits = un
        }
    }
    
}
