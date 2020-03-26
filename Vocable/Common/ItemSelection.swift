//
//  ItemSelection.swift
//  Vocable AAC
//
//  Created by Patrick Gatewood on 2/25/20.
//  Copyright © 2020 WillowTree. All rights reserved.
//

import Foundation
import Combine
import CoreData

class ItemSelection {
    
    @PublishedValue
    static var selectedCategory = Category.fetchAll(in: NSPersistentContainer.shared.viewContext,
                      sortDescriptors: [NSSortDescriptor(keyPath: \Category.identifier, ascending: true)])
    .compactMap { CategoryViewModel($0) }.first!

    @PublishedValue
    static var selectedPhrase: PhraseViewModel?
    
    @PublishedValue
    static var presetsPageIndicatorProgress: CarouselGridPagingProgress = (pageIndex: 0, pageCount: 0)
}

@propertyWrapper struct PublishedValue<T> {

    private let subject: CurrentValueSubject<T, Never>

    var wrappedValue: T {
        didSet {
            subject.send(wrappedValue)
        }
    }

    var projectedValue: AnyPublisher<T, Never> {
        mutating get {
            return subject.eraseToAnyPublisher()
        }
    }

    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        self.subject = CurrentValueSubject<T, Never>(self.wrappedValue)
    }
}
