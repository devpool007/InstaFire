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
import PINRemoteImage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ref:FIRDatabaseReference!
    var data = [DataModel]()
        @IBOutlet weak var one: UIImageView!
    

    
    @IBAction func Logout(_ sender: Any) {
        
        
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBOutlet weak var mytable: UITableView!
    
    
    override func viewDidLoad() {
        
        
        doSetup()
        self.view.backgroundColor = UIColor(red: 138/255, green: 56/255, blue: 48/255, alpha: 1.0)

        mytable.dataSource = self
        mytable.delegate = self
        
        super.viewDidLoad()
        
    }

    func doSetup(){
   
        
        ref = FIRDatabase.database().reference()
        //ref.child("Posts").childByAutoId().setValue(["post_text":" Trafalgar D. Water Law ","imageUrl" : ""])
        ref.child("Posts").observe(.childAdded, with: { (snapshot) in
            
            let newData = snapshot.value as! [String:String]
            
            let post_text = newData["post_text"]
            let imageUrl = newData["imageUrl"]
            
            let converted = DataModel(post_text: post_text, imageUrl: imageUrl)
            
            self.data.append(converted)
            
            self.mytable.reloadData()
            
            self.one.image = #imageLiteral(resourceName: "Luffy")
            
           
        })

    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        
        let nth_data = data[indexPath.row]
        cell.posttext.text = nth_data.post_text
        cell.posttext.textColor = .white
        cell.myimage.pin_setImage(from: URL(string: nth_data.imageUrl!))
        cell.backgroundColor = UIColor(red: 138/255, green: 56/255, blue: 48/255, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 138/255, green: 56/255, blue: 48/255, alpha: 1.0)
        return (cell)
    }

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

