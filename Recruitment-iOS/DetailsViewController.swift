//
//  DetailsViewController.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, NetworkingManagerDelegate {
    
    @IBOutlet weak var textView: UITextView!
    
    var model: ItemModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBarTitle()
        configureView()
        
        guard let model = model else { return }
        
        NetworkingManager.sharedManager.delegate = self
        NetworkingManager.sharedManager.downloadItemWithID(model.id)
    }
    
    func downloadedItems(_ items: [ItemModel]) {
        
    }
    
    func downloadedItemDetails(_ itemDetails: ItemDetailsModel) {
        textView.text = itemDetails.desc
    }
    
    public func configure(with model: ItemModel) {
        textView.text = model.name
    }
    
    private func configureBarTitle() {
        guard let model = model else { return }
        let title = model.name
        var newTitle = ""
        for (index, letter) in title.enumerated() {
            let newLetter = index % 2 == 0 ? String(letter).uppercased() : String(letter).lowercased()
            newTitle += newLetter
        }
        
        self.title = newTitle
    }
    
    private func configureView() {
        guard let model = model else { return }
        self.view.backgroundColor = model.color
    }

}
