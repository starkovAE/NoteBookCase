//
//  UserData.swift
//  NoteBookNew
//
//  Created by Александр Старков on 17.07.2022.
//
import Foundation

// MARK: - UserData
struct UserData: Decodable {
    let results: [Resulte]?
}

// MARK: - Result
struct Resulte: Decodable {
    let gender: String //yes
    let name: Name //yes
    let location: Location //Yes
    let email: String //yes
    let dob: Dob
    let registered: Dob // Yes
    let picture: Picture //yes
}

// MARK: - Dob
struct Dob: Decodable {
    let date: String
    let age: Int
}
// MARK: - Location
struct Location: Decodable {
    let timezone: Timezone
}

// MARK: - Timezone
struct Timezone: Decodable {
    let offset: String
    let timezoneDescription: String
    
    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}

// MARK: - Name
struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

// MARK: - Picture
struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}

