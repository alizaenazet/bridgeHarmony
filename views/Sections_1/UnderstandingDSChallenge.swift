//
//  UnderstandingDSChallenge.swift
//
//
//  Created by Alizaenal Abidin on 21/02/24.
//

import SwiftUI

enum AnimateSequence {
    case none, first, second
}

@available(iOS 17.0, *)
struct UnderstandingDSChallenge: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var imageCornerRadius = 3.0
    @State private var currentAnimateSequence: AnimateSequence = AnimateSequence.none
    @State private var readytoNext = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .center ,spacing:21){
                    Text("Hey, just so you know,\nsometimes we struggle to put words in the right order when I'm speaking")
                    .multilineTextAlignment(.center)
                        .font(.bodyAx1)
                    
                        HStack(alignment: .center ){
                            Text("Difficulty with syllables and\nspeech rhythm.")
                                .font(.captionAx1)
                                .multilineTextAlignment(.center)
                                .opacity(currentAnimateSequence == AnimateSequence.none ? 0 : 1)
                                .transition(.opacity.animation(.easeIn(duration: 1.0)))
                            Spacer()
                            Image("UnderstandingDSChallenge")
                                .resizable()
                                .frame(width: 408,height: 249)
                                .cornerRadius(imageCornerRadius)
                                .transition(.opacity.animation(.easeIn(duration: 5.0)))
                                .onAppear{
                                    withAnimation{
                                        firstAnimate()
                                    }
                                }
                            Spacer()
                            Text("Challenges accessing word\nsounds.")
                                .font(.captionAx1)
                                .multilineTextAlignment(.center)
                                .opacity(currentAnimateSequence == AnimateSequence.none ? 0 : 1)
                                .transition(.opacity.animation(.easeIn(duration: 1.0)))
                        }
                    
                        HStack (alignment: .center){
                            Text("Trouble describing word \nrelationships.")
                                .font(.captionAx1)
                                .multilineTextAlignment(.center)
                                .transition(.opacity.animation(.easeIn(duration: 1.0)))
                            Spacer()
                            
                            Text("Challenges accessing word sounds.")
                                .font(.captionAx1)
                                .offset(x: 33)
                                .multilineTextAlignment(.center)
                                .transition(.opacity.animation(.easeIn(duration: 1.0)))
                            Spacer()
                            Text("Struggle with complex sentence \nstructures.")
                                .font(.captionAx1)
                                .multilineTextAlignment(.center)
                                .transition(.opacity.animation(.easeIn(duration: 1.0)))
                            
                        }.opacity(currentAnimateSequence == AnimateSequence.second ? 1 : 0)
                }
                .padding()
                .navigationBarBackButtonHidden(true)
                .toolbar{
                    if(readytoNext){
                        ToolbarItemGroup(placement: .bottomBar){
                            Button("Previous", action: {dismiss()})
                            Spacer()
                            Text("3. Understanding DS Challenges")
                                .font(.headlineAx1)
                            Spacer()
                            NavigationLink("Next", destination: DealingWithLimitation())
                        }
                        }
                }
            
        }
        
    }
    
    private func firstAnimate(){
        delay(delay: 2){
            withAnimation{
                imageCornerRadius = 72
                currentAnimateSequence = AnimateSequence.first
                secondAnimate()
            }
        }
    }
    
    private func secondAnimate(){
        delay(delay: 2){
            withAnimation{
                currentAnimateSequence = AnimateSequence.second
                readytoNext = true
            }
        }
    }
}

struct UnderstandingDSChallenge_Preview: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            UnderstandingDSChallenge()
        } else {
            UnsupportedOSVersion()
        }
    }
}
