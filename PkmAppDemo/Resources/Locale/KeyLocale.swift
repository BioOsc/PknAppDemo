//
//  KeyLocale.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import Foundation

class LocalString {
    
    private init () {}
    
    enum RefTable: String {
        //Enter different table files references to use same keys if need it
        case pokeList = "PokeList"
        case pokeDetail = "PokeDetail"
    }
    
    static func getFrom(key: String, in table: RefTable) -> String {
        return String(NSLocalizedString(key, tableName: table.rawValue, comment: ""))
    }
    
    static func format(text: String, with key: String, in table: RefTable) -> String {
        let format: String = getFrom(key: key, in: table)
        return String(format: format, text)
    }
    
    static func format(value: Double, with key: String, in table: RefTable) -> String {
        let format: String = getFrom(key: key, in: table)
        return String(format: format, value)
    }
    
    static func format(value: Int, with key: String, in table: RefTable) -> String {
        let format: String = getFrom(key: key, in: table)
        return String(format: format, value)
    }
    
}
//MARK: Key
struct KeyLocal {
    
    struct Global {
        //
    }
    
    //MARK: Character
    struct PokeList {
        static let btnPrev = "button_PrevPage"
        static let btnNext = "button_NextPage"
    }
    //MARK: Detail
    struct PokeDetail {
        static let txtWeight = "text_Weight"
        static let txtHeight = "text_Height"
        static let txtExpBase = "text_ExpBase"
        static let txtAbilities = "text_Abilities"
        static let btnAddFav = "button_AddFavorite"
        static let btnRmvFav = "button_RemoveFavorite"
    }
    
}
