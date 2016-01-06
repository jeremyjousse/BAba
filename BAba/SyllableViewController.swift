//
//  ViewController.swift
//  BAba
//
//  Created by Jérémy Jousse on 28/12/2015.
//  Copyright © 2015 CoEvo. All rights reserved.
//

import Cocoa

class SyllableViewController: NSViewController, NSSpeechSynthesizerDelegate {
    let speechSynth = NSSpeechSynthesizer()
    var syllableGenerator = Syllable()
    var syllable = ""

    @IBOutlet weak var syllableLabel: NSTextField!

    @IBAction func backToMenu(sender: NSButton) {
        self.dismissViewController(self)
    }

    @IBAction func getSyllable(sender: AnyObject) {
        syllable = syllableGenerator.createSyllable(false)
        syllableLabel.stringValue = syllable
    }
    @IBAction func getRandomSyllable(sender: AnyObject) {
        syllable = syllableGenerator.createSyllable(true)
        syllableLabel.stringValue = syllable
    }
    @IBAction func getAnswer(sender: AnyObject) {
        syllableGenerator.speek(speechSynth)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        speechSynth.setVoice(NSSpeechSynthesizer.defaultVoice())
        syllableLabel.stringValue = syllable
    }

    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}
