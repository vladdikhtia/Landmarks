//
//  ModelData.swift
//  Landmarks
//
//  Created by Vladyslav Dikhtiaruk on 20/02/2024.
//

import Foundation



// Create an array of landmarks that you initialize from landmarkData.json.

//Create a load(_:) method that fetches JSON data with a given name from the app’s main bundle.
//The load method relies on the return type’s conformance to the Decodable protocol, which is one component of the Codable protocol.

//With Observation, a view in SwiftUI can support data changes without using property wrappers or bindings. SwiftUI watches for any observable property changes that could affect a view, and displays the correct version of the view after a change.

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

