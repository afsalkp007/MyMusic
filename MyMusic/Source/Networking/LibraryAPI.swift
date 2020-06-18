//
//  LibraryAPI.swift
//  MyMusic
//
//  Created by Afsal's Macbook Pro on 18/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import Foundation


class LibraryAPI {
    
    static let shared = LibraryAPI()
    private let persistencyManager = PersistencyManager()
    
    private init() {
        
    }
    
    func getSongs() -> [Song] {
      return persistencyManager.getSongs()
    }
      
    func addSong(_ song: Song, at index: Int) {
      persistencyManager.addSong(song, at: index)
    }
      
    func deleteSong(at index: Int) {
      persistencyManager.deleteSong(at: index)
    }
}
