//
//  FileWriter.swift
//  DownloaderQuickLook
//
//  Created by dede.exe on 17/08/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import Foundation
import MobileCoreServices

/**
 Gravador de arquivos
 */
struct FileWriter {

    let url : URL
    let data : Data
    
    /**
     Inicializa Escritor de arquivo
     
     - parameters:
        - path: Endereço de destino e nome do arquivo a ser gravado
        - content: Objeto Data contendo conteúdo do arquivo a ser salvo
     */
    init(path:String, content:Data) throws {
        let url = URL(fileURLWithPath: path)
        self.init(url: url, content: content)
    }

    /**
     Initializa Escritor de arquivo
     
     - parameters:
        - url: Objeto URL de destino do arquivo a ser gravado
        - content: Objeto Data contendo conteúdo do arquivo a ser salvo
     */
    init(url:URL, content:Data) {
        self.data = content
        self.url = url
    }
    
    /**
     Salva dados em arquivo
     */
    func save() throws {
        try data.write(to: url)
    }
        
}
