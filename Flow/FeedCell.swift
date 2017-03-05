//
//  FeedCell.swift
//  Flow
//
//  Created by Garric Nahapetian on 1/21/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//

import UIKit

final class FeedCell: BaseCell {
    static var reuseID: String {
        return NSStringFromClass(self)
    }
    
    private let photoImageView = UIImageView(frame: CGRect.zero)
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: FeedCell.reuseID)
    }
    
    override func setup() {
        contentView.addSubview(photoImageView)
    }
    
    override func style() {
        photoImageView.contentMode = .scaleAspectFill
    }
    
    override func layout() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ]
        )
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
