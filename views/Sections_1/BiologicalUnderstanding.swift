//
//  BiologicalUnderstanding.swift
//  
//
//  Created by Alizaenal Abidin on 21/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct BiologicalUnderstanding: View {
    @Environment(\.dismiss) var dismiss
    @State private var showText = false
    
    var viewWidth = UIScreen.main.bounds.width

    var body: some View {
        NavigationStack{
            HStack(alignment: .center,spacing: 21.0){
                Image("BiologicalUnderstanding")
                    .resizable()
                    .frame(width: 623,height: 623)
                    .cornerRadius(6)

                VStack(alignment: .leading,spacing: 30){
                    Text("Down Syndrome is a chromosomal condition characterized by an additional chromosome 21 possibly decreasing the brain's ability to process information")
                        .font(.headlineAx1)
                    Text("thus requiring a societal approach that respects the unique experiences and full potential of those affected.")
                        .font(.bodyAx1)
                        .opacity(showText ? 1 : 0)
                        .animation(.easeIn(duration: 0.5).delay(1),value: showText)
                }.onAppear {
                    withAnimation {
                        showText = true
                    }
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Button("Previous", action: {dismiss()})
                    Spacer()
                        Text("1. Biological Understanding")
                        .font(.headlineAx1)
                    Spacer()
                    NavigationLink("Next", destination: AttitudeWithDs())
                }
            }
            
        }
    }
}

@available(iOS 17.0, *)
struct BiologicalUnderstanding_Previews: PreviewProvider {
    static var previews: some View {
        BiologicalUnderstanding()
    }
}
