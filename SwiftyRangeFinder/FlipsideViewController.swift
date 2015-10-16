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
    var theDistantObject: DistantObject

    
// MARK: - Lifecycle Methods
    
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUINavigationItem.title = "Setup"
    
// Additional setup after loading the view, typically from storyboard.
    objectPicker.dataSource = self;
    objectPicker.delegate = self;

    helpView.hidden = true

//    // Load data from AppDelegate singleton distantObject
//    let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//    let theDistantObject = delegate.distantObject
//
//    if let height = theDistantObject.height {
//      self.height = height
//      print(height)
//    }

    
// Builds the distantObjectsArray
    self.loadInitialData()

  }
    
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear, this is where we do whatever")
    }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
// MARK: - Screen & UI Methods
    
    @IBAction func test2Button(sender: UIBarButtonItem) {
        print("Tests deleting the selected row on the objectPicker")
        self.deleteObject()
 //       distantObjectsArray.removeObjectAtIndex(selectedRow)
 //       objectPicker.reloadAllComponents()
    }
    
    @IBAction func testButton(sender: UIButton) {
        print("Tests deleting the selected row on the objectPicker")
// Need to set up selected row property
 //       [self.heightObjects removeObjectAtIndex:selectedRow];
 //       [self.objectPicker reloadAllComponents];

    }
    
    @IBAction func editButton(sender: UIBarButtonItem) {
// Allows for deletion of selected item in pickerView
        let objectName = "selected object"
  //      let objectName = theDistantObject.objectName

// Initialize an Alert View
        let deleteAlertController = UIAlertController(title: title, message: "Delete \(objectName) ?", preferredStyle: .ActionSheet)

// Configure the alaert view BUTTONS & ACTIONS
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action:UIAlertAction!) in
            print("Pressed Cancel button");
        }
        deleteAlertController.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .Default) { (action:UIAlertAction!) in
            print("Pressed Delete button");
// Delete the selected object
            self.deleteObject();
        }
        deleteAlertController.addAction(deleteAction)
        
// Show the Alert view
        presentViewController(deleteAlertController, animated: true, completion: nil)
    }
    
    @IBAction func showHelpView(sender: AnyObject) {
        helpView.hidden = false
    }
    
    @IBAction func hideHelpView(sender: AnyObject) {
        helpView.hidden = true
    }
    
    @IBAction func unitsSelected(sender: UISegmentedControl) {
//       print("Changes the units that are displayed on the app")
        switch (self.unitsSelector.selectedSegmentIndex) {
        case 0:
            theDistantObject.distanceUnits = "inches"
            break
        case 1:
            theDistantObject.distanceUnits = "feet"
            break
        case 2:
            theDistantObject.distanceUnits = "yards"
            break
        case 3:
            theDistantObject.distanceUnits = "furlong"
            break
        case 4:
            theDistantObject.distanceUnits = "miles"
            break

        default:
            print("WTF")
        }
    }
 
// MARK: - Custom Methods

    func loadInitialData() {

        print("Loads the preconfigured distantObjects into the array")
        
        let item00 = DistantObject()
        item00.objectName = "STICK"
        item00.height = "20"
        item00.heightUnits = "inches"
        distantObjectsArray.addObject(item00)
        
        let item01 = DistantObject()
        item01.objectName = "STONE"
        item01.height = "200"
        item01.heightUnits = "inches"
        distantObjectsArray.addObject(item01)
        
        let item02 = DistantObject()
        item02.objectName = "GOLF FLAG"
        item02.height = "4"
        item02.heightUnits = "feet"
        distantObjectsArray.addObject(item02)
        
        let item03 = DistantObject()
        item03.objectName = "PERSON"
        item03.height = "6"
        item03.heightUnits = "feet"
        distantObjectsArray.addObject(item03)
        
        let item04 = DistantObject()
        item04.objectName = "LIGHTHOUSE"
        item04.height = "40"
        item04.heightUnits = "feet"
        distantObjectsArray.addObject(item04)

    }
    
    func deleteObject() {
        distantObjectsArray.removeObjectAtIndex(selectedRow)
        objectPicker.reloadAllComponents()
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
