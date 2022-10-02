//
//  LocalFileManager.swift
//  CryptoTrackSwiftUI
//
//  Created by Baris OZGEN on 20.09.2022.
//

import Foundation
import SwiftUI
import Cocoa

class LocalFileManager {
    
    static let instance = LocalFileManager()
    
    private init(){ }
    
    func saveImageToLocalFolder(image : NSImage, imageName : String, folderName : String){
        
        // if folder does not exist, create!
        createFolderIfNotExist(folderName: folderName)
        
        // get path for image

        guard
            let imageRep = NSBitmapImageRep(data: image.tiffRepresentation!),
            let data = imageRep.representation(using: .png, properties: [:]),
            let url = getImageURL(imageName: imageName, folderName: folderName)
        else {return}
        
        // save image to path
        
        do{
            try data.write(to: url)
        } catch let error {
            print("DEBUG: ⚠️ Error writing image to local folder;\n imageName: \(imageName) \nfolderName: \(folderName) \n ERROR: \(error)")
        }
        
        
    }
    
    func getImage(imageName : String, folderName : String) -> NSImage? {
        
        guard
            let url = getImageURL(imageName: imageName, folderName: folderName),
            FileManager.default.fileExists(atPath: url.path) else { return nil }
        return NSImage(contentsOfFile: url.path)
    }
    
    private func getImageURL(imageName : String, folderName : String) -> URL? {
        
        guard let folderURL = getFolderURL(folderName: folderName) else {return nil}
        
        return folderURL.appendingPathComponent(imageName + ".png")
    }
    private func getFolderURL(folderName : String) -> URL? {
       
        guard let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {return nil}
        
        return url.appendingPathComponent(folderName)
    }
    private func createFolderIfNotExist(folderName: String){
        
        guard let folderURL = getFolderURL(folderName: folderName) else {return}
        
        if !FileManager.default.fileExists(atPath: folderURL.path) {
            do {
                try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
            }
            catch let error {
                print("DEBUG: ⚠️ Error creating folder; \nfolderName: \(folderName) \n ERROR: \(error)")
            }
        }
    }
}
