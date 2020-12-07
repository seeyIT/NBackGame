//
//  GameSummaryView.swift
//  NBackGame
//
//  Created by Kornel Miszczak on 18/11/2020.
//

import SwiftUI

struct GameSummaryView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var press: Bool
    var viewModel: GameSummaryViewModel 
    
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Text("Results")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                    .padding()
                SummaryTable(viewModel: viewModel)
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        MenuButton(iconName: "arrow.counterclockwise", text: "Play again")
                            .frame(width: 120, height: 120)                           
                    })
                    .padding(.trailing)
                   
                    Spacer()
                    Button(action: {
                        print("press: \(press)")
                        press = false
                    }, label: {
                        MenuButton(iconName: "line.horizontal.3", text: "Menu")
                            .frame(width: 120, height: 120)
                    })
//                    .padding(.vertical)

                        
                    Spacer()
                }
                .padding()
            }
        }
        .foregroundColor(.white)
        .navigationBarHidden(true)
    }
}

struct SummaryTable: View {
    var viewModel: GameSummaryViewModel
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4)) {
            Group {
                Text("") /// Placeholer to move first row to the right
                Text("Correct selection")
                    .minimumScaleFactor(0.1)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                Text("Incorrect selection")
                    .minimumScaleFactor(0.1)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                Text("Missed")
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                
            }
            Group {
                Text("Position")
                
                Text("\(viewModel.correctSelectionPostion)")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
                
                Text("\(viewModel.incorrectSelectionPosition)")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                
                Text("\(viewModel.missedSelectionPosition)")
                    .font(.title)
                    .foregroundColor(.yellow)
                    .padding()
            }
            Group {
                Text("Sound")
                
                Text("\(viewModel.correctSelectionSound)")
                    .font(.title)
                    .foregroundColor(.green)
                    .padding()
                
                Text("\(viewModel.incorrectSelectionSound)")
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                
                Text("\(viewModel.missedSelectionSound)")
                    .font(.title)
                    .foregroundColor(.yellow)
                    .padding()
            }
        }
        .padding()
    }
}

struct GameSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        GameSummaryView(press: .constant(false), viewModel: GameSummaryViewModel(history: [], nBack: 0))
    }
}
