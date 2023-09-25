//
//  GuideVoicePlayer.swift
//  Allright
//
//  Created by 송재훈 on 2023/09/25.
//

import Foundation
import AVFoundation
import UIKit

class GuideVoicePlayer: NSObject, ObservableObject {
    var step: TrainingSteps?
    var player = AVAudioPlayer()
    var playList: [URL] = []
    
    @Published var isIndex = 0
    
    init(step: TrainingSteps? = nil, player: AVAudioPlayer = AVAudioPlayer(), isIndex: Int = 0) {
        self.step = step
        self.player = player
        self.isIndex = isIndex
        
        guard let step = self.step else { return }
        
        switch step {
        case .step1:
            for idx in 1...195 {
                let path = Bundle.main.path(forResource: "Step1_\(idx).mp3", ofType: nil)!
                playList.append(URL(filePath: path))
            }
        case .step2:
            break
        case .sentence:
            break
        }
    }
    
    func startPlaying() {
        do {
            player = try AVAudioPlayer(contentsOf: playList[isIndex])
            player.prepareToPlay()
            player.play()
            isIndex += 1
        } catch {
            print(error.localizedDescription)
        }
    }
}