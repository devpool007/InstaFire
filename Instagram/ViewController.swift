//
//  ViewController.swift
//  Instagram
//
//  Created by Devansh Sharma on 08/06/17.
//  Copyright © 2017 Devansh Sharma. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ref:FIRDatabaseReference!
    var data = [DataModel]()
    
    
    @IBOutlet weak var mytable: UITableView!
    
    
    override func viewDidLoad() {
        
        doSetup()
        
        mytable.dataSource = self
        mytable.delegate = self
        
        super.viewDidLoad()
        
    }

    func doSetup(){
   
        ref = FIRDatabase.database().reference()
        ref.child("Posts").observe(.childAdded, with: { (snapshot) in
            
            let newData = snapshot.value as! [String:String]
            
            let post_text = newData["post_text"]
            let imageUrl = newData["imageUrl"]
            
            let converted = DataModel(post_text: post_text, imageUrl: imageUrl)
            
            self.data.append(converted)
            
            self.mytable.reloadData()
            
        })
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        let nth_data = data[indexPath.row]
        let doto
        cell.posttext.text = nth_data.post_text
        cell.myimage.image = UIImage(data: nth_data.imageUrl!)
        
        return (cell)
    }

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    
  
}

