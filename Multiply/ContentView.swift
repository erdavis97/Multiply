//
//  ContentView.swift
//  Multiply
//
//  Created by Ethan Davis on 9/13/23.
//

import SwiftUI

struct ContentView: View {
    @State private var firstNumberTextField = ""
    @State private var secondNumberTextField = ""
    @State private var calculation = 0
    @State private var imageName = ""
    var body: some View {
        VStack {
            Text("Multiply")
                .font(.title).bold()
            TextField("Enter a number", text: $firstNumberTextField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 30, alignment: .center)
                .font(.body)
                .padding()
            Text("X")
            TextField("Enter a number", text: $secondNumberTextField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 30, alignment: .center)
                .font(.body)
                .padding()
            Button("Calculate") {
                if let firstNumber = Int(firstNumberTextField) {
                    if let secondNumber = Int(secondNumberTextField) {
                        calculation = firstNumber * secondNumber
                    }
                }
            }
            Text("\(calculation)")
                .multilineTextAlignment(.center)
                .frame(width: 200, height: 30, alignment: .center)
                .font(.body)
                .padding()
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .onChange(of: calculation) { newValue in
                    if calculation == newValue {
                        if newValue == 64 {
                            imageName = "Nintendo"
                        }
                        if calculation != 64 {
                            if newValue % 2 == 0 {
                                imageName = "Rain"
                            }
                            else {
                                imageName = "Brick"
                            }
                        }
                    }
                    else {
                        imageName = ""
                    }
                }
        }
    }
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
}
// added a comment
