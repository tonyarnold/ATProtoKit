//
//  ToolsOzoneSetDefs.swift
//
//  Created by Christopher Jr Riley on 2024-10-19.
//

import Foundation

extension ToolsOzoneLexicon.Set {

    /// A definition model for a set.
    ///
    /// - SeeAlso: This is based on the [`tools.ozone.set.defs`][github] lexicon.
    ///
    /// [github]: https://github.com/bluesky-social/atproto/blob/main/lexicons/tools/ozone/set/defs.json
    public struct SetDefinition: Sendable, Codable {

        /// The name of the set.
        ///
        /// A minimum of 3 characters and maximum of 128 characters is required.
        public let name: String

        /// The description of the set.
        ///
        /// A maximum of 1,024 characters can be made.
        public let description: String?

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)

            try truncatedEncode(self.name, withContainer: &container, forKey: .name, upToCharacterLength: 128)
            try truncatedEncodeIfPresent(self.description, withContainer: &container, forKey: .description,upToCharacterLength: 1_024)
        }

        enum CodingKeys: CodingKey {
            case name
            case description
        }
    }

    /// A definition model for a set view.
    ///
    /// - SeeAlso: This is based on the [`tools.ozone.set.defs`][github] lexicon.
    ///
    /// [github]: https://github.com/bluesky-social/atproto/blob/main/lexicons/tools/ozone/set/defs.json
    public struct SetViewDefinition: Sendable, Codable {

        /// The name of the set.
        ///
        /// A minimum of 3 characters and maximum of 128 characters is required.
        public let name: String

        /// The description of the set.
        ///
        /// A maximum of 1,024 characters can be made.
        public let description: String?

        /// The size of the set.
        public let setSize: Int

        /// The date and time the set was created.
        public let createdAt: Date

        /// The date and time the set was updated.
        public let updatedAt: Date

        public init(name: String, description: String?, setSize: Int, createdAt: Date, updatedAt: Date) {
            self.name = name
            self.description = description
            self.setSize = setSize
            self.createdAt = createdAt
            self.updatedAt = updatedAt
        }

        public init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: ToolsOzoneLexicon.Set.SetViewDefinition.CodingKeys.self)

            self.name = try container.decode(String.self, forKey: .name)
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            self.setSize = try container.decode(Int.self, forKey: .setSize)
            self.createdAt = try decodeDate(from: container, forKey: .createdAt)
            self.updatedAt = try decodeDate(from: container, forKey: .updatedAt)
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)

            try truncatedEncode(self.name, withContainer: &container, forKey: .name, upToCharacterLength: 128)
            try truncatedEncodeIfPresent(self.description, withContainer: &container, forKey: .description,upToCharacterLength: 1_024)
            try container.encode(self.setSize, forKey: .setSize)
            try encodeDate(self.createdAt, with: &container, forKey: .createdAt)
            try encodeDate(self.updatedAt, with: &container, forKey: .updatedAt)
        }

        enum CodingKeys: CodingKey {
            case name
            case description
            case setSize
            case createdAt
            case updatedAt
        }
    }
}
