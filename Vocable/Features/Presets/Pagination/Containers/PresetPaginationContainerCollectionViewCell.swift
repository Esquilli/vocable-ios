//
//  PresetPaginationCollectionViewCell.swift
//  Vocable AAC
//
//  Created by Patrick Gatewood on 2/20/20.
//  Copyright © 2020 WillowTree. All rights reserved.
//

import UIKit

class PresetPaginationContainerCollectionViewCell: VocableCollectionViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderedView.fillColor = .collectionViewBackgroundColor
        borderedView.backgroundColor = .collectionViewBackgroundColor
        pageViewController = PresetsPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pageViewController = PresetsPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
}
