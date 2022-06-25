//
//  DataBase.swift
//  SportsApp
//
//  Created by Mahmoud Saad on 24/06/2022.
//

import Foundation
import CoreData

protocol DeletionDelegate{
    func deleteMovieAtIndexPath(indexPath: IndexPath)
}

class DBManager{
    static let sharedInstance = DBManager()
    private init(){
        print("Data Base")
    }
}
extension DBManager{
    func addLeague(leagueTitle : String , leagueImage : String ,leagueYoutube:String,   appDelegate: AppDelegate){
        let managedContext = appDelegate.persistentContainer.viewContext
        if let entity = NSEntityDescription.entity(forEntityName: "Leaguess", in: managedContext){
            let League = NSManagedObject(entity: entity, insertInto: managedContext)
            League.setValue(leagueTitle, forKey: "strLeague")
            League.setValue(leagueImage, forKey: "strBadge")
            League.setValue(leagueYoutube, forKey: "strYoutube")
            do {
                try managedContext.save()
                print("Save Data Base")
            }catch let error as NSError {
                print("Error in saving")
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchData(appDelegate: AppDelegate) -> [Leaguess]{
 
        var fetchedList : [Leaguess] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Leaguess")
 
        do{
            fetchedList = try managedContext.fetch(fetchRequest) as! [Leaguess]
            print("================================================")
            print("Fetch")
        }catch let error as NSError {
            print("Error in saving")
            print(error.localizedDescription)
        }
        return fetchedList
    }
    func delete(league:Leaguess, indexPath: IndexPath, appDelegate: AppDelegate, delegate: DeletionDelegate){

        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(league)
        do{
            try managedContext.save()
            delegate.deleteMovieAtIndexPath(indexPath: indexPath)
            print("Cell Is Deleted")
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
}
