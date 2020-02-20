//
//  PresetsPageViewController.swift
//  EyeSpeak
//
//  Created by Patrick Gatewood on 2/20/20.
//  Copyright © 2020 WillowTree. All rights reserved.
//

import UIKit

class PresetsPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var selectedItem: String?
    
    private let itemsPerPage = 9
    private var selectedCategory: PresetCategory
    
    private lazy var pages: [UIViewController] = {
        TextPresets.presetsByCategory[selectedCategory]?.chunked(into: itemsPerPage).map { presets in
            let collectionViewController = PresetPageCollectionViewController(collectionViewLayout: PresetPageCollectionViewController.CompositionalLayout(with: presets.count))
            collectionViewController.items = presets
            return collectionViewController
            } ?? []
    }()
    
    init(selectedCategory: PresetCategory) {
        self.selectedCategory = selectedCategory
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        if let firstViewController = pages.first {
            setViewControllers([firstViewController], direction: .forward, animated: true)
        }
    }
    
    // MARK: - UIPageViewControllerDataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard pages.count > 1,
            let index = pages.firstIndex(of: viewController) else {
                return nil
        }
        
        return pages[safe: index - 1] ?? pages.last
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard pages.count > 1,
            let index = pages.firstIndex(of: viewController) else {
                return nil
        }
        
        return pages[safe: index + 1] ?? pages.first
    }
}
