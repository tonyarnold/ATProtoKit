//
//  BskyUnspeccedGetPopularFeedGenerators.swift
//
//
//  Created by Christopher Jr Riley on 2024-03-17.
//

import Foundation

/// The main data model definition for the output of globally popular feed generators.
///
/// - Note: According to the AT Protocol specifications: "An unspecced view of globally
/// popular feed generators."
///
/// - Important: This is an unspecced model, and as such, this is highly volatile and may change
/// or be removed at any time. Use at your own risk.
///
/// - SeeAlso: This is based on the [`app.bsky.unspecced.getPopularFeedGenerators`][github] lexicon.
///
/// [github]: https://github.com/bluesky-social/atproto/blob/main/lexicons/app/bsky/unspecced/getPopularFeedGenerators.json
public struct UnspeccedGetPopularFeedGeneratorsOutput: Codable {
    /// The mark used to indicate the starting point for the next set of result. Optional.
    public let cursor: String?
    /// An array of feed generators.
    public let feeds: [FeedGeneratorView]
}
