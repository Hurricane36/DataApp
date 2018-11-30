//
//  BucketItemCell.swift
//  DataApp
//
//  Created by Tolman, Caiden on 11/30/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class BucketItemCell: UITableViewCell {
    
    @IBOutlet weak var bucketItemText: UILabel!
    
    @IBOutlet weak var bucketItemSymbol: UILabel!
    
    @IBOutlet weak var bucketItemSignature: UILabel!
    
    
    var currentBucketItem : BucketItem!
    {
        didSet
        {
            updateCellView()
        }
    }
    private func randomEmoji()->String
    {
        let emojiStart = 0x1F601
        let emojiEnd = 0x2F64F
        let symbolStart = 0x1F680
        let symbolEnd = 0x1F6C5
        
        let emojiRange = 79
        let symbolRange = 70
        
        
        let ascii = emojiStart +
            Int(arc4random_uniform(UInt32(emojiRange)))
        let emoji = UnicodeScalar(ascii)?.description
        return emoji!
    }
    
    private func updateCellView() -> Void
    {
        if (currentBucketItem != nil)
        {
            bucketItemSignature.text = currentBucketItem.itemAuthor
            bucketItemText.text = currentBucketItem.itemContents
        }
        else
        {
            bucketItemSignature.text = "Author goes here"
            bucketItemText.text = "Bucket item contents here"
        }
        
        bucketItemSymbol.text = randomEmoji()
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
