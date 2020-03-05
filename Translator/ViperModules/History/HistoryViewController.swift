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
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: cellId, bundle: .main), forCellReuseIdentifier: cellId)
            tableView.separatorStyle = .none
        }
    }
    
    @IBOutlet weak var label: UILabel! {
        didSet {
            label.isHidden = true
        }
    }
    
    func showLabel(isHidden: Bool) {
        label.isHidden = isHidden
        tableView.isHidden = !isHidden
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
        presenter?.fetchData()
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(onBackgroundTap))
        tableView.addGestureRecognizer(tapGR)
        view.addGestureRecognizer(tapGR)
    }
    @objc func onBackgroundTap() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchData()
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

extension HistoryViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        if text.isEmpty {
            presenter?.fetchData()
        } else {
            presenter?.search(text: text)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let text = searchBar.text else { return }
        if text.isEmpty {
            presenter?.fetchData()
        } else {
            presenter?.search(text: text)
        }
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let arrayTranslatedText = presenter?.arrayTranslatedText else { return 0 }
        return arrayTranslatedText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HistoryTableViewCell, let arrayTranslatedText = presenter?.arrayTranslatedText else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.setup(inputText: arrayTranslatedText[indexPath.row].inputText, outputText: arrayTranslatedText[indexPath.row].outputText)
        return cell
    }
}

extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Dele11te", handler: { action, view, completion in
            guard let arrayTranslatedText = self.presenter?.arrayTranslatedText else { return }
            let translatedText = arrayTranslatedText[indexPath.row]
            self.presenter?.remove(text: translatedText)
            completion(true)
        })
        action.title = "Delete"
        action.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [action])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    
    
}
