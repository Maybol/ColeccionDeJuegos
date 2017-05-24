//
//  ViewController.swift
//  Tablas
//
//  Created by Maybol Reynaldo Huracahua Gutierrez on 3/05/17.
//  Copyright © 2017 Maybol Reynaldo Huracahua Gutierrez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     print ("Se activo  la func viewDidLoad del VC en la pantalla #1")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
      print ("Se  activo la func DidRMWarming de vc de la pantalla 1")
    
    }
  
    override func loadView() {
        super.loadView()
        print ("Se activo la func loadView del VC en la pantalla1")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    override func  viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
    }
}

