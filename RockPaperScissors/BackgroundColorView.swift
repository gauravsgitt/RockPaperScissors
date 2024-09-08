//
//  BackgroundColorView.swift
//  RockPaperScissors
//
//  Created by Gaurav Bisht on 08/09/24.
//

import SwiftUI

struct BackgroundColor: View {
    
    var body: some View {
        LinearGradient(colors: [
            Color(red: 93/255, green: 179/255, blue: 199/255),
            Color(red: 83/255, green: 129/255, blue: 210/255)
        ],
                       startPoint: .top,
                       endPoint: .bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundColor()
}
