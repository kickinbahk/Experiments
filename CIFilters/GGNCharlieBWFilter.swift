//
//  GGNCharlieBWFilter.swift
//  GGNCIFilters
//
//  Created by Garric Nahapetian on 5/4/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import Foundation
import CoreImage

class GGNCharlieBWFilter: CIFilter, GGNFilterType {
    
    var inputImage: CIImage!
    
    func ggnOutputImage() -> CIImage {
        let filter = CIFilter(
            name: "CIColorControls",
            withInputParameters: [
                kCIInputImageKey:inputImage,
                "inputSaturation":0.0,
                "inputBrightness":0.0,
                "inputContrast":1.0
            ])
        return (filter?.outputImage)!
    }
    
}
