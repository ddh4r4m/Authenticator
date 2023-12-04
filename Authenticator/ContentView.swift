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
            PinView(numberOfCircles: 4, fillCount: enteredNumber.count, fillColor: .black, borderColor: .white.opacity(0.2))
            
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
}
#Preview {
    ContentView()
}
