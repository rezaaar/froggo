//AUDIO PLAYER
import AVFoundation

class AudioPlayer {
    static var audioPlayer: AVAudioPlayer?
    static var peakVolume: Float = 5.0

    static func preloadAudioPlayer(fileName: String) {
        guard let sfxURL = Bundle.main.url(forResource: "frogsfx", withExtension: "mp3") else {return}
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sfxURL)
            audioPlayer?.prepareToPlay()
//            normalizeVolume()
        } catch {
            print("failed to play \(error.localizedDescription)")
        }
    }

    static func playMusic() {
        audioPlayer?.play()
    }

    static func stopMusic() {
        audioPlayer?.stop()
//        audioPlayer = nil
    }
}
