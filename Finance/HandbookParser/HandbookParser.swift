//
//  HandbookParser.swift
//  Finance
//
//  Created by Алексей Папин on 28.07.2021.
//

import Foundation

class HandbookParser<Model: Decodable> {
    private enum Constants: String {
        case point = "."
    }
    
    var models: [Model] = []
    
    var parser: (String) -> Model? = { string in
        guard
            let data = try? JSONSerialization.data(withJSONObject: string, options: [.fragmentsAllowed]),
            let object = try? JSONDecoder().decode(Model.self, from: data)
        else {
            return nil
        }
        return object
    }
    
    init?(filename: String) {
        let components = filename.components(separatedBy: Constants.point.rawValue)
        guard
            components.count == 2,
            let path = Bundle.main.path(forResource: components[0], ofType: components[1])
        else {
            return nil
        }
        
        do {
            let contents = try String(contentsOfFile: path, encoding: .utf8)
            let rows = contents.components(separatedBy: .newlines).filter { !$0.isEmpty }
            self.models = rows.compactMap { self.parser($0) }
        } catch {
            print(error)
            return nil
        }
    }
}
