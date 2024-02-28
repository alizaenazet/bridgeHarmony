//
//  extensionsUtil.swift
//  
//
//  Created by Alizaenal Abidin on 20/02/24.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

typealias Ax1Font = Font

extension Ax1Font {
    static let largeTitleAx1 = Font.system(size:44)
    static let titleAx1 = Font.system(size:38)
    static let title2Ax1 = Font.system(size:34)
    static let title3Ax1 = Font.system(size:31)
    static let headlineAx1 = Font.system(size:28,weight: .semibold)
    static let bodyAx1 = Font.system(size:28)
    static let calloutAx1 = Font.system(size:26)
    static let subheadlineAx1 = Font.system(size:25)
    static let footnoteAx1 = Font.system(size:23)
    static let captionAx1 = Font.system(size:22)
    static let caption2Ax1 = Font.system(size:20)

}
