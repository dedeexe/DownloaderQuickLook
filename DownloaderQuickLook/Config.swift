//
//  AppConfigs.swift
//  DownloaderQuickLook
//
//  Created by dede.exe on 18/08/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import Foundation

struct Config {
    
    static var savedFilesPath : String {
        return NSHomeDirectory().appending("/Documents/files/")
    }
    
}
