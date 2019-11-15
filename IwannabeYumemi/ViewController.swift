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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    @IBAction private func sendButtonTapped(_ sender: UIButton) {
        Api.convertToHiragana(hiragana: inputTextField.text ?? "") { [weak self] respose in
            self?.resultLabel.text = respose.hiragana
        }
    }
}

