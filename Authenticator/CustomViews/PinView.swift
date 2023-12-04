//
//  PinView.swift
//  Authenticator
//
//  Created by Dharam Dhurandhar on 04/12/23.
//

import SwiftUI

struct PinView: View {
    let numberOfCircles: Int
    let fillCount: Int
    let fillColor: Color
    let borderColor: Color

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numberOfCircles, id: \.self) { index in
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(index < fillCount ? fillColor : .clear)
                    .overlay(
                        Circle()
                            .stroke(borderColor, lineWidth: 2)
                    )
            }
        }
    }
}

#Preview {
    PinView(numberOfCircles: 3, fillCount: 2, fillColor: .red, borderColor: .black)
}
