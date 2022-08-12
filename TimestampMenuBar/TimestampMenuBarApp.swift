//
//  TimestampMenuBarApp.swift
//  TimestampMenuBar
//
//  Created by Jianan XU on 2022/8/11.
//

import SwiftUI

@main
struct TimestampMenuBarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        Settings{
            EmptyView()
        }
    }
}

class AppDelegate:NSObject, NSApplicationDelegate{
    static private(set) var instance: AppDelegate!
    lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    let menu = ApplicationMenu()
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        statusBarItem.menu = menu.createMenu()
    }
}
