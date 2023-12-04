//
//  NumpadView.swift
//  Authenticator
//
//  Created by Dharam Dhurandhar on 04/12/23.
//

import SwiftUI

struct NumpadView: View {
    @Binding var enteredNumber: String

    let rows: [[String]] = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["", "0", "<"]
    ]

    var body: some View {
        VStack(spacing: 10) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            self.buttonTapped(button)
                        }) {
                            Text(button)
                                .font(.title)
                                .frame(minWidth: 90.0, minHeight: 90.0)
                                .foregroundColor(button == "<" ? .white : .black)
                                .cornerRadius(10)
                        }
                    }
                }.frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity) // Take the full width
    }

    private func buttonTapped(_ button: String) {
        if button == "<" {
            if !enteredNumber.isEmpty {
                enteredNumber.removeLast()
            }
        } else {
            enteredNumber += button
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
