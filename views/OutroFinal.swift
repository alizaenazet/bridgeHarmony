//
//  SwiftUIView 2.swift
//  
//
//  Created by Alizaenal Abidin on 26/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct OutroFinal: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                Text("🎉🎉🎉\nAmazing that you actually got it done")
                    .font(.largeTitleAx1)
                Image("OutroFInal")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 380)
                    .cornerRadius(9)

                NavigationLink("Go back to home", destination: HomePage())
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(12)
            }
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        OutroFinal()
    } else {
        UnsupportedOSVersion()
    }
}
