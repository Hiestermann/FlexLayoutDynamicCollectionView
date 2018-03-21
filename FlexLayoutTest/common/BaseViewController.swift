//
//  BaseViewController.swift
//  FlexLayoutTest
//
//  Created by Kilian on 19.03.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if #available(iOS 11.0, *) {
        } else if let view = view as? BaseView {
            view.setSafeArea(UIEdgeInsets(top: topLayoutGuide.length, left: 0, bottom: bottomLayoutGuide.length, right: 0))
        }
    }
}
