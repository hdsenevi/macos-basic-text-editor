//
//  ViewController.swift
//  macos-basic-text-editor
//
//  Created by Shanaka Senevirathne on 14/3/20.
//  Copyright © 2020 Shanaka Senevirathne. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTextViewDelegate {
    @IBOutlet var textView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear() {
        let document = view.window?.windowController?.document as? Document
        representedObject = document
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            print("Set object")
            let document = representedObject as? Document
            textView.string = document?.text ?? ""
        }
    }

    func textDidChange(_ notification: Notification) {
        let document = representedObject as? Document
        document?.text = textView.string
    }

}

