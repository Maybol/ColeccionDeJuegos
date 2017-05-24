//
//  ViewController.swift
//  Tareas
//
//  Created by Maybol Reynaldo Huracahua Gutierrez on 3/05/17.
//  Copyright © 2017 Maybol Reynaldo Huracahua Gutierrez. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{

    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tareas:[Tarea] = []
    override func viewDidLoad() {
        super.viewDidLoad()
           tareas = crearTareas()
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        indexSeleccionado =  indexPath.row
        let  tarea = tareas[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: tarea)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
    
        return tareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        if tarea.importante{
           cell.textLabel?.text = "😇\(tarea.nombre)"
        }else {
        cell.textLabel?.text = tarea.nombre
            
        }
        return cell
    }

    func crearTareas() -> [Tarea]{
    
    let tarea1 = Tarea()
        tarea1.nombre = "Pasear al perro"
        tarea1.importante = false
        
    let tarea2 = Tarea()
        tarea2.nombre = " Lavar los sercicios"
        tarea2.importante = true
    let tarea3 = Tarea()
        tarea3.nombre = "comprar verduras"
        tarea3.importante = false
        
        return [tarea1,tarea2,tarea3]
    }

    @IBAction func agregarTarea(_ sender: Any) {
        
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "agregarSegue"{
            let siguienteVC = segue.destination as! CrearTareaViewController
            siguienteVC.anteriorVC = self
            
        }
        if segue.identifier == "tareasSeleccionadaSegue"{
            let siguienteVC = segue.destination as! TareaCompletadaViewController
            siguienteVC.tarea = sender as! Tarea
            siguienteVC.anteriorVC = self
        }
    }
    
    

}

