//
//  FileManger+Extensions.swift
//  Scheduler
//
//  Created by casandra grullon on 1/17/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

extension FileManager {
    // In this function : getting a URL path to a user's documents directory
    
    // documents/
    static func getDocumentsDirectory() -> URL {
        // documentDirectory ==> user's documents file on computer/phone.
        // userDomainMask ==> assigns a path to the user
        // index 0 because we only need 1 url
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    // documents/schedules.plist || filename: "schedules.plist"
    // this function will create a path to this file
    static func pathToDocumentsDirectory(with filename: String) -> URL {
        return getDocumentsDirectory().appendingPathComponent(filename)
    }
    
    
    
}
