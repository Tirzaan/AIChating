//
//  String+Ext.swift
//  AIChating
//
//  Created by Tirzaan on 2/19/26.
//

import Foundation

extension String {
    func getIndex(_ index: Int) -> String {
        if index >= 0 && index < self.count {
            let targetIndex = self.index(self.startIndex, offsetBy: index)
            return String(self[targetIndex])
        } else {
            return ""
        }
    }
    
    func getRange(_ start: Int, _ end: Int) -> String {
        guard start >= 0,
              end >= start,
              let startIndex = index(startIndex, offsetBy: start, limitedBy: endIndex),
              let endIndex   = index(startIndex, offsetBy: end - start + 1, limitedBy: endIndex)
        else {
            return ""
        }
        
        return String(self[startIndex..<endIndex])
    }
    
    func firstCharacterIsVowel() -> Bool {
        let vowels = ["a", "e", "i", "o", "u"]
        if vowels.contains(self.getIndex(0)) {
            return true
        } else {
            return false
        }
    }
    
    /// Returns "a" or "an" (capitalized if uppercased: true) based on starting sound.
    /// Covers vowels, silent h, acronyms, numbers (including 80134 → "an"), exceptions.
    func article(uppercased: Bool = false) -> String {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            return uppercased ? "A" : "a"
        }
        //
        let lower = trimmed.lowercased()
        //
        // ── 1. Consonant-sound exceptions (vowel letter but consonant sound)
        let consonantSoundPrefixes = [
            "nasa", "nato", "unesco", "one", "once", "unicorn", "uniform", "university",
            "utensil", "utopia", "euphemism", "european", "eulogy", "ukulele", "ufo",
            "youtube", "y", "yuan"
        ]
        //
        if consonantSoundPrefixes.contains(where: lower.hasPrefix) {
            return uppercased ? "A" : "a"
        }
        
        // ── 2. Vowel-sound initial letters for true initialisms (FBI, NSA, HTML…)
        let vowelSoundInitials: Set<Character> = ["f", "h", "l", "m", "r", "s", "x"]
        
        if let first = lower.first, vowelSoundInitials.contains(first) {
            let isLikelyInitialism = lower.count <= 5 ||
            lower == lower.uppercased() ||
            lower.contains(".") ||
            lower.contains(where: { $0.isNumber }) ||
            lower.split(separator: " ").count > 1
            
            if isLikelyInitialism {
                return uppercased ? "An" : "an"
            }
        }
        
        // ── 3. Silent / unsounded h words
        let silentHPattern = #"^h(our|onou?r(able)?|eir|onest|erb|istoric(al)?|ourly|onoured?|onestly|omage|onorific|ereditary|ours|onestly)"#
        
        if let regex = try? NSRegularExpression(pattern: silentHPattern, options: [.caseInsensitive]),
           regex.firstMatch(in: lower, range: NSRange(location: 0, length: lower.utf16.count)) != nil {
            return uppercased ? "An" : "an"
        }
        
        let extraSilentHPrefixes = [
            "honest", "honestly", "honor", "honour", "heir", "herb", "herbal",
            "hour", "homage", "honorary", "honorable", "honorific"
        ]
        
        if extraSilentHPrefixes.contains(where: lower.hasPrefix) {
            return uppercased ? "An" : "an"
        }
        
        // ── 4. Normal vowel start (a/e/i/o/u)
        if let firstChar = lower.first, "aeiou".contains(firstChar) {
            return uppercased ? "An" : "an"
        }
        
        // ── 5. Number handling: vowel-sound spoken starts (8, 11, 18, 80–89…)
        if lower.first?.isNumber == true {
            // Extract leading digits safely
            let digitPrefix = lower.components(separatedBy: CharacterSet.decimalDigits.inverted).first ?? ""
            
            if !digitPrefix.isEmpty {
                let leadingTwo = digitPrefix.prefix(2)
                let leadingOne = digitPrefix.prefix(1)
                
                if leadingOne == "8" ||
                    leadingTwo == "11" ||
                    leadingTwo == "18" ||
                    leadingTwo.hasPrefix("8") {  // 80–89xxx → "eighty…"
                    return uppercased ? "An" : "an"
                }
            }
        }
        
        // ── 6. Default: consonant sound
        return uppercased ? "A" : "a"
    }
}
