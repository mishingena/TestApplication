//
//  TableViewController.swift
//  TestApp
//
//  Created by Gennadiy Mishin on 01/12/2018.
//  Copyright © 2018 Gennadiy Mishin. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewController: UITableViewController {
    
    private var pullToRefreshControl: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(red: 221/255, green: 221/255, blue: 221/255, alpha: 1.0)
        tableView.separatorColor = .clear
        tableView.accessibilityIdentifier = "ItemsTableView"
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshAction(sender:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        pullToRefreshControl = refreshControl

        if ItemManager.shared.items.count == 0 {
            pullToRefreshControl.beginRefreshing()
            loadData()
        }
    }
    
    private func loadData() {
        ItemManager.shared.loadItems { [weak self] (items, error) in
            guard let self = self else { return }
            self.pullToRefreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Actions
    
    @objc private func refreshAction(sender: UIRefreshControl) {
        loadData()
    }
}

// MARK: - Table view data source

extension TableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemManager.shared.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ItemCell {
            cell.accessibilityIdentifier = "ItemCell\(indexPath.row)"
            let item = ItemManager.shared.items[indexPath.row]
            cell.titleLabel.text = item.title
            cell.descriptionLabel.text = item.description
            cell.priceLabel.text = "\(item.price)"
            cell.itemImageView?.sd_setImage(with: item.imageURL, completed: nil)
            
            return cell
        }
        
        return UITableViewCell(style: .default, reuseIdentifier: nil)
    }
}

// MARK: - Table view delegate

extension TableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = ItemManager.shared.items[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            vc.item = item
            present(vc, animated: true, completion: nil)
        }
    }
    
}
