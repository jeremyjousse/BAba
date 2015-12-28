//
//  Syllable.swift
//  BAba
//
//  Created by Jérémy Jousse on 28/12/2015.
//  Copyright © 2015 CoEvo. All rights reserved.
//

import Foundation

class Syllable {
    let consonants = Array("bcdfghjklmnpqrst".characters)
    let vowels = Array("aeiouy".characters)

    var actualConsonant = 0
    var actualVowel = 0

    func createSyllable(random: Bool) -> String {
        if random == true {
            return randomSyllabe()
        }
        return simpleSyllable()
    }

    func simpleSyllable() -> String {
        let syllable = String(consonants[actualConsonant])+String(vowels[actualVowel])
        nextSyllable()
        return syllable
    }

    func nextSyllable() {
        if vowels.count > (actualVowel + 1) {
            actualVowel++
        } else {
            actualVowel = 0
            if consonants.count > (actualConsonant + 1) {
                actualConsonant++
            } else {
                actualConsonant = 0
            }
        }

    }

    func randomSyllabe() -> String {
        actualVowel = Int(arc4random_uniform(UInt32(vowels.count)))
        actualConsonant = Int(arc4random_uniform(UInt32(consonants.count)))
        let syllable = String(consonants[actualConsonant])+String(vowels[actualVowel])
        nextSyllable()
        return syllable
    }
}
