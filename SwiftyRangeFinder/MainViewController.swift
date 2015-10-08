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

//    Sets self to be the ImagePickerController delegate
    let imagePickerController: UIImagePickerController = UIImagePickerController()
    imagePickerController.delegate = self;

//    Configures the camera & presents the modal camera view
    imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
    imagePickerController.allowsEditing = true
    imagePickerController.showsCameraControls = true
    imagePickerController.cameraOverlayView = reticleView
    presentViewController(imagePickerController, animated: true, completion: nil)
  }

//   MARK: - UIImagePickerControllerDelegate Methods

  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
  {

    //    Displays the INITIAL zoom factor by getting cropped rectangle dimensions

    let imageRectangle = info[UIImagePickerControllerCropRect] as! NSValue
    let rectangleValue: CGRect = imageRectangle.CGRectValue()
    print(rectangleValue.size.height) // 2449.0

    let zoomFactor: CGFloat = (1937.0 / (rectangleValue.size.height)) // .790935075541037

    print("CropRect ZoomFactor is ", zoomFactor) // CropRect ZoomFactor is  0.790935075541037

//    Displays the FINAL zoom factor by getting {Exif}dictionary's FocalLenIn35mmFilm

    let metadata = info[UIImagePickerControllerMediaMetadata] as! NSDictionary
    let exif = metadata["{Exif}"] as! NSDictionary
    let pictureZoomFactor = exif["FocalLenIn35mmFilm"] as! Double
    let pictureZoomValue = pictureZoomFactor / 29.0
    print("FocalLenIn35mmFilm \(pictureZoomValue)") // 1

//    Converts both Zooms to number & multiplies together for TOTAL zoom factor

    var secondZoomFactor = pictureZoomValue
    print(secondZoomFactor)
    // keeps zoom factor from being zero
    if secondZoomFactor == 0 { secondZoomFactor = 1.0}

    //    var totalZoomFactor = zoomFactor * secondZoomFactor

//    finalZoomFactor == "Total zoom = \(totalZoomFactor)"


//    Calculates actual distance in selected units

//    gets rid of the image controller modal view
    dismissViewControllerAnimated(true, completion: nil)

  }

  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    print("imagePickerControllerDidCancel method \n")
    dismissViewControllerAnimated(true, completion: nil)
  }


}
