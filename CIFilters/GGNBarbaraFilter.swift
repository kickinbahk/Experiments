//
//  GGNBarbaraFilter.swift
//  GGNCIFilters
//
//  Created by Garric Nahapetian on 5/4/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import Foundation
import CoreImage

class GGNBarbaraFilter: CIFilter, GGNFilterType {
    
    var inputImage: CIImage!
    
    func ggnOutputImage() -> CIImage {
        let filter0 = CIFilter(name: "CIPhotoEffectFade", withInputParameters: [kCIInputImageKey:inputImage])
        let output0 = filter0?.outputImage
        let filter1 = CIFilter(name: "CIVignette", withInputParameters: [kCIInputImageKey:output0!, "inputRadius":2.0, "inputIntensity":1.0])
        let output1 = filter1?.outputImage
        return output1!
    }
}
