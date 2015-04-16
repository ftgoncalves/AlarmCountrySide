//
//  ViewController.swift
//  AlarmeCountrySide
//
//  Created by Felipe Theodoro on 4/16/15.
//  Copyright (c) 2015 Felipe Theodoro. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    private let textMessageRecipients = ["000000"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onActiveButtonPressed(sender: UIButton) {
        self.sendSMSWithText("000")
    }
    @IBAction func onDeactiveButtonPressed(sender: UIButton) {
        self.sendSMSWithText("000")
    }
    @IBAction func onInverterButtonPressed(sender: UIButton) {
        self.sendSMSWithText("000")
    }
    
    func sendSMSWithText(text:String) {
        if MFMessageComposeViewController.canSendText() {
            var messageComposeVC = MFMessageComposeViewController()
            messageComposeVC.messageComposeDelegate = self
            messageComposeVC.recipients = textMessageRecipients
            messageComposeVC.body = text
            
            self.presentViewController(messageComposeVC, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(controller: MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
        switch (result.value) {
            case MessageComposeResultCancelled.value:
                println("Message was cancelled")
                self.dismissViewControllerAnimated(true, completion: nil)
            case MessageComposeResultFailed.value:
                println("Message failed")
                self.dismissViewControllerAnimated(true, completion: nil)
            case MessageComposeResultSent.value:
                println("Message was sent")
                self.dismissViewControllerAnimated(true, completion: nil)
            default:
                break;
        }
    }
    
}