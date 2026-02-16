//
//  MockData.swift
//  AIChating
//
//  Created by Tirzaan on 2/16/26.
//

import Foundation

struct MockData {
    static let shared = MockData()
    private init() { }
    
    func mockTitle(_ viewName: String) -> String {
        "Mock Title For \(viewName)"
    }
    
    func mockSubtitle(_ viewName: String) -> String {
        "This is the Mock Subtitle for \(viewName)"
    }
}
