//
//  DetailViewController.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 4/16/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var image: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }

}
