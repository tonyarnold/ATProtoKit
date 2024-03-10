//
//  BskyGraphGetLists.swift
//
//
//  Created by Christopher Jr Riley on 2024-03-10.
//

import Foundation

/// The main data model definition for the output of retrieving the lists created by the user account.
///
/// - Note: According to the AT Protocol specifications: "Enumerates the lists created by a specified account (actor)."
///
/// - SeeAlso: This is based on the [`app.bsky.graph.getLists`][github] lexicon.
///
/// [github]: https://github.com/bluesky-social/atproto/blob/main/lexicons/app/bsky/graph/getLists.json
public struct GraphGetListsOutput: Codable {
    /// The mark used to indicate the starting point for the next set of results. Optional.
    public let cursor: String?
    /// An array of lists created by the user account.
    public let lists: [GraphListView]
}
