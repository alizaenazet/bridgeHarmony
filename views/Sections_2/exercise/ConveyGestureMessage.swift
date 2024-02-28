//
//  ConveyGestureMessage.swift
//
//
//  Created by MacBook Pro on 25/02/24.
//

import SwiftUI
import KeyAudioManager

@available(iOS 17.0, *)
struct ConveyGestureMessage: View {
    @State private var isOpenModal = true
    @State private var isOpenOutroModal = false
    @State private var isOpenShowImages = false
    @State private var isOpenShowSentence = false
    @State private var isOpenShowQuestions = false
    @State private var wrongOptions: Array<Int> = []
    @State private var navigateToNextView = false
    
    
    let audioManager : KeyAudioManager
    init(){
        
        audioManager = KeyAudioManager()
        do{
            try audioManager.addAudio(key: "0", audioFileName: "session-2-2", fileExtension: "wav")
        }catch{
            print("Error adding audio file: \(error)")
        }
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink(destination: OutroFinal(), isActive: $navigateToNextView){EmptyView()}
                ScrollView{
                    VStack(spacing: 15){
                        Text(" In the library, Alex, is surrounded by new books to read. The shelves are filled with various colorful options.")
                            .font(.bodyAx1)
                            .multilineTextAlignment(.center)
                            .transition(.opacity.animation(.easeInOut(duration: 1)))
                        
                        if(isOpenShowImages){
                            HStack(spacing: 30){
                                Image("ConveyGestureMessage_1")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(6)
                                    .transition(.move(edge: .leading))
                                Image("ConveyGestureMessage_2")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(6)
                                    .scaleEffect(x: -1, y: 1)
                                    .transition(.move(edge: .leading).animation(.default.delay(1)))
                                Image("ConveyGestureMessage_3")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(6)
                                    .transition(.move(edge: .leading).animation(.default.delay(2)))
                            }.onAppear{
                                delay(delay: 3){
                                    withAnimation{
                                        isOpenShowSentence = true
                                    }
                                }
                            }
                        }
                        
                        if(isOpenShowSentence){
                            HStack(spacing: 3){
                                Image("ConveyGestureMessage_circle")
                                    .resizable()
                                    .frame(width: 42, height: 42)
                                    .clipShape(.circle)
                                    .transition(.scale.animation(.default))
                                Text("Alex:")
                                    .font(.captionAx1)
                                    .bold()
                                    .transition(.opacity.animation(.default.delay(1)))
                                Text("This one, I pick!")
                                    .font(.captionAx1)
                                    .padding([.leading],3)
                                    .transition(.opacity.animation(.default.delay(1.5)))
                                    .onAppear{
                                        audioManager.play(key: "0")
                                        delay(delay: 1){
                                            withAnimation{
                                                isOpenShowQuestions = true
                                            }
                                        }
                                    }
                            }
                        }
                        
                        
                    }.padding()
                }.defaultScrollAnchor(.center)
                if(isOpenShowQuestions){
                    VStack(alignment: .leading,spacing: 15){
                        Text("What is Alex doing ?")
                            .font(.system(size: 17))
                        VStack{
                            VStack(alignment: .leading){
                                    Text("asked for a shelf")
                                    .font(.system(size: 17))
                                    .foregroundStyle(wrongOptions.contains(1) ?  .red :.blue)
                                    .padding([.top],5)
                                Divider()
                            }.onTapGesture {
                                wrongOptions.append(1)
                            }
                            VStack(alignment: .leading){
                                Text("want to take a book")
                                .font(.system(size: 17))
                                .foregroundStyle( .blue)
                                .padding([.top],5)
                                Divider()
                            }.onTapGesture {
                                withAnimation{
                                    isOpenModal = true
                                    isOpenOutroModal = true
                                }
                            }
                            VStack(alignment: .leading){
                                Text("Arrange books on shelves")
                                .font(.system(size: 17))
                                .foregroundStyle(wrongOptions.contains(2) ?  .red :.blue)
                                .padding([.top],5)
                                Divider()
                            }.onTapGesture {
                                wrongOptions.append(2)
                            }
                            
                        }
                    }
                    .padding()
                    .transition(.move(edge: .bottom).animation(.default.delay(0.5)))
                }
            }.sheet(isPresented: $isOpenModal, onDismiss: {
                if(isOpenModal && !isOpenOutroModal){
                    isOpenModal = false
                    withAnimation{
                        isOpenShowImages = true
                    }
                }else if(isOpenOutroModal){
                    isOpenModal = false
                    navigateToNextView = true
                }
            }, content: {
                if(isOpenModal  && !isOpenOutroModal){
                    VStack(spacing: 47){
                        Text("👋👋👋\nWelcome to understanding gesture exercise! Dive into scenarios where gestures and sounds convey messages. Guess the action depicted after each scenario to understand how individuals with Down syndrome communicate.")
                            .font(.bodyAx1)
                            
                        Button("Let's begin! 🚀"){
                            isOpenModal = false
                            withAnimation{
                                isOpenShowImages = true
                            }
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(12)
                        
                        
                    }.padding()
                }
                if(isOpenOutroModal) {
                    VStack(spacing: 47){
                        Text("Amazing, you almost understand all the general ways of communicating with people with Down syndrome, best regards to you ❤️️")
                            .font(.bodyAx1)
                            
                        Button{
                            isOpenModal = false
                            navigateToNextView = true
                        }label: {
                            Label("Next session", systemImage: "play.fill")
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(12)
                        }
                        
                        
                    }.padding()
                }
            })
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        ConveyGestureMessage()
    } else {
        UnsupportedOSVersion()
    }
}
