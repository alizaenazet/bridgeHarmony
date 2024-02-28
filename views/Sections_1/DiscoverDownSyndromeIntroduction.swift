//
//  DiscoverDownSyndromeIntroduction.swift
//  
//
//  Created by Alizaenal Abidin on 21/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct DiscoverDownSyndromeIntroduction: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 72){
                Text("Discover Down Syndrome (DS)")
                    .font(.largeTitleAx1)
                
                VStack(alignment: .leading,spacing: 21){
                    VStack(alignment: .leading){
                        Text("- Explore the Basics: Learn about DS and what makes it unique.")
                            .font(.bodyAx1)
                            .bold()
                        Text("- Communicate with Care: Get tips on respectful and effective communication.")
                            .font(.bodyAx1)
                            .bold()
                    }
                    VStack(alignment:.leading){
                        Text("What You'll Do:")
                            .font(.bodyAx1)
                            .bold()
                        Text("1.Understand DS: Quick facts about biological aspects.")
                            .font(.bodyAx1)
                        Text("2.Talk Right: Practice respectful communication methods.")
                            .font(.bodyAx1)
                        Text("3.Solve Together: Tackle common communication challenges.")
                            .font(.bodyAx1)
                    }
                }
                NavigationLink(destination: SayHai()){
                    Label("Start the section", systemImage: "play.fill")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(12)
                }
            }.padding()
        }

    }
}

struct DiscoverDownSyndromeIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            DiscoverDownSyndromeIntroduction()
        } else {
            UnsupportedOSVersion()
        }
    }
}
