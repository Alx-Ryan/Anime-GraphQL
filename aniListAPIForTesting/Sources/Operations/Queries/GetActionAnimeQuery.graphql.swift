// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetActionAnimeQuery: GraphQLQuery {
  public static let operationName: String = "GetActionAnime"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetActionAnime($page: Int, $perPage: Int, $sort: [MediaSort]) { Page(page: $page, perPage: $perPage) { __typename media(genre: "Action", format: TV, sort: $sort) { __typename title { __typename native romaji english } coverImage { __typename large } characters(role: MAIN, perPage: 3) { __typename edges { __typename node { __typename image { __typename large } name { __typename first native } } role } } } } }"#
    ))

  public var page: GraphQLNullable<Int>
  public var perPage: GraphQLNullable<Int>
  public var sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>

  public init(
    page: GraphQLNullable<Int>,
    perPage: GraphQLNullable<Int>,
    sort: GraphQLNullable<[GraphQLEnum<MediaSort>?]>
  ) {
    self.page = page
    self.perPage = perPage
    self.sort = sort
  }

  public var __variables: Variables? { [
    "page": page,
    "perPage": perPage,
    "sort": sort
  ] }

  public struct Data: AniListAPIForTesting.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AniListAPIForTesting.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("Page", Page?.self, arguments: [
        "page": .variable("page"),
        "perPage": .variable("perPage")
      ]),
    ] }

    public var page: Page? { __data["Page"] }

    /// Page
    ///
    /// Parent Type: `Page`
    public struct Page: AniListAPIForTesting.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AniListAPIForTesting.Objects.Page }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("media", [Medium?]?.self, arguments: [
          "genre": "Action",
          "format": "TV",
          "sort": .variable("sort")
        ]),
      ] }

      public var media: [Medium?]? { __data["media"] }

      /// Page.Medium
      ///
      /// Parent Type: `Media`
      public struct Medium: AniListAPIForTesting.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AniListAPIForTesting.Objects.Media }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("title", Title?.self),
          .field("coverImage", CoverImage?.self),
          .field("characters", Characters?.self, arguments: [
            "role": "MAIN",
            "perPage": 3
          ]),
        ] }

        /// The official titles of the media in various languages
        public var title: Title? { __data["title"] }
        /// The cover images of the media
        public var coverImage: CoverImage? { __data["coverImage"] }
        /// The characters in the media
        public var characters: Characters? { __data["characters"] }

        /// Page.Medium.Title
        ///
        /// Parent Type: `MediaTitle`
        public struct Title: AniListAPIForTesting.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPIForTesting.Objects.MediaTitle }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("native", String?.self),
            .field("romaji", String?.self),
            .field("english", String?.self),
          ] }

          /// Official title in it's native language
          public var native: String? { __data["native"] }
          /// The romanization of the native language title
          public var romaji: String? { __data["romaji"] }
          /// The official english title
          public var english: String? { __data["english"] }
        }

        /// Page.Medium.CoverImage
        ///
        /// Parent Type: `MediaCoverImage`
        public struct CoverImage: AniListAPIForTesting.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPIForTesting.Objects.MediaCoverImage }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("large", String?.self),
          ] }

          /// The cover image url of the media at a large size
          public var large: String? { __data["large"] }
        }

        /// Page.Medium.Characters
        ///
        /// Parent Type: `CharacterConnection`
        public struct Characters: AniListAPIForTesting.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AniListAPIForTesting.Objects.CharacterConnection }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("edges", [Edge?]?.self),
          ] }

          public var edges: [Edge?]? { __data["edges"] }

          /// Page.Medium.Characters.Edge
          ///
          /// Parent Type: `CharacterEdge`
          public struct Edge: AniListAPIForTesting.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { AniListAPIForTesting.Objects.CharacterEdge }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("node", Node?.self),
              .field("role", GraphQLEnum<AniListAPIForTesting.CharacterRole>?.self),
            ] }

            public var node: Node? { __data["node"] }
            /// The characters role in the media
            public var role: GraphQLEnum<AniListAPIForTesting.CharacterRole>? { __data["role"] }

            /// Page.Medium.Characters.Edge.Node
            ///
            /// Parent Type: `Character`
            public struct Node: AniListAPIForTesting.SelectionSet {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public static var __parentType: any ApolloAPI.ParentType { AniListAPIForTesting.Objects.Character }
              public static var __selections: [ApolloAPI.Selection] { [
                .field("__typename", String.self),
                .field("image", Image?.self),
                .field("name", Name?.self),
              ] }

              /// Character images
              public var image: Image? { __data["image"] }
              /// The names of the character
              public var name: Name? { __data["name"] }

              /// Page.Medium.Characters.Edge.Node.Image
              ///
              /// Parent Type: `CharacterImage`
              public struct Image: AniListAPIForTesting.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { AniListAPIForTesting.Objects.CharacterImage }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("large", String?.self),
                ] }

                /// The character's image of media at its largest size
                public var large: String? { __data["large"] }
              }

              /// Page.Medium.Characters.Edge.Node.Name
              ///
              /// Parent Type: `CharacterName`
              public struct Name: AniListAPIForTesting.SelectionSet {
                public let __data: DataDict
                public init(_dataDict: DataDict) { __data = _dataDict }

                public static var __parentType: any ApolloAPI.ParentType { AniListAPIForTesting.Objects.CharacterName }
                public static var __selections: [ApolloAPI.Selection] { [
                  .field("__typename", String.self),
                  .field("first", String?.self),
                  .field("native", String?.self),
                ] }

                /// The character's given name
                public var first: String? { __data["first"] }
                /// The character's full name in their native language
                public var native: String? { __data["native"] }
              }
            }
          }
        }
      }
    }
  }
}
