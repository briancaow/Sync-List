//
//  ViewController.swift
//  messagingApp
//
//  Created by Brian Cao on 2/18/19.
//  Copyright © 2019 Brian Cao. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    var postData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set the firebase reference
        ref = Database.database().reference()
        
        // Retrieve the posts and listen for changes
        databaseHandle = ref?.child("Post").observe(.childAdded, with: { (snapshot) in
            
            // Code to execute when a child is added under "Posts"
            // Take the data from the snapshot and add it to the postData array
            
            // Try to convert the value of the data to a string

            let post = snapshot.value as? String
            
            if let actualPost = post {
                
                //Append the data to out post data array
                self.postData.append(actualPost)
                
                //Reload the tableview
                self.tableView.reloadData()
            }
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
    }

}

