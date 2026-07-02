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
        //case global = "Global"
        case pokeList = "PokeList"
    }
    
    static func getFrom(key: String, in table: RefTable) -> String {
        return String(NSLocalizedString(key, tableName: table.rawValue, comment: ""))
    }
    
    static func format(text: String, with key: String, in table: RefTable) -> String {
        let format: String = getFrom(key: key, in: table)
        return String(format: format, text)
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
    
}
