//
//  Difficulity.swift
//  
//
//  Created by MacBook Pro on 23/02/24.
//

import SwiftUI
let storySceneList = [
    StoryScene(
        id: 0, storyContex: "They arrive at the park, and Alex immediately gets excited about the playground.",
        sentences: [
            CharacterSentence(name: .Jamie, sentence: "Max, look! Swings!"),
            CharacterSentence(name: .Max, sentence: "I see them, Jamie. Let's start there. I'll push you!")],
        storyAnswerOptions: StoryAnswerOptions(
            question: "What does Jamie want to do first at the park?",
            options: ["Go on the swings","Have a picnic","Leave the park"], trueOptionIndex: 0
        )),
        
    StoryScene(
        id: 1, storyContex: "After some time on the swings, they sit down for a snack. Jamie has trouble opening his juice box.",
        sentences: [
            CharacterSentence(name: .Jamie, sentence: "Max, help please. Juice hard."),
            CharacterSentence(name: .Max, sentence: "Of course, Jamie. Here you go")],
        storyAnswerOptions: StoryAnswerOptions(
            question: "What does Jamie need help with?",
            options: ["Finding his juice box","Opening his juice box","Drinking his juice"], trueOptionIndex: 1
        )),
        
    StoryScene(
        id: 2, storyContex: "While enjoying their snacks, a dog comes up to them, wagging its tail. Alex gets excited.",
        sentences: [
            CharacterSentence(name: .Jamie, sentence: "Doggy! Can pet?"),
            CharacterSentence(name: .Max, sentence: "Sure, Jamie. Let's ask the owner if it's okay.")],
        storyAnswerOptions: StoryAnswerOptions(
            question: "What does Jamie want to do when he sees the dog?",
            options: ["Ignore the dog","Run away","Pet the dog"], trueOptionIndex: 2
        )),
        
    StoryScene(
        id: 3, storyContex: "As the sun begins to set, they pack up to head home. Alex feels happy about their day.",
        sentences: [
            CharacterSentence(name: .Jamie, sentence: "Fun day, Max. Thank you."),
            CharacterSentence(name: .Max, sentence: "I had a great time too, Jamie. We should do this again soon")],
        storyAnswerOptions: StoryAnswerOptions(
            question: "How does Alex feel about their day at the park?",
            options: ["How does Alex feel about their day at the park?","He's grateful and happy","He's bored and wants to go home"], trueOptionIndex: 1
        )),
        
]
@available(iOS 17.0, *)
struct Difficulity: View {
    @State private var isOpenModal = true
    @State private var isStart = false
    @State private var isStartStory = false
    @State private var isShowContext = false
    @State private var isShowSentences = false
    @State private var sentenceHistory: Array<CharacterSentence> = []
    @State private var wrongOption: Array<Int> = []
    @State private var storyScene = 0
    @State private var isStandby = false
    @State private var currentSentencePart = 0
    @State private var isShowedQuestion = false
    @State private var navigateToNextView = false
    
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 30){
                NavigationLink(destination: ConveyMessage(), isActive: $navigateToNextView){EmptyView()}
                
                    ScrollView{
                        VStack(alignment: .center, spacing:12){
                                Text("A Day at the park with Jamie and Max")
                                    .font(.headlineAx1)
                                    .transition(.opacity)
                                Image("Difficulity")
                                    .resizable()
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(8)
                                    .transition(.opacity)

                                    Text("On a sunny afternoon, Jamie and Max decide to visit the park. They plan to enjoy some outdoor activities and have a small picnic.")
                                        .font(.bodyAx1)
                                        .opacity(isStart ? 1 : 0)
                                        .transition(.opacity.animation(.default.delay(1)))
                                        .multilineTextAlignment(.center)
                            
                            }.padding(.bottom)

                                
                            // Memulai menampilkan cerita
                            if(isStartStory){
                                
                                // iterasi seluruh story yang ada
                                ForEach(Array(storySceneList.enumerated()), id: \.offset){
                                    sceneIndex, scene  in
                                    
                                    // Tampilkan story yang telah dimunculkan saja
                                    // menampilkan story beserta sentence pertama
                                    if(sceneIndex <= storyScene){
                                    Text(scene.storyContex)
                                        .font(.footnoteAx1)
                                        .bold()
                                        .multilineTextAlignment(.center)
                                        .onAppear{
                                            isStandby = false
                                         }
                                        
                                        CharacterSentenceComponent(sentece: scene.sentences.first!)
                                            .transition(.opacity.animation(.default.delay(2)))
                                            .onAppear{
                                                isStandby = false
                                                delay(delay: 2.5){
                                                    withAnimation{
                                                        isStandby = true
                                                    }
                                                }
                                            }
                                        
                                        ForEach(Array(scene.sentences.enumerated()), id: \.offset){
                                            sentenceIndex, sentence in
                                            if(sceneIndex < storyScene && sentenceIndex != 0 ){
                                                CharacterSentenceComponent(sentece: sentence)
                                            }else if(sentenceIndex != 0 && sentenceIndex <= currentSentencePart){
                                                CharacterSentenceComponent(sentece: sentence)
                                            }
                                        }

                                    }
                                }
                                
                            }
                            
                            if(isShowedQuestion){
                                VStack(alignment: .leading, spacing: 10){
                                    Text(storySceneList[storyScene].storyAnswerOptions.question)
                                        .font(.footnoteAx1)
                                    VStack(alignment: .leading){
                                        ForEach(
                                            Array(storySceneList[storyScene].storyAnswerOptions.options.enumerated()),
                                            id: \.offset
                                        ){ index, item in
                                            VStack(alignment: .leading){
                                                if(index != storySceneList[storyScene].storyAnswerOptions.trueOptionIndex){
                                                    Text(item)
                                                        .font(.system(size: 17))
                                                        .foregroundColor(wrongOption.contains(index) ? .red : .blue)
                                                        .offset(x: 10)
                                                        .padding([.top],10)
                                                }else{
                                                    Text(item)
                                                        .font(.system(size: 17))
                                                        .foregroundColor(.blue)
                                                        .offset(x: 10)
                                                        .padding([.top],10)
                                                }
                                                
                                                Divider()
                                            }
                                            .frame(maxWidth: .infinity)
                                            .background(.white)
                                            .onTapGesture{
                                                if(
                                                    index == storySceneList[storyScene].storyAnswerOptions.trueOptionIndex &&
                                                    (
                                                        storyScene == 3 || storyScene == 0
                                                    )
                                                ){
                                                    withAnimation{
                                                        isOpenModal = true
                                                    }
                                                    isShowedQuestion = false
                                                    wrongOption.removeAll()
                                                }else if(
                                                    index == storySceneList[storyScene].storyAnswerOptions.trueOptionIndex
                                                ) {
                                                    isShowedQuestion = false
                                                    wrongOption.removeAll()
                                                    storyScene += 1
                                                    currentSentencePart = 0
                                                }else{
                                                    wrongOption.append(index)
                                                }
                                            }
                                            
                                       }
                                        }
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                        .background(.white)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(hex: "#F3F3F3"))
                                .transition(.opacity.animation(.easeIn(duration: 0.3)))

                    }
                    
                    }.defaultScrollAnchor(.bottom)
                
               
                
                
                
                
            }.sheet(
                isPresented: $isOpenModal,
                onDismiss: {
                    if(!isStart){
                        isOpenModal = false
                        delay(delay: 1){
                            withAnimation{
                                isStart = true
                                isStandby = true
                            }}
                    }else if(storyScene == 0){
                        isOpenModal = false
                        delay(delay: 1){
                        withAnimation{
                            storyScene += 1
                            currentSentencePart = 0
                        }}
                    }else{
                        isOpenModal = false
                    }
                }
            ){
                
                if(!isStart){
                    introSheet(){
                        isOpenModal = false
                        delay(delay: 1){
                        withAnimation{
                        isStart = true
                        isStandby = true
                        }}
                    }
                }else if(storyScene == 0){
                    secondSheet(
                        buttonActionNext: {
                            navigateToNextView = true
                            isOpenModal = false
                        },
                        buttonActionRetry: {
                            isOpenModal = false
                            delay(delay: 1){
                            withAnimation{
                                storyScene += 1
                                currentSentencePart = 0
                            }}
                        })
                }else{
                    finalSheet(buttonActionNextView: {
                        navigateToNextView = true
                        isOpenModal = false  
                    })
                }
                
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .toolbar{
                    ToolbarItemGroup(placement: .bottomBar){
                        if(storyScene == 3 && currentSentencePart == storySceneList.last!.sentences.count  ){
                            
                        }else{
                            if(isStandby && !isShowedQuestion) {
                            Button("Continue"){
                                if(isStart && !isStartStory){
                                    withAnimation{
                                    isStartStory = true
                                    }
                                }else if(currentSentencePart < storySceneList[storyScene].sentences.count - 1){
                                    withAnimation{
                                        currentSentencePart += 1
                                    }
                                    if(currentSentencePart == storySceneList[storyScene].sentences.count-1){
                                        delay(delay: 1){
                                            withAnimation{
                                                isShowedQuestion = true
                                            }
                                        }
                                    }
                                }else{
                                    withAnimation{
                                        storyScene += 1
                                        currentSentencePart = 0
                                    }
                                    if(storyScene == 1){
                                        withAnimation{
                                            isOpenModal = true
                                        }
                                    }
                                }
                                withAnimation{
                                    isStandby = false
                                }
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(12)
                            .transition(.move(edge: .bottom))
                        }
                    }
                   
                }
            }
        }
        
    }
}


struct introSheet : View {
    let buttonAction: () -> Void
    
    var body : some View {
        VStack( spacing: 25){
            VStack(alignment: .leading, spacing: 5){
                Text("Welcome to the Adventure ! 👋👋👋")
                    .font(.headlineAx1)
                Text("Picture yourself in a lively park. Here, we'll uncover the secrets of communication together.")
                    .font(.bodyAx1)
            }
            VStack(alignment: .leading, spacing: 5){
                Text("Meet Challenges Head-On:")
                    .font(.headlineAx1)
                Text("We'll face real-life situations showing how people with Down syndrome can affect speech. But don't worry, we'll pause for cool insights along the way. 🥳👏")
                .font(.bodyAx1)
                
            }
            
            Button("Let’s begin 🚀"){
                buttonAction()
            }
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(12)
                
        }.padding()
    }
    
}
struct secondSheet : View {
    let buttonActionNext: () -> Void
    let buttonActionRetry: () -> Void
    
    var body : some View {
        VStack( spacing: 25){
                Text("🎉🎉🎉\nYuhuu, you have successfully begun to understand how to convey messages that are often used by people with Down syndrome")
                    .font(.bodyAx1)
            
            VStack(spacing:20){
                Button("Next section"){
                    buttonActionNext()
                }
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(12)
                
                Button{
                    buttonActionRetry()
                }label: {
                    Label("Try more", systemImage: "play.fill")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(12)
                }
                
            }
                
        }.padding()
    }
    
}
struct finalSheet : View {
    let buttonActionNextView: () -> Void
    
    var body : some View {
        VStack( spacing: 25){
                Text("🎉🎉🎉\nExcellent, you have succeeded in perfecting your practice to understand how to convey messages that are often used by people with Down Syndrome, let's move on to the next session🚀")
                    .font(.bodyAx1)
            
            VStack(spacing:20){
                Button("Next section"){
                    buttonActionNextView()
                }
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(12)
                
            }
                
        }.padding()
    }
    
}

#Preview {
    if #available(iOS 17.0, *) {
        Difficulity()
    } else {
        UnsupportedOSVersion()
    }
}
