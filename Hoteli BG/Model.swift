//
//  Model.swift
//  TNation Zadatak
//
//  Created by Mac on 4/2/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import Foundation



struct Model: Codable{
    var data: [Opis]
}

struct Opis: Codable {
    var id: Int
    var name, address: String
    var city: City
    var description: String
    var countryID: Int
    var webSite: String
    var status, accountType: Int
    var addDate: String
    var placeGroupID: Int
    var longitude, latitude, distance: Double
    var working: Bool
    var promotion: String
    var repertoire: Repertoire
    var workingHour: WorkingHour
    var country: Country
    var reviewNum: Int
    var score: Double
    var placeImgURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, address, city, description
        case countryID = "countryId"
        case webSite, status, accountType, addDate
        case placeGroupID = "placeGroupId"
        case longitude, latitude, distance, working, promotion, repertoire, workingHour, country, reviewNum, score
        case placeImgURL = "placeImgUrl"
    }
}

enum City: String, Codable {
    case belgrade = "Belgrade"
    case kaluđerica = "Kaluđerica"
    case vrčin = "Vrčin"
}

struct Country: Codable {
    var name: Name
}

enum Name: String, Codable {
    case serbia = "Serbia"
}

struct Repertoire: Codable {
    var monday, tuesday, wednesday, thursday: String
    var friday, saturday, sunday: String
}

struct WorkingHour: Codable {
    var mon, tue, wed, thu: Mon
    var fri, sat: Fri
    var sun: Mon
}

enum Fri: String, Codable {
    case the00002400 = "00:00-24:00"
    case the08000100 = "08:00-01:00"
    case the09002400 = "09:00-24:00"
}

enum Mon: String, Codable {
    case the00002400 = "00:00-24:00"
    case the08002400 = "08:00-24:00"
    case the09002400 = "09:00-24:00"
}


var model: Model?


