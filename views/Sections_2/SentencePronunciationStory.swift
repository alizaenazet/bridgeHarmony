//
//  SentencePronunciationStory.swift
//  
//
//  Created by MacBook Pro on 23/02/24.
//

import SwiftUI
import KeyAudioManager

let sentenceList = CharacterSentences(sentences: [
    CharacterSentence(
        name: CharacterName.Max,
        sentence: "Look it's very crowded here and there are lots of things to do, where do we start ?"
    ),
    CharacterSentence(
        name: CharacterName.Jamie,
        sentence: "Me swings. We go?"
    ),
    CharacterSentence(
        name: CharacterName.Max,
        sentence: "Yes, we can go to the swings. Let's have fun!"
    ),
    CharacterSentence(
        name: CharacterName.Jamie,
        sentence: "Swing high, me happy."
    ),
    CharacterSentence(
        name: CharacterName.Max,
        sentence: "When you swing high, it makes you happy. I like that!"
    ),
    CharacterSentence(
        name: CharacterName.Narator,
        sentence: "While swinging, Jamie notices other children playing"
    ),
    CharacterSentence(
        name: CharacterName.Jamie,
        sentence: "They run fast. Me too?"
    ),
    CharacterSentence(
        name: CharacterName.Max,
        sentence: "You want to run fast as well? After swinging, we can run together!"
    ),
    
    
])

@available(iOS 17.0, *)
struct SentencePronunciationStory: View {
    @State private var storyPart = 0
    @State private var isStandBy = false
    @State private var isShowFirstSentence = false
    @State private var firstHiglightedSentenceBg = Color.white
    @State private var secondHiglightedSentenceBg = Color.white
    @State private var audioPart = 0
    
    
    @Environment(\.dismiss) var dismiss
    var viewWidth = UIScreen.main.bounds.width
    var viewHeight = UIScreen.main.bounds.height
    let explanationIndex = [
        2: "Jamie uses minimal syntax, characteristic of 'syntactic weakness' omitting auxiliary verbs and prepositions. His intent is clear, but the structure is simplified.",
        7: "Jamie attempts to use an infinitive structure ('to run') but simplifies it. This reflects a difficulty with infinitive clauses that have different subjects."
    ]
    
    let audioManager : KeyAudioManager
    init(){
        audioManager = KeyAudioManager()
        do{
            try audioManager.addAudio(key: "0", audioFileName: "1_sound-session-2-1", fileExtension: "wav")
            try audioManager.addAudio(key: "1", audioFileName: "2_sound-session-2-1", fileExtension: "wav")
            try audioManager.addAudio(key: "2", audioFileName: "3_sound-session-2-1", fileExtension: "wav")
            try audioManager.addAudio(key: "3", audioFileName: "4_sound-session-2-1", fileExtension: "wav")
            try audioManager.addAudio(key: "4", audioFileName: "5_sound-session-2-1", fileExtension: "wav")
            try audioManager.addAudio(key: "5", audioFileName: "6_sound-session-2-1", fileExtension: "wav")
            try audioManager.addAudio(key: "6", audioFileName: "7_sound-session-2-1", fileExtension: "wav")
            
        }catch{
            print("Error adding audio file: \(error)")
        }
    }
    
    var body: some View {
        NavigationStack{
                ScrollView(.vertical){
                    VStack(spacing:30){
                        VStack(spacing:15){
                            Text("A Day at the Park with Jamie and Max")
                                    .font(.headlineAx1)
                                    .transition(.slide.animation(.linear.delay(0.5)))
                            
                                Image("SentencePronunciationStory")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(8)
                                .transition(.slide.animation(.linear.delay(0.5)))
                            
                            
                                if(storyPart >= 1){
                                    Text("in the afternoon Jam with his friend Max to spend time in the park together")
                                    .font(.bodyAx1)
                                    .transition(.opacity.animation(.easeIn(duration: 0.5)))
                                    }
                            
                                
                        }.onAppear{
                            delay(delay: 1.5){
                            withAnimation{
                                storyPart = 1
                                }
                                delay(delay: 3){
                                    withAnimation{
                                        isShowFirstSentence = true
                                        isStandBy = true
                                    }
                                }
                            }
                        }
                        VStack(spacing:10){
                            if(isShowFirstSentence){
                                CharacterSentenceComponent(sentece: sentenceList.sentences[0])
                                    .transition(.opacity.animation(.easeIn(duration: 0.5)))
                                    .onAppear{
                                        if(sentenceList.sentences[0].name != CharacterName.Narator.rawValue){
                                            audioManager.play(key: "\(audioPart)")
                                            audioPart += 1
                                        }
                                    }
                            }
                            
                            ForEach(0..<sentenceList.sentences.count ) { index in
                                if(storyPart > 1 && (storyPart-1) >= index && index != 0){
                                    if(index == 1 || index == 6){
                                        CharacterSentenceComponent(sentece: sentenceList.sentences[index])
                                            .transition(.opacity.animation(.easeIn(duration: 0.5)))
                                            .background(index == 1 ? firstHiglightedSentenceBg : secondHiglightedSentenceBg)
                                            .onAppear{
                                                if(sentenceList.sentences[index].name != CharacterName.Narator.rawValue){
                                                    audioManager.play(key: "\(audioPart)")
                                                    audioPart += 1
                                                }
                                            }
                                    }else{
                                    CharacterSentenceComponent(sentece: sentenceList.sentences[index])
                                        .transition(.opacity.animation(.easeIn(duration: 0.5)))
                                        .onAppear{
                                            if(sentenceList.sentences[index].name != CharacterName.Narator.rawValue){
                                                audioManager.play(key: "\(audioPart)")
                                                audioPart += 1
                                            }
                                        }
                                        
                                    }
                                }
                            }
                            if(storyPart-1 == 2 || storyPart-1 == 7){
                                Text(explanationIndex[storyPart-1]!)
                                    .font(.footnoteAx1)
                                    .padding()
                                    .frame(height: 90,alignment:.topLeading)
                                    .transition(.slide)
                                    .onAppear{
                                        if(storyPart-1 == 2){
                                            firstHiglightedSentenceBg = Color(hex:"F3F3F3")
                                        }else{
                                            secondHiglightedSentenceBg = Color(hex:"F3F3F3")
                                        }
                                    }
                                
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }.defaultScrollAnchor(.bottom)
            .padding()
            .navigationBarBackButtonHidden(true)
            .toolbar{
                    ToolbarItemGroup(placement: .bottomBar){
                        if(storyPart == sentenceList.sentences.count){
                        Button("Previous", action: {dismiss()})
                        Spacer()
                        Text("2. Difficulty Understanding Sentence Pronunciation")
                            .font(.headlineAx1)
                        Spacer()
                        NavigationLink("Next", destination: Difficulity())
                    }else if(isStandBy) {
                        Button("Continue"){
                            storyPart += 1
                            firstHiglightedSentenceBg = Color.white
                            secondHiglightedSentenceBg = Color.white
                            audioManager.stopAll()
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(12)
                    }
                   
                }
            }
        }
    }
}

struct SentencePronunciationStory_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            SentencePronunciationStory()
        } else {
            // Fallback on earlier versions
        }
    }
}

