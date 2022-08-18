/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation
import AVFoundation

extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        print("sharedDingPlayer")
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else {
            print("error")
            fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
