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
            label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
            label.text = "Good afternoon, Eriik ☀️"
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            
            return label
    }()
    
    lazy var indexButton: UIButton =
        {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitleColor(.label, for: .normal)
            button.setTitle("Inbox", for: .normal)
            button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
            return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
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
        
    }
    
    
    func layout()
    {
        
        self.heightAnchor.constraint(equalToConstant: 150).isActive =  true
        
        NSLayoutConstraint.activate([greeting.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 2),
                                     greeting.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1),
                                     self.trailingAnchor.constraint(equalToSystemSpacingAfter: greeting.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([indexButton.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 1),
                                     indexButton.topAnchor.constraint(equalToSystemSpacingBelow: greeting.bottomAnchor, multiplier: 2),
                                     self.bottomAnchor.constraint(equalToSystemSpacingBelow: indexButton.bottomAnchor, multiplier: 2)
                                     
        ])
    }
}
