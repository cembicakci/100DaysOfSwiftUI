//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Cem Bıçakcı on 17.09.2023.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
