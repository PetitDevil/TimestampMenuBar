//
//  Timestamp.swift
//  TimestampMenuBar
//
//  Created by Jianan XU on 2022/8/11.
//

import SwiftUI

struct Timestamp: View {
    @StateObject var updateViewModel = UpdaterViewModel()
    var body: some View {
        Text(Date().milliStamp)
            .font(.system(size: 100, design: .monospaced)).fixedSize()
        
    }
}

struct Timestamp_Previews: PreviewProvider {
    static var previews: some View {
        Timestamp()
    }
}

extension Date {
    var millisecondsSince1970:Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    var milliStamp:String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return "\(millisecond)"
    }
}
