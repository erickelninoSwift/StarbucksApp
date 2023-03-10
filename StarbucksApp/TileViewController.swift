//
//  TileViewController.swift
//  StarbucksApp
//
//  Created by Erick El nino on 2023/03/09.
//  Copyright © 2023 Erick El nino. All rights reserved.
//

import UIKit

class TileViewController: UIViewController
{
    
    let titlelabel: UILabel =
    {
        let label = UILabel()
        return label
        
    }()
    
    init(titlelabel: String)
    {
        super.init(nibName: nil, bundle: nil)
        self.titlelabel.text = titlelabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .starYellow
        style()
        layout()
    }
}

extension TileViewController
{
    private func style()
    {
        view.addSubview(titlelabel)
        self.titlelabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
    private func layout()
    {
        NSLayoutConstraint.activate([titlelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     titlelabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                                     self.view.heightAnchor.constraint(equalToConstant: 300)
                                     
        ])
    }
}
