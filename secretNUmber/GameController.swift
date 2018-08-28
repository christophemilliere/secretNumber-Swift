//
//  GameController.swift
//  secretNUmber
//
//  Created by Christophe on 28/08/2018.
//  Copyright © 2018 Christophe. All rights reserved.
//

import Foundation

class GameController {
    private var _sercretNumber:Int?
    private var _lastGuessValue:Int?
    
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
        _lastGuessValue = value
    }
}
