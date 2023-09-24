//
//  AddPersonView.swift
//  RememberMe
//
//  Created by Cem Bıçakcı on 24.09.2023.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var image: Image?
    @State private var inputImage: UIImage?
    
    @State private var showImagePicker = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("Image") {
                    if inputImage != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: .infinity, height: 250)
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, style: .init(lineWidth: 2, lineCap: .round, dash: [5, 5]))
                                .frame(width: .infinity, height: 250)
                            
                            Text("Tap to select an image")
                                .foregroundColor(.blue)
                                .font(.headline)
                        }
                        .onTapGesture {
                            showImagePicker = true
                        }
                    }
                }
                .onChange(of: inputImage) { newValue in
                    setImage(uiImage: newValue)
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .navigationTitle("Add Picture")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func setImage(uiImage: UIImage?) {
        guard let uiImage = uiImage else { return }
        
        image = Image(uiImage: uiImage)
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView()
    }
}
