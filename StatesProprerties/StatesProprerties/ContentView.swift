//
//  ContentView.swift
//  StatesProprerties
//
//  Created by Jaideep Singh on 31/05/24.
//

import SwiftUI

//struct ContentView: View {
//    @State private var tapCount = 0
//    var body: some View {
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }
//    }
//}
struct ContentView: View {
    @Binding private var tapCount :Int
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}


#Preview {
    ContentView()
}
