//
//  HistoryTableViewCell.swift
//  Translator
//
//  Created by RomanovAI on 02.03.2020.
//  Copyright © 2020 RomanovAI. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var inputLabel: UILabel!
    
    @IBOutlet weak var outputLabel: UILabel!
    
    func setup(inputText: String, outputText: String) {
        inputLabel.text = inputText
        outputLabel.text = outputText
    }
}
