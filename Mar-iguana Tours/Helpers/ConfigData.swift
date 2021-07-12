//
//  PersistenceManager.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 14/03/21.
//

import Foundation

// This class is used to get/set, delete key-value into config JSON file
class ConfigData : NSObject {
    // singleton pattern
    static let instance = ConfigData()
    
    let fileManager = FileManager.default
    var dictJSON: [String: Any] = [:]
    var path = ""
    
    private override init() {
        super.init()
        loadFile()
    }
    
    public func get(key: String) -> Any? {
        return dictJSON[key]
    }
    
    public func set(key: String, value: Any) {
        if addKeyValue(key: key, value: value) {
            print("Key added successfully")
        } else {
            print("Error adding Key")
        }        
    }
    
    
    public func delete(key: String) {
        dictJSON[key] = nil
    }
    
    private func loadFile() {
        let documentDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        print (documentDir) // For debugging
        path = "file://" + documentDir + "/config.json"
        if fileManager.fileExists(atPath: documentDir + "/config.json") {
            if let url = URL(string: path) {
                do {
                    let data = try Data(contentsOf: url)
                    let tmp = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    dictJSON = tmp as! [String: Any]
                }
                catch {
                    
                }
            }
        }
    }
    
    private func addKeyValue(key: String, value: Any) -> Bool {
        dictJSON[key] = value
        // TODO: remover una llave existente...
        if let url = URL(string: path) {
            do {
                let data = try JSONSerialization.data(withJSONObject: dictJSON, options: .prettyPrinted)
                try data.write(to: url)
                return true
            }
            catch {
                print (error.localizedDescription)
            }
        }
        return false
    }
}
