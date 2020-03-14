//
//  Document.swift
//  macos-basic-text-editor
//
//  Created by Shanaka Senevirathne on 14/3/20.
//  Copyright © 2020 Shanaka Senevirathne. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    var text: String = ""
    
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        self.addWindowController(windowController)
    }
    
    override func write(to url: URL, ofType typeName: String) throws {
        return try text.write(to: url, atomically: false, encoding: String.Encoding.utf8)
    }

    override func read(from url: URL, ofType typeName: String) throws {
        text = try String(contentsOf: url, encoding: String.Encoding.utf8)
    }
}

