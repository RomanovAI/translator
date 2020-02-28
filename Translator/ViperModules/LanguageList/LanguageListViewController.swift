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
    
    var currentLanguage: String?
       var onTapCell: ((String) -> Void)?
       
       private let languageArray: [Language] = [
           Language(title: "English", code: "en"),
           Language(title: "Russian", code: "ru"),
           Language(title: "Spanish", code: "es")
       ]
    
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
        presenter?.showTranslateScreen(language: nil)
    }
    
}

extension LanguageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else { return UITableViewCell() }
        cell.selectionStyle = .none
        if currentLanguage == languageArray[indexPath.row].title {
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        } else {
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        }
        cell.textLabel?.text = languageArray[indexPath.row].title
        return cell
    }
}

extension LanguageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showTranslateScreen(language: languageArray[indexPath.row])
    }
    
}