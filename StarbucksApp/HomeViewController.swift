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
    
    private var homeheader: HomeHeaderView =
    {
        let view = HomeHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    var tableview: UITableView =
    {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints =  false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupHeaderView()
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
//        let erickAttr = [NSAttributedString.Key.foregroundColor: UIColor.label,
//                         NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1).bold()
//        ]
//
////        self.navigationController?.navigationBar.titleTextAttributes = erickAttr
//
        
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource
{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Eriik"
        return cell
    }
    
    func setupHeaderView()
    {
        tableview.dataSource = self
        tableview.delegate = self
        
        
        view.addSubview(homeheader)
        
        NSLayoutConstraint.activate([homeheader.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 0),
                                     homeheader.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
                                     view.trailingAnchor.constraint(equalToSystemSpacingAfter: homeheader.trailingAnchor, multiplier: 0)
        ])
        
        
        //        view.addSubview(tableview)
        
        //        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        //
        //        NSLayoutConstraint.activate([tableview.leadingAnchor.constraint(equalToSystemSpacingAfter: self.view.leadingAnchor, multiplier: 1),
        //                                     tableview.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
        //                                     view.trailingAnchor.constraint(equalToSystemSpacingAfter: tableview.trailingAnchor, multiplier: 1),
        //                                     view.bottomAnchor.constraint(equalToSystemSpacingBelow: tableview.bottomAnchor, multiplier: 1)
        //        ])
        
    }
    
}
