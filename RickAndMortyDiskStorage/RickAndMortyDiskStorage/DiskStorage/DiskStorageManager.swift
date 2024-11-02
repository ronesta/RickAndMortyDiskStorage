//
//  DiskStorageManager.swift
//  RickAndMortyDiskStorage
//
//  Created by Ибрагим Габибли on 02.11.2024.
//

import Foundation
import Disk

final class DiskStorageManager {
    static let shared = DiskStorageManager()

    private init() {}

    func saveCharacters(characters: [Character]) {
        do {
            try Disk.save(characters, to: .documents, as: "characters.json")
        } catch {
            print("Failed to save data: \(error.localizedDescription)")
        }
    }

    func loadCharacters() -> [Character]? {
        do {
            let characters = try Disk.retrieve("characters.json", from: .documents, as: [Character].self)
            return characters
        } catch {
            print("Error loading data: \(error.localizedDescription)")
            return nil
        }
    }

    func deleteCharacters() {
        do {
            try Disk.remove("characters.json", from: .documents)
        } catch {
            print("Error deleting data: \(error.localizedDescription)")
        }
    }

    func saveImage(_ data: Data, key: String) {
        do {
            try Disk.save(data, to: .documents, as: "\(key).png")
        } catch {
            print("Failed to save image: \(error.localizedDescription)")
        }
    }

    func loadImage(key: String) -> Data? {
        do {
            let imageData = try Disk.retrieve("\(key).png", from: .documents, as: Data.self)
            return imageData
        } catch {
            print("Error loading image: \(error.localizedDescription)")
            return nil
        }
    }

    func deleteImage(key: String) {
        do {
            try Disk.remove("\(key).png", from: .documents)
        } catch {
            print("Error deleting image: \(error.localizedDescription)")
        }
    }
}
