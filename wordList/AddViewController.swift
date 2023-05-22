//
//  AddViewController.swift
//  wordList
//
//  Created by Kana Fujitani on 2023/05/13.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    let saveDate = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if saveDate.array(forKey:"WORD") != nil {
            wordArray = saveDate.array(forKey: "WORD") as! [Dictionary<String,String>]
        }
        
    }
    
    @IBAction func saveWord(){
        let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
        wordArray.append(wordDictionary)
        saveDate.set(wordArray, forKey: "WORD")
            
        let alert = UIAlertController(
            title:"保存完了",
            message:"単語の登録が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title:"OK",
            style: .default,
            handler: nil
        ))
        present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
        }

}
