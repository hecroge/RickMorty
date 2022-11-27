//
//  CharactersResponse.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 25/11/22.
//

import Foundation

struct CharactersResponse: Decodable {
    let info: CharactersInfo
    let results: [Character]
}

struct CharactersInfo: Decodable {
    let pages: Int
}
