//
//  FileLister.swift
//  DownloaderQuickLook
//
//  Created by dede.exe on 18/08/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import Foundation
import QuickLook

class FilePreviewItem : NSObject, QLPreviewItem {
    private(set) var previewItemTitle: String?
    private(set) var previewItemURL: URL?
    
    init(title:String?, url:String) {
        let fileURL = URL(fileURLWithPath: url)
        previewItemTitle = title
        previewItemURL = fileURL
    }
}

class FileLister {
    
    let dirPath : String
    
    init(dirPath:String) {
        self.dirPath = dirPath
    }
    
    var previewFileItens : [QLPreviewItem] {
        
        var itens = [QLPreviewItem]()
        
        do {
            let contents = try FileManager.default.contentsOfDirectory(atPath: dirPath)
            
            for content in contents {
                let filePath = dirPath.appending("/\(content)")
                let filePreview = FilePreviewItem(title: nil, url: filePath)
                itens.append(filePreview)
            }
            
        } catch {
            itens = []
        }

        return itens
    }
    
}
