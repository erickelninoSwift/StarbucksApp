//
//  AppDelegate.swift
//  StarbucksApp
//
//  Created by Erick El nino on 2023/03/05.
//  Copyright © 2023 Erick El nino. All rights reserved.
//

import UIKit

class StarbaucksViewController: UIViewController
{
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        comonIni()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func comonIni()
    {
    }
    
    
    func setTabBarImage(ImageName: UIImage, title: String)
    {
        self.tabBarItem = UITabBarItem(title: title, image: ImageName.withTintColor(.systemGreen, renderingMode: .alwaysOriginal), tag: 0)
    }

}


class ScnaViewController: StarbaucksViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Scan"
        self.navigationItem.title = "Scan"
        view.backgroundColor = .systemRed
    }
    
    override func comonIni() {
        
        setTabBarImage(ImageName: UIImage(systemName: "qrcode") ?? UIImage() , title: "Scan")
    }
}

class OrderViewController: StarbaucksViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = .systemBackground
         self.navigationItem.title = "Order"
        title = "Order"
    }
    
    override func comonIni() {
         setTabBarImage(ImageName: UIImage(systemName: "arrow.up.bin.fill") ?? UIImage() , title: "Order")
    }
}

class GiftViewController: StarbaucksViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
         view.backgroundColor = .systemBlue
         self.navigationItem.title = "Gift"
        title = "Gift"
    }
    override func comonIni() {
         setTabBarImage(ImageName: UIImage(systemName: "gift.fill") ?? UIImage() , title: "Gift")
    }
}





@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let tabController = UITabBarController()
        
        let controller1 = makeNavigationController(controller: HomeViewController())
        let controller2 = UINavigationController(rootViewController: ScnaViewController())
        let controller3 = UINavigationController(rootViewController: OrderViewController())
        let controller4 = UINavigationController(rootViewController: GiftViewController())
        
        tabController.tabBar.tintColor = .systemGreen
//        tabController.tabBarItem.image?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
        
        tabController.viewControllers = [controller1,controller2,controller3,controller4]
        window?.rootViewController = tabController
        
        return true
    }
    
    
    
    func makeNavigationController(controller: UIViewController) -> UINavigationController
    {
        let navigation = UINavigationController(rootViewController: controller)
        navigation.navigationBar.prefersLargeTitles = true
        return navigation
    }
    
}

