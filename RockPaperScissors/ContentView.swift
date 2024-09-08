//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Gaurav Bisht on 07/09/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var yourScore = 0
    @State private var opponentsScore = 0
    @State private var blurRockImage = true
    @State private var blurPaperImage = true
    @State private var blurScissorImage = true
    @State private var showErrorAlert = false
    @State private var userSelection = Move.none
    @State private var opponentSelection = Move.none
    @State private var opponentWins = false
    @State private var youWin = false
    
    var opponentWillWin: Bool {
        Bool.random()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundColor()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    //MARK: - Opponent's view
                    VStack {
                        VStack(spacing: 20) {
                            VStack {
                                Text("Opponent's score")
                                    .titleStyle()
                                Text("Score: \(opponentsScore)")
                                    .scoreStyle()
                            }
                            HStack {
                                ResizableImage(imageName: Move.rock.imageName)
                                    .blur(radius: blurRockImage ? 10 : 0)
                                ResizableImage(imageName: Move.paper.imageName)
                                    .blur(radius: blurPaperImage ? 10 : 0)
                                ResizableImage(imageName: Move.scissor.imageName)
                                    .blur(radius: blurScissorImage ? 10 : 0)
                            }
                            .padding(.horizontal, 5)
                        }
                    }
                    
                    Spacer()
                    Spacer()
                    
                    //MARK: - Your view
                    VStack(spacing: 0) {
                        VStack(spacing: 20) {
                            VStack {
                                Text("Your score")
                                    .titleStyle()
                                Text("Score: \(yourScore)")
                                    .scoreStyle()
                            }
                            HStack {
                                Button {
                                    selectionMade(.rock)
                                } label: {
                                    ResizableImage(imageName: Move.rock.imageName)
                                }
                                Button {
                                    selectionMade(.paper)
                                } label: {
                                    ResizableImage(imageName: Move.paper.imageName)
                                }
                                Button {
                                    selectionMade(.scissor)
                                } label: {
                                    ResizableImage(imageName: Move.scissor.imageName)
                                }
                                
                            }
                            .padding(.horizontal, 5)
                        }
                    }
                    
                    Spacer()
                    
                    Text("Select to make a move!")
                        .messageStyle()
                    
                    Spacer()
                }
            }
            .navigationTitle("Rock, Paper, Scissors")
            .alert("Error!", isPresented: $showErrorAlert) {
                
            } message: {
                Text("Something went wrong!")
                    .foregroundStyle(.red)
            }
            .onChange(of: opponentSelection) { oldValue, newValue in
                
                switch opponentSelection {
                case .rock:
                    blurRockImage = false
                case .paper:
                    blurPaperImage = false
                case .scissor:
                    blurScissorImage = false
                case .none:
                    break
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    blurRockImage = true
                    blurPaperImage = true
                    blurScissorImage = true
                }
            }
            .onChange(of: opponentsScore) { oldValue, newValue in
                opponentWins = opponentsScore == 8
            }
            .onChange(of: yourScore) { oldValue, newValue in
                youWin = yourScore == 8
            }
            .alert("", isPresented: $opponentWins) {
                Button("Ok") {
                    opponentsScore = 0
                    yourScore = 0
                }
            } message: {
                Text("You lose :(")
            }
            .alert("", isPresented: $youWin) {
                Button("Ok") {
                    opponentsScore = 0
                    yourScore = 0
                }
            } message: {
                Text("You win :)")
            }
        }
    }
    
    private func selectionMade(_ move: Move) {
        userSelection = move
        if opponentWillWin {
            switch userSelection {
            case .rock:
                opponentSelection = .paper
            case .paper:
                opponentSelection = .scissor
            case .scissor:
                opponentSelection = .rock
            case .none:
                break
            }
            opponentsScore += 1
        } else {
            switch userSelection {
            case .rock:
                opponentSelection = .scissor
            case .paper:
                opponentSelection = .rock
            case .scissor:
                opponentSelection = .paper
            case .none:
                break
            }
            yourScore += 1
        }
    }
}

#Preview {
    ContentView()
}
