//
//  ApplicationMenu.swift
//  TimestampMenuBar
//
//  Created by Jianan XU on 2022/8/11.
//

import Foundation
import SwiftUI

class ApplicationMenu:NSObject{
    let menu = NSMenu()
    let tsWindow = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 1500, height: 200), styleMask: [.titled,.closable], backing: .buffered, defer: false)
    let timestampView = Timestamp()
    func createMenu() -> NSMenu{
        
        let openTimestamp = NSMenuItem(title: "OpenCloseTime", action: #selector(openTimestamp), keyEquivalent: "")
        openTimestamp.target = self
        menu.addItem(openTimestamp);
        
        let quit = NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: "")
        quit.target = self
        menu.addItem(quit)
        
        return menu
        
    }
    @objc func openTimestamp(sender:NSMenuItem){
        //TODO: open a new view in front of current display
        
        if(!tsWindow.isVisible){
            tsWindow.styleMask.insert(.resizable)
            tsWindow.standardWindowButton(.closeButton)?.isHidden = true
            tsWindow.standardWindowButton(.zoomButton)?.isHidden = true
            tsWindow.standardWindowButton(.miniaturizeButton)?.isHidden = true
            
            tsWindow.contentView = NSHostingView(rootView: timestampView)
            tsWindow.makeKeyAndOrderFront(nil)
        }else{
            NSApp.hide(tsWindow)
        }
        
    }
    @objc func quit(sender: NSMenuItem){
        NSApp.terminate(self)
    }
}
