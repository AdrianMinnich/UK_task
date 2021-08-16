//
//  NetworkingManager.swift
//  UKiOSTest
//
//  Created by Paweł Sporysz on 15.09.2016.
//  Copyright © 2016 Paweł Sporysz. All rights reserved.
//

import UIKit

class NetworkingManager: NSObject {

    static var sharedManager = NetworkingManager()
    
    public func downloadItems(completion: @escaping (Result<[ItemGeneralModel], Error>) -> Void) {
        request(filename: "Items.json") { dictionary in
            let data = dictionary["data"]
            let array = data as! Array<Dictionary<String, AnyObject>>
            var result:[ItemGeneralModel] = []
            for item in array {
                guard let name = item["attributes"]?["name"] as? String,
                      let preview = item["attributes"]?["preview"] as? String,
                      let id = item["id"] as? String,
                      let colorString = item["attributes"]?["color"] as? String else {
                    completion(.failure(NetworkingManagerError.failedToFetchItems))
                    return
                }
                var color = UIColor()
                switch colorString {
                case "Red": color = UIColor.red
                case "Green": color = UIColor.green
                case "Blue": color = UIColor.blue
                case "Yellow": color = UIColor.yellow
                case "Purple": color = UIColor.purple
                default: color = UIColor.black
                }
                
                let itemModel = ItemGeneralModel(id: id, name: name, color: color, preview: preview)
                result.append(itemModel)
            }
            completion(.success(result))
        }
    }
    
    public func downloadItemWithID(_ id: String, completion: @escaping (Result<ItemDetailsModel, Error>) -> Void) {
        let filename = "Item\(id).json"
        request(filename: filename) { dictionary in
            guard let data = dictionary["data"],
                  let attributes = data["attributes"]! as? Dictionary<String, AnyObject>,
                  let name = attributes["name"] as? String,
                  let id = data["id"] as? String,
                  let desc = attributes["desc"] as? String,
                  let colorString = attributes["color"] as? String else {
                completion(.failure(NetworkingManagerError.failedToFetchItemWithID))
                return
            }
            var color = UIColor()
            switch colorString {
            case "Red": color = UIColor.red
            case "Green": color = UIColor.green
            case "Blue": color = UIColor.blue
            case "Yellow": color = UIColor.yellow
            case "Purple": color = UIColor.purple
            default: color = UIColor.black
            }
            
            let itemModelDetails = ItemDetailsModel(id: id, name: name, color: color, desc: desc)
            completion(.success(itemModelDetails))
        }
    }
    
    private func request(filename:String, completionBlock:@escaping (Dictionary<String, AnyObject>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if let dictionary = JSONParser.jsonFromFilename(filename) {
                completionBlock(dictionary)
            } else {
                completionBlock([:])
            }
        }
    }
}

public enum NetworkingManagerError: Error {
    case failedToFetchItems
    case failedToFetchItemWithID
}
