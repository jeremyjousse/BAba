//
//  NumberViewController.swift
//  BAba
//
//  Created by Jérémy Jousse on 07/01/2016.
//  Copyright © 2016 CoEvo. All rights reserved.
//

import Cocoa

class NumberViewController: NSViewController {

    let userDefaults = UserDefaults()
    var numberGenerator = NumberGenerator()

    var privateMaxNumber: Int

    dynamic var maxNumber: Int {
        set {
            privateMaxNumber = newValue
            numberGenerator.maxNumber = privateMaxNumber
        }

        get {
            return privateMaxNumber
        }
    }

    var privateMinNumber: Int

    dynamic var minNumber: Int {
        set {
            privateMinNumber = newValue
            numberGenerator.minNumber = privateMinNumber
        }

        get {
            return privateMinNumber
        }
    }

    required init?(coder aDecoder: NSCoder) {
        privateMaxNumber = numberGenerator.maxNumber
        privateMinNumber = numberGenerator.minNumber
        super.init(coder: aDecoder)
    }

    @IBOutlet var maxNumberLabel: NSTextField!
    @IBOutlet var minNumberLabel: NSTextField!
    @IBOutlet var actualNumberLabel: NSTextField!

    @IBAction func backToMenu(sender: NSButton) {
        userDefaults.activeView = ""
        self.dismissViewController(self)
    }

    @IBAction func randomNumber(sender: NSButton) {
        numberGenerator.random()
        updateactualNumberLabel()
    }

    @IBAction func nextNumber(sender: NSButton) {
        numberGenerator.next()
        updateactualNumberLabel()
    }

    @IBAction func updateMaxNumber(sender: NSButton) {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        maxNumberLabel.stringValue = String(maxNumber)
        minNumberLabel.stringValue = String(minNumber)
        updateactualNumberLabel()
    }

    func updateactualNumberLabel() {
        actualNumberLabel.stringValue = String(numberGenerator.actualNumber)
    }
}
