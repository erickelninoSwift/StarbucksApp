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
        view.backgroundColor = .systemBlue
        return view
    }()
    
    private var tableview: UITableView =
    {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints =  false
        table.register(HomeHeaderView.self, forHeaderFooterViewReuseIdentifier: HomeHeaderView.headerviewIdentifier)
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
        let erickAttr = [NSAttributedString.Key.foregroundColor: UIColor.label,
                         NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .title1).bold()
        ]
        
        self.navigationController?.navigationBar.titleTextAttributes = erickAttr
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func setupHeaderView()
    {
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(HomeHeaderView.self, forHeaderFooterViewReuseIdentifier:HomeHeaderView.headerviewIdentifier)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HomeHeaderView()
    }
    

}
