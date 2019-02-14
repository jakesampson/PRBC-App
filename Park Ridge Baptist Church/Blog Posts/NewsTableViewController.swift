//
//  ViewController.swift
//  Park Ridge Baptist Church
//
//  Created by Jake Sampson on 4/2/19.
//  Copyright © 2019 Jake Sampson. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController, UISearchResultsUpdating {

    var allBlogPosts = [Post]()
    var filteredBlogPosts = [Post]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search PRBC"
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        
        downloadPosts()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBlogPosts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let blogPost = filteredBlogPosts[indexPath.row]
        
        
        
        cell.textLabel?.text = blogPost.title.rendered
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailBlogViewController()
        
        vc.detailItem = allBlogPosts[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }


    func updateSearchResults(for searchController: UISearchController) {
        filteredBlogPosts = allBlogPosts.matching(searchController.searchBar.text)
        
        tableView.reloadData()
        
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
                    self.tableView.reloadData()
                    
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }


}

