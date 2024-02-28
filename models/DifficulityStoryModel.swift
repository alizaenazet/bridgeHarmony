////
////  DifficulityStoryModel.swift
////  
////
////  Created by MacBook Pro on 24/02/24.
////

import SwiftUI

struct StoryAnswerOptions{
    let question: String
    let options: Array<String>
    let trueOptionIndex: Int
}

struct StoryScene: Identifiable {
    var id: Int
    let storyContex : String
    let sentences: Array<CharacterSentence>
    let storyAnswerOptions: StoryAnswerOptions
}
