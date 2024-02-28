//
//  ResponseChallangesFacedDS_2.swift
//  
//
//  Created by MacBook Pro on 23/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct ResponseChallangesFacedDS_2: View {
    let answeroptions = [
        AnswerOption(option: "I will address my conversation to both the person with DS and their caregiver, ensuring no one feels excluded.", feedBackText: "🎉🥰🎉\nGreat choice! Your inclusive approach shows respect for everyone involved, creating a warm and welcoming atmosphere. understanding.\nWell done!"),
        AnswerOption(isWrongAnswer: true, option: "I will only talk to the caregiver, assuming they can better communicate the person's experiences and feelings.", feedBackText: "😔😔😔\nLet's rethink this choice. It's important to remember that every perspective matters, including those of individuals with DS. Together, we can create a more inclusive environment."),
        AnswerOption(option: "I will ask open-ended questions about the trip, giving the person with DS the opportunity to share their experiences.", feedBackText: "🎉🥰🎉Great choice! Your decision to encourage direct engagement shows your commitment to promoting autonomy and respect. By valuing their perspective, you're contributing to enhanced social inclusion. Keep up the excellent work!"),
        AnswerOption(option: "I will share my own holiday experiences first, to create a comfortable atmosphere for them to share theirs.", feedBackText: "🎉🥰🎉\nGreat choice! Sharing personal stories can really help build rapport and make conversations more relatable and inclusive. Keep up the good work!")
    ]
    var body: some View {
        ResponseChallangesFacedDS(answerOptions: answeroptions, textStory: "imagine, At a family gathering, a family member with Down Syndrome is accompanied by their caregiver. You want to engage them in a conversation about a recent holiday trip.",nextScreen: AnyView(ResponseChallangesFacedDS_3()) ).navigationBarBackButtonHidden(true)
    }
}

struct ResponseChallangesFacedDS_2_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            ResponseChallangesFacedDS_2()
        } else {
            UnsupportedOSVersion()
        }
    }
}
