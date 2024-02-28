import SwiftUI

struct SectionRow: View {
    let title: String
    let subTitle: String
    @State private var isOpenFirstModal = true
    var body: some View {
        HStack{
            VStack(alignment: HorizontalAlignment.leading){
                Text(title)
                    .font(.system(size: 17))
                Text(subTitle)
                    .font(.system(size: 15))
                    .foregroundColor(.secondary)
            }
            Spacer()
                Text("Start")
                    .font(.system(size: 17))
                    .foregroundColor(.secondary)
        }.sheet(isPresented: $isOpenFirstModal){
            VStack(spacing: 20){
                VStack{
                    Text("Before you begin, please note: ")
                        .font(.titleAx1)
                    Text("This application is optimized for the 11-inch iPad in Light Mode and is designed to be used exclusively in landscape (horizontal) orientation.")
                        .font(.bodyAx1)
                        .multilineTextAlignment(.center)
                    
                    }.padding()
                Button("Understand"){
                    isOpenFirstModal = false
                }
            }.padding()
        }
    }
}

@available(iOS 17.0, *)
struct HomePage: View {
    var body: some View {
        NavigationStack{
            VStack(spacing:23) {
                Text("learn to communicate with people with Down syndrome 🥰")
                    .font(.largeTitleAx1)
                Image("HomePageImage")
                    .resizable()
                    .frame(width: 551, height: 315)
                    .cornerRadius(8)
                NavigationLink(
                    destination: DiscoverDownSyndromeIntroduction()
                ){
                    Label("Start the sections", systemImage: "play.fill")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(12)
                }
                
                VStack{
                    Text("Section List")
                        .font(.subheadlineAx1)
                    List {
                        
                        NavigationLink(
                            destination: DiscoverDownSyndromeIntroduction()
                        ){
                            SectionRow(title: "Communication Basic", subTitle: "Understand the basics of attitude and action when communicating")
                        }
                        NavigationLink(
                            destination: UnderstandingMessageDelivery()
                        ){
                            SectionRow(title: "Understanding Message Delivery", subTitle: "understand convey and receive messages in communication with an interactive storyline")
                        }
                    }.listStyle(.plain)
                }.padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(hex: "#F2F2F7"))
                    .cornerRadius(3)
                
            }.padding()
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 17.0, *) {
            HomePage()
        } else {
            UnsupportedOSVersion()
        }
    }
}
