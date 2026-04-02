//
//  Color+EXT.swift
//  AIChating
//
//  Created by Tirzaan on 4/1/26.
//

import SwiftUI

extension Color {
    // MARK: - Init from Hex String

    /// Initialize a Color from a hex string.
    /// Supports formats: "#RGB", "#RGBA", "#RRGGBB", "#RRGGBBAA" (with or without the `#` prefix)
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.hasPrefix("#") ? String(hexSanitized.dropFirst()) : hexSanitized

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r, g, b, a: Double

        switch hexSanitized.count {
        case 3: // RGB (12-bit)
            r = Double((rgb >> 8) & 0xF) / 15.0
            g = Double((rgb >> 4) & 0xF) / 15.0
            b = Double(rgb & 0xF) / 15.0
            a = 1.0

        case 4: // RGBA (16-bit)
            r = Double((rgb >> 12) & 0xF) / 15.0
            g = Double((rgb >> 8)  & 0xF) / 15.0
            b = Double((rgb >> 4)  & 0xF) / 15.0
            a = Double(rgb & 0xF)          / 15.0

        case 6: // RRGGBB (24-bit)
            r = Double((rgb >> 16) & 0xFF) / 255.0
            g = Double((rgb >> 8)  & 0xFF) / 255.0
            b = Double(rgb & 0xFF)          / 255.0
            a = 1.0

        case 8: // RRGGBBAA (32-bit)
            r = Double((rgb >> 24) & 0xFF) / 255.0
            g = Double((rgb >> 16) & 0xFF) / 255.0
            b = Double((rgb >> 8)  & 0xFF) / 255.0
            a = Double(rgb & 0xFF)          / 255.0

        default:
            // Invalid hex string — fall back to clear
            r = 0; g = 0; b = 0; a = 0
        }

        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }

    // MARK: - Convert to Hex String

    /// Returns the color as an uppercase hex string in `#RRGGBB` or `#RRGGBBAA` format.
    /// - Parameter includeAlpha: When `true`, appends the alpha channel. Defaults to `false`.
    func toHex(includeAlpha: Bool = false) -> String? {
        guard let components = UIColor(self).cgColor.components,
              components.count >= 3 else { return nil }

        let r = components[0]
        let g = components[1]
        let b = components[2]
        let a = components.count >= 4 ? components[3] : 1.0

        if includeAlpha {
            return String(
                format: "#%02X%02X%02X%02X",
                Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255)
            )
        } else {
            return String(
                format: "#%02X%02X%02X",
                Int(r * 255), Int(g * 255), Int(b * 255)
            )
        }
    }
}


// MARK: - Usage Examples

/*
 // Hex → Color
 let red       = Color(hex: "#FF0000")
 let shorthand = Color(hex: "F00")           // 3-digit shorthand
 let withAlpha = Color(hex: "#FF000080")     // 50% transparent red
 let noHash    = Color(hex: "1A2B3C")        // # prefix is optional

 // Color → Hex
 let hexString      = Color.red.toHex()                // "#FF3B30"
 let hexWithAlpha   = Color.red.toHex(includeAlpha: true)  // "#FF3B30FF"
 */
