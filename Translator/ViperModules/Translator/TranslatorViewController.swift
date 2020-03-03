//
//  TranslatorViewController.swift
//  Translator
//
//  Created RomanovAI on 26.02.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import UIKit

final class TranslatorViewController: UIViewController, TranslatorViewProtocol {
    
    var presenter: TranslatorPresenterProtocol?
    
    @IBOutlet weak var viewContainer: UIView! {
        didSet {
            viewContainer.layer.cornerRadius = 10
            viewContainer.clipsToBounds = true
        }
    }
    @IBOutlet weak var translateButton: UIButton! {
        didSet {
            translateButton.backgroundColor = .white
            translateButton.layer.cornerRadius = 5
            translateButton.clipsToBounds = true
        }
    }
    
    var inputLanguage: Language? {
        didSet {
            if let language = inputLanguage {
                inputLanguageButton.setTitle(language.title, for: .normal)
            }
        }
    }
    
    @IBOutlet weak var inputLanguageButton: UIButton! {
        didSet {
            if let language = presenter?.inputLanguage {
                inputLanguageButton.setTitle(language.title, for: .normal)
                inputLanguageButton.setTitleColor(.black, for: .normal)
            }
        }
    }
    
    var outputLanguage: Language? {
        didSet {
            if let language = outputLanguage {
                outputLanguageButton.setTitle(language.title, for: .normal)
            }
        }
    }
    
    @IBOutlet weak var outputLanguageButton: UIButton! {
        didSet {
            if let language = presenter?.outputLanguage {
                outputLanguageButton.setTitle(language.title, for: .normal)
                outputLanguageButton.setTitleColor(.black, for: .normal)
            }
        }
    }
    
    @IBOutlet weak var arrowButton: UIButton! {
        didSet {
            let image = UIImage(named: "arrow")
            arrowButton.setImage(image, for: .normal)
            arrowButton.sizeToFit()
        }
    }
    
    var inputText: String? {
        didSet {
            inputTextView.text = inputText
        }
    }
    
    @IBOutlet weak var inputTextView: UITextView! {
        didSet {
            inputTextView.delegate = self
            inputTextView.font = UIFont.systemFont(ofSize: 16)
            inputTextView.textColor = UIColor.lightGray
        }
    }
    
    var outputText: String? {
        didSet {
            outputTextView.text = outputText
        }
    }
    
    @IBOutlet weak var outputTextView: UITextView! {
        didSet {
            outputTextView.delegate = self
            outputTextView.isUserInteractionEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupTabBarItem()
        presenter?.setuplanguageButton()
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(onBackgroundTap))
        view.addGestureRecognizer(tapGR)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupTabBarItem() {
        let dealsImage = UIImage(named: "bolt")
        tabBarItem = UITabBarItem(title: "Translate", image: dealsImage, tag: 0)
    }
    
    @objc func onBackgroundTap() {
        if inputTextView.text.isEmpty {
            inputTextView.font = UIFont.systemFont(ofSize: 16)
            inputTextView.textColor = UIColor.lightGray }
        view.endEditing(true)
    }
    
    @IBAction func tapInputLanguageButton(_ sender: UIButton) {
        presenter?.selectionInputLanguageButton()
    }
    
    
    @IBAction func tapOutputLanguageButton(_ sender: UIButton) {
        presenter?.selectionOutputLanguageButton()
    }
    
    
    @IBAction func tapTranslateButton(_ sender: UIButton) {
        guard let text = inputTextView.text, let presenter = presenter else { return }
        presenter.translationText(text: text)
    }
    
    @IBAction func tapArrowButton(_ sender: UIButton) {
        guard let presenter = presenter else { return }
        presenter.inputText = inputTextView.text
        presenter.tapArrowButton()
    }
    
}

extension TranslatorViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = UIColor.black
    }
}
