//
//  ViewController.swift
//  Silly Song
//
//  Created by Venkat Kurapati on 21/11/2016.
//  Copyright © 2016 Kurapati. All rights reserved.
//

import UIKit
//MARK:- ViewController: UIViewController
class ViewController: UIViewController {
    //MARK:- Outlets
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK:- Reset the lyric and namefield
    @IBAction func reset(_ sender: Any) {
        nameField.text = nil
        lyricsView.text = nil
    }
    // MARK:- Display the lyrics
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }
    
}
//MARK:- Function to get a short name
func shortNameForName(name : String) -> String{
    var lowercaseName = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    if let range = lowercaseName.rangeOfCharacter(from: vowelSet){
        let vowelStr = lowercaseName.substring(with: range)
        lowercaseName =  lowercaseName.substring(from: lowercaseName.index(after: vowelStr.startIndex))
    }
    return lowercaseName
}

//MARK:- Lyrics as per template
func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    // ...
    let shortName = shortNameForName(name: fullName)
    
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}
// join an array of strings into a single template string:
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
