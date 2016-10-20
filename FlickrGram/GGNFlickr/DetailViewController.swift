//
//  DetailViewController.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 4/16/16.
//  Copyright © 2016 ggn. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .ScaleAspectFit
        view.addSubview(imageView)
        view.backgroundColor = .whiteColor()
        
        let views = ["imageView":imageView]
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[imageView]-|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[imageView]-|", options: [], metrics: nil, views: views))
        
    }

}
