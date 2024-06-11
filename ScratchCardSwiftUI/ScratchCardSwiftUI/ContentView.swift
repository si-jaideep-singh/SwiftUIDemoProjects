//
//  ContentView.swift
//  ScratchCardSwiftUI
//
//  Created by Jaideep Singh on 27/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var points = [CGPoint]()
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.red)
                .frame(width: 250,height: 250)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.yellow)
                .frame(width: 250,height: 250)
                .overlay{
                    Image("image", bundle: nil)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200,height: 200)
                }
                .mask{
                    Path {
                        path in
                        path.addLines(points)}
                    .stroke(style: StrokeStyle(lineWidth: 50,lineCap: .round,lineJoin: .round))
                }
                .gesture(
                    DragGesture(minimumDistance: 0,coordinateSpace: .local)
                        .onChanged( {
                            value in
                            points.append(value.location)
                        })
                )
        }
        
        .padding()
    }
}


#Preview {
    ContentView()
}
