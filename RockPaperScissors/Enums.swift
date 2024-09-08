//
//  Enums.swift
//  RockPaperScissors
//
//  Created by Gaurav Bisht on 08/09/24.
//

import Foundation

enum Move: String, CaseIterable {
    case rock = "Rock"
    case paper = "Paper"
    case scissor = "Scissor"
    case none = "none"
    
    var imageName: String {
        switch self {
        case .rock:
            return "rock"
        case .paper:
            return "paper"
        case .scissor:
            return "scissor"
        default:
            return ""
        }
    }
}
