//
//  DiscoverDownSyndromeExerciseOutro.swift
//  
//
//  Created by MacBook Pro on 23/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct DiscoverDownSyndromeExerciseOutro: View {
    @State private var isShowButton = false
    @State private var showFirstText = false
    @State private var showSecondText = false
    @State private var showThirdText = false
    @State private var showLastText = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .center, spacing: 45){
                
                VStack(alignment: .center, spacing: 12){
                        Text("Every action we take")
                        .font(.headlineAx1)
                        .multilineTextAlignment(.center)
                        .transition(.opacity.animation(.easeIn(duration: 1)))
                        .onAppear{
                            delay(delay: 1){
                                withAnimation{
                                showFirstText = true
                                }
                            }
                        }
                        if(showFirstText){
                        Text("every word we speak")
                        .font(.headlineAx1)
                        .multilineTextAlignment(.center)
                        .transition(.opacity.animation(.easeIn(duration: 1)))
                        .onAppear{
                            delay(delay: 1){
                                withAnimation{
                                    showSecondText = true
                                }
                            }
                        }}
                        if(showSecondText){
                        Text("can make a big difference in someone's life")
                        .font(.headlineAx1)
                        .multilineTextAlignment(.center)
                        .transition(.opacity.animation(.easeIn(duration: 1)))
                        .onAppear{
                            delay(delay: 1.5){
                                withAnimation{
                                    showThirdText = true
                                }
                            }
                        }}
                        if(showThirdText){
                        Text("This exercise is all about building bridges, fostering kindness, and celebrating everyone's unique contributions to our world.")
                        .font(.headlineAx1)
                        .multilineTextAlignment(.center)
                        .transition(.opacity.animation(.easeIn(duration: 1)))
                        .onAppear{
                            delay(delay: 3){
                                withAnimation{
                                    isShowButton = true
                                }
                            }
                        }}
                    
                    }
                NavigationLink(destination: UnderstandingMessageDelivery()){
                    Label("Next Section", systemImage: "play.fill")
                }
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(12)
                .opacity(isShowButton ? 1 : 0)
                .animation(.easeIn(duration: 0.5), value: isShowButton)
                
            }.padding()
        }
    }
}

struct DiscoverDownSyndromeExerciseOutro_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            DiscoverDownSyndromeExerciseOutro()
        } else {
            // Fallback on earlier versions
        }
    }
}
