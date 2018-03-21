//
//  FlexLayoutCollectionViewCell.swift
//  FlexLayoutTest
//
//  Created by Kilian on 19.03.18.
//  Copyright © 2018 Kilian. All rights reserved.
//

import UIKit
import FlexLayout

class FlexLayoutCollectionViewCell: UICollectionViewCell {
    fileprivate let nameLabel = UILabel()
    
    let viewProfileButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("View Profile", for: .normal)
        button.layer.borderWidth = 1
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        return button
    }()
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        return image
    }()
    
    let textInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    let multiImage: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        return iv
    }()

    fileprivate func setup() -> Flex {
        return contentView.flex.margin(10).justifyContent(.center).alignItems(.center).grow(1).define { (flex) in
            flex.addItem().direction(.row).justifyContent(.start).grow(1).define({ (flex) in
                flex.addItem(profileImage).width(100).height(100).aspectRatio(of: profileImage)
                
                flex.addItem().direction(.column).marginRight(10).grow(1).shrink(1).marginLeft(10).define({ (flex) in
                
                    flex.addItem(nameLabel)
                    flex.addItem(dateLabel)
                    flex.addItem().direction(.row).margin(10).define({ (flex) in
                        
                            flex.addItem(multiImage).width(46).height(48).marginLeft(5)
                    })
                    flex.addItem(textInfoLabel).marginTop(10).marginBottom(10).marginRight(10)
                    
                })
            })
            flex.addItem(viewProfileButton).alignItems(.center).height(50).width(200).marginBottom(100)
           //flex.addItem().width(frame.width).height(1).backgroundColor(.lightGray)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nameLabel.font = UIFont.systemFont(ofSize: 50)
        nameLabel.textColor = .black
        nameLabel.text = "Hello World"
        nameLabel.numberOfLines = 0
        _ = setup()
        
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        super.layoutSubviews()
        contentView.pin.top().left().width(size.width)
        layout()
        return contentView.frame.size
    }
    
    func configure(text: dataExample) {
        if(text.name == ""){
            nameLabel.flex.height(0)
        } else {
             nameLabel.text = text.name
        }
        
        if(text.infoText == ""){
            textInfoLabel.flex.height(0)
        } else {
            textInfoLabel.text = text.name
            textInfoLabel.flex.markDirty()
        }
        
        if(text.date == ""){
            dateLabel.flex.height(0)
        } else {
            dateLabel.text = text.date
            dateLabel.flex.markDirty()
        }
        
        if(text.numberOfImage == 0){
            multiImage.flex.height(0)
        }
        
       
        viewProfileButton.flex.markDirty()
        nameLabel.flex.markDirty()
        nameLabel.numberOfLines = 10
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        setNeedsLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
    private func layout() {
        contentView.flex.layout(mode: .adjustHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    }
