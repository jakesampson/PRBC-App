//
//  ViewController.swift
//  Park Ridge Baptist Church
//
//  Created by Jake Sampson on 4/2/19.
//  Copyright © 2019 Jake Sampson. All rights reserved.
//

import UIKit

class NewsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var allBlogPosts = [Post]()
    var filteredBlogPosts = [Post]()
    
    @IBOutlet weak var blogTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.blogTableView.layer.cornerRadius = 10
        self.blogTableView.layer.masksToBounds = true
        self.blogTableView.rowHeight = 90
        
        downloadPosts()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBlogPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = blogTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let blogPost = filteredBlogPosts[indexPath.row]
        
        
        
        cell.textLabel?.text = blogPost.title.rendered
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailBlogViewController()
        
        vc.detailItem = allBlogPosts[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }



    
    
    func downloadPosts() {
        DispatchQueue.global().async {
            do {
                
                let url = URL(string: "https://www.prbc.org.au/wp-json/wp/v2/posts")!
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                let downloadedBlogPosts = try decoder.decode([Post].self, from: data)
                
                DispatchQueue.main.async {
                    self.allBlogPosts = downloadedBlogPosts
                    self.filteredBlogPosts = downloadedBlogPosts
                    self.blogTableView.reloadData()
                    
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }


}

