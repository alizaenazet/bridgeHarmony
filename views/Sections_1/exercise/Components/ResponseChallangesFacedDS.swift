//
//  ResponseChallangesFacedDS.swift
//  
//
//  Created by MacBook Pro on 22/02/24.
//

import SwiftUI

struct AnswerOption {
    var isWrongAnswer: Bool = false
    let option: String
    let feedBackText: String
}

struct ResponseChallangesFacedDS: View {
    let answerOptions : Array<AnswerOption>
    var textStory: String
    var nextScreen : AnyView
    var viewWidth = UIScreen.main.bounds.width
    @State private var navigateToNextView = false
    @State private var isPresentModal = false
    @State private var presentedModal : Int = -1
    @State private var isPresentTextStory = false
    @State var isIntroScreen : Bool = false
    var body: some View {
        NavigationStack{
            NavigationLink(destination: nextScreen, isActive: $navigateToNextView){EmptyView()}
            VStack(alignment: .center){
                Text("\(presentedModal)")
                    .opacity(0)
                HStack{
                    if(isPresentTextStory){
                        withAnimation{
                            Text(textStory)
                                .font(.headlineAx1)
                                .frame(maxWidth: viewWidth-20)
                                .transition(.opacity.animation(.easeIn(duration: 1.5)))
                        }
                    }else{
                        Text(textStory)
                            .font(.headlineAx1)
                            .frame(maxWidth: viewWidth-20)
                            .opacity(isPresentTextStory ? 1 : 0)
                            .transition(.opacity.animation(.easeIn(duration: 1)))
                    }
                    
                }
                .scaledToFill()
                .frame(minHeight: 500,maxHeight: .infinity)

                
                VStack(alignment:.leading){
                    Text("Action Options")
                        .font(.system(size: 17))
                    if(isIntroScreen){
                        List {
                            ForEach(0..<answerOptions.count, id: \.self) { index in
                                Text(answerOptions[index].option)
                                    .font(.system(size: 17))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        presentedModal = index
                                        isPresentModal = true
                                    }
                            }
                        }.listStyle(.plain)
                            .sheet(isPresented: $isIntroScreen){
                                VStack(spacing: 20){
                                    Text("👋👋👋\nNow, we enter a wonderful world full of diversity and empathy, with a focus on our friends with Down Syndrome (DS). Through real-life scenarios, you'll get a glimpse of their experiences, challenges, and triumphs.")
                                        .font(.bodyAx1)
                                    VStack(alignment: .leading){
                                        Text("What's the Plan?")
                                            .font(.headlineAx1)
                                        Text("You'll be presented with different situations that people with DS often encounter. Your task? Choose how you'd respond in each scenario. Don't worry, it's not about right or wrong; it's about understanding and learning.")
                                            .font(.bodyAx1)
                                        
                                    }
                                    Button("Let's get started! 💪❤️", action: {isIntroScreen = false})
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(.blue)
                                        .cornerRadius(12)
                                }.padding()
                            }
                    }else{
                        List {
                            ForEach(0..<answerOptions.count, id: \.self) { index in
                                Text(answerOptions[index].option)
                                    .font(.system(size: 17))
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    .foregroundColor(.blue)
                                    .background(.background)
                                    .onTapGesture {
                                        presentedModal = index
                                        isPresentModal = true
                                    }
                            }
                        }.listStyle(.plain)
                            .onAppear{
                                delay(delay: 0.3){
                                    isPresentTextStory = true
                                }
                            }
                    }
                }.padding()
                    .cornerRadius(3)
                
            }.frame(alignment: .bottom)
                .sheet(isPresented: $isPresentModal, onDismiss:{
                    isPresentModal = false
                }){
                    VStack(alignment: .center,spacing: 20){
                    if(isIntroScreen){
                        Text("👋👋👋\nNow, we enter a wonderful world full of diversity and empathy, with a focus on our friends with Down Syndrome (DS). Through real-life scenarios, you'll get a glimpse of their experiences, challenges, and triumphs.")
                            .font(.bodyAx1)
                        VStack(alignment:.leading){
                            Text("What's the Plan?")
                                .font(.headlineAx1)
                            Text("You'll be presented with different situations that people with DS often encounter. Your task? Choose how you'd respond in each scenario. Don't worry, it's not about right or wrong; it's about understanding and learning.")
                                .font(.bodyAx1)
                        }
                        
                        Button("Let's get started! 💪❤️"){
                            isPresentModal = false
                            isIntroScreen = false
                        }
                        .padding()
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        
                    }else {
                        Text(answerOptions[presentedModal].feedBackText)
                            .font(.bodyAx1)
                        if (answerOptions[presentedModal].isWrongAnswer){
                            Button("Try again 🔥"){
                                isPresentModal = false
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(12)
                        }else {
                            Button("Next practice 🤝"){
                                isPresentModal = false
                                navigateToNextView = true
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(12)
                        }
                    }
                    }.padding()
                }
            }
        }
    }

@available(iOS 17.0, *)
struct ResponseChallangesFacedDS_Previews: PreviewProvider {
    static var previews: some View {
        ResponseChallangesFacedDS(answerOptions: [
            AnswerOption(option: "I will patiently ask simple, clear questions to understand their interest better", feedBackText: "🎉🥰🎉\nBy choosing this approach, you're demonstrating respect for their unique communication style and fostering a welcoming atmosphere that encourages clear understanding.\nWell done!"),
            AnswerOption(option: "I will speak directly to them, maintaining eye contact and giving them time to respond", feedBackText: "🎉🥰🎉\nWhen you communicate directly with patience and respect, you're helping to boost their confidence and independence, creating a supportive and respectful environment. Great job on choosing this positive approach!"),
            AnswerOption(isWrongAnswer: true, option: "I will assume they might not understand the activity and decide not to include them", feedBackText: "😔😔😔\nYour assumption might unintentionally exclude them and make them feel left out. Let's strive to create a more inclusive environment where everyone feels valued and respected!"),
            AnswerOption(option: "I will involve them in the conversation about the activity, using gestures or visual aids if necessary", feedBackText: "🎉🥰🎉\nGreat choice! Incorporating diverse communication methods shows your commitment to understanding and engaging with others, promoting inclusivity and adaptability. Keep up the excellent work!")
        ],textStory: "nYour assumption might unintentionally exclude them and make them feel left out. Let's strive to create a more inclusive environment where everyone feels valued and respected!",nextScreen: AnyView(HomePage()),isIntroScreen: true)
    }
}
