//
//  Extension.swift
//  RockPaperScissors
//
//  Created by Gaurav Bisht on 08/09/24.
//

import SwiftUI

extension View {
    
    func titleStyle() -> some View {
        modifier(TitleTextStyle())
    }
    
    func appTitleStyle() -> some View {
        modifier(AppTitleTextStyle())
    }
    
    func scoreStyle() -> some View {
        modifier(ScoreTextStyle())
    }
    
    func messageStyle() -> some View {
        modifier(MessageTextStyle())
    }
}
