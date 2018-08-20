//
//  FileDownloader.swift
//  DownloaderQuickLook
//
//  Created by dede.exe on 17/08/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import Foundation

///
/// Enum contento os possíveis erros no momento de download
///
/// - **invalidURL**: Indica que a URL não é uma URL válida
///
enum FileDownloaderError : Error, LocalizedError {
    case invalidURL
    
    var localizedDescription: String {
        return "Invalid URL address"
    }
}

///
/// Delegate para **FileDownloader**
///
protocol FileDownloaderDelegate : class {
    
    ///
    /// Devolve um os dados do arquivo baixado.
    ///
    func fileDownloader(_ downloader:FileDownloader, didDownload data:Data?, identifiedBy identifier:String)
}

///
/// Executor de downloads por URL
///
class FileDownloader {
    
    weak private(set) var delegate : FileDownloaderDelegate?
    
    init(delegate: FileDownloaderDelegate) {
        self.delegate = delegate
    }
    
    ///
    /// Executa download utilizando string. Lança uma exceção caso algo dê errado
    ///
    /// - parameters:
    ///     - atPath: String contendo o arquivo a ser baixado
    ///     - identifiedBy: Uma string para identificar o download
    ///
    func download(atPath address: String, identifiedBy identifier:String="") throws {
        guard let url = URL(string: address) else {
            throw FileDownloaderError.invalidURL
        }
        
        try download(at: url, identifiedBy: identifier)
    }

    ///
    /// Executa download utilizando url. Lança uma exceção caso algo dê errado
    ///
    /// - parameters:
    ///     - url: Objeto URL contendo o arquivo a ser baixado
    ///     - identifiedBy: Uma string para identificar o download
    ///
    func download(at url:URL, identifiedBy identifier:String="") throws {
        let data = try Data(contentsOf: url)
        delegate?.fileDownloader(self, didDownload: data, identifiedBy: identifier)
    }
    
}
