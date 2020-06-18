//
//  PersistencyManager.swift
//  MyMusic
//
//  Created by Afsal's Macbook Pro on 18/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import Foundation


final class PersistencyManager {
    
    private var songs = [Song]()
    
    init() {
        
        let song1 = Song(name: "Background music",
                          albumName: "123 Others",
                          artistName: "Rnado",
                          imageName: "cover1",
                          trackName: "song1")
        let song2 = Song(name: "Havana",
                          albumName: "Havana album",
                          artistName: "Camilla Cabello",
                          imageName: "cover2",
                          trackName: "song2")
        let song3 = Song(name: "Viva La Vida",
                          albumName: "123 Something",
                          artistName: "Coldplay",
                          imageName: "cover3",
                          trackName: "song3")
        let song4 = (Song(name: "Background music",
                          albumName: "123 Others",
                          artistName: "Rnado",
                          imageName: "cover1",
                          trackName: "song1"))
        let song5 = Song(name: "Havana",
                          albumName: "Havana album",
                          artistName: "Camilla Cabello",
                          imageName: "cover2",
                          trackName: "song2")
        let song6 = Song(name: "Viva La Vida",
                          albumName: "123 Something",
                          artistName: "Coldplay",
                          imageName: "cover3",
                          trackName: "song3")
        let song7 = Song(name: "Background music",
                          albumName: "123 Others",
                          artistName: "Rnado",
                          imageName: "cover1",
                          trackName: "song1")
        let song8 = Song(name: "Havana",
                          albumName: "Havana album",
                          artistName: "Camilla Cabello",
                          imageName: "cover2",
                          trackName: "song2")
        let song9 = Song(name: "Viva La Vida",
                          albumName: "123 Something",
                          artistName: "Coldplay",
                          imageName: "cover3",
                          trackName: "song3")
        songs = [song1, song2, song3, song4, song5, song6, song7, song8, song9]
    }
    
    func getSongs() -> [Song] {
      return songs
    }
      
    func addSong(_ song: Song, at index: Int) {
      if (songs.count >= index) {
        songs.insert(song, at: index)
      } else {
        songs.append(song)
      }
    }
      
    func deleteSong(at index: Int) {
      songs.remove(at: index)
    }
    
}
