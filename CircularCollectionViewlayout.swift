//
//  CircularCollectionViewlayout.swift
//  12marspinningWheel
//
//  Created by Appinventiv-PC on 12/03/18.
//  Copyright © 2018 Appinventiv-PC. All rights reserved.
//

import UIKit
// Mark :- LayoutAtribute class
class CircularCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {

         var anchorPoint = CGPoint(x: 0.5, y: 0.5)
          var angle: CGFloat = 0 {
     
             didSet {
               zIndex = Int(angle * 1000000)
                transform = CGAffineTransform(rotationAngle: angle)
                   }

 }
}
/* func copyWithZone(zone: NSZone) -> AnyObject {
    
       let copiedAttributes: CircularCollectionViewLayoutAttributes =
super.copyWithZone(zone) as! CircularCollectionViewLayoutAttributes
        copiedAttributes.anchorPoint = self.anchorPoint
        copiedAttributes.angle = self.angle
        return copiedAttributes */



// Mark :- layout Class

class CircularCollectionViewlayout : UICollectionViewLayout {

  class func layoutAttributesClass() -> AnyClass {
        return CircularCollectionViewLayoutAttributes.self
    }//mark :- array for holding attributes layout
    var attributesList = [CircularCollectionViewLayoutAttributes]()
    // mark :-Item size
          let itemSize = CGSize(width: 133, height: 173)
          var angleAtExtreme: CGFloat {
            return collectionView!.numberOfItems(inSection: 0) > 0 ? -CGFloat(collectionView!.numberOfItems(inSection: 0) - 1) * anglePerItem : 0
             }
         var angle: CGFloat {
            return angleAtExtreme * collectionView!.contentOffset.x / ( collectionViewContentSize().width -
                ( collectionView!.bounds.width))
    }
    
    // Mark :- Distance between Centre and Item
           var radius: CGFloat = 100{
        didSet {
            invalidateLayout()
               }
                }
    // Mark :- angle Between two items
    var anglePerItem: CGFloat {
        return atan(itemSize.width / radius)
    }
    
    // mark :- collectionviewcontentsize
    
 func collectionViewContentSize() -> CGSize {
        return CGSize(width: CGFloat(collectionView!.numberOfItems(inSection: 0)) * itemSize.width,
                      height:  collectionView!.bounds.height)
    }
    // Mark :- layout calculation
    
override func prepare() {
        super.prepare()
        
    
         var startIndex = 0
         var endIndex = collectionView!.numberOfItems(inSection: 0) - 1
      //  let anchorPointY = ((itemSize.height / 2.0) + radius) / itemSize.height
    let theta = atan2((collectionView!.bounds.width) / 2.0,
    radius + (itemSize.height / 2.0) - ((collectionView!.bounds.width) / 2.0))
   

    if (angle < -theta) {
        startIndex = Int(floor((-theta - angle) / anglePerItem))
    }

    endIndex = min(endIndex, Int(ceil((theta - angle) / anglePerItem)))
 
    if (endIndex < startIndex) {
        endIndex = 0
        startIndex = 0
    }
        let centerX = ((collectionView!.contentOffset.x + collectionView!.bounds.width) / 2.0 )
     
   
        attributesList = (startIndex...endIndex).map { (i)
            -> CircularCollectionViewLayoutAttributes in
        let attributes = CircularCollectionViewLayoutAttributes()
           attributes.size = self.itemSize
   
            attributes.center = CGPoint(x: centerX, y: (self.collectionView!.bounds.midY))
            attributes.angle = self.anglePerItem*CGFloat(i)
            return attributes
   
    }
    
    }
        
        func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
            return attributesList
        }
        
/*  func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath)
            -> UICollectionViewLayoutAttributes! {
                attributesList.anchorPoint = CGPoint(x: 0.5, y:AnchorPoint)
                return attributesList[indexPath.row]*/
    
    
        func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    }



        


