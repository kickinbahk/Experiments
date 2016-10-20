//
//  ViewController.swift
//  GGNCIFilters
//
//  Created by Garric Nahapetian on 5/3/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let ggnFilters: [String:GGNFilterType] = ["A":GGNAndyFilter(), "B":GGNBarbaraFilter(), "C":GGNCharlieBWFilter(), "D":GGNDonnaFilter()]
    let context = CIContext()
    
    @IBAction func filterButtonTapped(sender: UIBarButtonItem) {
        guard sender.title != "None" else {
            return imageView.image = UIImage(named: "Lucy")!
        }
        
        let inputImage = UIImage(named: "Lucy")!
        var filter = ggnFilters[sender.title!]
        filter?.inputImage = CIImage(image: inputImage)
        let outputImage = filter?.ggnOutputImage()
        let cgImage = context.createCGImage(outputImage!, fromRect: outputImage!.extent)
        let processedImage = UIImage(CGImage: cgImage, scale: inputImage.scale, orientation: inputImage.imageOrientation)
        imageView.image = processedImage
    }

}