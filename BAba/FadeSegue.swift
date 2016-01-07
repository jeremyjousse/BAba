//
//  FadeSegue.swift
//  BAba
//
//  Created by Jérémy Jousse on 07/01/2016.
//  Copyright © 2016 CoEvo. All rights reserved.
//

import Cocoa

class FadeSegue: NSStoryboardSegue {

    override func perform() {
//        let animator = FadeAnimator()
//        let sourceVC  = self.sourceController as! NSViewController
//        let destVC = self.destinationController as! NSViewController
//        sourceVC.presentViewController(destVC, animator: animator)
        super.perform()
        sourceController.presentViewController(destinationController as! NSViewController,
            animator: FadeAnimator())
    }

}

class FadeAnimator: NSObject, NSViewControllerPresentationAnimator {
    @objc func  animatePresentationOfViewController(viewController: NSViewController,
            fromViewController: NSViewController) {
        let bottomVC = fromViewController
        let topVC = viewController
        topVC.view.wantsLayer = true
        topVC.view.layerContentsRedrawPolicy = .OnSetNeedsDisplay
        topVC.view.alphaValue = 0
        bottomVC.view.addSubview(topVC.view)
        let frame: CGRect = NSRectToCGRect(bottomVC.view.frame)
//        frame = CGRectInset(frame, 40, 40)
        topVC.view.frame = NSRectFromCGRect(frame)
        let color: CGColorRef = NSColor.grayColor().CGColor
        topVC.view.layer?.backgroundColor = color
        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            context.duration = 0.5
            topVC.view.animator().alphaValue = 1
            }, completionHandler: nil)
    }

    @objc func  animateDismissalOfViewController(viewController: NSViewController,
            fromViewController: NSViewController) {
        let topVC = viewController
        topVC.view.wantsLayer = true
        topVC.view.layerContentsRedrawPolicy = .OnSetNeedsDisplay

        NSAnimationContext.runAnimationGroup({ (context) -> Void in
            context.duration = 0.5
            topVC.view.animator().alphaValue = 0
            }, completionHandler: {
                topVC.view.removeFromSuperview()
        })
    }
}
