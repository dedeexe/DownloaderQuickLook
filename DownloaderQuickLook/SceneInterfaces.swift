//
//  SceneInterfaces.swift
//  DownloaderQuickLook
//
//  Created by dede.exe on 18/08/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import Foundation
import QuickLook

/**
 Implemente este protocolo para garantir um Controller consiga se comunicar com a ViewController
 */
protocol View : class {
    func show(message:String)
    func show(previewItens:[QLPreviewItem])
}

/**
 Implemente este protocolo para que uma ViewController consiga se comunicar com um controller
 */
protocol Controller : class {
    func downloadFile(at path:String)
    func retrievePreviewItens()
}
