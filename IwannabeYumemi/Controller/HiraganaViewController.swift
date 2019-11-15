//
//  HiraganaViewController.swift
//  IwannabeYumemi
//
//  Created by 矢守叡 on 2019/11/15.
//  Copyright © 2019 yamolean. All rights reserved.
//

import UIKit

final class HiraganaViewController: UIViewController {

    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var inputTextField: UITextField!
    @IBOutlet private weak var sendButton: UIButton!
 
    @IBAction private func sendButtonTapped(_ sender: UIButton) {
        guard let text = inputTextField.text, !text.isEmpty else {
            resultLabel.text = "漢字を入力して下さい"
            return
        }
        
        Api.convertToHiragana(hiragana: text, onSuccess: { [weak self] response in
            // 成功
            self?.resultLabel.text = response.hiragana
            
        }) { [weak self] errorMessage in
            // エラー
            self?.resultLabel.text = errorMessage
        }
    }
}

