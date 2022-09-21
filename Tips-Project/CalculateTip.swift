//
//  CalculateTip.swift
//  Tips-Project
//
//  Created by Sillas Santos on 21/09/22.
//

import Foundation

protocol CalculateTipProtocol: AnyObject{
    func calculateTip(tipValue: Int?, purchaseValue: Double?) -> String
}

class CalculateTip: CalculateTipProtocol {
    
    func calculateTip(tipValue: Int?, purchaseValue: Double?) -> String {
        
        guard let purchaseValue = purchaseValue, let tipValue = tipValue else { return "0.0" }
        
        var result = Int(purchaseValue) / 100 * tipValue
        return "\(result)"
    }
}
