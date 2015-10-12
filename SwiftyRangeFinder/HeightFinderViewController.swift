//
//  HeightFinderViewController.swift
//  SwiftyRangeFinder
//
//  Created by rg on 10/1/15.
//  Copyright © 2015 RG5D. All rights reserved.
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


//  @property (nonatomic, strong) IBOutlet UITextField *objectName;
//
//  @property (weak, nonatomic) IBOutlet UIButton *calculateButtonObject;
//

  @IBOutlet weak var degreeLabel: UILabel!


//  @property (weak, nonatomic) IBOutlet UILabel *accelerationsLabel;
//

  @IBOutlet weak var baseLength: UITextField!

  @IBOutlet weak var angleOneLabel: UITextField!

  @IBOutlet weak var angleTwoLabel: UITextField!

  @IBOutlet weak var angleOneButton: UIButton!

  
//  @property (nonatomic, strong) IBOutlet UIButton *angleTwoButton;
//
//  - (IBAction)setAngleOneButton:(UIButton *)sender;
//  - (IBAction)setAngleTwoButton:(UIButton *)sender;
//
//  - (IBAction)calculateButton:(UIButton *)sender;
//  - (IBAction)showHelpButton:(id)sender;
//  - (IBAction)hideHelpButton:(id)sender;
//
//  - (IBAction)addButton:(UIButton *)sender;
//  @property (weak, nonatomic) IBOutlet UILabel *testString;
//
///*
//
//@interface HeightFinderViewController : UIViewController
//
//@property (nonatomic, strong) IBOutlet UITextField *baseLength;
//@property (nonatomic, strong) IBOutlet UITextField *angleOneLabel;
//@property (nonatomic, strong) IBOutlet UITextField *angleTwoLabel;
//
//@property (nonatomic, strong) IBOutlet UILabel *height;
//@property (nonatomic, strong) IBOutlet UITextField *objectName;
//
////@property (nonatomic, strong) CMAcceleration *myAcceleration;
//@property (nonatomic, strong) IBOutlet UILabel *accelerationsLabel;
////@property (strong, nonatomic) CMMotionManager *motionManager;
//
//@property (nonatomic, strong) IBOutlet UIButton *angleOneButton;
//@property (nonatomic, strong) IBOutlet UIButton *angleTwoButton;
//
//- (IBAction)setAngleOneButton:(UIButton *)sender;
//- (IBAction)setAngleTwoButton:(UIButton *)sender;
//
//- (IBAction)calculateButton:(UIButton *)sender;
//
//@property (strong, nonatomic) IBOutlet UIView *helpView;
//
//- (IBAction)showHelpButton:(id)sender;
//- (IBAction)hideHelpButton:(id)sender;







  
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
