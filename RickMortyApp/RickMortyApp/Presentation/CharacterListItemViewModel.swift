//
//  CharacterListItemViewModel.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 25/11/22.
//

import Foundation

struct CharacterListItemViewModel: Equatable {
    var name: String
    var image: Data?
    var status: String
    var species: String
    var gender: String
    var origin: String
    var location: String
}

extension CharacterListItemViewModel {
    init(character: Character) {
        name = character.name
        status = character.status
        species = character.species
        gender = character.gender
        origin = character.origin.name
        location = character.location.name
        image = getThumbnailData(file: character.image)
    }

    private func getThumbnailData(file: String) -> Data? {
        guard let url = URL(string: file) else {
            return nil
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            return nil
        }
    }
}
