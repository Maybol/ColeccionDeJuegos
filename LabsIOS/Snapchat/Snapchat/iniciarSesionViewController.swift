//
//  ViewController.swift
//  Snapchat
//
//  Created by Maybol Reynaldo Huracahua Gutierrez on 15/05/17.
//  Copyright © 2017 Maybol Reynaldo Huracahua Gutierrez. All rights reserved.
//

import UIKit
import Firebase

class IniciarSesionViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   

    @IBAction func iniciarSesionTapped(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion:{(user, error) in
            print ("Intentamos iniciar SEsion")
            if error != nil {
            
            print("tenemos que siguiente error :\(error)")
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {(user,error) in
                print("Intentamos crear  un usuario")
                    if error != nil {
                     print("tenemos el siguiente error :\(error)")
                    }else{
                     print ("el usuarui fue creado exitosamente")
                        FIRDatabase.database().reference().child("usuarios").child(user!.uid).child("email").setValue(user!.email)
                        self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                    }
                })
            }else {
            print("Inicio de sesion exitosa")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
    })
    }

}

