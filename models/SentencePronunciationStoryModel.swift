//
//  SentencePronunciationStoryModel.swift
//  model for storyline @Views/Sections_2/SentencePronunciationStory
//
//  Created by MacBook Pro on 23/02/24.
//

import Foundation
import SwiftUI

enum CharacterName: String {
    case Max = "Max"
    case Jamie = "Jamie"
    case Narator = "Narator"
}

//let kiw = try? SleepCalculator()

struct CharacterSentence {
    let name: String
    let characterImage: String
    let sentence: String
    init(name: CharacterName, sentence: String) {
        self.name = name.rawValue
        self.characterImage = name.rawValue
        self.sentence = sentence
    }
}

struct CharacterSentences {
    let sentences : Array<CharacterSentence>
}

struct CharacterSentenceComponent : View {
    let sentece: CharacterSentence
    var body: some View {
        HStack(alignment: .center,spacing: 10){
            if(sentece.name == "Narator"){
                Text(sentece.sentence)
                    .font(.headlineAx1)
            }else{
                Image(sentece.characterImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 55,height: 55)
                    .clipShape(Circle())
                    
                HStack(spacing:10){
                    Text("\(sentece.name) :")
                        .font(.bodyAx1)
                        .bold()
                    Text(sentece.sentence)
                        .font(.bodyAx1)
                }
                    
            }
        }.frame(maxWidth: .infinity,alignment: sentece.name == "Narator" ? .center : .leading)
    }
}



