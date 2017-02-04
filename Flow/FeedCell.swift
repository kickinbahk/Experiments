//
//  FeedCell.swift
//  Flow
//
//  Created by Garric Nahapetian on 1/21/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//

import UIKit
import Cartography

final class FeedCell: BaseCell {
    static var reuseID: String {
        return NSStringFromClass(self)
    }
    
    private let photoImageView = UIImageView(frame: CGRect.zero)
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: FeedCell.reuseID)
    }
    
    override func setup() {
        addSubview(photoImageView)
    }
    
    override func style() {
        photoImageView.contentMode = .scaleAspectFill
    }
    
    override func layout() {
        constrain(photoImageView) { photoImageView in
            photoImageView.leading == photoImageView.superview!.leading + 10
            photoImageView.trailing == photoImageView.superview!.trailing - 10
            photoImageView.top == photoImageView.superview!.top + 10
            photoImageView.bottom == photoImageView.superview!.bottom - 10
        }
    }
    
    func configure(with image: UIImage?) {
        photoImageView.image = image
    }
}

class BaseCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
        self.style()
        self.layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {}
    func style() {}
    func layout() {}
}
