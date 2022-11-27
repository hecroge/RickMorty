//
//  CharacterListViewModel+Test.swift
//  RickMortyAppTests
//
//  Created by Héctor Rogel on 27/11/22.
//

import Foundation
@testable import RickMortyApp

extension CharacterListItemViewModel {
    static func main() -> CharacterListItemViewModel {
        CharacterListItemViewModel(name: CharacterTestData.mainName,
                                   status: CharacterTestData.mainStatus,
                                   species: CharacterTestData.mainSpecies,
                                   gender: CharacterTestData.mainGender,
                                   origin: CharacterTestData.mainOrigin,
                                   location: CharacterTestData.mainLocation)
    }
}
