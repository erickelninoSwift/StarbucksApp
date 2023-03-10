//
//  HomeHeaderView.swift
//  StarbucksApp
//
//  Created by Erick El nino on 2023/03/07.
//  Copyright © 2023 Erick El nino. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView
{
    
    static let headerviewIdentifier = "HomeHeaderViewCellid"
    var greeting: UILabel =
    {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 30, weight: .light)
        label.text = " Good afternoon, \n Eriik ☀️"
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    lazy var indexButton: UIButton =
        {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(.label, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .light)
            return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        makeInboxButton()
        style()
        layout()
//        self.backgroundColor = .systemGray2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeHeaderView
{
    func style()
    {
        self.addSubview(greeting)
        self.addSubview(indexButton)
//        self.addSubview(indexButtonImage)
        
    }
    
    
    func layout()
    {
        
        self.heightAnchor.constraint(equalToConstant: 150).isActive =  true
        
        NSLayoutConstraint.activate([greeting.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 2),
                                     greeting.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1),
                                     self.trailingAnchor.constraint(equalToSystemSpacingAfter: greeting.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([indexButton.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 2),
                                     indexButton.topAnchor.constraint(equalToSystemSpacingBelow: greeting.bottomAnchor, multiplier: 2),
                                     self.bottomAnchor.constraint(equalToSystemSpacingBelow: indexButton.bottomAnchor, multiplier: 1),
                                     indexButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25)
                                     
            
        ])
    }
}

extension HomeHeaderView
{
    func makeInboxButton()
    {
        indexButton.setTitle("Inbox", for: .normal)
        indexButton.setTitleColor(.secondaryLabel, for: .normal)
        
        
        indexButton.setImage(UIImage(systemName: "envelope")?.withRenderingMode(.alwaysOriginal), for: .normal)
        indexButton.imageView?.contentMode = .scaleAspectFit
        indexButton.imageView?.tintColor = .secondaryLabel
        
        indexButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        indexButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
    }
}
