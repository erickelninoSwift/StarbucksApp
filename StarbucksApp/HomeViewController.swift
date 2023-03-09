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
    
    var headerviewtopAnchpr: NSLayoutConstraint?
    
    private var homeheader: HomeHeaderView =
    {
        let view = HomeHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
//
//    var tableview: UITableView =
//    {
//        let table = UITableView()
//        table.translatesAutoresizingMaskIntoConstraints =  false
//        return table
//    }()
    
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
    }
}


extension HomeViewController
{
    
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableview.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = "Eriik"
//        cell.accessoryType = .disclosureIndicator
//        return cell
//    }
    
    func setupHeaderView()
    {
//        tableview.dataSource = self
//        tableview.delegate = self
//        tableview.tableFooterView = UIView()
        
        view.addSubview(homeheader)
        
        headerviewtopAnchpr = homeheader.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        
        NSLayoutConstraint.activate([headerviewtopAnchpr!,
                                     homeheader.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
                                     view.trailingAnchor.constraint(equalToSystemSpacingAfter: homeheader.trailingAnchor, multiplier: 0)
        ])
        
        
//        view.addSubview(tableview)
//
//        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//
//        NSLayoutConstraint.activate([tableview.leadingAnchor.constraint(equalToSystemSpacingAfter: self.view.leadingAnchor, multiplier: 1),
//                                     tableview.topAnchor.constraint(equalToSystemSpacingBelow: homeheader.bottomAnchor, multiplier: 1),
//                                     view.trailingAnchor.constraint(equalToSystemSpacingAfter: tableview.trailingAnchor, multiplier: 1),
//                                     view.bottomAnchor.constraint(equalToSystemSpacingBelow: tableview.bottomAnchor, multiplier: 1)
//        ])
        
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        guard y >= 0 else {return}
        let snippingDown = y <= 0
        let shouldSnap = y > 30
        let labelHeight = homeheader.greeting.frame.height + 16
        
        UIView.animate(withDuration: 0.3) {
            self.homeheader.greeting.alpha = snippingDown ? 1.0 : 0.0
        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.2, delay: 0, options: [], animations: {
            self.headerviewtopAnchpr?.constant = shouldSnap ? -labelHeight: 0
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
}
