//
//  FlexLayoutCollectionView.swift
//  FlexLayoutTest
//
//  Created by Kilian on 19.03.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import UIKit
import PinLayout
import FlexLayout

class FlexLayoutCollectionView: UIView {
    let values = ["true, false, true, true, true, false , false, true, false, true, true, true", "Call this method on your application’s main thread when you want to adjust the layout of a view’s subviews. This method makes a note of the request and returns immediately. Because this method does not force an immediate update, but instead waits for the next update cycle, you can use it to invalidate the layout of multiple views before any of those views are updated. This behavior allows you to consolidate all of your layout updates to one update cycle, which is usually better for performance.", "Hello", "Invalidates the current layout of the receiver and triggers a layout update during the next update cycle."]
    fileprivate let cellTemplate = FlexLayoutCollectionViewCell()
    fileprivate let collectionView: UICollectionView
    fileprivate let flowLayout = UICollectionViewFlowLayout()
    
    init() {
         collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        super.init(frame: .zero)
        setupCollectionView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.pin.all()
        
    }
    
    fileprivate func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(FlexLayoutCollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
        collectionView.backgroundColor = .white
        flowLayout.minimumLineSpacing = 0
        addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:- UICollectionviewDelegate, UICollectionViewDataSource
extension FlexLayoutCollectionView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataExamples.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! FlexLayoutCollectionViewCell
        
        cell.configure(text: dataExamples[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let adjustedWidth = adjustWidthWithSafeArea(collectionView.bounds.width)
        
        cellTemplate.configure(text: dataExamples[indexPath.row])
        return cellTemplate.sizeThatFits(CGSize(width: adjustedWidth, height: .greatestFiniteMagnitude))
    }
    
    private func adjustWidthWithSafeArea(_ width: CGFloat) -> CGFloat {
        if #available(iOS 11.0, *) {
            return width - safeAreaInsets.left - safeAreaInsets.right
        } else {
            return width
        }
    }
    
}
