//
//  ViewController.swift
//  FlexLayoutTest
//
//  Created by Kilian on 19.03.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import UIKit

class FlexLayoutCollectionViewController: UIViewController{

    fileprivate var mainView: FlexLayoutCollectionView {
        return self.view as! FlexLayoutCollectionView
    }
    
    
      init() {
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func loadView() {
        view = FlexLayoutCollectionView()

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}



