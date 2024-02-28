//
//  AttitudeWithDs.swift
//  
//
//  Created by Alizaenal Abidin on 21/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct AttitudeWithDs: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var showFirstText = false
    @State private var showSecondText = false
    @State private var textBackground = Color.white
    
    var viewWidth = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .center, spacing: 55){
                Text("Let's embrace the strengths and potential of people with Down syndrome.\nThey're full of possibilities, just like everyone else."
                )
                .font(.bodyAx1)
                .multilineTextAlignment(.center)
                
                HStack(alignment: .center, spacing: 23){
                    Image("AttitudeWithDs")
                        .resizable()
                        .frame(width: 338,height: 199)
                        .scaledToFit()
                    
                    VStack(alignment: .leading, spacing: 35){
                        if showFirstText {
                        Text("Think positive! Swap 'special' or 'unfortunate' for empowering words.")
                            .font(.footnoteAx1).bold()
                            .multilineTextAlignment(.leading)
                            .offset(x: showFirstText ? 0 : viewWidth)
                            .animation(.easeIn(duration: 1).delay(2),value: showFirstText)}
                        
                        if showSecondText {
                        Text("Instead of saying 'suffering from', let's talk about living and thriving.")
                            .font(.footnoteAx1).bold()
                            .multilineTextAlignment(.leading)
                            .offset(x: showSecondText ? 0 : viewWidth)
                            .animation(.easeIn(duration: 1).delay(2.5),value: showSecondText)
                            
                            }
                        }
                }
                .padding([.horizontal],20)
                .padding([.vertical],10)
                .background(textBackground)
                .cornerRadius(6)
                .frame(width: 750)
                .onAppear{
                    
                    withAnimation{
                        setShowFirstText()
                        setShowSecondText()
                    }
                    
                    changeTextBg()
                }
                
                Text("See beyond limits. Every person brings unique abilities to the table. Let's recognize and celebrate those talents together!"
                )
                .font(.bodyAx1)
                .multilineTextAlignment(.center)
                
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Button("Previous", action: {dismiss()})
                    Spacer()
                    Text("2. Attitudes Towards people with Down")
                        .font(.headlineAx1)
                    Spacer()
                    NavigationLink("Next", destination: AttitudeWithDsOutro())
                }
            }
        }
    }
    
    func setShowFirstText() {
        delay(delay: 3){
            withAnimation{
            showFirstText = true}
        }
    }
    func setShowSecondText() {
        delay(delay: 2){
            withAnimation{
                showSecondText = true
            }
        }
    }
    
    func changeTextBg(){
        delay(delay: 4.5){
            withAnimation{
                textBackground = Color(hex: "#F2F2F7")}
        }
    }
}

struct AttitudeWithDs_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            AttitudeWithDs()
        } else {
            UnsupportedOSVersion()
        }
    }
}
