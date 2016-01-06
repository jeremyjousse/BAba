//
//  ViewController.swift
//  BAba
//
//  Created by Jérémy Jousse on 28/12/2015.
//  Copyright © 2015 CoEvo. All rights reserved.
//

import Cocoa

class AboutViewController: NSViewController {
    @IBAction func backToMenu(sender: NSButton) {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let sourceViewController = storyboard
            .instantiateControllerWithIdentifier("MenuViewController") as? NSViewController
        view.window?.contentViewController = sourceViewController
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}
