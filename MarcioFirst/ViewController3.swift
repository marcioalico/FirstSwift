//
//  Autor: Marcio Alico
//  Created by Applica on 05/12/2019.
//  Copyright © 2019 Applica. All rights reserved.
//

import UIKit
import WebKit

class ViewController3: UIViewController {

    // Conexión de este controller con el WebView del storyboard.
    @IBOutlet var vistaWeb: WKWebView!
    
    // Variable Optional String para recibir un valor de la pantalla anterior.
    var nombrePdfRecibido: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        habilitarZoom()
        mostrarPdf()
    }
    
    func habilitarZoom(){
        vistaWeb.scalesLargeContentImage = true
    }
    
    func mostrarPdf(){
    //Paso 1) Conseguir dirección del PDF que pida el usuario.
    //Se crea un objeto URL
        let direccionPdf = URL(fileURLWithPath: Bundle.main.path(forResource: nombrePdfRecibido!, ofType: "pdf", inDirectory: "PDF")!)
        
    //Paso 2) Hacer la transformación de archivo PDF a clase Data
        let datosPdf = try? Data(contentsOf: direccionPdf)
        
    //Paso 3) Mostrar datos en la WebView
        vistaWeb.load(datosPdf!, mimeType: "application/pdf", characterEncodingName: "utf-8", baseURL: direccionPdf)
    }

}
