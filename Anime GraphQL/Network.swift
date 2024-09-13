//
//  Network.swift
//  Anime GraphQL
//
//  Created by Alex Ryan on 9/12/24.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()

    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
}
