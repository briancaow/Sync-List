//
//  ComposeViewController.swift
//  messagingApp
//
//  Created by Brian Cao on 2/19/19.
//  Copyright © 2019 Brian Cao. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    var ref: DatabaseReference?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPost(_ sender: Any) {
    
    // Post the data to firebase
        ref?.child("Post").childByAutoId().setValue(textView.text)
    // Dismiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelPost(_ sender: Any) {
   
        // Dismiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
