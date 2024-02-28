//
//  DealingWithLimitationOutro.swift
//  
//
//  Created by MacBook Pro on 22/02/24.
//

import SwiftUI


@available(iOS 17.0, *)
struct DealingWithLimitationOutro: View {
    struct Content {
        let imageName: String
        let text: String
    }
    
    @Environment(\.dismiss) var dismiss
    let contents = [
        Content(imageName: "DealingWithLimitationOutro_1", text: "Avoid assuming that\nindividuals with DS cannot\ncommunicate."),
        Content(imageName: "DealingWithLimitationOutro_2", text: "Engage not only in\nconversations but also\ninteractions with\naccompanying individuals."),
        Content(imageName: "DealingWithLimitationOutro_3", text: "You should strive to\nunderstand Down\nsyndrome physically.")
    ]
    
    var body: some View {
        HStack(alignment:.center,spacing:12){
            ForEach(contents, id: \.imageName ) { content in
                    VStack(spacing: 10){
                        Image(content.imageName)
                            .resizable()
                            .frame(width: 315,height: 315)
                        Text(content.text)
                            .font(.bodyAx1)
                            .multilineTextAlignment(.center)
                    }
                }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement: .bottomBar){
                Button("Previous", action: {dismiss()})
                Spacer()
                Text("3. Understanding DS Challenges")
                    .font(.headlineAx1)
                Spacer()
                NavigationLink("Next", destination: ResponseChallangesFacedDS_1())
            }
        }
        
    }
        
}

struct DealingWithLimitationOutro_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            DealingWithLimitationOutro()
        } else {
            UnsupportedOSVersion()
        }
    }
}
