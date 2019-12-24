//
//  Connection.swift
//  HTMessaging
//
//  Created by Hector Jose Alvarado Chapa on 22/12/19.
//  Copyright © 2019 Hector Jose Alvarado Chapa. All rights reserved.
//

import Foundation
import Firebase

// MARK: Initialization

public final class Connection {
    
    /**
    Performs a connection to Firebase with the File's name and file type.
    @param fileName The filename of te Google-services.
    @param ofType The type of the Google-services file.
    @param completion The handler block to execute. status is the value of the response(Ex. Successful) .
    */
    static func withFirebaseFile(with fileName: String, ofType type: Filetype, completion: @escaping(_ status: FIRResponse?) -> Void) {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: type.rawValue) else {
            print("Couldn't load the file. Check the name and extension.")
            completion(.error)
            return
        }
        guard let options = FirebaseOptions(contentsOfFile: filePath) else {
            print("Firebase configuration file are not correct. Check your property list.")
            completion(.error)
            return
        }
        FirebaseApp.configure(options: options)
        print("Firebase connection success!")
        completion(.successful)
    }
    
    /**
    Performs a connection to Firebase with customs options.
    @param googleAppID The google APP ID.
    @param gcmSenderID The gcm Sender ID.
    @param apiKey The api Key of the firebase service.
    @param clientID The ID of the client.
    @param databaseURL The URL of de firebase database.
    @param completion The handler block to execute. status is the value of the response(Ex. Successful) .
    */
    static func withFirebaseOptions(with googleAppID: String,
                             gcmSenderID: String,
                             apiKey: String,
                             clientID: String,
                             databaseURL: String,
                             completion: @escaping(_ status: FIRResponse?) -> Void) {
        
        let options = FirebaseOptions(googleAppID: googleAppID, gcmSenderID: gcmSenderID)
        guard let bundleID = Bundle.main.bundleIdentifier else {
            print("No bundle identifier found.")
            completion(.error)
            return
        }
        options.bundleID = bundleID
        options.apiKey = apiKey
        options.clientID = clientID
        options.databaseURL = databaseURL
        FirebaseApp.configure(options: options)
        completion(.successful)
    }
}
