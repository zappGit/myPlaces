//
//  PlaceModel.swift
//  myPlaces
//
//  Created by Артем Хребтов on 20.05.2021.
//

import RealmSwift
import UIKit

class Coctail: Object {
    @objc dynamic var name = ""
    @objc dynamic var type: String?
    @objc dynamic var ingridients: String?
    @objc dynamic var imageData: Data?
    
    convenience init (name: String,
                      type: String?,
                      ingridients: String?,
                      imageData: Data?) {
        self.init()
        self.name = name
        self.type = type
        self.ingridients = ingridients
        self.imageData = imageData
    }
}
