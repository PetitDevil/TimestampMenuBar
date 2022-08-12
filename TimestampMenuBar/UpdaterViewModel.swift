//
//  UpdaterViewModel.swift
//  TimestampMenuBar
//
//  Created by Jianan XU on 2022/8/11.
//

import Foundation
class UpdaterViewModel: ObservableObject {
    @Published var now: Date = Date()

    var timer: Timer?
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true, block: { _ in
            self.refresh()
        })
    }
    deinit {
        timer?.invalidate()
    }
    func refresh() {
        now = Date()
    }
}
