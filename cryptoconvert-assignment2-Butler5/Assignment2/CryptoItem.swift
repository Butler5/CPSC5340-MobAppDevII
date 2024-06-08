//
//  CryptoItem.swift
//  Assignment2
//
//  Created by Adam Butler on 3/25/24.
//

import SwiftUI

struct CryptoItem: View {

    @StateObject var viewModel: CryptoConverterViewModel = CryptoConverterViewModel()
    
    @State private var amount: String = ""
    
    @State private var showKeypad: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {

                HStack {
                    Text("Bitcoin: ")
                    
                    TextField("", text: $amount)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                    
                        .onTapGesture {
                            self.showKeypad.toggle()
                        }
                }
                
                List(viewModel.cryptos.indices, id: \.self) { index in
                    HStack {
                        
                        Text(viewModel.cryptos[index].cryptoLabel)
                        Spacer()
                        

                        if let amountDouble = Double(amount) {
                            Text(String(format: "%.1f", viewModel.convertToUSD(cryptoName: viewModel.cryptos[index], amount: amountDouble)))
                            
                        } else {
                            Text("Invalid Entry")
                        }
                    }
                    
                    .frame(maxWidth: .infinity)
                }
            }
            
            .padding()
            
            .navigationBarTitle("Bitcoin Conversion", displayMode: .inline)
            
            .onTapBackgroundToDismissKeyboard()
            
            if showKeypad {
                NumberPadView(value: $amount, showKeypad: $showKeypad)
                    .transition(.move(edge: .bottom))
            }
        }
    }
}

struct NumberPadView: View {

    @Binding var value: String

    @Binding var showKeypad: Bool

    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)

    var body: some View {

        VStack {
            LazyVGrid(columns: columns) {

                ForEach(1...9, id: \.self) { num in
                    Button(action: {

                        value += "\(num)"

                    }) {

                        Text("\(num)")
                            .font(.largeTitle)
                            .padding(20)
                            .background(Color.white)
                    }
                }

                Button(action: {
                    showKeypad = false
                }) {

                    // return image
                    Image(systemName: "return")
                        .font(.largeTitle)
                        .padding(20)
                        .background(Color.white)
                }

                Button(action: {
                    value += "0"

                }) {

                    Text("0")
                        .font(.largeTitle)
                        .padding(20)
                        .background(Color.white)
                }

 
                Button(action: {
                    if !value.isEmpty {
                        value.removeLast()
                    }

                }) {

                    Image(systemName: "delete.left")
                        .font(.largeTitle)
                        .padding(20)
                        .background(Color.white)

                }
            }
        }

        
        .background(Color.gray.opacity(0.1))

        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)

        .onTapGesture {
            showKeypad = false

        }
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TapBackgroundToDismissKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

extension View {
    func onTapBackgroundToDismissKeyboard() -> some View {
        self.modifier(TapBackgroundToDismissKeyboard())
    }
}

struct CryptoItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CryptoItem()
        }
    }
}
