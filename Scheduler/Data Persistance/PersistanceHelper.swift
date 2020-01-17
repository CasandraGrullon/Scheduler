//
//  PersistanceHelper.swift
//  Scheduler
//
//  Created by casandra grullon on 1/17/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

enum DataPersistanceError: Error {
    case savingError(Error)
}

class PersistanceHelper {
    // CRUD :: Create | Read | Update | Delete
    
    private static var events = [Event]()
    
    private static let filename = "schedules.plist"
    
    // Create :: save item to documents directory
    // Throwing function ==> throws an error we grab in catch block
    static func save(event: Event) throws {
        //1. get URL path to the file event that the Event will be saved to
        let url = FileManager.pathToDocumentsDirectory(with: "\(filename)")
        
        //2. append new event to the events array
        events.append(event)
        
        //3. events array will be the object being converted into Data -- we will use the Data object and write / save it to the documents directory
        do {
            let data = try PropertyListEncoder().encode(events)
            // .atomic ==> write all at once
            try data.write(to: url, options: .atomic)
        } catch {
            throw DataPersistanceError.savingError(error)
        }
    }
    
    // Read :: load/retrieve items from documents directory
    
    // Update ::
    
    // Delete :: remove items from documents directory
}
