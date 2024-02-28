//
//  DealingWithLimitation.swift
//  
//
//  Created by MacBook Pro on 22/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct DealingWithLimitation: View {
    @State private var isShowImageText = false
    
    @Environment(\.dismiss) var dismiss
    var viewWidth = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 54){
                Text("With the limitations and communication problems faced by people with Down's, we need to behave appropriately when communicating with people with Down's")
                    .font(.bodyAx1)
                HStack(alignment: .center, spacing: 23){
                    Image("DealingWithLimitation")
                        .resizable()
                        .frame(width: 354,height: 354)
                        .cornerRadius(6)
                        .onAppear(){
                            delay(delay: 1.5){
                                withAnimation{
                                    isShowImageText = true
                                }
                            }
                        }
                        Text("By behaving appropriately, we can\nhelp provide a sense of comfort and\nmutual respect in the community")
                        .font(.bodyAx1)
                        .offset(x: isShowImageText ? 0 : viewWidth)
                        .opacity(isShowImageText ? 1 : 0)
                        .transition(.move(edge: .trailing))
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
                    NavigationLink("Next", destination: DealingWithLimitationOutro())
                }
            }
        }
        
    }
}

struct DealingWithLimitation_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            DealingWithLimitation()
        } else {
            UnsupportedOSVersion()
        }
    }
}
