//
//  ContentView.swift
//  CuteDogs
//
//  Created by Audrey Jiang on 2023-04-20.
//

import SwiftUI

struct CuteDogsView: View {
    // MARK: Stored properties
    
    // 0.0 is invisible, 1.0 is visible
    @State var punchlineOpacity = 0.0
    
    // The cureent dog to display
    @State var currentDog: CuteDogs?
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                if let currentDog = currentDog {
                    
                    // Show the dog, if it can be unwrapped (if currentDog is not nil)
                    Image("Goldenretriever")
                    Image(currentDog.dogs)
                        .resizable()
                        .frame(width: 100, height: 0)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        withAnimation(.easeIn(duration: 1.0)) {
                            punchlineOpacity = 1.0
                        }
                    }, label: {
                        Image(systemName: "arrow.down.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width:40)
                            .tint(.black)
                    })
                    
                    Text("Golden Retriever")
                    Text(currentDog.name)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .opacity(punchlineOpacity)
                    
                } else {
                    // Show a spinning wheel indicator until the joke is loaded
                    ProgressView()
                }
                
                Spacer()
                
                Button(action: {
                    // Reset the interface
                    punchlineOpacity = 0.0

                    Task {
                        // Get another joke
                        withAnimation {
                            currentDog = nil
                        }
                        currentDog = await NetworkService.fetch()
                    }
                }, label: {
                    Text("Fetch another one")
                })
                .disabled(punchlineOpacity == 0.0 ? true : false)
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Dog Search")
        }

        //Create an asynchronous task to be performed as this view appears
        .task {
            currentDog = await NetworkService.fetch()
        }
        }
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CuteDogsView()
    }
}
