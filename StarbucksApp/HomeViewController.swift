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
    
    private var scrollView = UIScrollView()
    
    private var stackview = UIStackView()
    
    var TileController = [TileViewController(titlelabel: "Star Balance"),
                          TileViewController(titlelabel: "Bonus Stars"),
                          TileViewController(titlelabel: "Try these"),
                          TileViewController(titlelabel: "Welcome back"),
                          TileViewController(titlelabel: "Uplifting"),
    ]
    
    private var homeheader: HomeHeaderView =
    {
        let view = HomeHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupHeaderView()
        setupTitle()
        
        style()
        layout()
        setupScollview()
        
    }
    
    override func comonIni() {
        guard let image = UIImage(systemName: "house.fill") else {return}
        setTabBarImage(ImageName: image, title: "Home")
    }
    
}


extension HomeViewController
{
    private func style()
    {
        stackview.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        
    }
    
    
    private func layout()
    {
        stackview.axis = .vertical
        stackview.spacing = 8
        stackview.distribution = .equalSpacing
        
        scrollView.backgroundColor = .lightGreen
        
        NSLayoutConstraint.activate([scrollView.topAnchor.constraint(equalToSystemSpacingBelow: homeheader.bottomAnchor, multiplier: 1),
                                     scrollView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
                                     view.trailingAnchor.constraint(equalToSystemSpacingAfter: scrollView.trailingAnchor, multiplier: 1),
                                     view.bottomAnchor.constraint(equalToSystemSpacingBelow: scrollView.bottomAnchor, multiplier: 1)
                                     
        ])
        
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
    
    
    func setupHeaderView()
    {
        
        
        view.addSubview(homeheader)
        
        headerviewtopAnchpr = homeheader.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        
        NSLayoutConstraint.activate([headerviewtopAnchpr!,
                                     homeheader.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
                                     view.trailingAnchor.constraint(equalToSystemSpacingAfter: homeheader.trailingAnchor, multiplier: 0)
        ])
        
    }
}

extension HomeViewController: UIScrollViewDelegate
{
    private func setupScollview()
    {
        scrollView.delegate = self
    }
    
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
