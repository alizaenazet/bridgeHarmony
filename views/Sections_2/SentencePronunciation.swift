//
//  SentencePronunciation.swift
//  
//
//  Created by MacBook Pro on 23/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct SentencePronunciation: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack(spacing:42){
                Text("Difficulty in conveying sentences")
                    .font(.bodyAx1)
                
                HStack(spacing:12){
                    Image("SentencePronunciation")
                        .resizable()
                        .frame(width: 357,height: 357)
                        .cornerRadius(6)
                    
                    Text("It's important to note that at times, our sentences may require you to make adjustments in order to comprehend them fully.")
                        .font(.bodyAx1)
                        .frame(width: 331)
                    
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Button("Previous", action: {dismiss()})
                    Spacer()
                    Text("2. Difficulty Understanding Sentence Pronunciation")
                        .font(.headlineAx1)
                    Spacer()
                    NavigationLink("Next", destination: SentencePronunciationStory())
                }
            }
        }
    }
}

struct SentencePronunciation_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            SentencePronunciation()
        } else {
            // Fallback on earlier versions
        }
    }
}
