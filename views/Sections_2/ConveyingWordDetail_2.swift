//
//  ConveyingWordDetail_1.swift
//  
//
//  Created by MacBook Pro on 23/02/24.
//

import SwiftUI
import KeyAudioManager

@available(iOS 17.0, *)
struct ConveyingWordDetail_2: View {
    @State private var isShowPopOverFirstWord = false
    @State private var isShowPopOverSecondWord = false
    
    @Environment(\.dismiss) var dismiss
    
    let audioManager : KeyAudioManager
    init(){
        audioManager = KeyAudioManager()
        do{
            try audioManager.addAudio(key: "dip", audioFileName: "dip", fileExtension: "mp3")
            try audioManager.addAudio(key: "stop", audioFileName: "stop", fileExtension: "mp3")
        }catch{
            print("Error adding audio file: \(error)")
        }
    }
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading,spacing:30){
                Text("Sometimes individuals with Down Syndrome might use sharper sounds for softer ones and skip the initial breath in words, making speech easier but less clear.")
                    .font(.bodyAx1)
                    .frame(maxWidth: .infinity,alignment: .center)
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 5){
                        Text("Replacing Fricatives with Stops")
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
                                Text("replacing softer 'stop' sounds (such as /d/) with sharper 'fricative'\nsounds (such as /s/), due to physical factors such as muscle tone and size of the oral cavity. This adaptation simplifies speech production but can affect word intelligibility,\n making 'sip' sound more similar to 'dip'.")
                                    .font(.caption2Ax1)
                                    .frame(width: 550, height: 150)
                                    .padding()
                            }
                        }
                    }
                    
                    Button{
                        audioManager.play(key: "dip")
                    }label: {
                        Label("'sip' becomes 'dip'", systemImage: "playpause.fill")
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(12)
                    }
                    Text("Softer sounds may change to sharper ones, like 'd' to 's,' for simpler articulation due to physical speech traits.")
                        .font(.footnoteAx1)
                }
                
                VStack(alignment: .leading,spacing: 10){
                    HStack(spacing: 5){
                        Text("De-aspiration of Initial Stops")
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
                                Text("Reducing the breathy puff of air that usually follows initial stop sounds like /t/ and /p/. For example, the word 'top' might sound more like\n'stop' without the strong breathy quality on the /t/.")
                                    .font(.caption2Ax1)
                                    .frame(width: 450, height: 100)
                                    .padding()
                            }
                        }
                    }
                    
                    Button{
                        audioManager.play(key: "stop")
                    }label: {
                        Label("'top' becomes 'stop'", systemImage: "playpause.fill")
                            .padding()
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(12)
                    }
                    Text("The usual breathy start of words like 'top' might be softened, making speech clearer without the initial puff")
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
                        NavigationLink("Next", destination: SentencePronunciation())
                    }
                }
        }
    }
}

struct ConveyingWordDetail_2_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            ConveyingWordDetail_2()
        } else {
            // Fallback on earlier versions
        }
    }
}
