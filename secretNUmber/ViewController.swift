//
//  ViewController.swift
//  secretNUmber
//
//  Created by Christophe on 28/08/2018.
//  Copyright © 2018 Christophe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let _gameController = GameController()
    
    @IBOutlet weak var ui_checkValueButton: UIButton!
    @IBOutlet weak var ui_gameStatusLabel: UILabel!
    @IBOutlet weak var ui_guessdValueField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateDisplay(){
        if _gameController.isGameInProgress {
            ui_gameStatusLabel.text = "Essayez de trouver me nombre mystère"
            displayUiGuess(hidden: false)
        } else {
            ui_gameStatusLabel.text = nil
            displayUiGuess(hidden: true)
        }
    }
    
    func displayUiGuess(hidden:Bool) {
        ui_guessdValueField.isHidden = hidden
        ui_checkValueButton.isHidden = hidden
    }

    @IBAction func NewGameBUttonTouched() {
        _gameController.startNewGame()
        updateDisplay()
    }
    @IBAction func checkValueButtonTouched() {
        if let guessText = ui_guessdValueField.text,
            let guesInt = Int(guessText){
            _gameController.checkGuessedValue(guesInt)
            updateDisplay()
        }
    }
}

