//
//  ViewModel.swift
//  Anime GraphQL
//
//  Created by Alex Ryan on 9/12/24.
//

import SwiftUI
import Apollo
import AniListAPIForTesting

class AnimeViewModel: ObservableObject {
    @Published var animeList: [AnimeMedia] = []
    
    @Published var mediaSort: MediaSort = .trendingDesc {
        didSet {
            fetchAnime()
        }
    }

    func fetchAnime() {

        let query = GetActionAnimeQuery(page: 1, perPage: 20, sort: [GraphQLEnum(mediaSort)])

        Network.shared.apollo.fetch(query: query) { [weak self] result in
            switch result {
                case .success(let grapgQLResult):
                    if let media = grapgQLResult.data?.page?.media?.compactMap({ $0 }) {
                        self?.animeList = media.map { mediaData in
                            AnimeMedia(
                                id: UUID(),
                                englishTitle: mediaData.title?.english ?? "",
                                nativeTitle: mediaData.title?.native ?? "",
                                coverImageURL: mediaData.coverImage?.large ?? "",
                                characters: mediaData.characters?.edges?.compactMap { edge in
                                    AnimeCharacter(
                                        name: edge?.node?.name?.first ?? edge?.node?.name?.native ?? "Unknown",
                                        imageURL: edge?.node?.image?.large ?? ""
                                    )
                                } ?? []
                            )
                        }
                    }

                case .failure(let error):
                    print("Error: \(error)")
            }
        }
    }
}

struct AnimeMedia: Identifiable {
    var id: UUID
    var englishTitle: String
    var nativeTitle: String
    var coverImageURL: String
    var characters: [AnimeCharacter]
}

struct AnimeCharacter: Identifiable {
    var id = UUID()
    var name: String
    var imageURL: String
}
