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
