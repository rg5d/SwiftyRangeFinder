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
    @IBOutlet weak var units: UILabel!

  @IBOutlet weak var distanceObjectLabel: UILabel!

  @IBOutlet weak var myAssistantLabel: UILabel!

  var reticleZoomSlider: UISlider!

  @IBOutlet weak var cameraButtonButton: UIImageView!

  @IBOutlet weak var helpView: UIView!

  var firstZoomFactor: CGFloat?
  var secondZoomFactor: Float?
  var totalZoomFactor: Float?
  var flagHeight: Double?
  var reticleView: UIImageView?
  var imagePickerController: UIImagePickerController?

  var distanceUnits: String?
  var objectName: String?
  var height: String?
  var heightUnits: String?

  let FUTZ_FACTOR: Double = 6.0

// MARK: - Lifecycle Methods
    
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

    // Builds a view to overlay over the camera view including the zoom factor
    let frame = CGRectMake(80.0, 150.0, 160.0, 120.0)

    reticleView = UIImageView()
    reticleView!.frame = frame
    reticleView!.image = UIImage(named: "Reticle(2).png")
    reticleView!.userInteractionEnabled = true

    helpView.hidden = true

    // Sets up labels & initial values
    heightUnits = "foot"
    height = "6"
    objectName = "Golf Flag"
    distanceUnits = "yard"

// Load data from AppDelegate singleton distantObject
    let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let theDistantObject = delegate.distantObject

    if let height = theDistantObject.height {
      self.height = height
      print(height)
    }

    if let objectName = theDistantObject.objectName {
      self.objectName = objectName
      print(objectName)
    }

    if let distanceUnits = theDistantObject.distanceUnits {
      self.distanceUnits = distanceUnits
      print(distanceUnits)
    }

    distanceObjectLabel.text = String(format: "Distant object is a %@ %@ high %@", height!, heightUnits!, objectName!)

// Builds the slider and rotates it 90 degrees

//    let sliderFrame = CGRectMake(-20.0, 50.0, 150.0, 50.0);
//    reticleZoomSlider = UISlider()
//    reticleZoomSlider.frame = sliderFrame
//    let trans = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
//    reticleZoomSlider.transform = trans
//    reticleView!.addSubview(reticleZoomSlider)
  }

  override func viewWillAppear(animated: Bool) {
    print("MainController viewWillAppear")

    let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let theDistantObject = delegate.distantObject

    self.units.text = theDistantObject.distanceUnits

    if let height = theDistantObject.height {
      self.height = height
      print(height)
    }

    if let objectName = theDistantObject.objectName {
      self.objectName = objectName
      print(objectName)
    }

    if let heightUnits = theDistantObject.heightUnits {
      self.heightUnits = heightUnits
      print(heightUnits)
    }

    distanceObjectLabel.text = String(format: "Distant object is a %@ %@ high %@", height!, heightUnits!, objectName!)
  }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  override func shouldAutorotate() -> Bool {
    return false
  }

// MARK: - Custom Methods

  @IBAction func testButton() {
    print("testButton is for testing singleton action")
    let delegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let theDistantObject = delegate.distantObject
    print(theDistantObject)
    if let heightUnits = theDistantObject.heightUnits{
      print(heightUnits)
    }

    if let height = theDistantObject.height {
      self.height = height
      print(height)
    }

    if let objectName = theDistantObject.objectName {
      print(objectName)
    }

    if let distanceUnits = theDistantObject.distanceUnits {
      print(distanceUnits)
    }
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
    let imagePickerController = UIImagePickerController()
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

    let image = info[UIImagePickerControllerOriginalImage]
    print("OrignalImage=\(image?.description)")

    //    Displays the INITIAL zoom factor by getting cropped rectangle dimensions

    let imageRectangle = info[UIImagePickerControllerCropRect] as! NSValue
    let rectangleValue: CGRect = imageRectangle.CGRectValue()
    print("rectangleValue.size.height = \(rectangleValue.size.height)")

//    rectangleValue.size.height range: 817 to 2449 on iPhone 5S
    let minRectangleViewSizeHeight = 817.0
    let maxRectangleViewSizeHeight = 2449.0

    let digitalZoomFactor = 1.0 - CGFloat(1.0/(maxRectangleViewSizeHeight - minRectangleViewSizeHeight)) * (rectangleValue.size.height - CGFloat(minRectangleViewSizeHeight))
    print("digitalZoomFactor = \(digitalZoomFactor)")

//    Displays the FINAL zoom factor by getting {Exif}dictionary's FocalLenIn35mmFilm

    let metadata = info[UIImagePickerControllerMediaMetadata] as! NSDictionary
    let exif = metadata["{Exif}"] as! NSDictionary
    let opticalZoomFactor = exif["FocalLenIn35mmFilm"] as! Double // FocalLenIn35mmFilm

//    print("opticalZoomFactor = \(opticalZoomFactor)")

     // this is emprical from iPhone 5S -- need to verify on other models
    let maxZoomFactor = 145.0
    let minZoomFactor = 29.0

    let opticalZoomValue = (100.0/(maxZoomFactor - minZoomFactor))*(opticalZoomFactor - minZoomFactor)

    print("opticalZoomValue = \(opticalZoomValue)")

//    Converts both Zooms to number & multiplies together for TOTAL zoom factor

    var secondZoomFactor = opticalZoomValue

    // keeps zoom factor from being zero
    if secondZoomFactor == 0 { secondZoomFactor = 1.0}

    let totalZoomFactor = opticalZoomFactor * secondZoomFactor

    let finalZoomFactor = String(format:"Total zoom = %3.1f",totalZoomFactor)

    myAssistantLabel.text = finalZoomFactor as String
    print(finalZoomFactor)

//    Calculates actual distance in selected units
    print("flagHeight = \(flagHeight)")
    let distance: Double = totalZoomFactor * flagHeight! * FUTZ_FACTOR
    distanceLabel.text = (String(format:"%3.0f %@ away", distance, distanceUnits!))

//    gets rid of the image controller modal view
    dismissViewControllerAnimated(true, completion: nil)

  }

  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    print("imagePickerControllerDidCancel method \n")
    dismissViewControllerAnimated(true, completion: nil)
  }
}
