# AnimeList App

This is a simple SwiftUI project that uses GraphQL and Apollo to fetch anime data from [AniList's GraphQL API](https://graphql.anilist.co). The app allows users to view anime sorted by different criteria and displays the top 3 main characters for each anime along with their images.

## Features

- **Data Source**: Fetches anime data from the AniList GraphQL API using Apollo.
- **Sorting Options**: Allows users to sort anime by:
  - Trending
  - Popularity
  - Number of Episodes
- **Anime Details**: Displays each anime's:
  - Cover image
  - Title (in English or native language)
  - Top 3 main characters, including their names and images

## Screenshots

<img src="https://github.com/user-attachments/assets/d123e6cc-5bff-4c0c-95e7-79c0c0a2b815" width="300"/>

## Technologies Used

- **SwiftUI**: For the user interface.
- **Apollo**: For making GraphQL queries.
- **AniList GraphQL API**: The source of the anime data.

## GraphQL Query

The app fetches anime data with the following GraphQL query:

```graphql
query GetActionAnime($page: Int, $perPage: Int, $sort: [MediaSort]) {
  Page(page: $page, perPage: $perPage) {
    media(genre: "Action", format: TV, sort: $sort) {
      title {
        native
        romaji
        english
      }
      coverImage {
        large
      }
      characters(role: MAIN, perPage: 3) {
        edges {
          node {
            image {
              large
            }
            name {
              first
              native
            }
          }
        }
      }
    }
  }
}


