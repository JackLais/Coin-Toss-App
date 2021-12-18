//
//  ResultsScreen.swift
//  Coin Toss App
//
//  Created by Student on 12/14/21.
//

import SwiftUI

struct ResultsScreen: View {
    let results : Results
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Coin Flips: \(results.count)")
                 .font(.title)
                 .padding()
                 
               
               
                
                 
            }
            .navigationTitle("Statistics & Results")
        }
        
    }
}

struct TextField: View {
    let placeholder : String
    let variable : Binding<String>
    var body: some View {
        TextField(placeholder: placeholder, variable: variable)
            
    }
}


struct ResultsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ResultsScreen(results: Results())
    }
}
