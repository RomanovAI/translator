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
    
    let cellId = "HistoryTableViewCell"
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.register(UINib(nibName: cellId, bundle: .main), forCellReuseIdentifier: cellId)
            tableView.separatorStyle = .none
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupTabBarItem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        presenter?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.reloadData()
    }
    
    func reloadData() {
        guard isViewLoaded else { return }
        tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        title = "History"
        let removeItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(tapRightBarButtonItem))
        removeItem.tintColor = .black
        navigationItem.rightBarButtonItem = removeItem
    }
    
    private func setupTabBarItem() {
        let image = UIImage(named: "history")
        tabBarItem = UITabBarItem(title: "History", image: image, tag: 1)
    }
    
    @objc func tapRightBarButtonItem() {
        presenter?.removeAll()
    }
    
}

extension HistoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let arrayTranslatedText = presenter?.translatedText else { return 0 }
        return arrayTranslatedText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HistoryTableViewCell, let arrayTranslatedText = presenter?.translatedText else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setup(inputText: arrayTranslatedText[indexPath.row].inputText, outputText: arrayTranslatedText[indexPath.row].outputText)
        return cell
    }
}

extension HistoryViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let action = UIContextualAction(style: .destructive, title: "Delete", handler: { action, view, completion in
//
//            view.backgroundColor = .green
//        })
//        let configuration = UISwipeActionsConfiguration(actions: [action])
//        return configuration
//    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let arrayTranslatedText = presenter?.translatedText else { return  }
            let translatedText = arrayTranslatedText[indexPath.row]
            presenter?.remove(text: translatedText)
        }
    }
    
}
