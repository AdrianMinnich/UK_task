//
//  CollectionViewController.swift
//  Recruitment-iOS
//
//  Created by Adrian Minnich on 15/08/2021.
//  Copyright © 2021 Untitled Kingdom. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var itemModels: [ItemGeneralModel] = []
    
    override func viewDidLoad() {
        if let layout = collectionView?.collectionViewLayout as? ItemGeneralModelLayout {
          layout.delegate = self
            
        }
        super.viewDidLoad()
        fetchItems()
    }
    
    // MARK: - CollectionView methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemModels.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemGeneralModelCollectionViewCell.identifier, for: indexPath) as! ItemGeneralModelCollectionViewCell
        let model = itemModels[indexPath.item]
        cell.configure(with: model)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        let model = itemModels[indexPath.row]
        vc.model = model
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize / 2, height: collectionViewSize / 2)
    }
    
    private func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - Fetch data method
extension CollectionViewController {
    private func fetchItems() {
        NetworkingManager.sharedManager.downloadItems() { [weak self] result in
            switch result {
            case .success(let items):
                self?.itemModels = items
                self?.reloadCollectionView()
                
            case .failure(let error):
                print("Failed to fetch items: \(error)")
            }
            
        }
    }
}

// MARK: - Dynamic height for cell
extension CollectionViewController: ItemGeneralModelLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPreviewAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        let item = itemModels[indexPath.row]
        let nameHeight = requiredTextHeight(text: item.name, font: UIFont.systemFont(ofSize: 22, weight: .bold), cellWidth: (collectionView.frame.size.width - 10) / 2 - 10)
        let previewHeight = requiredTextHeight(text: item.preview, font: UIFont.systemFont(ofSize: 13, weight: .regular), cellWidth: (collectionView.frame.size.width - 10) / 2 - 10)
        return nameHeight + previewHeight + 25
    }
    
    func requiredTextHeight(text: String, font: UIFont, cellWidth: CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: cellWidth, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
}
