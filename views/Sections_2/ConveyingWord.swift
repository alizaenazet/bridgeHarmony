//
//  ConveyingWord.swift
//  
//
//  Created by MacBook Pro on 23/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct ConveyingWord: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center,spacing: 30){
                Text("Effective communication starts by understanding the way we use words and phrases to convey our thoughts.")
                    .font(.headlineAx1)
                    .multilineTextAlignment(.center)
                
                Text("Words are more than just sounds. they're the foundation of every conversation. Knowing how they work together helps us communicate better.")
                    .font(.bodyAx1)
                    .multilineTextAlignment(.center)
                
                Image("ConveyingWord")
                    .resizable()
                    .frame(width: 672, height: 384)
                    .cornerRadius(8)
                
            }
            .padding()
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Button("Previous", action: {dismiss()})
                    Spacer()
                    Text("1. Understand the difficulty of conveying words")
                        .font(.headlineAx1)
                    Spacer()
                    NavigationLink("Next", destination: ConveyingWordDetail_1())
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct ConveyingWord_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            ConveyingWord()
        } else {
            UnsupportedOSVersion()
        }
    }
}
