//
//  DetailsViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    var model: ItemGeneralModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let model = model else { return }
        fetchItem(with: model.id)
        configureView(with: model)
    }
    
    // MARK: - Configure view methods
    private func configureView(with model: ItemGeneralModel) {
        configureBackgroundColor(with: model)
        configureBarTitle(with: model)
    }
    
    private func configureBackgroundColor(with model: ItemGeneralModel) {
        self.view.backgroundColor = model.color
    }
    
    private func configureBarTitle(with model: ItemGeneralModel) {
        let title = model.name
        var newTitle = ""
        for (index, letter) in title.enumerated() {
            let newLetter = index % 2 == 0 ? String(letter).uppercased() : String(letter).lowercased()
            newTitle += newLetter
        }
        self.title = newTitle
    }
    
    private func configureTextLabel(with model: ItemDetailsModel) {
        textLabel.text = model.desc
    }
}

// MARK: - Fetch data method
extension DetailsViewController {
    private func fetchItem(with id: String) {
        NetworkingManager.sharedManager.downloadItemWithID(id) { [weak self] result in
            switch result {
            case .success(let item):
                self?.configureTextLabel(with: item)
                
            case .failure(let error):
                print("Failed to fetch items: \(error)")
            }
        }
    }
}
