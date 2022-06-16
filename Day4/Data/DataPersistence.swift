//
//  DataPersistence.swift
//  Day4
//
//  Created by Jovan A on 16/06/22.
//

import Foundation

func saveData(title: String, subTitle: String, content: String) {
    do {
        if UserDefaults.standard.object(forKey: "data") != nil {
            var temp = try UserDefaults.standard.getObject(forKey: "data", castTo: [List].self)
            temp.append(List(title: title, subTitle: subTitle, content: content))
            try UserDefaults.standard.setObject(temp, forKey: "data")
        }
        else {
            try UserDefaults.standard.setObject([List(title: title, subTitle: subTitle, content: content)], forKey: "data")
        }
        
    }
    catch {
        print(error.localizedDescription)
    }
}

func getData() -> [List] {
    do {
        let temp = try UserDefaults.standard.getObject(forKey: "data", castTo: [List].self)
        return temp
    }
    catch {
        print(error.localizedDescription)
    }
    return []
}

func clearData() {
    UserDefaults.standard.removeObject(forKey: "data")
}
