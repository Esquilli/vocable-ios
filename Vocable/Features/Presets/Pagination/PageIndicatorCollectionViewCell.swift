//
//  PageIndicatorCollectionViewCell.swift
//  Vocable AAC
//
//  Created by Patrick Gatewood on 2/20/20.
//  Copyright © 2020 WillowTree. All rights reserved.
//

import UIKit
import Combine

final class PageIndicatorCollectionViewCell: VocableCollectionViewCell {
    
    @IBOutlet private weak var pageLabel: UILabel!
    private var disposables = Set<AnyCancellable>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fillColor = .collectionViewBackgroundColor
        pageLabel.adjustsFontSizeToFitWidth = true
        
        ItemSelection.$presetsPageIndicatorProgress.sink(receiveValue: { [weak self] pageInfo in
            self?.pageLabel.text = String.localizedStringWithFormat(NSLocalizedString("Page %d of %d", comment: ""), pageInfo.pageIndex + 1, pageInfo.pageCount)
        }).store(in: &disposables)
    }
}
