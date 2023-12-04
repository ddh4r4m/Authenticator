//
//  OTPView.swift
//  Authenticator
//
//  Created by Dharam Dhurandhar on 05/12/23.
//

import SwiftUI

struct OTPView: View {
    let numberOfCircles: Int
    let fillColor: Color
    let borderColor: Color
    let otp: [Int]

    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numberOfCircles, id: \.self) { index in
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(self.fillColor(for: index))
                        .overlay(
                            Circle()
                                .stroke(borderColor, lineWidth: 2)
                        )

                    if let digit = self.otpDigit(at: index) {
                        Text("\(digit)")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
            }
        }
    }

    private func fillColor(for index: Int) -> Color {
        return otp.indices.contains(index) ? fillColor : .clear
    }

    private func otpDigit(at index: Int) -> Int? {
        guard otp.indices.contains(index) else {
            return nil
        }
        return otp[index]
    }
}

#Preview {
    OTPView(numberOfCircles: 4, fillColor: .red, borderColor: .black, otp: [1,2, 3, 4])
}
