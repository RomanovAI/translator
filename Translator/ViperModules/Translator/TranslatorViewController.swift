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
    @IBOutlet weak var arrowButton: UIButton! {
        didSet {
            let image = UIImage(named: "arrow")
            arrowButton.setImage(image, for: .normal)
            arrowButton.sizeToFit()
        }
    }
    
    @IBOutlet weak var inputTextView: UITextView! {
        didSet {
            inputTextView.delegate = self
            inputTextView.text = "Text"
            inputTextView.font = UIFont.systemFont(ofSize: 16)
            inputTextView.textColor = UIColor.lightGray
        }
    }
    
    
    @IBOutlet weak var outputTextView: UITextView! {
        didSet {
            outputTextView.delegate = self
            outputTextView.text = ""
            outputTextView.isUserInteractionEnabled = false
        }
    }
    
    @IBOutlet var chooseLanguageButton: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupTabBarItem()
        presenter?.setupButton()
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(onBackgroundTap))
        view.addGestureRecognizer(tapGR)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupButton()
        navigationController?.isNavigationBarHidden = true
    }
    
    func setupButton() {
        guard let array = presenter?.getTitleButton() else { return }
        print("array==", array)
        chooseLanguageButton.enumerated().forEach{ (index, item) in
            item.setTitle(array[index].title, for: .normal)
            item.setTitleColor(.black, for: .normal)
        }
    }
    
    private func setupTabBarItem() {
        let dealsImage = UIImage(named: "bolt")
        tabBarItem = UITabBarItem(title: "Translate", image: dealsImage, tag: 0)
    }
    
    @objc func onBackgroundTap() {
        if inputTextView.text.count == 0 {
            inputTextView.text = "Text"
            inputTextView.font = UIFont.systemFont(ofSize: 16)
            inputTextView.textColor = UIColor.lightGray }
        view.endEditing(true)
    }
    
    @IBAction func tapTranslateButton(_ sender: UIButton) {
        
        let fetcher = DataFetcherService()
        
        let string = inputTextView.text!.replacingOccurrences(of: " ", with: "%20")
        
        fetcher.translateText(text: string, lang: "en-ru", completion: { response in
            if let resp = response {
                self.outputTextView.text = resp.text.joined(separator: " ")
                print("000=", resp.text)
            }
        })
        
    }
    
    @IBAction func tapArrowButton(_ sender: UIButton) {
        chooseLanguageButton[0].setTitle(chooseLanguageButton[1].titleLabel?.text, for: .normal)
        chooseLanguageButton[1].setTitle(chooseLanguageButton[0].titleLabel?.text, for: .normal)
    }
    
    @IBAction func chooseLanguageButton(_ sender: UIButton) {
        guard let button = chooseLanguageButton.firstIndex(of: sender) else { return }
        print("buttonbutton=", button)
        presenter?.tapLanguageButton(button: button)
    }
}

extension TranslatorViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Text" {
            textView.text = ""
        }
        textView.textColor = UIColor.black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        //        textView.text = "Text"
        //        textView.textColor = UIColor.lightGray
        print("textViewDidEndEditing")
    }
    
    func textViewDidChange(_ textView: UITextView) {
        // print(textView.text!)
    }
    
}
