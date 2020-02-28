//
//  HistoryViewController.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import UIKit

final class HistoryViewController: UIViewController, HistoryViewProtocol {
    
    var presenter: HistoryPresenterProtocol?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabBarItem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
    }
    
    private func setupTabBarItem() {
        let image = UIImage(named: "history")
        tabBarItem = UITabBarItem(title: "History", image: image, tag: 1)
    }
    
    
}
