//
//  CircleImage.swift
//  Landmarks
//
//  Created by Vladyslav Dikhtiaruk on 20/02/2024.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(.circle)
            .overlay{
                Circle()
                    .stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
