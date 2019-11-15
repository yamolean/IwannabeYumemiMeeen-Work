//
//  ViewController.swift
//  IwannabeYumemi
//
//  Created by 矢守叡 on 2019/11/15.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var sendButton: UIButton!
 
    @IBAction private func sendButtonTapped(_ sender: UIButton) {
        guard let text = inputTextField.text, !text.isEmpty else {
            resultLabel.text = "漢字を入力して下さい"
            return
        }
        
        Api.convertToHiragana(hiragana: text) { [weak self] respose in
            self?.resultLabel.text = respose.hiragana
        }
    }
}

