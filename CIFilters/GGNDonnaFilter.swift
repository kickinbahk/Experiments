//
//  GGNDonnaFilter.swift
//  GGNCIFilters
//
//  Created by Garric Nahapetian on 5/4/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import Foundation
import CoreImage

class GGNDonnaFilter: CIFilter, GGNFilterType {
    
    var inputImage: CIImage!
    
    func ggnOutputImage() -> CIImage {
        let filter = CIFilter(
            name: "CITemperatureAndTint",
            withInputParameters: [
                kCIInputImageKey:inputImage,
                "inputNeutral":CIVector(x: 6500.0, y: 100.0),
                "inputTargetNeutral":CIVector(x: 6500.0, y: 0.0)
            ])
        return (filter?.outputImage)!
    }
    
}