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

    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var heightUnits: UILabel!
    
// pickerViews setup
    @IBOutlet weak var objectPicker: UIPickerView!
    
    @IBOutlet weak var unitsSelector: UISegmentedControl!
    @IBOutlet weak var helpSwitch: UISwitch!
    
    var selectedRow = 0
    var distantObjectsArray: NSMutableArray = NSMutableArray()
    
// MARK: - Lifecycle Methods
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUINavigationItem.title = "Setup"
    
// Additional setup after loading the view, typically from storyboard.
    objectPicker.dataSource = self;
    objectPicker.delegate = self;

    helpView.hidden = true
    
// Builds the distantObjectsArray
    self.loadInitialData()

  }
    
    override func viewWillAppear(animated: Bool) {
        print("viewWillApprea, this is where we do whatever")
    }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
// MARK: - Custom Methods
    
    @IBAction func test2Button(sender: UIBarButtonItem) {
        print("Tests deleting the selected row on the objectPicker")
        distantObjectsArray.removeObjectAtIndex(selectedRow)
        objectPicker.reloadAllComponents()
    }
    
    @IBAction func testButton(sender: UIButton) {
        print("Tests deleting the selected row on the objectPicker")
// Need to set up selected row property
 //       [self.heightObjects removeObjectAtIndex:selectedRow];
 //       [self.objectPicker reloadAllComponents];

    }
    
    @IBAction func unitsSelected(sender: UISegmentedControl) {
        print("Changes the units that are displayed on the app")
        switch (self.unitsSelector.selectedSegmentIndex) {
        case 0:
            print("INCHES")
            break
        case 1:
            print("FEET")
            break
        default:
            print("WTF")
        }
    }
    
    func loadInitialData() {
        print("Loads the preconfigured distantObjects into the array")
 //       var ourDefaults = NSUserDefaults()
        
        let item00 = DistantObject()
        item00.objectName = "STICK"
        item00.height = "20"
        item00.heightUnits = "inches"
        distantObjectsArray.addObject(item00)
        
        let item01 = DistantObject()
        item01.objectName = "LIGHT SW"
        item01.height = "6"
        item01.heightUnits = "inches"
        distantObjectsArray.addObject(item01)

        let item02 = DistantObject()
        item02.objectName = "CAR"
        item02.height = "18"
        item02.heightUnits = "feet"
        distantObjectsArray.addObject(item02)

        let item03 = DistantObject()
        item03.objectName = "POWERBALL"
        item03.height = "1.3"
        item03.heightUnits = "miles"
        distantObjectsArray.addObject(item03)
        
        let item04 = DistantObject()
        item04.objectName = "CAR"
        item04.height = "18"
        item04.heightUnits = "feet"
        distantObjectsArray.addObject(item04)
        
        let item05 = DistantObject()
        item05.objectName = "POWERBALL"
        item05.height = "1.3"
        item05.heightUnits = "miles"
        distantObjectsArray.addObject(item05)

        let item06 = DistantObject()
        item06.objectName = "Golf Flag"
        item06.height = "6"
        item06.heightUnits = "feet"
        distantObjectsArray.addObject(item06)
        
        let item07 = DistantObject()
        item07.objectName = "Utility Pole"
        item07.height = "20"
        item07.heightUnits = "yards"
        distantObjectsArray.addObject(item07)
        
        let item08 = DistantObject()
        item08.objectName = "Person"
        item08.height = "2"
        item08.heightUnits = "meters"
        distantObjectsArray.addObject(item08)
        
        let item09 = DistantObject()
        item09.objectName = "Lighthouse"
        item09.height = "2"
        item09.heightUnits = "furlong"
        distantObjectsArray.addObject(item09)
        
        let arrayList = "the array \(distantObjectsArray[1].objectName)"
        print(arrayList)
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
            return 1
    }
   
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return distantObjectsArray.count
    }
    
// MARK: - UIPickerViewDelegate methods
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
              return distantObjectsArray[row].objectName
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let theDistantObject = delegate.distantObject
            
// Assigns array object to distantObject
            theDistantObject.objectName = distantObjectsArray[row].objectName
            theDistantObject.height = distantObjectsArray[row].height
            theDistantObject.heightUnits = distantObjectsArray[row].heightUnits
        
            selectedRow = row       // added for deletion function
            height.text = distantObjectsArray[row].height
            heightUnits.text = distantObjectsArray[row].heightUnits
    }
    
}
