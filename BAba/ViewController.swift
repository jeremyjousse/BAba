//
//  ViewController.swift
//  BAba
//
//  Created by Jérémy Jousse on 28/12/2015.
//  Copyright © 2015 CoEvo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBAction func goToSyllable(sender: NSButton) {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let sourceViewController = storyboard
            .instantiateControllerWithIdentifier("SyllableViewController") as? NSViewController
        view.window?.contentViewController = sourceViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}
