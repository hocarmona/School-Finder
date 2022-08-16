//
//  Model.swift
//  API-MVVM
//
//  Created by Hector Carmona on 8/2/22.
//

import Foundation

struct List: Codable {
    
    let school_name: String
    let overview_paragraph: String
    let borough: String?
    let academicopportunities1: String?
    let academicopportunities2: String?
    let school_sports: String?
}
