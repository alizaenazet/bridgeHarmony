//
//  SwiftUIView.swift
//  
//
//  Created by MacBook Pro on 26/02/24.
//

import SwiftUI

enum CharacterSentenceTextType{
    case current, previous
}

struct CharacterSentenceText : View {
    let type: CharacterSentenceTextType
    let text: String
    var body: some View {
            Text(text)
                .font(type == CharacterSentenceTextType.current ? .headlineAx1 : .calloutAx1)
                .foregroundStyle(type == CharacterSentenceTextType.current ? Color.black : Color(hex: "#636366"))
                .bold()
        
    }
}

struct CharacterSentencePart: Identifiable {
    let id: Int
    let text : String
    let duration : Float
}



enum InstructionComponentType {
    case basic, current, finished
}

struct InstructionComponent : View {
    let type: InstructionComponentType
    let text: String
    var body: some View {
        HStack(alignment: .top, spacing:5){
            Image(systemName: type == InstructionComponentType.finished  ? "checkmark.circle" : "circle")
                .offset(y: 6)
                .foregroundColor(getIconColor())
            Text(text)
                .font(.headlineAx1)
            
        }
    }
    
    private func getIconColor() -> Color {
        switch type {
        case .basic :
            return Color(hex: "#8E8E93")
        case .current:
            return Color(hex: "#636366")
            
        case .finished:
            return .green
        }
    }

}
