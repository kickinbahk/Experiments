//
//  FlickrPhotoTableViewCell.swift
//  GGNFlickr
//
//  Created by Garric Nahapetian on 5/26/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import UIKit

class FlickrPhotoTableViewCell: UITableViewCell {
    
    let ownernameLabel: UILabel
    let timeAgoLabel: UILabel
    let iconImageView: UIImageView
    let contentImageView: UIImageView
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        ownernameLabel = UILabel()
        ownernameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        timeAgoLabel = UILabel()
        timeAgoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView = UIImageView()
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .ScaleAspectFill
        
        contentImageView = UIImageView()
        contentImageView.translatesAutoresizingMaskIntoConstraints = false
        contentImageView.contentMode = .ScaleAspectFill
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(ownernameLabel)
        addSubview(timeAgoLabel)
        addSubview(iconImageView)
        addSubview(contentImageView)
        
        let height = UIScreen.mainScreen().bounds.width
        let views = ["ownername":ownernameLabel, "time":timeAgoLabel, "icon":iconImageView, "content":contentImageView]
        var constraints = [NSLayoutConstraint]()
        
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-[icon(48)]-[ownername]-|", options: [.AlignAllCenterY], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|[content]|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-[time]-|", options: [], metrics: nil, views: views)
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-[icon(48)]-[content(h)]-[time]-|", options: [], metrics: ["h":height], views: views)

        NSLayoutConstraint.activateConstraints(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCellWith(item: FlickrPhotoType) {
        ownernameLabel.text = item.ownername
        timeAgoLabel.text = item.uploadDate.descriptionWithLocale(NSLocale.currentLocale())
        iconImageView.image = item.icon
        contentImageView.image = item.image
        
    }
    
}
