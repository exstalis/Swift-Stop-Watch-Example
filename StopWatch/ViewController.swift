//
//  ViewController.swift
//  StopWatch
//
//  Created by elif ece arslan on 9/30/16.
//  Copyright © 2016 elif ece arslan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var Counter = 0.0
    var Timer = Foundation.Timer()
    var isPlaying: Bool = false
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(Counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func resetTapped(_ sender: UIButton) {
        Timer.invalidate()
        isPlaying = false
        Counter = 0
        timeLabel.text = String(Counter)
        playButton.isEnabled = true
        pauseButton.isEnabled = true
        
    }
    @IBAction func pauseTapped(_ sender: UIButton) {
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        Timer.invalidate()
        isPlaying = false
    }
    @IBAction func playTapped(_ sender: UIButton) {
        if isPlaying {
            return
        }
        playButton.isEnabled = false
        pauseButton.isEnabled = true
        Timer = Foundation.Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @objc private func updateTimer(){
        Counter = Counter + 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }
}

