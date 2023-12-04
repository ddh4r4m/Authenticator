//
//  ContentView.swift
//  Authenticator
//
//  Created by Dharam Dhurandhar on 04/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var enteredNumber = ""

    var body: some View {
        VStack {
            Spacer()
            Text("Please Enter mPin to Login")
                .foregroundStyle(.white)
            Spacer(minLength: 5)
//            PinView(numberOfCircles: 4, fillType: .color(.red), fillCount: enteredNumber.count, fillColor: .black, borderColor: .white.opacity(0.2))
            OTPView(numberOfCircles: 4, fillColor: .purple, borderColor: .black, otp: OtpValue(from: enteredNumber))
            
            Spacer()

            NumpadView(enteredNumber: $enteredNumber)
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.blue]), // Modify the colors as needed
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
        )
    }
    
    private func OtpValue(from otpString: String) -> [Int] {
        return self.enteredNumber.compactMap { Int(String($0)) }
    }
}
#Preview {
    ContentView()
}
