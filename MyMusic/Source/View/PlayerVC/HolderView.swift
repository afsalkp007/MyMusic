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
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_ :)), for: .valueChanged)
        return slider
    }()
    
    let playPauseButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        button.addTarget(self, action: #selector(didTapPlayPauseButton(_ :)), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward.fill"), for: .normal)
        button.addTarget(self, action: #selector(didTapNextButton(_:)), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()
    
    let previousButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.fill"), for: .normal)
        button.addTarget(self, action: #selector(didTapPreviousButton(_:)), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpUI()
        
    }
    
    deinit {
        playerManager.stopAudio()
    }
    
    private func configure() {
        addSubview(albumImageView)
        addSubview(songNameLabel)
        addSubview(albumNameLabel)
        addSubview(artistNameLabel)
        addSubview(slider)
        addSubview(playPauseButton)
        addSubview(nextButton)
        addSubview(previousButton)
    }
    
    @objc private func didTapPlayPauseButton(_ sender: UIButton) {
        if playerManager.isPlaying ?? false {
            let playImage = UIImage(systemName: "play.fill")
            playPauseButton.setImage(playImage, for: .normal)
            playerManager.pause()
        } else {
            let pauseImage = UIImage(systemName: "pause.fill")
            playPauseButton.setImage(pauseImage, for: .normal)
            playerManager.play()
        }
    }
    
    @objc private func didTapNextButton(_ sender: UIButton) {
        print(#function)
    }
    
    @objc private func didTapPreviousButton(_ sender: UIButton) {
        print(#function)
    }
    
    @objc private func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        playerManager.player?.volume = value
    }
    
    @objc private func stopAudioPlay() {
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
        slider.frame = CGRect(x: 20,
                              y: frame.size.height - 60,
                              width: frame.size.width - 40,
                              height: 50)
        
        let yPosition = artistNameLabel.frame.origin.y + 70 + 20
        let size: CGFloat = 80.0
        playPauseButton.frame = CGRect(x: (frame.size.width - size) / 2,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        nextButton.frame = CGRect(x: frame.size.width - size - 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        previousButton.frame = CGRect(x: 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)
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
