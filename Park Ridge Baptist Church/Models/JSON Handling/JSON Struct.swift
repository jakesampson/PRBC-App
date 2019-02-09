//
//  Post.swift
//  Park Ridge Baptist Church
//
//  Created by Jake Sampson on 4/2/19.
//  Copyright © 2019 Jake Sampson. All rights reserved.
//

import Foundation

struct Post: Codable {
    let id: Int
    let title: Title
        struct Title: Codable {
        let rendered: String
        }
    
    let content, excerpt: Content
        struct Content: Codable {
        let rendered: String
        let protected: Bool
        }
}

extension Array where Element == Post {
    func matching (_ text: String?) -> [Post] {
        if let text = text, text.count > 0 {
            return self.filter {
                $0.title.rendered.contains(text)
                    || $0.content.rendered.contains(text)
            }
        } else {
            return self
        }
    }
}
