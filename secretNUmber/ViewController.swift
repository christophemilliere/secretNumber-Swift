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
    var _gameRangeToScreenRation:CGFloat = 1
    
    @IBOutlet weak var ui_boundaryZone: UIView!
    @IBOutlet weak var ui_highLabel: UILabel!
    @IBOutlet weak var ui_lowLabel: UILabel!
    @IBOutlet weak var ui_checkValueButton: UIButton!
    @IBOutlet weak var ui_gameStatusLabel: UILabel!
    @IBOutlet weak var ui_guessdValueField: UITextField!
    
    @IBOutlet weak var cs_boundaryZoneLeading: NSLayoutConstraint!
    @IBOutlet weak var cs_boundaryZoneTrailing: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let barWidth:CGFloat = self.ui_boundaryZone.bounds.width
        _gameRangeToScreenRation = barWidth / CGFloat((GameController.MAX_VALUE - GameController.MIN_VALUE))
        
    }
    
    func updateDisplay(){
        if _gameController.isGameInProgress {
            if ui_boundaryZone.isHidden != false {
                UIView.transition(with: ui_boundaryZone, duration: 0.3, options: [.transitionCurlDown], animations: {
                    self.ui_boundaryZone.isHidden = false
                    self.ui_gameStatusLabel.text = "Essayez de trouver me nombre mystère"
                    self.displayUiGuess(hidden: false)
                    UIView.animate(withDuration: 0.4) {
                        self.view.layoutIfNeeded()
                    }
                }, completion: nil)
            }
            
            ui_lowLabel.text = String(_gameController.lowBoundary)
            ui_highLabel.text = String(_gameController.highBoundary)
            
            cs_boundaryZoneLeading.constant = CGFloat(_gameController.lowBoundary) * _gameRangeToScreenRation
            cs_boundaryZoneTrailing.constant = CGFloat(GameController.MAX_VALUE - _gameController.highBoundary) * _gameRangeToScreenRation
            

            
            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.45, initialSpringVelocity: 10, options: [], animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        } else {
            ui_gameStatusLabel.text = nil
            displayUiGuess(hidden: true)
            if ui_boundaryZone.isHidden != true {
                UIView.transition(with: ui_boundaryZone, duration: 0.3, options: [.transitionCurlUp], animations: {
                    self.ui_boundaryZone.isHidden = true
                }, completion: nil)
            }
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
            ui_guessdValueField.text = nil
            updateDisplay()
        }
    }
}

