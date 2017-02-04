//
//  FeedVC.swift
//  Flow
//
//  Created by Garric Nahapetian on 1/15/17.
//  Copyright © 2017 Garric Nahapetian. All rights reserved.
//

import UIKit

final class FeedVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UITableViewDataSourcePrefetching {
    private let tableView = UITableView(frame: CGRect.zero, style: .plain)
    private let viewModel: FeedVM

    init(viewModel: FeedVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        tableView.estimatedRowHeight = UIScreen.main.bounds.width
        tableView.rowHeight = UIScreen.main.bounds.width
        tableView.dataSource = self
        tableView.register(
            FeedCell.self,
            forCellReuseIdentifier: FeedCell.reuseID
        )
        
        self.viewModel.doneRefreshingOutput.onNext { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = tableView
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: FeedCell.reuseID)
        let cell = dequeuedCell as? FeedCell ?? FeedCell()
        let image = viewModel.image(at: indexPath)
        cell.configure(with: image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach(viewModel.prefetchImage)
    }
}
