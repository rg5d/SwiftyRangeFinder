//
//  DistantObject.swift
//  SwiftyRangeFinder
//
//  Created by rg on 10/9/15.
//  Copyright © 2015 RG5D. All rights reserved.
//
//  Created by Chris Lamb on 12/2/14.
//  Copyright (c) 2014 CPL Consulting. All rights reserved.
//

import Foundation

class DistantObject: NSObject {
  var objectName: String!
  var height: String!
  var heightUnits: String!
  var distanceUunits: String!
  var singletonDistantObject: DistantObject!

  func getSingeltonInstance() -> DistantObject{

    if (singletonDistantObject == nil){
      singletonDistantObject = DistantObject()
    }
    return singletonDistantObject
  }

}
