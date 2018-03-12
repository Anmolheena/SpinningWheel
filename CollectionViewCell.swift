//
//  CollectionViewCell.swift
//  12marspinningWheel
//
//  Created by Appinventiv-PC on 12/03/18.
//  Copyright © 2018 Appinventiv-PC. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        let circularlayoutAttributes = layoutAttributes as! CircularCollectionViewLayoutAttributes
        let height  : CGFloat = self.frame.size.height;
        self.layer.anchorPoint = circularlayoutAttributes.anchorPoint
        self.center.y += (circularlayoutAttributes.anchorPoint.y - 0.5) * height
    }
    
}
