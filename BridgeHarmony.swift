import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 17.0, *) {
                HomePage()
            } else {
                UnsupportedOSVersion()
            }
        }
    }
}
