//
//  LoadingView.swift
//  Flow
//
//  Created by Garric G. Nahapetian on 1/28/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//

import UIKit
import Cartography

class LoadingView: BaseView {
    private let spinner = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    override func setup() {
        addSubview(spinner)
        spinner.hidesWhenStopped = true
    }
    
    override func style() {
        backgroundColor = .white
    }
    
    override func layout() {
        constrain(spinner) { spinner in
            spinner.center == spinner.superview!.center
        }
    }
    
    func startSpinner() {
        spinner.startAnimating()
    }
    
    func stopSpinner() {
        spinner.stopAnimating()
    }
}
