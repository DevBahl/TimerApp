//
//  TimeManager.swift
//  TimerApp
//
//  Created by Dev Bahl on 31/01/20.
//  Copyright © 2020 Dev Bahl. All rights reserved.
//

import Foundation
import SwiftUI

class TimeManager : ObservableObject {
    
    var timerMode: TimerMode = .initial
    var timer = Timer()
    var secondsLeft = 60
    func start() {
        timerMode = .running
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
        if self.secondsLeft == 0 {
            self.timerMode = .initial
            self.secondsLeft = 60
            timer.invalidate()
        }
            self.secondsLeft -= 1
        })
    }
}
