//
//  HolderView.swift
//  MyMusic
//
//  Created by Afsal's Macbook Pro on 18/06/2020.
//  Copyright © 2020 Afsal. All rights reserved.
//

import UIKit


class HolderView: UIView {
    
    let playerManager = PlayerManager()
        
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    private func configure() {
        addSubview(albumImageView)
        addSubview(songNameLabel)
        addSubview(albumNameLabel)
        addSubview(artistNameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpUI()
        
    }
    
    deinit {
        playerManager.stopAudio()
    }
    
    @objc func stopAudioPlay() {
        playerManager.stopAudio()
    }
    
    private func setUpUI() {
        albumImageView.frame = CGRect(x: 10,
                                      y: 10,
                                      width: frame.size.width - 20,
                                      height: frame.size.width - 20)
        songNameLabel.frame = CGRect(x: 10,
                                     y: albumImageView.frame.size.height + 10,
                                      width: frame.size.width - 20,
                                      height: 70)
        albumNameLabel.frame = CGRect(x: 10,
                                      y: albumImageView.frame.size.height + 10 + 70 + 10,
                                      width: frame.size.width - 20,
                                      height: 70)
        artistNameLabel.frame = CGRect(x: 10,
                                      y: albumImageView.frame.size.height + 10 + 70 + 10 + 70 + 10,
                                      width: frame.size.width - 20,
                                      height: 70)
    }
    
    public func bindViews(_ song: Song) {
        // set up UI elements
    
        albumImageView.image = UIImage(named: song.imageName)
        songNameLabel.text = song.name
        artistNameLabel.text = song.artistName
        albumNameLabel.text = song.albumName
        
        // set up player
        playerManager.playAudio(trackName: song.trackName)
    }
    
    
}
