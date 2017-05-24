			//
//  SounViewController.swift
//  SoundBoard
//
//  Created by Maybol Reynaldo Huracahua Gutierrez on 8/05/17.
//  Copyright © 2017 Maybol Reynaldo Huracahua Gutierrez. All rights reserved.
//

import UIKit
import AVFoundation

class SounViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    var audioRecorder : AVAudioRecorder?
    var audioURL : URL?
    var audioPlayer : AVAudioPlayer?
    @IBAction func recordTapped(_ sender: UIButton) {
        
        if audioRecorder!.isRecording{
        //detener la grabacion
            audioRecorder?.stop()
            //cambiar el texto del tobon grabar
            recordButton.setTitle("Record", for : .normal)
            playButton.isEnabled = true
            addButton.isEnabled = true
        }
        else{
        //empeZAR A GRABAR
            audioRecorder?.record()
            //cambiar el titulo del boton  a detener
            recordButton.setTitle("Stop", for: .normal)
            
        }
    }
    
    @IBAction func playTapped(_ sender: UIButton) {
        do {
        try audioPlayer = AVAudioPlayer(contentsOf:audioURL!)
            audioPlayer!.play()
        }
        catch {}
    }
    
    
    @IBAction func addTapped(_ sender: UIButton) {
        
        
        let context = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext
        let sound =  Sound(context:context)
        sound.name = nameTextField.text
        sound.audio =  NSData(contentsOf: audioURL!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecorder()
        
        playButton.isEnabled = false
        addButton.isEnabled = false
        
    }
    
    func setupRecorder() {
    
        do{
        let session = AVAudioSession.sharedInstance()
            
            //creando una session de audio
        try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try session.overrideOutputAudioPort(.speaker)
        try session.setActive(true)
            
            //creando una direecion de archivo
            
            let basePath : String = NSSearchPathForDirectoriesInDomains(.documentDirectory	, .userDomainMask, true ).first!
             let pathComponents = [basePath,"audio.m4a"]
             audioURL = NSURL.fileURL(withPathComponents: pathComponents)!
            
            print("+++++++++++++++")
            //print(audioURL)
            print("++++++++++++++++")
            //creando opc para  grabar audio
            
            var settings : [String:AnyObject]   = [:]
            
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC) as AnyObject?
            settings[AVSampleRateKey] = 44100.0 as AnyObject?
            settings[AVNumberOfChannelsKey] = 2 as AnyObject?
            //crear el obj de grabaciones
            audioRecorder  = try   AVAudioRecorder(url: audioURL!, settings: settings)
            audioRecorder!.prepareToRecord()
        }catch let error as NSError{
            print(error)
        
        }
        
        }
    }

   

   


