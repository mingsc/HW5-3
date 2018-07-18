//
//  ViewController.swift
//  HW5-3
//
//  Created by Ming hsien Chen on 2018/7/18.
//  Copyright © 2018年 Ming hsien Chen. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    //播放按钮
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var playButton2: UIButton!
    
    
    var player:AVPlayer?
    func playUsingAVPlayer(url: URL) {
        player = AVPlayer(url: url)
        player?.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func playButtonTapped(_ sender: Any) {
        
        guard let url = URL(string: "https://s3.ap-south-1.amazonaws.com/aksharpatel47-static/positive_attitude.mp3") else {
            print("Invalid URL")
            return
        }
        playUsingAVPlayer(url: url)
        
    }
    var audioPlayer: AVAudioPlayer?
    
    func playUsingAVAudioPlayer(url: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print(error)
        }
    }
    
    @IBAction func playButton2Tapped(_ sender: Any) {
        //return
        
        guard let filePath = Bundle.main.path(forResource: "StarSky", ofType: "mp3") else {
            print("File does not exist in the bundle.")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        
        playUsingAVAudioPlayer(url: url)
    }
}

