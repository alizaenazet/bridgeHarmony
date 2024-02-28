//
//  ConveyingWordDetail_1.swift
//  
//
//  Created by MacBook Pro on 23/02/24.
//

import SwiftUI
import KeyAudioManager


@available(iOS 17.0, *)
struct ConveyingWordDetail_1: View {
    @State private var isShowPopOverFirstWord = false
    @State private var isShowPopOverSecondWord = false
    @Environment(\.dismiss) var dismiss
    
    let audioManager : KeyAudioManager
    init(){
        audioManager = KeyAudioManager()
        do{
            try audioManager.addAudio(key: "hep", audioFileName: "hep", fileExtension: "mp3")
            try audioManager.addAudio(key: "baseba", audioFileName: "baseba", fileExtension: "mp3")
        }catch{
            print("Error adding audio file: \(error)")
        }
    }
    
    
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing:30){
                Text("Explore how people with Down Syndrome simplify speech by blending sounds and dropping ending sounds.")
                    .font(.bodyAx1)
                    .frame(maxWidth: .infinity,alignment: .center)
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 5){
                        Text("Phonological Reduction")
                            .font(.headlineAx1)
                        Button{
                            isShowPopOverFirstWord.toggle()
                        }label: {
                            Image(systemName: "info.circle")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 26,height: 26)
                        }.popover(isPresented: $isShowPopOverFirstWord){
                            HStack{
                                Text("simplify speech by merging adjacent consonants in words. This process, known as cluster reduction turns groups like 'bl' in 'black' into a single sound, making 'help' sound more like 'hep'.")
                                    .font(.caption2Ax1)
                                    .frame(width: 450, height: 100)
                                    .padding()
                            }
                        }
                    }
                    
                    Button{
                        audioManager.play(key: "hep")
                    }label: {
                        Label("'help' becomes 'hep'", systemImage: "playpause.fill")
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(12)
                    }
                    Text("Speech simplifies by blending sounds, like 'bl' to 'b' in 'black,' due to easier sound formations.")
                        .font(.footnoteAx1)
                }
                
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 5){
                        Text("Word Final Consonants Removed ")
                            .font(.headlineAx1)
                        Button{
                            isShowPopOverSecondWord.toggle()
                        }label: {
                            Image(systemName: "info.circle")
                                .resizable()
                                .foregroundColor(.blue)
                                .frame(width: 26,height: 26)
                        }.popover(isPresented: $isShowPopOverSecondWord){
                            HStack{
                                Text("rendering it as 'beɪs bɑ:' instead of 'beɪs bɑ:l.' This alteration illustrates a specific speech pattern.")
                                    .font(.caption2Ax1)
                                    .frame(width: 450, height: 100)
                                    .padding()
                            }
                        }
                    }
                    
                    Button{
                        audioManager.play(key: "baseba")
                    }label: {
                        Label("'baseball' becomes 'baseba'", systemImage: "playpause.fill")
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(12)
                    }
                    Text("they might drop the last consonant in words. For instance, 'baseball' could be pronounced more like 'baseba.'")
                        .font(.footnoteAx1)
                }
            }.padding()
                .navigationBarBackButtonHidden(true)
                .toolbar{
                    ToolbarItemGroup(placement: .bottomBar){
                        Button("Previous", action: {dismiss()})
                        Spacer()
                        Text("1. Understand the difficulty of conveying words")
                            .font(.headlineAx1)
                        Spacer()
                        NavigationLink("Next", destination: ConveyingWordDetail_2())
                    }
                }
        }
    }
}

struct ConveyingWordDetail_1_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            ConveyingWordDetail_1()
        } else {
            UnsupportedOSVersion()
        }
    }
}
