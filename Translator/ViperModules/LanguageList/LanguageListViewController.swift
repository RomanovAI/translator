//
//  LanguageListViewController.swift
//  Translator
//
//  Created RomanovAI on 27.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import UIKit

final class LanguageListViewController: UIViewController, LanguageListViewProtocol {
    
    var presenter: LanguageListPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
            tableView.separatorStyle = .none
        }
    }
    
    private let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        tableView.reloadData()
    }
    
    private func setupNavigationBar() {
        title = "Source language"
        navigationController?.isNavigationBarHidden = false
        let closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popViewController))
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc func popViewController() {
        presenter?.showTranslateScreen(with: nil)
    }
    
}

extension LanguageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let languageList = presenter?.languageList else { return 0 }
        return languageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier), let languageList = presenter?.languageList, let currentLanguage = presenter?.currentLanguage else { return UITableViewCell() }
        cell.selectionStyle = .none
        if currentLanguage.title == languageList[indexPath.row].title {
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        } else {
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        }
        cell.textLabel?.text = languageList[indexPath.row].title
        return cell
    }
}

extension LanguageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let presenter = presenter, let languageList = presenter.languageList else { return }
        presenter.showTranslateScreen(with: languageList[indexPath.row])
    }
    
}
