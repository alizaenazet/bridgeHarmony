//
//  utils.swift
//  
//
//  Created by MacBook Pro on 22/02/24.
//

import Foundation
import SwiftUI


public func delay(delay: Float, callback: @escaping () -> Void) -> Void {
    let delayTime = DispatchTimeInterval.milliseconds(Int(delay * 1000))
    
    DispatchQueue.main.asyncAfter(deadline: .now() + delayTime ){
            callback()
    }
}
