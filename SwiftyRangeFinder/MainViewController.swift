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

class MainViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

  @IBOutlet weak var cameraView: UIImageView!

  @IBOutlet weak var distanceLabel: UILabel!

  @IBOutlet weak var distanceObjectLabel: UILabel!

  @IBOutlet weak var myAssistantLabel: UILabel!

  var reticleZoomSlider: UISlider!
  var reticleView: UIImageView!


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

    reticleView = UIImageView()
    reticleView.frame = frame
    reticleView.image = UIImage(named: "Reticle(2).png")
    reticleView.userInteractionEnabled = true

    helpView.hidden = true

    // Sets up labels & initial values
    var heightUnits = "foot"
    var height = "6"
    var objectName = "Golf Flag"
    var distanceUnits = "yard"

    distanceObjectLabel.text = String(format: "Distant object is a %@ %@ high %@", height, heightUnits, objectName)

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
    let imagePickerController: UIImagePickerController = UIImagePickerController()
    imagePickerController.delegate = self;

    // Configures the camera & presents the modal camera view
    imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
    imagePickerController.allowsEditing = true
    imagePickerController.showsCameraControls = true
    imagePickerController.cameraOverlayView = reticleView
    presentViewController(imagePickerController, animated: true, completion: nil)
  }

// MARK: - UIImagePickerControllerDelegate Methods

// Objective-C

//  - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//
//  // Displays the INITIAL zoom factor by getting cropped rectangle dimensions
//  NSValue *imageRectangle = [info objectForKey:UIImagePickerControllerCropRect];
//  CGRect rectangleValue = [imageRectangle CGRectValue];
//  CGFloat zoomFactor = (1937.0 / rectangleValue.size.height);
//  NSLog(@"CropRect ZoomFactor is in %2.3f", zoomFactor);
//
//  // Displays the FINAL zoom factor by getting {Exif}dictionary's DigitalZoomRatio
//  NSMutableDictionary *metadata = [[NSMutableDictionary alloc] initWithDictionary:[info objectForKey:UIImagePickerControllerMediaMetadata]];
//  NSString *pictureZoomFactor = [[metadata objectForKey:@"{Exif}"] objectForKey:@"DigitalZoomRatio"];
//  NSLog(@"DigitalZoomRatio is in %@", pictureZoomFactor);
//
//  // Converts both Zooms to number & multiplies together for TOTAL zoom factor
//  secondZoomFactor = [pictureZoomFactor floatValue];
//  // keeps zoom factor from being zero
//  if (!secondZoomFactor) {
//  // NSLog (@"No zoom factor");
//  secondZoomFactor = 1.0;
//  }
//  totalZoomFactor = zoomFactor *secondZoomFactor;
//  NSString *finalZoomFactor = [[NSString alloc] initWithFormat:@"Total zoom = %3.1f", totalZoomFactor];
//  self.myAssistantLabel.text = finalZoomFactor;
//  // NSLog(@"zoom are %2.3f, %2.3f, %2.3f", zoomFactor, secondZoomFactor, totalZoomFactor);
//
//  // Calculates actual distance in selected units
//  float distance = totalZoomFactor * flagHeight * FUTZ_FACTOR;
//  self.distanceLabel.text = [NSString stringWithFormat:@"%3.0f %@ away", distance, distanceUnits];
//
//  // gets rid of the image controller modal view
//  [self dismissModalViewControllerAnimated:YES];
//  }

//  - (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
//  NSLog(@"imagePickerControllerDidCancel method");
//  [self dismissModalViewControllerAnimated:YES];
//
//  }


  func imagePickerController(
    picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
  {

    // Displays the INITIAL zoom factor by getting cropped rectangle dimensions

    //  I Am stuck right here....I don't know the swift equivalent syntax
    //  trying to translate NSValue *imageRectangle = [info objectForKey:UIImagePickerControllerCropRect]

    //  let imageRectangle: UIImage = info[UIImagePickerControllerCropRect]

    //  NSValue *imageRectangle = [info objectForKey:UIImagePickerControllerCropRect];

    //  CGRect rectangleValue = [imageRectangle CGRectValue];

    //  CGFloat zoomFactor = (1937.0 / rectangleValue.size.height);

    //  NSLog(@"CropRect ZoomFactor is in %2.3f", zoomFactor);

    print("CropRect ZoomFactor is in zoomFactor")

    // Displays the FINAL zoom factor by getting {Exif}dictionary's DigitalZoomRatio

    // Converts both Zooms to number & multiplies together for TOTAL zoom factor

    // Calculates actual distance in selected units

    // gets rid of the image controller modal view
    dismissViewControllerAnimated(true, completion: nil)

  }

  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    print("imagePickerControllerDidCancel method \n")
    dismissViewControllerAnimated(true, completion: nil)
  }


}
