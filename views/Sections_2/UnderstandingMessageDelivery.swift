//
//  UnderstandingMessageDelivery.swift
//  
//
//  Created by MacBook Pro on 23/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct UnderstandingMessageDelivery: View {
    var body: some View {
        NavigationStack{
            VStack(alignment:.center, spacing: 72){
                Text("Understanding Message Delivery")
                    .font(.largeTitleAx1)
                Text("Discover the unique ways in which individuals with Down Syndrome convey their thoughts and feelings through language and expression")
                    .font(.bodyAx1)
                    .multilineTextAlignment(.center)
                NavigationLink(destination: ConveyingWord()){
                    Label("Start the sections", systemImage: "play.fill")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(12)
                }
            }
        }
    }
}

struct UnderstandingMessageDelivery_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            UnderstandingMessageDelivery()
        } else {
            // Fallback on earlier versions
        }
    }
}
