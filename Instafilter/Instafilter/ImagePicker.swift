//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Cem Bıçakcı on 9.09.2023.
//

import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    //Created typealias to create upside functions
    //typealias UIViewControllerType = PHPickerViewController
}