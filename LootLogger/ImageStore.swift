//
//  ImageStore.swift
//  LootLogger
//
//  Created by Harrison Anthony on 8/8/23.
//

import UIKit

class ImageStore {
    let cache = NSCache<NSString,UIImage>()
    
    func setImage(_ image: UIImage, forKey key: String){
        cache.setObject(image, forKey: key as NSString)
        
        // create full URL for image
        let url = imageURL(forKey: key)
        
        // turn image into JPEG data
        if let data = image.jpegData(compressionQuality: 0.5){
            // write it to full URL
            try? data.write(to: url)            
        }
    }
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
    
    func imageURL(forKey key: String) -> URL {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.appendingPathComponent(key)
    }
}
