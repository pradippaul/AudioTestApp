//
//  ViewController.swift
//  AudioTestApp
//
//  Created by QI-PC-13 on 04/05/17.
//  Copyright © 2017 sourav. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playAudio(_ sender: Any) {
        self.play()
    }

    func play()  {
        guard let url = Bundle.main.url(forResource: "silence-10sec", withExtension: "mp3") else {
            print("url not found")
            return
        }
        
        do {
            /// this codes for making this app ready to takeover the device audio
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /// change fileTypeHint according to the type of your audio file (you can omit this)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
            // if you want it play infinite time: player.numberOfLoops = (-1)
            player?.numberOfLoops = -1
            
            // no need for prepareToPlay because prepareToPlay is happen automatically when calling play()
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    
}
