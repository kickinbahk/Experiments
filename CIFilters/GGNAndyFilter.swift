//
//  GGNAndyFilter.swift
//  GGNCIFilters
//
//  Created by Garric Nahapetian on 5/4/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import Foundation
import CoreImage

class GGNAndyFilter: CIFilter, GGNFilterType {
    
    var inputImage: CIImage!
    
    func ggnOutputImage() -> CIImage {
        let filter = CIFilter(
            name: "CIColorMatrix",
            withInputParameters: [
                kCIInputImageKey:inputImage,
                "inputRVector":CIVector(x: 2.0, y: 0.0, z: 0.0, w: 0.0),
                "inputGVector":CIVector(x: 0.0, y: 1.0, z: 0.0, w: 0.0),
                "inputBVector":CIVector(x: 0.0, y: 0.0, z: 1.0, w: 0.0),
                "inputAVector":CIVector(x: 0.0, y: 0.0, z: 0.0, w: 1.0),
                "inputBiasVector":CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0)
            ])!
        let output = filter.outputImage!
        return output
    }
}