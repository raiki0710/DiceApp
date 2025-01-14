//
//  ContentView.swift
//  DiceApp
//
//  Created by Raiki Oyatsu on 10/1/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var randomNumber = 1
    @State private var timer: Timer?
    @State private var isRolling = false
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "die.face.\(randomNumber)")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width/2)
                .padding()
            Spacer()
            Button {
                playDice()
            } label: {
                Text("サイコロを振る")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(Color.black)
                    .cornerRadius(10)
            }
            .disabled(isRolling)
            Spacer()
        }
        .padding()
    }
    
    private func playDice() {
        print("ボタンが押されました。")
        isRolling = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            randomNumber = Int.random(in: 1...6)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            timer?.invalidate()
            timer = nil
            isRolling = false
        }
    }
}

#Preview {
    ContentView()
}
