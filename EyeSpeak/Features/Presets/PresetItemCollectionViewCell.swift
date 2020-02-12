//
//  PresetItemCollectionViewCell.swift
//  EyeSpeak
//
//  Created by Patrick Gatewood on 1/28/20.
//  Copyright © 2020 WillowTree. All rights reserved.
//

import UIKit

class PresetItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet fileprivate weak var textLabel: UILabel!
    
    fileprivate let borderedView = BorderedView()

    fileprivate var defaultBackgroundColor: UIColor?
    
    override var isHighlighted: Bool {
        didSet {
             updateContentViews()
        }
    }

    override var isSelected: Bool {
        didSet {
            updateContentViews()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        borderedView.cornerRadius = 8
        borderedView.borderColor = .cellBorderHighlightColor
        borderedView.backgroundColor = .collectionViewBackgroundColor
        
        updateContentViews()
        backgroundView = borderedView
    }
    
    fileprivate func updateContentViews() {
        borderedView.borderWidth = (isHighlighted && !isSelected) ? 4 : 0
        borderedView.fillColor = isSelected ? .cellSelectionColor : fillColor
        borderedView.isOpaque = true

        textLabel.textColor = isSelected ? .selectedTextColor : .defaultTextColor
        textLabel.backgroundColor = borderedView.fillColor
        textLabel.isOpaque = true
    }
    
    var fillColor: UIColor = .defaultCellBackgroundColor {
        didSet {
            updateContentViews()
        }
    }

    func setup(title: String) {
        textLabel.text = title
    }
    
    func changeTitleFont(font: UIFont) {
        textLabel.font = font
    }
    
    func setup(with image: UIImage?) {
        guard let image = image else {
            return
        }
        
        let systemImageAttachment = NSTextAttachment(image: image)
        let attributedString = NSAttributedString(attachment: systemImageAttachment)
        
        textLabel.attributedText = attributedString
    }
}

class CategoryItemCollectionViewCell: PresetItemCollectionViewCell {
    
    override fileprivate func updateContentViews() {
        borderedView.borderWidth = (isHighlighted && !isSelected) ? 4 : 0
        borderedView.fillColor = isSelected ? .cellSelectionColor : .categoryBackgroundColor
        borderedView.backgroundColor = .categoryBackgroundColor
        borderedView.isOpaque = true
        
        textLabel.textColor = isSelected ? .selectedTextColor : .defaultTextColor
        textLabel.backgroundColor = borderedView.fillColor
        textLabel.isOpaque = true
    }
}

class KeyboardKeyGroupCollectionViewCell: PresetItemCollectionViewCell {
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func setup(title: String) {
        guard !title.isEmpty else {
            return
        }
        
        title.forEach { character in
            let label = UILabel()
            label.textColor = .defaultTextColor
            label.font = .boldSystemFont(ofSize: 48)
            label.text = "\(character)"
            stackView.addArrangedSubview(label)
        }
    }
    
    override func prepareForReuse() {
        stackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    override fileprivate func updateContentViews() {
        borderedView.borderWidth = (isHighlighted && !isSelected) ? 4 : 0
        borderedView.fillColor = isSelected ? .cellSelectionColor : fillColor
        borderedView.isOpaque = true
    }

}
