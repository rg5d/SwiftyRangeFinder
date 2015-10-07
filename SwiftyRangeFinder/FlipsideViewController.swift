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

  @IBOutlet weak var objectPicker: UIPickerView!
  @IBOutlet weak var heightPicker: UIPickerView!
    @IBOutlet weak var unitsSelector: UISegmentedControl!
    @IBOutlet weak var helpSwitch: UISwitch!
    
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
// Do any additional setup after loading the view, typically from a nib.
 //   objectPicker.dataSource = self;
 //   objectPicker.delegate = self;

    helpView.hidden = true

    var objectPickerItems = ["Light switch", "Car","Person", "Door","Golf flag", "Utility pole", "Sailboat", "Lighthouse"]
  //  objectPicker.numberOfSectionsInTableView(<#T##tableView: UITableView##UITableView#>)  InComponent(3)
    objectPicker.reloadAllComponents()


  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
// MARK: Custom Methods

    
    @IBAction func test2Button(sender: UIBarButtonItem) {
        print("Tests adding a new distantObject to the objectPicker")
}
    
    @IBAction func testButton(sender: UIButton) {
        print("Tests deleting the selected row on the objectPicker")
    }
    
    
    @IBAction func unitsSelected(sender: UISegmentedControl) {
        print("Changes the units that are displayed on the app")
    }
    

  @IBAction func editButton(sender: UIBarButtonItem) {
let objectName = "test"
    let ac = UIAlertController(title: title, message: "Delete \(objectName) ?", preferredStyle: .Alert)
    ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: nil))
    presentViewController(ac, animated: true, completion: nil)

    
    
    
//    NSString *messageString = [NSString stringWithFormat:@"Delete %@ ?", objectName];
//    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Edit Object List"
//    message:messageString
//    delegate:nil
//    cancelButtonTitle:@"Delete"
//    otherButtonTitles:@"Cancel",nil];
//    [message setAlertViewStyle:UIAlertViewStyleDefault];
//    [message show];

    
//      - (IBAction)testButton:(UIButton *)sender
//    {
//      NSLog(@"testing whatever!!");
//      [self.heightObjects removeObjectAtIndex:selectedRow];
//      [self.objectPicker reloadAllComponents];
//      }
//
//      - (IBAction)test2Button:(UIBarButtonItem *)sender
//    {
//      NSLog(@"adds theDistantObject to the mutable array heightObjects");
//      NSString *name = _theDistantObject.objectName;
//      NSString *height =  self.theDistantObject.height;
//      NSString *units = self.theDistantObject.heightUnits;
//      NSLog(@"distant object %@ %@ %@", name, height, units);
//      NSArray *newObject = [[NSArray alloc] initWithObjects:name, height, units, nil];
//      NSArray *keys = [[NSArray alloc] initWithObjects:@"objectName", @"height", @"heightUnits", nil];
//      NSDictionary *newDistantObject = [[NSDictionary alloc] initWithObjects:newObject forKeys:keys];
//      [self.heightObjects addObject:newDistantObject];
//      [self.objectPicker reloadAllComponents];
//
//      // And then saves the mutableArray heightObjects to a NSUserDefaults
//      //    NSUserDefaults *savedData = [NSUserDefaults standardUserDefaults];
//      //    [savedData ]
//    }

  }
  @IBAction func showHelpView(sender: AnyObject) {
    helpView.hidden = false
  }

  @IBAction func hideHelpView(sender: AnyObject) {
    helpView.hidden = true
  }

}
