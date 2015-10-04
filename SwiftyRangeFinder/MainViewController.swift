//
//  MainViewController.swift
//  SwiftyRangeFinder
//
//  Created by rg on 10/1/15.
//  Copyright © 2015 RG5D. All rights reserved.
//
//  Created by Chris Lamb on 6/3/12.
//  Copyright (c) 2012 CPL Consulting. All rights reserved.
//
/*  This view is used for determining the distance to an object by using the device's camera & zoom effects.  The calculation is based upon 2 zoom factors (digital zoom & CGRect zoom) X the height of a known object (person, stop sign, etc).
*/


import UIKit

class MainViewController: UIViewController {

  @IBOutlet weak var cameraView: UIImageView!

  @IBOutlet weak var distanceLabel: UILabel!

  @IBOutlet weak var distanceObjectLabel: UILabel!

  @IBOutlet weak var myAssistantLabel: UILabel!

  var reticleZoomSlider: UISlider!

  @IBOutlet weak var cameraButtonButton: UIImageView!


  @IBOutlet weak var helpView: UIView!


  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.


    // Checks to see if the camera is available
    if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
      print("camera is available - We must be on the iPhone! \n")
      myAssistantLabel.text = "Tap to open RangeFinder"
    }
    else {
      print("camera is NOT available - We must be on the Simulator! \n")
      myAssistantLabel.text = "Camera unavailable"
      cameraButtonButton.hidden = true
    }

    // Build a view to overlay over the camera view including the zoom factor
    let frame = CGRectMake(80.0, 150.0, 160.0, 120.0)

    let reticleView: UIImageView = UIImageView()
    reticleView.frame = frame
    reticleView.image = UIImage(named: "Reticle(2).png")
    reticleView.userInteractionEnabled = true

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

//    myAssistantLabel.text = "Tap to open RangeFinder"

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func showHelpview(sender: AnyObject) {
      helpView.hidden = false
  }

  @IBAction func hideHelpView(sender: AnyObject) {
    helpView.hidden = true
  }

  @IBAction func camera(sender: AnyObject) {
    print("Trying to get the camera controls to show")


    // Sets self to be the ImagePickerController delegate
//    imagePickerController = [[UIImagePickerController alloc] init];
//    imagePickerController.delegate = self;
//
//    // Configures the camera & presents the modal camera view
//    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
//    imagePickerController.allowsEditing = YES;
//    imagePickerController.showsCameraControls = YES;
//    imagePickerController.cameraOverlayView = reticleView;
//    [self presentModalViewController:imagePickerController animated:YES];

  }

}
