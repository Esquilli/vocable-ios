//
//  TrackingTextView.swift
//  EyeTrackingTest
//
//  Created by Kyle Ohanian on 4/17/19.
//  Copyright © 2019 WillowTree. All rights reserved.
//

import UIKit

class TrackingTextView: UITextView, TrackableWidget, CircularAnimatable {
    var hoverBorderColor: UIColor?
    var isTrackingEnabled: Bool = true
    var animationSpeed: TimeInterval = 1.0
    
    var animationViewColor: UIColor? {
        didSet {
            self.animationView.backgroundColor = self.animationViewColor
        }
    }
    
    var parent: TrackableWidget?
    var gazeableComponent = GazeableTrackingComponent()
    
    var id: Int?
    
    func add(to engine: TrackingEngine) {
        engine.registerView(self)
    }
    
    lazy var animationView: UIView = {
        let view = UIView()
        self.addSubview(view)
        self.sendSubviewToBack(view)
        view.backgroundColor = .animatingColor
        return view
    }()
}
