//
//  FeedVM.swift
//  Flow
//
//  Created by Garric Nahapetian on 1/15/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//

import UIKit

protocol FeedDelegate: class {
    func didSelect(_ photo: Photo)
}

class FeedVM {
    var numberOfRows: Int { return items.count }
    weak var delegate: FeedDelegate?
    
    private let items: [Photo]

    init(items: [Photo]) {
        self.items = items
    }
    
    func cellForRow(at indexPath: IndexPath, from dequeuedCell: UITableViewCell?) -> UITableViewCell {
        let cell = dequeuedCell as? FeedCell ?? FeedCell()
        let image = items[indexPath.row].image
        cell.configure(with: image)
        return cell
    }
    
    func didSelectRow(at indexPath: IndexPath) {
        let photo = items[indexPath.row]
        delegate?.didSelect(photo)
    }
}
