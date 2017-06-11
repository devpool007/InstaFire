//
//  LogIn.swift
//  Instagram
//
//  Created by Devansh Sharma on 10/06/17.
//  Copyright © 2017 Devansh Sharma. All rights reserved.
//

import UIKit
import Firebase

class LogIn: UIViewController {

    @IBOutlet weak var piece: UIImageView!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var nami: UIImageView!
    
    @IBOutlet weak var luffy: UIImageView!
    
    @IBOutlet weak var zoro: UIImageView!
    
    @IBOutlet weak var info: UILabel!
    
    @IBAction func login(_ sender: Any) {
        
        FIRAuth.auth()?.createUser(withEmail: email.text!, password: password.text!, completion:{
            
        
            user , error in
            
            if error != nil {
            
                self.login()
                
               
                

            }
            
            else {
                
                
                self.login()
                self.info.text = "Account created!"
            }
        
        })
        
    }
    
    
    func login(){
        
        FIRAuth.auth()?.signIn(withEmail: email.text!, password: password.text!, completion: {
            
            user, error in
            
            if error != nil {
                
                self.email.placeholder = "Incorrect Email or Password"
                self.password.text = ""
                
               
         
                
            }
                
            else {
               
                self.performSegue(withIdentifier: "go", sender: self)



            }
            
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 138/255, green: 56/255, blue: 48/255, alpha: 1.0)
        self.piece.pin_setImage(from: URL( string: "https://otaku-w9pxf76zfsktmx3e.stackpathdns.com/wp-content/uploads/2016/06/Luffy.png"))
        self.info.textColor = .white
        self.info.backgroundColor = UIColor(red: 138/255, green: 56/255, blue: 48/255, alpha: 1.0)
        

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
 
}
