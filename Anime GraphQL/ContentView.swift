//
//  ContentView.swift
//  Anime GraphQL
//
//  Created by Alex Ryan on 9/12/24.
//

import SwiftUI
import Apollo
import AniListAPIForTesting

struct ContentView: View {
    @State var mediaList: [(native: String?, english: String?, imageUrl: String?)] = []
    @StateObject var vm = AnimeViewModel()
    let sortOptions: [MediaSort] = [.trendingDesc, .popularityDesc, .episodesDesc]

    var body: some View {
        Picker("Sort By", selection: $vm.mediaSort) {
            ForEach(sortOptions, id: \.self) { sortOption in
                Text("\(sortOption)")
                    .tag(sortOption)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()

        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(vm.animeList) { anime in
                    VStack(alignment: .center, spacing: 10) {
                        Text(anime.englishTitle)
                            .font(.title)
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.6)
                            .frame(width: 230)


                        AsyncImage(url: URL(string: anime.coverImageURL)) { image in
                            image
                                .resizable()
                                .frame(width: 259, height: 371)
                        } placeholder: {
                            ProgressView()
                        }
                    }

                    Text("Main Characters")
                        .font(.headline)

                    HStack(alignment: .center, spacing: 15) {
                        ForEach(anime.characters) { character in
                            VStack(alignment: .center, spacing: 0) {
                                Text(character.name)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.center)
                                    .font(.subheadline)
                                    .minimumScaleFactor(0.7)
                                    .frame(width: 60)

                                AsyncImage(url: URL(string: character.imageURL)) { heroImage in
                                    heroImage
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 120)
                                        .clipShape(Circle())

                                } placeholder: {
                                    ProgressView()
                                }
                            }
                        }
                    }
                    Spacer(minLength: 20)
                }
            }
        }
        .onAppear {
            vm.fetchAnime()
        }
    }
}

struct RectanglePlaceholderView: View {
    var width: CGFloat
    var height: CGFloat
    var color: Color = .gray

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: width, height: height)
            .overlay(
                Text("No Image")
                    .foregroundColor(.white)
                    .font(.caption)
            )
    }
}

#Preview {
    ContentView()
}
