//
//  ItemManager.swift
//  TestApp
//
//  Created by Gennadiy Mishin on 01/12/2018.
//  Copyright © 2018 Gennadiy Mishin. All rights reserved.
//

import UIKit

class ItemManager: NSObject {
    static var shared = ItemManager()
    
    var items = [Item]()
    var error: Error?
    
    private lazy var urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    private let itemsURL = URL(string: "https://gist.githubusercontent.com/gonchs/b657e6043e17482cae77a633d78f8e83/raw/7654c0db94a3f430888fac0caac675c7e811030a/test_data.json")
    
    func loadItems(completion: @escaping (_ items: [Item]?, _ error: Error?) -> Void) {
        guard let url = itemsURL else { return }
        
        let request = URLRequest(url: url)
        let task = urlSession.dataTask(with: request) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                guard let self = self else { return }
                guard error == nil else {
                    self.error = error
                    completion(nil, error)
                    return
                }
                
                var items = [Item]()
                if let jsonData = data {
                    if let objects = try? JSONDecoder().decode([Item].self, from: jsonData) {
                        items = objects
                    }
                }
                
                self.items = items
                completion(items, nil)
            }
        }
        task.resume()
    }
}
