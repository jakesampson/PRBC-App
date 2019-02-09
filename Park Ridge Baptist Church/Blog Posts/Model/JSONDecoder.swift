//
//  JSONDecoder-Remote.swift
//  Park Ridge Baptist Church
//
//  Created by Jake Sampson on 5/2/19.
//  Copyright © 2019 Jake Sampson. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode <T: Decodable>(_ type: T.Type, fromURL url: String, completion: @escaping(T) -> Void) {
        guard let url = URL(string: url) else {
            fatalError("Invallid URL Passed.")
        }

        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)

                let decoder = JSONDecoder()

                let downloadedData = try decoder.decode(type, from: data)

                DispatchQueue.main.async {
                    completion(downloadedData)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
}
}




