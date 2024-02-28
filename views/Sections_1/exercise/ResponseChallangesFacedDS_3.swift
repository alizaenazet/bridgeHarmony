//
//  ResponseChallangesFacedDS_3.swift
//  
//
//  Created by MacBook Pro on 23/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct ResponseChallangesFacedDS_3: View {
    let answeroptions = [
        AnswerOption(option: "I will simplify the instructions and break them down into smaller, manageable steps.", feedBackText: "🎉🥰🎉\nGreat choice! Your approach shows understanding and adaptability, which are key in fostering effective communication and boosting confidence. Keep up the good work!"),
        AnswerOption(isWrongAnswer: true, option: "I will express frustration and impatience, believing that this might motivate them to try harder.", feedBackText: "😔😔😔\nYour choice could potentially create a less welcoming atmosphere, affecting their confidence and eagerness to engage. Let's aim for a more supportive approach next time!"),
        AnswerOption(option: "I will offer to demonstrate the tasks visually or through hands-on examples.", feedBackText: "🎉🥰🎉\nGreat choice! Visual and hands-on demonstrations are excellent ways to understand and remember information, catering to different learning preferences. Keep up the good work!"),
        AnswerOption(option: "I will encourage them to ask questions and express any concerns, ensuring they feel supported.", feedBackText: "🎉🥰🎉\nGreat job! Your choice promotes open communication, creating a supportive and empathetic environment. This helps value everyone's input and enhances effective learning. Keep it up!")
    ]
    var body: some View {
        ResponseChallangesFacedDS(answerOptions: answeroptions, textStory: "imagine, In a workplace setting, a new colleague with Down syndrome is finding it challenging to follow complex instructions during training.",nextScreen: AnyView(DiscoverDownSyndromeExerciseOutro()) ).navigationBarBackButtonHidden(true)
    }
}

struct ResponseChallangesFacedDS_3_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            ResponseChallangesFacedDS_3()
        } else {
            UnsupportedOSVersion()
        }
    }
}
