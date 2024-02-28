//
//  UnderstandCommunicate.swift
//
//
//  Created by MacBook Pro on 25/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct UnderstandCommunicate: View {
    @State private var showText = false
    
    
    var body: some View {
        VStack(spacing:40){
            HStack(alignment: .center, spacing: 20){
                Image("UnderstandCommunicate_1")
                    .resizable()
                    .frame(width: 194.5, height: 194.5)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                if(showText){
                    HStack(alignment: .center, spacing:10){
                        Image(systemName: "arrow.backward")
                        Text("understand how to communicate")
                            .font(.headlineAx1)
                        Image(systemName: "arrow.forward")
                    }.transition(.scale.animation(.default))
                }
                Image("UnderstandCommunicate_2")
                    .resizable()
                    .frame(width: 194.5, height: 194.5)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .onAppear{
                        delay(delay: 0.8){
                            withAnimation{
                                showText = true
                            }
                        }
                    }
            }
            
            if(showText){
            NavigationLink(destination: PracticeCommunicate()){
                Label("Start Section", systemImage: "play.fill")
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(12)
                    .transition(.move(edge: .bottom).animation(.default.delay(3)))
            }}
            
            
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        UnderstandCommunicate()
    } else {
        UnsupportedOSVersion()
    }
}
