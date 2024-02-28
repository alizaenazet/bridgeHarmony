//
//  ConveyMessage.swift
//  
//
//  Created by MacBook Pro on 23/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct ConveyMessage: View {
    let imagesText: Array<Array<String>> = [
    ["ConveyMessage_1", "we"],
    ["ConveyMessage_2", "love"],
    ["ConveyMessage_3", "gesture"] ]
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack(alignment: .center,spacing: 15){
                HStack(spacing: 10){
                    VStack(alignment: .center, spacing: 10){
                        Image("ConveyMessage_1")
                                .resizable()
                                .frame(width: 328,height: 328)
                                .cornerRadius(30)
                            Text("we")
                                .font(.largeTitleAx1)
                    }
                    VStack(alignment: .center, spacing: 10){
                        Image("ConveyMessage_2")
                                .resizable()
                                .frame(width: 328,height: 328)
                                .cornerRadius(30)
                            Text("love")
                                .font(.largeTitleAx1)
                    }
                    VStack(alignment: .center, spacing: 10){
                        Image("ConveyMessage_3")
                                .resizable()
                                .frame(width: 328,height: 328)
                                .cornerRadius(30)
                            Text("gesture")
                                .font(.largeTitleAx1)
                    }
                    
                }
                
                Text("Use of gestures to convey messages")
                    .font(.headlineAx1)
                    .multilineTextAlignment(.center)
                Text("People with Down's often use gestures, although not always, it is often done to make it easier to convey the message")
                    .font(.bodyAx1)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .toolbar{
                    ToolbarItemGroup(placement: .bottomBar){
                        NavigationLink("Previous", destination: Difficulity())
                        Spacer()
                        NavigationLink("start practicing", destination: ConveyGestureMessage())
                            .padding()
                            .foregroundColor(.blue)
                            .background(Color(hex: "#007AFF").opacity(0.2))
                            .cornerRadius(12)
                }
            }
        }
    }
}

struct ConveyMessage_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            ConveyMessage()
        } else {
            // Fallback on earlier versions
        }
    }
}
