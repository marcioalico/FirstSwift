//
//  ViewController2.swift
//  MarcioFirst
//
//  Autor: Marcio Alico
//  Created by Applica on 05/12/2019.
//  Copyright © 2019 Applica. All rights reserved.
//

import UIKit

//Clase ViewController2 de tipo UIViewController y es delegado de los Protocolos: UITableViewDelegate y UITableViewDataSource
class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //Conexión de tipo IBOulet que relaciona este ViewController con la Vista del storyboard
    @IBOutlet var nombreVariableTabla: UITableView!
    
    var contenidoCeldas = ["pdf1", "pdf2", "pdf3"]
    
   override func viewDidLoad() {
            super.viewDidLoad()
            print("viewDidLoad de la vista #2")
    //Se asigna que el Delegado de los Protocolos es esta misma clase (self).
            nombreVariableTabla.dataSource = self
            nombreVariableTabla.delegate = self
        }
        
    
    // Este tableView con argumentLabel numberOfRowsInSection retorna la cantidad de filas en la sección (cantidad de datos en la lista contenidoCeldas en este caso.)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contenidoCeldas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // Se crea variable para almacenar la celda temporal a modificar (cambia reutilizando el identificador. Se ejecuta tantas veces como retorne el numberOfRowsInSection)
        let celda = UITableViewCell(style:UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        //Se valida si tienen un textLabel las celdas y se les asignan el contenido de la lista contenidoCeldas en este caso.
        celda.textLabel?.text = contenidoCeldas[indexPath.row]
        return celda
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        //Se obtiene el dato del indexPath.rox y se lo envia a performSegue como sender
        let idPdfSeleccionado = indexPath.row
        
        //Petición de hacer un Segue, antes se ejecutará el prepare.
        //En performSegue, se le asigna:
        //el ID (String)
        //y el sender (Any?): Puede ser cualq tipo. (indexPath.row en este caso)
        self.performSegue(withIdentifier: "pantallaDosSegue", sender: idPdfSeleccionado)
    }
    
    
    //ENVIAR DATOS ENTRE PANTALLAS.
    //funcion prepare: se realiza justo antes de que se realice el segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Validamos el ID del segue para saber a que pantalla vamos a enviar datos.
        if segue.identifier == "pantallaDosSegue" {
            
            // idPdfSeleccionadoRecibido transforma el sender recibido a Entero y será el indice de contenidoCeldas para saber cual pdf es el indice seleccionado.
            let idPdfSeleccionadoRecibido = sender as! Int
            
            // Creación objeto del ViewController de la vista siguiente, y se asigna segue.destination convertido al tipo del ViewController de la siguiente pantalla.
            let objPantalla3: ViewController3 = segue.destination as! ViewController3
            
            //ENVIO DE DATOS:
            // A la variable Optional String (nombrePdfRecibido) de la siguiente pantalla, se le asigna el contenido de la lista contenidoCeldas en la posicion solicitada.
            objPantalla3.nombrePdfRecibido = contenidoCeldas[idPdfSeleccionadoRecibido]
        }
    }

}
