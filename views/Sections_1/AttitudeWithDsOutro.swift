//
//  AttitudeWithDsOutro.swift
//  
//
//  Created by Alizaenal Abidin on 21/02/24.
//

import SwiftUI

@available(iOS 17.0, *)
struct AttitudeWithDsOutro: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Remember that Down syndrome is a chromosomal condition, not a disease.")
                    .font(.headlineAx1)
            }.navigationBarBackButtonHidden(true)
                .toolbar{
                    ToolbarItemGroup(placement: .bottomBar){
                        HStack(alignment:.center) {
                            Button("Previous", action: {dismiss()})
                                .padding(0)
                            Spacer()
                            Text("2. Attitudes Towards people with Down")
                                .font(.headlineAx1)
                            Spacer()
                            NavigationLink("Next", destination: ConnectStatement())
                                .padding(0)
                        }
                    }
                }
        }
    }
}

struct AttitudeWithDsOutro_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            AttitudeWithDsOutro()
        } else {
            UnsupportedOSVersion()
        }
    }
}
