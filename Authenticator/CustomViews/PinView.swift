//
//  PinView.swift
//  Authenticator
//
//  Created by Dharam Dhurandhar on 04/12/23.
//

import SwiftUI

enum PinViewFillType {
    case color(Color)
    case count(Int)
}

struct PinView: View {
    let numberOfCircles: Int
    let fillType: PinViewFillType
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
    
    private func fillColor(for index: Int) -> Color {
        switch fillType {
        case .color(let color):
            return color
        case .count(let count):
            return index < count ? fillColor : .clear
        }
    }
}

#Preview {
    PinView(numberOfCircles: 3, fillType: .color(.black), fillCount: 2, fillColor: .red, borderColor: .black)
}
