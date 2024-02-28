//
//  ConnectStatement.swift
//  
//
//  Created by MacBook Pro on 22/02/24.
//

import SwiftUI


@available(iOS 17.0, *)
struct ConnectStatement: View {
    enum OptionsMenu : String {
        case biologicFirst = "Chromosomal condition identified by an extra chromosome 21.";
        case biologicSecond = "Down Syndrome may potentially reduce the brain's capacity to process information.";
        case actionFirst = "Practice simple, open, and respectful communication with individuals with Down syndrome.";
        case actionSecond = "Down syndrome is a chromosomal condition, not a disease.";
        
    }
    
    @State private var selectedOption: Set<OptionsMenu> = []
    @State private var answeredOption: Set<OptionsMenu> = []
    @State private var currentOptionsType = [
        OptionsMenu.actionFirst: OptionType.basic,
        OptionsMenu.actionSecond: OptionType.basic,
        OptionsMenu.biologicFirst: OptionType.basic,
        OptionsMenu.biologicSecond: OptionType.basic]
    @State private var isWiningTheGame = false
    @State private var navigateToNextView = false


    var body: some View {
            NavigationStack{
                VStack(alignment:.center, spacing: 30){
                    if (isWiningTheGame){
                        NavigationLink(destination: UnderstandingDSChallenge(), isActive: $navigateToNextView){EmptyView()}
                    } else{
                        Text("match the following paired options correctly\ntap an option to connecting each of the following 2 correlated option parts correctly")
                            .font(.bodyAx1)
                            .multilineTextAlignment(.center)
                    }
                    
                    HStack(alignment: .center, spacing: 150){
                        VStack(alignment: .center){
                            Text("Biological conditions")
                                .font(.headlineAx1)
                                .multilineTextAlignment(.center)
                            VStack(alignment:.center, spacing: 12){
                                Option(text: OptionsMenu.biologicFirst.rawValue)
                                    .type(currentOptionsType[.biologicFirst]!)
                                    .onTapGesture {
                                        onOptionTap(OptionsMenu.biologicFirst)
                                    }
                                Option(text: OptionsMenu.biologicSecond.rawValue)
                                    .type(currentOptionsType[.biologicSecond]!)
                                    .onTapGesture {
                                        onOptionTap(OptionsMenu.biologicSecond)
                                    }
                            }
                            .padding()
                            .frame(width: 329,height: 568)
                            .background(.indigo)
                            .cornerRadius(9)
                        }
                        .padding()
                        
                        VStack(alignment: .center){
                            Text("Action and attitudes")
                                .font(.headlineAx1)
                                .multilineTextAlignment(.center)
                            VStack(alignment:.center, spacing: 12){
                                Option(text: OptionsMenu.actionFirst.rawValue)
                                    .type(currentOptionsType[.actionFirst]!)
                                    .onTapGesture {
                                        onOptionTap(OptionsMenu.actionFirst)
                                    }
                                Option(text: OptionsMenu.actionSecond.rawValue)
                                    .type(currentOptionsType[.actionSecond]!)
                                    .onTapGesture {
                                        onOptionTap(OptionsMenu.actionSecond)
                                    }
                            }
                            .padding()
                            .frame(width: 329,height: 568)
                            .background(.orange)
                            .cornerRadius(9)
                        }
                        .padding()
                    }
                }
                .padding()
                .sheet(isPresented: $isWiningTheGame,onDismiss: {
                    navigateToNextView = true
                    isWiningTheGame = false
                }){
                        VStack(alignment: .center, spacing: 47){
                            Text("🎉🎉🎉 Great job finishing the exercise! You now know more about how to interact with kindness and respect. This understanding will make your interactions more positive and respectful.")
                                .font(.bodyAx1)
                                .multilineTextAlignment(.center)
                            Button{
                                navigateToNextView = true
                                isWiningTheGame = false
                            } label: {
                                Label("let's keep practicing", systemImage: "play.fill")
                                .padding()
                                .foregroundColor(.white)
                                .background(.blue)
                                .cornerRadius(12)
                            }
                            
                            
                        }.padding()
                }
        }
            }
    
    func onOptionTap(_ optionOnSelected: OptionsMenu){
        
        
        // check for Action type Option
        if(optionOnSelected == OptionsMenu.actionFirst || optionOnSelected == OptionsMenu.actionSecond){
            if(optionOnSelected == OptionsMenu.actionFirst){
                
                
                if ((selectedOption.contains(OptionsMenu.actionSecond) || currentOptionsType[OptionsMenu.actionSecond] == OptionType.incorrect) && !answeredOption.contains(OptionsMenu.actionSecond)){
                    currentOptionsType[.actionSecond] = .basic
                    selectedOption.remove(OptionsMenu.actionSecond)
                    
                }
                if (currentOptionsType[.actionFirst] != .correct && !selectedOption.contains(.actionFirst)){
                    currentOptionsType[.actionFirst] = .selected
                    selectedOption.insert(OptionsMenu.actionFirst)
                }else if(currentOptionsType[.actionFirst] != .correct) {
                    currentOptionsType[.actionFirst] = .basic
                    selectedOption.remove(OptionsMenu.actionFirst)
                }
                
                
                
            }
            
            
            
            if(optionOnSelected == OptionsMenu.actionSecond){
                if ((selectedOption.contains(OptionsMenu.actionFirst) || currentOptionsType[OptionsMenu.actionFirst] == OptionType.incorrect) && !answeredOption.contains(OptionsMenu.actionFirst)){
                    currentOptionsType[.actionFirst] = .basic
                    selectedOption.remove(OptionsMenu.actionFirst)
                }
                if (currentOptionsType[.actionSecond] != .correct && !selectedOption.contains(.actionSecond)){
                    currentOptionsType[.actionSecond] = .selected
                    selectedOption.insert(OptionsMenu.actionSecond)
                }else if(currentOptionsType[.actionSecond] != .correct) {
                    currentOptionsType[.actionSecond] = .basic
                    selectedOption.remove(OptionsMenu.actionSecond)
                }
            }
            
        }else {
            
            if(optionOnSelected == OptionsMenu.biologicFirst){
                if ((selectedOption.contains(OptionsMenu.biologicSecond) || currentOptionsType[OptionsMenu.biologicSecond] == OptionType.incorrect) && !answeredOption.contains(OptionsMenu.biologicSecond)){
                    currentOptionsType[.biologicSecond] = .basic
                    selectedOption.remove(OptionsMenu.biologicSecond)
                }
                if (currentOptionsType[.biologicFirst] != .correct && !selectedOption.contains(.biologicFirst)){
                    currentOptionsType[.biologicFirst] = .selected
                    selectedOption.insert(OptionsMenu.biologicFirst)
                }else if(currentOptionsType[.biologicFirst] != .correct) {
                    currentOptionsType[.biologicFirst] = .basic
                    selectedOption.remove(OptionsMenu.biologicFirst)
                }
            }
            
            
            
            if(optionOnSelected == OptionsMenu.biologicSecond){
                if ((selectedOption.contains(OptionsMenu.biologicFirst) || currentOptionsType[OptionsMenu.biologicFirst] == OptionType.incorrect) && !answeredOption.contains(OptionsMenu.biologicFirst)){
                    currentOptionsType[.biologicFirst] = .basic
                    selectedOption.remove(OptionsMenu.biologicFirst)
                }
                if (currentOptionsType[.biologicSecond] != .correct && !selectedOption.contains(.biologicSecond)){
                    currentOptionsType[.biologicSecond] = .selected
                    selectedOption.insert(OptionsMenu.biologicSecond)
                }else if(currentOptionsType[.biologicSecond] != .correct) {
                    currentOptionsType[.biologicSecond] = .basic
                    selectedOption.remove(OptionsMenu.biologicSecond)
                }
            }
            
            
            
        }
        
        
        let firstBiologicAndSecondActionCorrect = selectedOption.contains([OptionsMenu.actionSecond, OptionsMenu.biologicFirst]) || selectedOption.contains([OptionsMenu.biologicFirst, OptionsMenu.actionSecond])
        let secondBiologicAndFirstActionCorrect = selectedOption.contains([OptionsMenu.actionFirst, OptionsMenu.biologicSecond]) || selectedOption.contains([OptionsMenu.biologicSecond, OptionsMenu.actionFirst])
        
        if(firstBiologicAndSecondActionCorrect || secondBiologicAndFirstActionCorrect){
            if(firstBiologicAndSecondActionCorrect){
                currentOptionsType[.biologicFirst] = .correct
                currentOptionsType[.actionSecond] = .correct
                answeredOption.insert(.biologicFirst)
                answeredOption.insert(.actionSecond)
            }
            if(secondBiologicAndFirstActionCorrect){
                currentOptionsType[.biologicSecond] = .correct
                currentOptionsType[.actionFirst] = .correct
                answeredOption.insert(.biologicSecond)
                answeredOption.insert(.actionFirst)
            }
            selectedOption.removeAll()
        }else if(selectedOption.count > 1){
            selectedOption.forEach{ option in
                currentOptionsType[option] = .incorrect
                selectedOption.removeAll()
            }
        }
        if(answeredOption.count == 4){
            isWiningTheGame = true
        }
        
    }
}

@available(iOS 17.0, *)
struct ConnectStatement_Previews: PreviewProvider {
    static var previews: some View {
        ConnectStatement()
    }
}






enum OptionType {
    case basic, selected, incorrect, correct
}



struct Option : View {
    let text: String
    var currentType: OptionType = OptionType.basic
    var body: some View {
        Text(text)
            .padding()
            .frame(width: 309)
            .foregroundColor(setTextColor(currentType))
            .background(setBackground(currentType))
            .cornerRadius(6)
    }
    
    private func setBackground(_ type: OptionType) -> Color {
        switch type {
        case .correct :
            return Color(hex: "#C5FDD3")
        case .selected:
            return Color(hex: "#D9EBFF")
        case .incorrect:
            return Color(hex: "#FFCDCA")
            
        default:
            return Color(hex: "#EFEFF0")
        }
    }
    
    private func setTextColor(_ type: OptionType) -> Color {
        switch type {
        case .correct :
            return Color.green
        case .selected:
            return Color.blue
        case .incorrect:
            return Color.red
            
        default:
            return Color.black
        }
    }
    
    
    func type(_ type: OptionType) -> Option{
        var newOptionComponent = self
        newOptionComponent.currentType = type
        return newOptionComponent
    }
}
