//
//  ViewController.swift
//  MarcioFirst
//
//  Autor: Marcio Alico
//  Created by Applica on 05/12/2019.
//  Copyright © 2019 Applica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cajaTexto: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad de la vista #1")
    }
    
//Funciones del ciclo de VIDA del ViewController
    override func loadView() {
        super.loadView()
        print("loadView de la vista #1")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    print("viewWillAppear de la vista #1")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    print("viewDidAppear de la vista #1")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
      print("viewWillDisappear de la vista #1")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
       super.viewDidDisappear(true)
    print("viewDidDisappear de la vista #1")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("didReciveMemoryWarning de la vista #1")
    }

    @IBAction func cambiarTexto(_ sender: UIButton) {
        cajaTexto.text = "Cambio"
    }
    
}

