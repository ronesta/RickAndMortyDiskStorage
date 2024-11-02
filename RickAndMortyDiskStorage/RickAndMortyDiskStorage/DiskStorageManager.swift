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
            print("Не удалось сохранить данные: \(error.localizedDescription)")
        }
    }

    func loadCharacters() -> [Character]? {
        do {
            let characters = try Disk.retrieve("characters.json", from: .documents, as: [Character].self)
            return characters
        } catch {
            print("Ошибка при загрузке данных: \(error.localizedDescription)")
            return nil
        }
    }

    func deleteCharacters() {
        do {
            try Disk.remove("characters.json", from: .documents)
        } catch {
            print("Ошибка при удалении данных: \(error.localizedDescription)")
        }
    }

    func saveImage(_ data: Data, key: String) {
        do {
            try Disk.save(data, to: .documents, as: "\(key).png")
        } catch {
            print("Не удалось сохранить изображение: \(error.localizedDescription)")
        }
    }

    func loadImage(key: String) -> Data? {
        do {
            let imageData = try Disk.retrieve("\(key).png", from: .documents, as: Data.self)
            return imageData
        } catch {
            print("Ошибка при загрузке изображения: \(error.localizedDescription)")
            return nil
        }
    }

    func deleteImage(key: String) {
        do {
            try Disk.remove("\(key).png", from: .documents)
        } catch {
            print("Ошибка при удалении изображения: \(error.localizedDescription)")
        }
    }
}
