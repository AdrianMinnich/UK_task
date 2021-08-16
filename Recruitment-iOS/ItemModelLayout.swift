//
//  ItemModelLayout.swift
//  Recruitment-iOS
//
//  Created by Adrian Minnich on 16/08/2021.
//  Copyright © 2021 Untitled Kingdom. All rights reserved.
//

import UIKit

protocol ItemModelLayoutDelegate: AnyObject {
    func collectionView(
        _ collectionView: UICollectionView,
        heightForPreviewAtIndexPath indexPath: IndexPath) -> CGFloat
    
}

class ItemModelLayout: UICollectionViewLayout {
    
    weak var delegate: ItemModelLayoutDelegate!
    // Cache is array of matrix with coordinates cell in X,Y
    // It will provide coordinates for visibility cell for UIKit
    // We can change it, as how we want
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    // Determinate height of content after first loop
    // Increment as content cell are added
    
    let cellPadding: CGFloat = 5
    let numberOfColumns = 2
    fileprivate var contentHeight: CGFloat = 0
    
    static let bannerHeight: CGFloat = 120
    static let placeholderHeight: CGFloat = 210
    static let cellBaseHeight: CGFloat = 200
    
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    // Method to return the size of the collection view’s contents
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        super.prepare()
        // Need to clear cache for invalidate layout
        self.cache.removeAll()
        
        guard cache.isEmpty, let collectionView = collectionView else {
            return
        }
        // If we had 2 sections we generate first elements and than get that offset and call it again
        // For example first section is "onboarding"
        if collectionView.numberOfSections > 1 {
            let lastSection = collectionView.numberOfSections - 1
            let yOffset = prepareForMain(collectionView: collectionView, section: 0, numberOfColumns: 1)
            let _ = prepareForMain(collectionView: collectionView, section: lastSection, numberOfColumns: numberOfColumns, inYOffset: yOffset)
        } else {
            let _ = prepareForMain(collectionView: collectionView, section: 0, numberOfColumns: numberOfColumns)
        }
    }
    
    func prepareForMain(collectionView: UICollectionView, section: Int, numberOfColumns: Int, inYOffset: CGFloat? = nil) -> CGFloat? {
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        if let inYOff = inYOffset {
            for index in 0..<numberOfColumns {
                yOffset[index] = inYOff
            }
        }
        
        for item in 0..<collectionView.numberOfItems(inSection: section) {
            
            let indexPath = IndexPath(item: item, section: section)
            
            let descriptionHeight = delegate.collectionView(collectionView, heightForPreviewAtIndexPath: indexPath)
            let height = cellPadding * 2 + descriptionHeight
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(
                dx: cellPadding,
                dy: cellPadding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
        return yOffset.last
    }
    // Here you simply retrieve and return from cache the layout attributes which correspond to the requested indexPath
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
    // Determine which items are visible in the given rect.
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // Loop through the cache and look for items in the rect
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
}

