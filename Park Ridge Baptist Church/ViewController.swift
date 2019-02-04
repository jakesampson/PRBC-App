//
//  ViewController.swift
//  Park Ridge Baptist Church
//
//  Created by Jake Sampson on 4/2/19.
//  Copyright © 2019 Jake Sampson. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var allBlogPosts = [Post]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            do {
                let url = URL(string: "https://www.prbc.org.au/wp-json/wp/v2/posts")!
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                let downloadedBlogPosts = try decoder.decode([Post].self, from: data)
                
                DispatchQueue.main.async {
                    self.allBlogPosts = downloadedBlogPosts
                    self.tableView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }

    }


    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBlogPosts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let blogPost = allBlogPosts[indexPath.row]
        
        
        
        cell.textLabel?.text = blogPost.title.rendered
        cell.detailTextLabel?.text = blogPost.content.rendered
        
        return cell
    }




}

