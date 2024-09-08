//
//  CustomModifiers.swift
//  RockPaperScissors
//
//  Created by Gaurav Bisht on 08/09/24.
//

import SwiftUI

struct TitleTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title.weight(.heavy))
            .foregroundStyle(.white)
    }
}

struct AppTitleTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
    }
}

struct ScoreTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title2.weight(.semibold))
            .foregroundStyle(.white)
    }
}

struct MessageTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundStyle(.white)
    }
}
