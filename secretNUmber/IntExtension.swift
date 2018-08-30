//
//  IntExtension.swift
//  secretNUmber
//
//  Created by christophe milliere on 31/08/2018.
//  Copyright © 2018 Christophe. All rights reserved.
//

import Foundation

extension Int {
    init(withRandomNumbersBetween minValue:Int, and maxValue:Int) {
        self = minValue + Int(arc4random_uniform(UInt32(maxValue-minValue+1)))
    }
}
