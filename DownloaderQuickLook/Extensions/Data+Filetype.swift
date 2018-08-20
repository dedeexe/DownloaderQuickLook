//
//  URL+Filetype.swift
//  DownloaderQuickLook
//
//  Created by dede.exe on 19/08/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import Foundation
import MobileCoreServices

extension Data {
    enum MimeType : Int {
        case imageJPEG          = 0xff
        case imagePNG           = 0x89
        
        case applicationPDF     = 0x25
        
        case textPlain          = 0x46
        
        case unknown            = 0x00
        
        
        //
        // Return the mime type string
        //
        var mimeTypeString : String {
            switch self {
            case .imageJPEG:        return "image/jpeg"
            case .imagePNG:         return "image/png"
            case .applicationPDF:   return "application/pdf"
            case .textPlain:        return "text/plain"
            case .unknown:          return ""
            }
        }

        //
        // Return the mime type extension string
        //
        var mimeTypeFile : String {
            switch self {
            case .imageJPEG:        return "jpeg"
            case .imagePNG:         return "png"
            case .applicationPDF:   return "pdf"
            case .textPlain:        return "txt"
            case .unknown:          return ""
            }
        }
    }
    
    var mimeType : MimeType {
        var value : UInt8 = 0
        copyBytes(to: &value, count: 1)
        let result = MimeType(rawValue: Int(value)) ?? MimeType.unknown
        return result
    }
}
