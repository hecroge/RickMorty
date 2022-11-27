//
//  CharacterCell.swift
//  RickMortyApp
//
//  Created by Héctor Rogel on 25/11/22.
//

import Foundation
import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterImage: UIImageView!

    func configureCell(for item: CharacterListItemViewModel) {
        characterName.text = item.name
        guard let imageData = item.image else {
            self.characterImage.image = UIImage(named: "emptyImage")
            return
        }
        characterImage.image = UIImage(data: imageData)
    }
}
