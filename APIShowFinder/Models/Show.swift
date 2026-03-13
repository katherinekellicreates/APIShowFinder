//
//  Show.swift
//  APIShowFinder
//
//  Created by Katherine Pizzirusso on 3/13/26.
//

import Foundation

struct Show: Codable, Identifiable {
    let id: Int
    let name: String
    let summary: String?
    let image: ImageLinks?
    let network: Network?
    let webChannel: Network?
}

struct ImageLinks: Codable {
    let medium: String?
}

struct Network: Codable {
    let name: String
}

