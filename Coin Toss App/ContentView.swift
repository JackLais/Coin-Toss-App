//
//  ContentView.swift
//  Coin Toss App
//
//  Created by Student on 12/14/21.
//

import SwiftUI

struct ContentView: View {
    //results = Results() is based on the Word Play project for data transfer
    @State private var results = Results()
    @State private var count = 0
    @State private var countHeads = 0
    @State private var countTails = 0
    @State private var prediction = ""
    @State private var outcome = ""
    @State private var Result = ""
    @State private var warning = ""
    
    
    //coinRotation, randomValue, and the onTapGesture (Lines 30-36, 43-44) are from the Roll the Dice hackwich
    @State private var randomValue = 0
    @State private var coinRotation = 0.0
    var body: some View {
        NavigationView {
            VStack {
                
                
                Image("CoinFace\(randomValue)")
                    .resizable()
                    .frame(width: 175, height: 175, alignment: .center)
                    .rotationEffect(.degrees (coinRotation))
                    .rotation3DEffect(.degrees(coinRotation), axis: (x: 10, y: 0, z: 0))
                    .padding()
                    .onTapGesture {
                        if prediction == "" {
                            warning = "you need to predict the toss first!"
                        }
                        else {
                            warning = ""
                            chooseRandom(times: 2)
                            withAnimation(.interpolatingSpring(stiffness: 100, damping: 10)) {
                                coinRotation += 720
                                comparison()
                                countAll()
                            }
                        }
                    }
                Text("\(warning)")
                    .padding()
                
                HStack {
                    Button(action: {
                        
                        prediction = "Heads"
                        
                    }, label: {
                        Text("Heads!")
                            .font(.title)
                    })
                    .padding()
                    Button(action: {
                        prediction = "Tails"
                    }, label: {
                        Text("Tails!")
                            .font(.title)
                    })
                    .padding()
                }
                
                Text("You chose: \(prediction)")
                    .fontWeight(.bold)
                Text("\(Result)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
               
                //below is a test for the count functions
                
                /*
                 Text("Coin Flips: \(count)")
                 .font(.title)
                 .padding()
                 
                 Text("Heads: \(countHeads)")
                 .font(.title)
                 .padding()
                 
                 Text("Tails: \(countTails)")
                 .font(.title)
                 .padding()
                 */
                NavigationLink(
                    destination: ResultsScreen(results: Results()),
                    label: {
                        Text("Click Here for Results!")
                    })
            }
            .navigationTitle("Coin Flip")
        }
       
    
    }

    
    /*
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     below are all functions necessary for the functionality of the app
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     */
    
    //counts all the times the coin has been flipped, how many times it has been heads or tails. Directly affects data transfer between views
    
    
    
    func countAll() {
        if randomValue != 0 {
            count += 1
        }
        if randomValue == 1 {
            countTails += 1
           
        }
        if randomValue == 2 {
           countHeads += 1

        }
        
        
        
    }
    //from the Roll the dice hackwich
    func chooseRandom(times:Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                randomValue = Int.random(in: 1...2)
                chooseRandom(times: times - 1)
            }
        }
    }
    //Tells the user if they won the toss or not
    func comparison() {
        if randomValue == 1
        {
            outcome = "Tails"
        }
        if randomValue == 2
        {
            outcome = "Heads"
        }
        
        if prediction != outcome {
            if prediction != "" {
                Result = "You lost!"
            }
            else {
                Result = "You didn't sumbit anything..."
            }
        }
        if prediction == outcome {
            Result = "You won!"
        }
        
    }
}


// a struct that had been made using the reference of the Word Play Hackwich
struct Results {
    var count = ""
    var countHeads = ""
    var countTails = ""
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//external assistance; Avery
