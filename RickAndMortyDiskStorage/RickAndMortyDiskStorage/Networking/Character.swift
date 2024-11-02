//
//  Character.swift
//  RickAndMortyDiskStorage
//
//  Created by Ибрагим Габибли on 02.11.2024.
//

import Foundation

struct PostCharacters: Codable {
    let results: [Character]
}

struct Character: Codable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let location: Location
    let image: String
}

struct Location: Codable {
    let name: String
}