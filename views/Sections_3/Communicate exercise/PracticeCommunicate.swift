//
//  PracticeCommunicate.swift
//
//
//  Created by MacBook Pro on 26/02/24.
//

import SwiftUI
import KeyAudioManager


@available(iOS 17.0, *)
struct PracticeCommunicate: View {
    let characterSentencePartList = [
        CharacterSentencePart(id: 0, text: "Hi there!", duration: 1.3),
        CharacterSentencePart(
            id: 1,
            text: "When you listen to someone talk about tough stuff!",
            duration: 4.3 ),
        CharacterSentencePart(
            id: 2,
            text: "make sure to keep eye contact nice and gentle, without staring too hard or looking away a lot!",
            duration: 6.3),
        CharacterSentencePart(
            id: 3,
            text: "It shows you're really there, caring about what they're saying",
            duration: 3.3),
        CharacterSentencePart(
            id: 4,
            text: "lets practice",
            duration: 2.3),
        
    ]
    
    @Namespace var topInstructionID
    @Namespace var middleInstructionID
    @Namespace var bottomInstructionID
    @State private var currentSentecePart = 0
    
    let audioManager : KeyAudioManager
    init(){
        audioManager = KeyAudioManager()
        do{
            try audioManager.addAudio(key: "0", audioFileName: "4_session-3-1", fileExtension: "aif")
            try audioManager.addAudio(key: "1", audioFileName: "1_session-3-1", fileExtension: "aif")
            try audioManager.addAudio(key: "2", audioFileName: "2_session-3-1", fileExtension: "aif")
            try audioManager.addAudio(key: "3", audioFileName: "3_session-3-1", fileExtension: "aif")
            try audioManager.addAudio(key: "4", audioFileName: "5_session-3-1", fileExtension: "wav")
        }catch{
            print("Error adding audio file: \(error)")
        }
    }
    
    
    var body: some View {
        NavigationStack{
            VStack(){
                HStack(alignment: .center){
                    Image("PracticeCommunicate")
                        .resizable()
                        .frame(width: 270,height: 270)
                        .cornerRadius(6)
                    // Scroll View for Jamie sentence
                    ScrollView{
                        VStack(alignment: .leading,spacing: 10){
                            ForEach(characterSentencePartList){ sentence in
                                if(sentence.id <= currentSentecePart ){
                                    CharacterSentenceText(
                                        type: sentence.id < currentSentecePart ? .previous : .current,
                                        text: sentence.text)
                                    .onAppear{
                                        audioManager.play(key: "\(sentence.id)")
                                        delay(delay: sentence.duration){
                                            withAnimation{
                                                currentSentecePart += 1
                                            }
                                        }
                                    }
                                }
                            }
                            // after all the sentece finished show ...
                            if(currentSentecePart == characterSentencePartList.count ){
                                CharacterSentenceText(
                                    type: .current,
                                    text: "...")
                            }
                        }
                        .frame(width: 872, height: 169, alignment:.bottomLeading)
                        
                    }.defaultScrollAnchor(.bottomLeading)
                        .frame(width: 872 ,height: 270)
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                VStack(alignment: .leading, spacing: 15){
                    Text("introduction of conveying the message")
                        .font(.bodyAx1)
                    HStack(spacing:10){
                        VStack(alignment:.leading){
                            Text("Instruction :")
                                .font(.headlineAx1)
                                .foregroundColor(.blue)
                            // instruction list area
                            ScrollViewReader { proxy in
                                ScrollView{
                                    VStack(){
    //                                    InstructionComponent(
    //                                        type: .basic,
    //                                        text: "thr text of each instruction")
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(hex: "#F2F2F7"))
                        
                        // Voice area feedback and emotion type
                        VStack(alignment: .center, spacing: 10){
                            Text("😊")
                                .font(.titleAx1)
                            HStack{
                                Text("  ")
                                
                            }.frame(width: 271)
                                .background(.gray)

                            Text(" ")
                                NavigationLink("Go to the practice section", destination: PracticeCommunicate_1())
                                    .transition(.opacity)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.blue)
                                    .cornerRadius(12)
                                    .opacity(currentSentecePart == characterSentencePartList.count ? 1 : 0)
                        }
                    }.frame(maxWidth: .infinity, alignment: .top)
                        .background()
                    
                }.padding()
                    .frame(maxWidth: .infinity ,maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        PracticeCommunicate()
    } else {
        UnsupportedOSVersion()
    }
}



