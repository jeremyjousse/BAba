//
//  File.swift
//  BAba
//
//  Created by Jérémy Jousse on 08/01/2016.
//  Copyright © 2016 CoEvo. All rights reserved.
//

import Foundation
import Cocoa

class NumberGenerator {
    var actualNumber = 0

    var minNumber: Int {
        willSet {
        }

        didSet {
            if minNumber != oldValue && actualNumber < minNumber {
                actualNumber = minNumber
            }
        }
    }

    var maxNumber: Int {
        willSet {
        }

        didSet {
            if maxNumber != oldValue && actualNumber > maxNumber {
                actualNumber = maxNumber
            }
        }
    }

    init() {
        minNumber = 0
        maxNumber = 100
    }

    func speek(speechSynth: NSSpeechSynthesizer) {
        speechSynth.startSpeakingString(String(actualNumber))
    }

    func next() {
        if actualNumber < maxNumber {
            actualNumber++
        } else {
            actualNumber = minNumber
        }
    }

    func random() {
        actualNumber = Int(arc4random_uniform(UInt32(maxNumber - minNumber))) + minNumber
    }
}
