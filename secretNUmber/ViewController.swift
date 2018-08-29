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
    
    static let BORDER_MARGIN:CGFloat = 16
    
    @IBOutlet weak var ui_highLabel: UILabel!
    @IBOutlet weak var ui_lowLabel: UILabel!
    @IBOutlet weak var ui_checkValueButton: UIButton!
    @IBOutlet weak var ui_gameStatusLabel: UILabel!
    @IBOutlet weak var ui_guessdValueField: UITextField!
    
    @IBOutlet weak var cs_boundaryZoneLeading: NSLayoutConstraint! {
        didSet{
           cs_boundaryZoneLeading.constant = ViewController.BORDER_MARGIN
        }
    }
    
    @IBOutlet weak var cs_boundaryZoneTrailing: NSLayoutConstraint! {
        didSet {
            cs_boundaryZoneTrailing.constant = ViewController.BORDER_MARGIN
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateDisplay()
    }
    
    func updateDisplay(){
        if _gameController.isGameInProgress {
            let barWidth:CGFloat = self.view.bounds.width
                - self.view.safeAreaInsets.left
                - self.view.safeAreaInsets.right
                - 2 * ViewController.BORDER_MARGIN
            let gameRangeToScreenRation = barWidth / CGFloat((GameController.MAX_VALUE - GameController.MIN_VALUE))
            
            ui_gameStatusLabel.text = "Essayez de trouver me nombre mystère"
            displayUiGuess(hidden: false)
            ui_lowLabel.text = String(_gameController.lowBoundary)
            ui_highLabel.text = String(_gameController.highBoundary)
            cs_boundaryZoneLeading.constant = ViewController.BORDER_MARGIN + CGFloat(_gameController.lowBoundary) * gameRangeToScreenRation
            cs_boundaryZoneTrailing.constant = ViewController.BORDER_MARGIN + CGFloat(GameController.MAX_VALUE - _gameController.highBoundary) * gameRangeToScreenRation
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

