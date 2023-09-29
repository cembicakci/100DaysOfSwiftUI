//
//  AddPersonView.swift
//  RememberMe
//
//  Created by Cem Bıçakcı on 24.09.2023.
//

import CoreLocation
import SwiftUI

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss
       
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var name = ""
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var location: CLLocationCoordinate2D?
    
    @State private var showImagePicker = false
    
    @State private var locationToggle = false
    @State private var confirmAlert = false
    
    let locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationView {
            Form {
                Section("Image") {
                    if inputImage != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 250)
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, style: .init(lineWidth: 2, lineCap: .round, dash: [5, 5]))
                                .frame(width: 300, height: 250)
                            
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
                
                
                Section("Name") {
                    TextField("Enter Name", text: $name)
                }
                
                Section("Location") {
                    Toggle("Save Location?", isOn: $locationToggle)
                        .onChange(of: locationToggle) { newValue in
                            if newValue == true { locationFetcher.start() }
                            else { location = nil }
                        }
                    
                    if locationToggle {
                        Button {
                            location = locationFetcher.lastKnownLocation
                            confirmAlert = true
                        } label: {
                             Label("Share My Current Location", systemImage: "location")
                        }
                    }
                }
                
            }
            .alert("Location Saved", isPresented: $confirmAlert) {
                Button("OK") {}
            } message: {
                Text("Your current location will be saved.")
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $inputImage)
            }
            
            .toolbar {
                Button {
                    
                    guard let inputImage = inputImage else { return }
                    guard let jpegData = inputImage.jpegData(compressionQuality: 0.8) else { return }
                    
                    let person = Person(name: name, imageData: jpegData, latitude: location?.latitude, longitude: location?.longitude)
                    print(person)
                    viewModel.addPerson(person)
                    dismiss()
                    
                } label: {
                    Text("Save")
                }
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
