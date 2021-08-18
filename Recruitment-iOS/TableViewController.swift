//
//  TableViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var itemModels: [ItemGeneralModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchItems()
    }
    
    // MARK: - TableView methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let itemModel = itemModels[indexPath.row]
        cell.backgroundColor = itemModel.color
        cell.textLabel?.text = itemModel.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let model = itemModels[indexPath.row]
        vc.model = model
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - Fetch data method
extension TableViewController {
    private func fetchItems() {
        NetworkingManager.sharedManager.downloadItems() { [weak self] result in
            switch result {
            case .success(let items):
                self?.itemModels = items
                self?.reloadTableView()
                
            case .failure(let error):
                print("Failed to fetch items: \(error)")
            }
            
        }
    }
}
