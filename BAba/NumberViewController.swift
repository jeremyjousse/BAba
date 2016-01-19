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
            if newValue > privateMaxNumber {
                let alert: NSAlert = NSAlert()
                alert.messageText = "Erreur de saisie"
                alert.informativeText = "Nombre min ne peut pas être suppérieur à Nombre max"
                alert.alertStyle = NSAlertStyle.WarningAlertStyle
                alert.addButtonWithTitle("OK")
                alert.beginSheetModalForWindow(self.view.window!, completionHandler: nil )
                minNumberLabel.stringValue = String(privateMaxNumber)
            } else {
                privateMinNumber = newValue
                numberGenerator.minNumber = privateMinNumber
            }
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

        NSEvent.addLocalMonitorForEventsMatchingMask(.KeyDownMask) { (aEvent) -> NSEvent? in
            self.keyDown(aEvent)
            return aEvent
        }

        NSEvent.addLocalMonitorForEventsMatchingMask(.FlagsChangedMask) { (theEvent) -> NSEvent? in
            self.flagsChanged(theEvent)
            return theEvent
        }
    }

    func updateactualNumberLabel() {
        actualNumberLabel.stringValue = String(numberGenerator.actualNumber)
    }

    // MARK: - First Responder
    override var acceptsFirstResponder: Bool {
        return true
    }

    override func becomeFirstResponder() -> Bool {
        return true
    }

    override func resignFirstResponder() -> Bool {
        return true
    }


    // MARK: - Key events
    override func keyDown(theEvent: NSEvent) {
        interpretKeyEvents([theEvent])
    }

    override func insertText(insertString: AnyObject) {
        let text = insertString as! String
        if text == "n" {
            numberGenerator.next()
            updateactualNumberLabel()
        }
        if text == "a" {
            numberGenerator.random()
            updateactualNumberLabel()
        }
    }
}
