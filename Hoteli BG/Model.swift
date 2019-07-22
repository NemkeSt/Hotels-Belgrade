//
//  Model.swift
//  TNation Zadatak
//
//  Created by Mac on 4/2/19.
//  Copyright © 2019 crossover. All rights reserved.
//

import Foundation



struct Model: Codable {
    var data = [Opis]()
}

struct Opis: Codable {
    var id: Int
    var name: String
    var address: String
    var city: String
    var description: String
    var countryId: Int
    var webSite: String
    var status: Int
    var accountType: Int
    var addDate: String
    var placeGroupId: Int
    var longitude: Double
    var latitude: Double
    var distance: Double
    var working: Bool
    var promotion: String
    var repertoire: Repertoire
    var workingHour: WorkingHour
    var country: Country
    var reviewNum: Int
    var score: Double
    var placeImgUrl: String
}

struct Country: Codable {
    var name: String
}

struct Repertoire: Codable {
    var monday: String
    var tuesday: String
    var wednesday: String
    var thursday: String
    var friday: String
    var saturday: String
    var sunday: String
}

struct WorkingHour: Codable {
    var mon: String
    var tue: String
    var wed: String
    var thu: String
    var fri: String
    var sat: String
    var sun: String
}

var model = Model()


