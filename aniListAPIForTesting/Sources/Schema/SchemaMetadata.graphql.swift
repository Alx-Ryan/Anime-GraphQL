// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AniListAPIForTesting.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AniListAPIForTesting.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AniListAPIForTesting.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AniListAPIForTesting.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return AniListAPIForTesting.Objects.Query
    case "Page": return AniListAPIForTesting.Objects.Page
    case "Media": return AniListAPIForTesting.Objects.Media
    case "MediaTitle": return AniListAPIForTesting.Objects.MediaTitle
    case "MediaCoverImage": return AniListAPIForTesting.Objects.MediaCoverImage
    case "CharacterConnection": return AniListAPIForTesting.Objects.CharacterConnection
    case "CharacterEdge": return AniListAPIForTesting.Objects.CharacterEdge
    case "Character": return AniListAPIForTesting.Objects.Character
    case "CharacterImage": return AniListAPIForTesting.Objects.CharacterImage
    case "CharacterName": return AniListAPIForTesting.Objects.CharacterName
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
