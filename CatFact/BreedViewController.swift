//
//  BreedViewController.swift
//  CatFact
//
//  Created by TribalScale on 2023-05-25.
//

import Foundation
import UIKit

struct CatBreed: Codable {
    let description: String
    let name: String
    let countryCode: String
}

//struct Statement: Codable {
//   let name: String
//}

class BreedViewController : UIViewController{
//    NSURL *URL = [NSURL URLWithString:@"https://api.thecatapi.com/v1/breeds"];
    let url = URL(string: "https://api.thecatapi.com/v1/breeds")!
    let catBreeds = [String]()
    let responseArray = [String]()
    let error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "message"])

    
    override func viewDidLoad() {
        NetworkManager.performGETRequestArray(url) { responseArray, error in
//            responseArray?[0]
            
            guard error != nil else {
                print(error!)
                
                // Error state
                return
            }
            
            guard let responseArray else {
                // Empty state
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                // TODO: [Any] to Data type.
                let catBreeds = try decoder.decode([CatBreed].self, from: Data())
                print(catBreeds[0].name)
            } catch {
                // Error state
                // maybe a retry
                print(error)
            }
            
            
//                print("Array: ", responseArray ?? [])
//                for cat in responseArray ?? [] {
//                    print(cat.name)
//                }

            
        }
    }
    
}
