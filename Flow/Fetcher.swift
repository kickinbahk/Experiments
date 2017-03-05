//
//  Fetcher.swift
//  Flow
//
//  Created by Garric Nahapetian on 10/20/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import Foundation

final class Fetcher {
    private var completion: (([String: Any]) -> Void)?
    
    func fetch(with request: URLRequest, completion: @escaping ([String: Any]) -> Void) {
        self.completion = completion
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
    }
    
    private func completionHandler(data: Data?, response: URLResponse?, error: Error?) {
        guard let data = data else { return }
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
        let json = jsonObject as? [String: Any] ?? [:]
        completion?(json)
    }
}
