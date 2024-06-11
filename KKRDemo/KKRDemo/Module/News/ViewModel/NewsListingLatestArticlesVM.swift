//
//  NewsListingLatestArticlesVM.swift
//  KKRDemo
//
//  Created by Jaideep Singh on 11/06/24.
//

//import Foundation
//import Combine
//
//final class NewsListingLatestArticlesVM: ObservableObject {
//    
//    // Variables
//    @Published var entityId: String = ""
//    @Published var excludeEntityId: String = ""
//    @Published var title: String = ""
//    @Published var newsListArr: [SIFeedsListingItem] = []
//    @Published var hasMoreNewsItems = true
//    
//    // Static URL
//   
//    
//    // Pagination Variables
//    private(set) var currentPageNumber = 1
//    private let pageCountLimit = 10
//    
//   
//    
//    func getNewsListingData(pageNumber: Int,
//                            onSuccess: @escaping() -> Void,
//                            onFailure: @escaping(ServiceError) -> Void) {
//        
//        let url = "https://www.knightclub.in/apiv4/listing?entities=172,4&otherent=&exclent=&pgnum=1&inum=10&pgsize=10"
//        
//        ServiceManager.shared.makeGetServiceRequest(
//            url: url,
//            type: SIFeedsListingModel.self,
//            completion: { [weak self] completion in
//                guard let self = self else { return }
//                switch completion {
//                case .success(let returnedResponse):
//                    if self.currentPageNumber == 1 { self.newsListArr.removeAll() }
//                    if let newsItems = returnedResponse.content?.items {
//                        if newsItems.count < self.pageCountLimit { self.hasMoreNewsItems = false }
//                        // Replace URLs with the static URL
////                        let updatedNewsItems = newsItems.map { item -> SIFeedsListingItem in
////                            var updatedItem = item
////                          
////                            return updatedItem
////                        }
//                      //  self.newsListArr.append(contentsOf: updatedNewsItems)
//                       // self.newsListingFLRPService.newsListArr = self.newsListArr
//                    } else {
//                        self.hasMoreNewsItems = false
//                    }
//                    onSuccess()
//                case .failure(let error):
//                    onFailure(error)
//                }
//            })
//    }
//}



import Foundation
import Combine

class NewsListingLatestArticlesVM: ObservableObject {
    @Published var feedItems: [SIFeedsListingItem] = []
    @Published var isLoading: Bool = false
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchData() {
        isLoading = true
        ServiceManager.shared.fetchData()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching data: \(error)")
                }
                self.isLoading = false
            }, receiveValue: { feedItems in
                self.feedItems = feedItems
            })
            .store(in: &cancellables)
    }
}
