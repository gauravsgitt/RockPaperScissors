//
//  ResizableImage.swift
//  RockPaperScissors
//
//  Created by Gaurav Bisht on 08/09/24.
//

import SwiftUI

struct ResizableImage: View {
    
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    ResizableImage(imageName: "rock")
}
