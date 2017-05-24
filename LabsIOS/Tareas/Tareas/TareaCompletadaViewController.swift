//
//  TareaCompletadaViewController.swift
//  Tareas
//
//  Created by Maybol Reynaldo Huracahua Gutierrez on 22/05/17.
//  Copyright © 2017 Maybol Reynaldo Huracahua Gutierrez. All rights reserved.
//

import UIKit

class TareaCompletadaViewController: UIViewController {

    @IBOutlet weak var tareaLabel: UILabel!
    @IBAction func completarTarea(_ sender: Any) {
        anteriorVC.tareas.remove(at: anteriorVC.indexSeleccionado)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if tarea.importante{
            tareaLabel.text = "😆\(tarea.nombre)"
        }else{
        tareaLabel.text = Tarea.nombre
        }
        // Do any additional setup after loading the view.
    }
    
    

    

}
