//
//  FlipsideViewController.swift
//  SwiftyRangeFinder
//
//  Created by rg on 10/1/15.
//  Copyright © 2015 RG5D. All rights reserved.
//

import UIKit


class FlipsideViewController: UIViewController, UIPickerViewDelegate {

  @IBOutlet weak var helpView: UIView!
  @IBOutlet weak var headerLabel: UILabel!

  @IBOutlet weak var setupUINavigationItem: UINavigationItem!

  @IBOutlet weak var scrollView: UIScrollView!

  @IBOutlet weak var objectPicker: UIPickerView!
  
  @IBOutlet weak var heightPicker: UIPickerView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
//    print(globalVar)

//    self.pickerView.dataSource = self;
//    self.pickerView.delegate = self;

    helpView.hidden = true

    var objectPickerItems = ["Light switch", "Car","Person", "Door","Golf flag", "Utility pole", "Sailboat", "Lighthouse"]
//    objectPicker.numberOfSectionsInTableView(<#T##tableView: UITableView##UITableView#>)  InComponent(3)
    objectPicker.reloadAllComponents()

//        objectPickerItems = [[NSArray alloc] initWithObjects:@"Light switch", @"Car", @"Person", @"Door", @"Golf flag", @"Utility pole", @"Sailboat", @"Lighthouse", nil];


  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
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
