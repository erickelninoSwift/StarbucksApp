//
//  HomeViewController.swift
//  StarbucksApp
//
//  Created by Erick El nino on 2023/03/06.
//  Copyright © 2023 Erick El nino. All rights reserved.
//

import UIKit

class HomeViewController: StarbaucksViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Good afternoon, Eriik😃"
        setupTitle()
    }
    
    override func comonIni() {
        guard let image = UIImage(systemName: "house.fill") else {return}
        setTabBarImage(ImageName: image, title: "Home")
    }
}

extension HomeViewController
{
    func setupTitle()
    {
        //        let attributed = NSAttributedString(string: "/n Good afternoon,", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .semibold),.foregroundColor: UIColor.label])
        //        let mutableString = NSMutableAttributedString(string: "Eriik Elninno 😃", attributes: [.font: UIFont.systemFont(ofSize: 18, weight: .semibold)])
        //        mutableString.append(attributed)
        //
        let erickAttr = [NSAttributedString.Key.foregroundColor: UIColor.label,
                         NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1).bold()
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = erickAttr
        
    }
}
