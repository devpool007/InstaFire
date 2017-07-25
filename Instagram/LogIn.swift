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
    
    @IBOutlet weak var logoino: UIButton!
    
    @IBOutlet weak var zoro: UIImageView!
    
    @IBOutlet weak var info: UILabel!
    
    @IBAction func login(_ sender: Any) {
        
        FIRAuth.auth()?.createUser(withEmail: email.text!, password: password.text!, completion:{
            
        
            user , error in
            
            if error != nil {self.log()}
            
            else {
                self.log()
                self.info.text = "Account created!"
            }
        })
    }
    
    
    func log(){
        
        FIRAuth.auth()?.signIn(withEmail: email.text!, password: password.text!, completion: {
            
            user, error in
            
            if error != nil {
                
                self.email.placeholder = "Incorrect Email or Password"
                self.info.text = "Or no Internet"
                self.email.text = ""
                self.password.text = ""
            }
                
            else {
               
                self.performSegue(withIdentifier: "go", sender: self)
                self.info.text = ""
                self.email.placeholder = "Enter email"
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        view.addGestureRecognizer(tap)
        
        self.view.backgroundColor = UIColor(red: 138/255, green: 56/255, blue: 48/255, alpha: 1.0)
        self.piece.image = #imageLiteral(resourceName: "Luffy")
        self.info.textColor = .white
        self.info.backgroundColor = UIColor(red: 138/255, green: 56/255, blue: 48/255, alpha: 1.0)
        self.logino()
        self.mailpass()
        
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


extension LogIn {
    
    func logino(){
        self.logoino.layer.cornerRadius = 5
        self.logoino.layer.borderColor = UIColor(red: 76/255, green: 152/255, blue: 210/255, alpha: 1.0).cgColor
        self.logoino.layer.borderWidth = 1.5
    }
    
    func mailpass(){
        self.email.layer.borderWidth = 1.5
        self.email.textColor = .black 
        self.email.layer.borderColor = UIColor(red: 76/255, green: 152/255, blue: 210/255, alpha: 1.0).cgColor
        self.email.layer.cornerRadius = 10
        self.email.keyboardType = UIKeyboardType.emailAddress
        self.email.backgroundColor = .white

        //==============================================================================\\
        
        self.password.layer.borderWidth = 1.5
        self.password.layer.borderColor = UIColor(red: 76/255, green: 152/255, blue: 210/255, alpha: 1.0).cgColor
        self.password.layer.cornerRadius = 10
        self.password.backgroundColor = .white
        
    }
    
    func dismissKeyboard() {
        
        view.endEditing(true)
}
}
