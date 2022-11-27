//
//  CharacterDetailConnector.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 26/11/22.
//

import Foundation
import UIKit

class CharacterDetailConnector {
    // MARK: - Properties
    private let item: CharacterListItemViewModel

    // MARK: - Init
    init(item: CharacterListItemViewModel) {
        self.item = item
    }

    func assembleModule() -> UIViewController {
        CharacterDetailViewController(item: item)
    }
}
