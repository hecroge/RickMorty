//
//  Character+Test.swift
//  RickMortyAppTests
//
//  Created by Héctor Rogel on 27/11/22.
//

import Foundation
@testable import RickMortyApp

extension Character {
    static func main() -> Character {
        Character(id: CharacterTestData.mainId,
                  name: CharacterTestData.mainName,
                  status: CharacterTestData.mainStatus,
                  species: CharacterTestData.mainSpecies,
                  image: CharacterTestData.mainImage,
                  gender: CharacterTestData.mainGender,
                  origin: CharacterOrigin(name: CharacterTestData.mainOrigin),
                  location: CharacterLocation(name: CharacterTestData.mainLocation))
    }
}
