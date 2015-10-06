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

// Objective-C

//  - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//
//  // Displays the INITIAL zoom factor by getting cropped rectangle dimensions
//  NSValue *imageRectangle = [info objectForKey:UIImagePickerControllerCropRect];
//  CGRect rectangleValue = [imageRectangle CGRectValue];
//  CGFloat zoomFactor = (1937.0 / rectangleValue.size.height);
//  NSLog(@"CropRect ZoomFactor is in %2.3f", zoomFactor);
//
  // Displays the FINAL zoom factor by getting {Exif}dictionary's DigitalZoomRatio
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

  // MARK: - UIImagePickerControllerDelegate Methods


  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
  {
    // Displays the INITIAL zoom factor by getting cropped rectangle dimensions

    let imageRectangle = info[UIImagePickerControllerCropRect] as! NSValue
    print(imageRectangle) // NSRect: {{0, 130}, {2448, 2449}}

    let rectangleValue: CGRect = imageRectangle.CGRectValue()
    print(rectangleValue.size.height) // 2449.0

    let zoomFactor: CGFloat = (1937.0 / (rectangleValue.size.height)) // .790935075541037

    print("CropRect ZoomFactor is ", zoomFactor) // CropRect ZoomFactor is  0.790935075541037

    // Displays the FINAL zoom factor by getting {Exif}dictionary's DigitalZoomRatio

    let metadata = info[UIImagePickerControllerMediaMetadata] as! NSDictionary
    print(metadata)
    /*
    {
    DPIHeight = 72;
    DPIWidth = 72;
    Orientation = 6;
    "{Exif}" =     {
    ApertureValue = "2.27500704749987";
    BrightnessValue = "12.0623618549317";
    ColorSpace = 1;
    DateTimeDigitized = "2015:10:06 10:46:51";
    DateTimeOriginal = "2015:10:06 10:46:51";
    ExposureBiasValue = 0;
    ExposureMode = 0;
    ExposureProgram = 2;
    ExposureTime = "0.004149377593360996";
    FNumber = "2.2";
    Flash = 25;
    FocalLenIn35mmFilm = 29;
    FocalLength = "4.15";
    ISOSpeedRatings =         (
    32
    );
    LensMake = Apple;
    LensModel = "iPhone 5s back camera 4.15mm f/2.2";
    LensSpecification =         (
    "4.15",
    "4.15",
    "2.2",
    "2.2"
    );
    MeteringMode = 5;
    PixelXDimension = 3264;
    PixelYDimension = 2448;
    SceneType = 1;
    SensingMethod = 2;
    ShutterSpeedValue = "7.91476028163762";
    SubjectArea =         (
    1631,
    1223,
    1795,
    1077
    );
    SubsecTimeDigitized = 652;
    SubsecTimeOriginal = 652;
    WhiteBalance = 0;
    };
    "{MakerApple}" =     {
    1 = 4;
    14 = 1;
    2 = <48004800 49004900 49004800 46004600 47004900 4b004c00 4c004b00 4a004800 4a004b00 4b004b00 49004600 45004500 45004700 48004a00 4c004c00 4b004900 4d004e00 4e004c00 49004600 44004300 44004500 47004900 4c004e00 4d004a00 52005300 52004e00 49004500 43004400 45004500 46004900 4d005000 50004c00 59005a00 57005000 49004400 44004700 49004800 47004900 4e005400 55005000 61006200 5d005300 49004600 47004a00 4c004b00 49004a00 51005800 5b005500 6d006d00 65005900 4d004a00 4c004f00 51005000 4e004d00 55005e00 62005b00 7c007b00 71006100 54005100 53005600 57005600 54005300 5c006700 6c006400 8d008e00 83007000 60005c00 5c005f00 5f005e00 5c005d00 66007400 79007000 a100a400 9a008600 71006a00 6a006d00 6d006900 65006700 75008500 8a007d00 b700bf00 b800a300 8a007e00 7d007d00 7c007700 73007700 89009900 9c008a00 d200df00 de00cd00 b3009e00 98009600 93008b00 88009300 a700b400 b0009800 f2000601 10010601 f000d700 c700c100 bb00b200 b200c000 ce00d400 c700a800 16013301 4a014e01 41013101 21011601 0a01ff00 fe000101 0301fc00 e200ba00 41016601 8a01a101 a801aa01 a801a001 89017101 60015201 41012901 0101d000 70019e01 d001fc01 1e023f02 5c025c02 3002fb01 d201ac01 85015701 2501ea00>;
    20 = 2;
    3 =         {
    epoch = 0;
    flags = 1;
    timescale = 1000000000;
    value = 64734761865583;
    };
    4 = 1;
    5 = 147;
    6 = 128;
    7 = 1;
    8 =         (
    "0.003293019",
    "-0.03067541",
    "-1.002246"
    );
    };
    "{TIFF}" =     {
    DateTime = "2015:10:06 10:46:51";
    Make = Apple;
    Model = "iPhone 5s";
    ResolutionUnit = 2;
    Software = "9.0.2";
    XResolution = 72;
    YResolution = 72;
    };
    }
    */

    let dpiHeight = metadata["DPIHeight"]!
    print(dpiHeight) // 72

    let exif = metadata["{Exif}"] as! NSDictionary
    print(exif)
    /*
    {
    ApertureValue = "2.27500704749987";
    BrightnessValue = "12.0623618549317";
    ColorSpace = 1;
    DateTimeDigitized = "2015:10:06 10:46:51";
    DateTimeOriginal = "2015:10:06 10:46:51";
    ExposureBiasValue = 0;
    ExposureMode = 0;
    ExposureProgram = 2;
    ExposureTime = "0.004149377593360996";
    FNumber = "2.2";
    Flash = 25;
    FocalLenIn35mmFilm = 29;
    FocalLength = "4.15";
    ISOSpeedRatings =     (
    32
    );
    LensMake = Apple;
    LensModel = "iPhone 5s back camera 4.15mm f/2.2";
    LensSpecification =     (
    "4.15",
    "4.15",
    "2.2",
    "2.2"
    );
    MeteringMode = 5;
    PixelXDimension = 3264;
    PixelYDimension = 2448;
    SceneType = 1;
    SensingMethod = 2;
    ShutterSpeedValue = "7.91476028163762";
    SubjectArea =     (
    1631,
    1223,
    1795,
    1077
    );
    SubsecTimeDigitized = 652;
    SubsecTimeOriginal = 652;
    WhiteBalance = 0;
    }
    */

    let focalLenIn35mmFilm = exif["FocalLenIn35mmFilm"]!
    print(focalLenIn35mmFilm) // 29

    //  NSMutableDictionary *metadata = [[NSMutableDictionary alloc] initWithDictionary:[info objectForKey:UIImagePickerControllerMediaMetadata]];



    //  NSString *pictureZoomFactor = [[metadata objectForKey:@"{Exif}"] objectForKey:@"DigitalZoomRatio"];

    //  NSLog(@"DigitalZoomRatio is in %@", pictureZoomFactor);



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
