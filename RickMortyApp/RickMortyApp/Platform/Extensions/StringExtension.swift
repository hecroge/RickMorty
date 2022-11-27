//
//  StringExtension.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 25/11/22.
//

import Foundation

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
