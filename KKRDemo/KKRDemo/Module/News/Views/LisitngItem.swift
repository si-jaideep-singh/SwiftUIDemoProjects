//
//  LisitngItem.swift
//  SampleProjectSwiftUI
//
//  Created by Jaideep Singh on 07/06/24.
//

import SwiftUI

struct LisitngItem: View {
    @ObservedObject var viewModel: NewsListingLatestArticlesVM

    var body: some View {
        HStack(alignment: .top) {
            Image("virat")
                .resizable()
                .frame(width: 156, height: 100)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.feedItems.first?.primaryEntityName ?? "")
                    .font(.custom(CustomFonts.RubikMedium.name, size: 12))
                    .foregroundColor(.yellow)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.black)
                    .cornerRadius(15)
                
                HStack {
                    Text(viewModel.feedItems.first?.assetTitle ?? "")
                        .font(.custom(CustomFonts.RubikSemiBold.name, size: 20))
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                }
                
                HStack {
                    Text("21 May, 2024")
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "star.fill")
                    }
                    
                    Rectangle()
                        .frame(width: 2, height: 20)
                    
                    Button(action: {}) {
                        Image(systemName: "star.fill")
                    }
                }
                .padding(.leading, 5)
                .padding(.bottom, 15)
                .padding(.trailing, 15)
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
        .frame(width: 380, height: 88)
        .padding(.top, 20)
        
        Divider()
    }
}


struct LisitngItem_Preview: PreviewProvider {
    static var previews: some View {
        LisitngItem(viewModel: NewsListingLatestArticlesVM())
    }
}


//#Preview {
//    LisitngItem(viewModel: NewsListingLatestArticlesVM())
//}
