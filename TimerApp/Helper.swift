//
//  Helper.swift
//  TimerApp
//
//  Created by Dev Bahl on 31/01/20.
//  Copyright © 2020 Dev Bahl. All rights reserved.
//

import Foundation
import SwiftUI

public enum TimerMode {
    
        case running
        case paused
        case initial
}

func secondsToMinutesAndSeconds(seconds : Int) ->
    String{
        let minutes = ("\((seconds % 3600) / 60)")
        let seconds = ("\((seconds % 3600) % 60)")
        let minuteStamp = minutes.count > 1 ? minutes:
        "0" + minutes
        let secondStamp = seconds.count > 1 ? seconds:
        "0" + seconds
        
        return "\(minuteStamp):\(secondStamp)"
}
    

