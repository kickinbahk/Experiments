//
//  Fetcher.swift
//  Flow
//
//  Created by Garric Nahapetian on 10/20/16.
//  Copyright © 2016 Garric Nahapetian. All rights reserved.
//

import GGNObservable

final class Fetcher {
    let output = Observable<[String: Any]>()

    func fetch(with request: URLRequest) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                guard let json = try JSONSerialization.jsonObject(
                    with: data!,
                    options: .allowFragments) as? [String: Any] else {
                    return
                }
                self.output.emit(json)
            } catch {
                // handle errors
            }
        }.resume()
    }
}
