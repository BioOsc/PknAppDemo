//
//  MemoryManager.swift
//  PkmAppDemo
//
//  Created by BioOsc on 02/07/26.
//

import Foundation
import CoreData

final class MemoryKey {
    
    private init() {}
    
    static let favoriteCharacters = "PKM_Mem_favorite"
    
}
//MARK: Singleton module
class MemoryManager {
    //MARK: Core Data Config
    let persistentContainer: NSPersistentContainer
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "FavPokemon")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    //MARK: User Defaults
    func setFavorite(ref: Int) -> Bool {
        var storage: [Int] = (UserDefaults.standard.array(forKey: MemoryKey.favoriteCharacters) ?? []) as! [Int]
        let duplicate: Int? = storage.first(where: { elm in
            return elm == ref
        })
        
        if (duplicate == nil) {
            storage.append(ref)
            UserDefaults.standard.setValue(storage.sorted(), forKey: MemoryKey.favoriteCharacters)
            return true
        } else { return false }
    }
    
    func characterIsFavorite(ref: Int) -> Bool {
        var storage: [Int] = (UserDefaults.standard.array(forKey: MemoryKey.favoriteCharacters) ?? []) as! [Int]
        let item: Int? = storage.first(where: { elm in
            return elm == ref
        })
        
        return item != nil
    }
    
    func removeFavorite(ref: Int) {
        var storage: [Int] = (UserDefaults.standard.array(forKey: MemoryKey.favoriteCharacters) ?? []) as! [Int]
        storage.removeAll(where: { elm in
            elm == ref
        })
        
        UserDefaults.standard.setValue(storage.sorted(), forKey: MemoryKey.favoriteCharacters)
    }
    //MARK: Core Data - Incomplete implementation | Actual function did not need this, but may be informative for review
    /*func saveFavCharacter(char: <CustomObject>) {
        let context = MemoryManager.shared.context
        
        let newElement = <CustomObject>(context: context)
        //Props
        newElement.id = Int32(char.id)
        newElement.name = char.name
        newElement.species = char.species
        newElement.status = char.status
        newElement.image = char.image
        
        do {
            try context.save()
            print("LOG: Data saved!")
        } catch {
            print("LOG: Failed to save data: \(error.localizedDescription)")
        }
    }
    
    func deleteFavCharacter(char: Int) {
        let context = MemoryManager.shared.context
        
        var stored: [<CustomObject>] = fetchFavCharacters()
        let element: <CustomObject>? = stored.first(where: { item in
            item.id == Int32(char)
        })
        
        if (element != nil) {
            context.delete(element!)
            do {
                try context.save()
                print("LOG: Data deleted!")
            } catch {
                print("LOG: Failed to save data: \(error.localizedDescription)")
            }
        }
        
    }
    
    func fetchFavCharacters() -> [<CustomObject>] {
        let context = MemoryManager.shared.context
        
        let fetchRequest: NSFetchRequest<<CustomObject>> = <CustomObject>.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch {
            print("LOG: Failed to fetch Core Data: \(error.localizedDescription)")
            return []
        }
    }*///MARK: May be practical use a generic type for memory entries.
    //MARK: Singleton entity
    static var shared: MemoryManager = {
        return MemoryManager()
    }()
    
}
