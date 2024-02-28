//
//  ResponseChallangesFacedDS_1.swift
//  
//
//  Created by MacBook Pro on 22/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct ResponseChallangesFacedDS_1: View {
        @State private var isOpenFirstModal = true

    let answeroptions = [
        AnswerOption(option: "I will patiently ask simple, clear questions to understand their interest better", feedBackText: "🎉🥰🎉\nBy choosing this approach, you're demonstrating respect for their unique communication style and fostering a welcoming atmosphere that encourages clear understanding.\nWell done!"),
        AnswerOption(option: "I will speak directly to them, maintaining eye contact and giving them time to respond", feedBackText: "🎉🥰🎉\nWhen you communicate directly with patience and respect, you're helping to boost their confidence and independence, creating a supportive and respectful environment. Great job on choosing this positive approach!"),
        AnswerOption(isWrongAnswer: true, option: "I will assume they might not understand the activity and decide not to include them", feedBackText: "😔😔😔\nYour assumption might unintentionally exclude them and make them feel left out. Let's strive to create a more inclusive environment where everyone feels valued and respected!"),
        AnswerOption(option: "I will involve them in the conversation about the activity, using gestures or visual aids if necessary", feedBackText: "🎉🥰🎉\nGreat choice! Incorporating diverse communication methods shows your commitment to understanding and engaging with others, promoting inclusivity and adaptability. Keep up the excellent work!")
    ]
    var body: some View {
            ResponseChallangesFacedDS(answerOptions: answeroptions, textStory: "imagine, You're at a community event and notice a person with Down syndrome trying to express their interest in participating in a group activity.",nextScreen: AnyView(ResponseChallangesFacedDS_2()),isIntroScreen: true ).navigationBarBackButtonHidden(true)
    }
}

struct ResponseChallangesFacedDS_1_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            ResponseChallangesFacedDS_1()
        } else {
            UnsupportedOSVersion()
        }
    }
}
