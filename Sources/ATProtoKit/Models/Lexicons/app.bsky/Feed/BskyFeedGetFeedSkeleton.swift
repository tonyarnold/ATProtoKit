//
//  BskyFeedGetFeedSkeleton.swift
//
//
//  Created by Christopher Jr Riley on 2024-03-04.
//

import Foundation

/// The main data model definition for the output of getting a skeleton for a feed generator.
///
/// - Note: According to the AT Protocol specifications: "Get a skeleton of a feed provided by a
/// feed generator. Auth is optional, depending on provider requirements, and provides the DID of
/// the requester. Implemented by Feed Generator Service."
///
/// - SeeAlso: This is based on the [`app.bsky.feed.getFeedSkeleton`][github] lexicon.
///
/// [github]: https://github.com/bluesky-social/atproto/blob/main/lexicons/app/bsky/feed/getFeedSkeleton.json
public struct FeedGetFeedSkeletonOutput: Codable {
    /// The mark used to indicate the starting point for the next set of result. Optional.
    public let cursor: String?
    /// An array of skeleton feeds.
    public let feed: [FeedSkeletonFeedPost]
}
