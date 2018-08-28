//
//  GameController.swift
//  secretNUmber
//
//  Created by Christophe on 28/08/2018.
//  Copyright © 2018 Christophe. All rights reserved.
//

import Foundation

class GameController {
    static let MIN_VALUE = 0
    static let MAX_VALUE = 100
    private var _sercretNumber:Int?
    private var _lastGuessValue:Int?
    private var _lowBoundary:Int = GameController.MIN_VALUE
    private var _highBoundary:Int = GameController.MAX_VALUE
    
    var lowBoundary: Int {
        return _lowBoundary
    }
    
    var highBoundary: Int {
        return _highBoundary
    }
    
    var isGameInProgress: Bool {
        guard let secretNUmber = _sercretNumber else { return false }
        
        return _lastGuessValue == nil || _lastGuessValue! != secretNUmber
    }
    
    var sercret: Int? {
        return _sercretNumber
    }
    
    func startNewGame(withSecretNumber secretNumber:Int?=nil) {
        if secretNumber != nil {
            _sercretNumber = secretNumber
        } else {
            _sercretNumber = 50
        }
        
        _lastGuessValue = nil
    }
    
    func checkGuessedValue(_ value:Int) {
        guard let secretNumber = _sercretNumber else { return }
        _lastGuessValue = value
        if value != secretNumber {
            if value < secretNumber {
                _lowBoundary = max(_lowBoundary, value)
            } else {
                _highBoundary = min(_highBoundary, value)
            }
        }
    }
}
