//
//  SoundPlayer.swift
//  Devote
//
//  Created by Manoel Filho on 24/04/21.
//

import Foundation
import AVFoundation

/*
    Método usado para torcar qualquer áudio disponível nos arquivos de um projeto
 */
var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("Não pôde encontrar e tocar o som")
        }
    }
}
