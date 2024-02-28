//
//  SayHai.swift
//  
//
//  Created by Alizaenal Abidin on 21/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct SayHai: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 21){
                Text("Hello, do you have difficulty communicating with us ?\nDon't worry, you are not alone, let's understand each other")
                    .multilineTextAlignment(.center)
                    .font(.bodyAx1)
                Image("SayHiCharacter")
                    .resizable()
                    .frame(width: 567,height: 423)
            }.padding()
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Button("Previous", action: {dismiss()})
                    Spacer()
                        Text("Say hi 👋")
                        .font(.headlineAx1)
                    Spacer()
                    NavigationLink("Next", destination: BiologicalUnderstanding())
                }
            }
        }
    }
}

struct SayHai_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            SayHai()
        } else {
            UnsupportedOSVersion()
        }
    }
}
