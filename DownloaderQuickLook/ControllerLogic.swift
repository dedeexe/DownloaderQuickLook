//
//  ControllerLogic.swift
//  DownloaderQuickLook
//
//  Created by dede.exe on 18/08/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import Foundation

/**
 Esta classe contém a lógica de negócio da ViewController.
 */
class ControllerLogic : Controller {

    var downloader : FileDownloader?
    let saveDirPath = Config.savedFilesPath
    
    weak var view : View?
    
    init() {
        downloader = FileDownloader(delegate: self)
        print(saveDirPath)
    }
    
    func downloadFile(at path: String) {
        do {
            try createSaveDirectory()
            let id = UUID.init().uuidString
            try downloader?.download(atPath: path, identifiedBy: id)
        } catch {
            redirectError(error: error)
        }
    }
    
    func createSaveDirectory() throws {
        let fm = FileManager.default
        if !fm.fileExists(atPath: saveDirPath) {
            try fm.createDirectory(atPath: saveDirPath, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    func redirectError(error:Error) {
        view?.show(message: error.localizedDescription)
    }
    
    func retrievePreviewItens() {
        let fileLister = FileLister(dirPath: Config.savedFilesPath)
        let previewItens = fileLister.previewFileItens
        view?.show(previewItens: previewItens)
    }
}

extension ControllerLogic : FileDownloaderDelegate {
    func fileDownloader(_ downloader: FileDownloader, didDownload data: Data?, identifiedBy identifier: String) {
        
        guard let contentData = data else { return }
        
        do {
            let filePath = saveDirPath.appending(identifier).appending(".").appending(contentData.mimeType.mimeTypeFile)
            let writer = try FileWriter(path: filePath, content: contentData)
            try writer.save()
            view?.show(message: "Arquivo baixado com sucesso")
        } catch {
            redirectError(error: error)
        }
        
    }
}
