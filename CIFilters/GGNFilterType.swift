//
//  GGNFilterType.swift
//  GGNCIFilters
//
//  Created by Garric Nahapetian on 5/4/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import Foundation
import CoreImage

protocol GGNFilterType {
    
    var inputImage: CIImage! { get set }
    
    func ggnOutputImage() -> CIImage
    
}
