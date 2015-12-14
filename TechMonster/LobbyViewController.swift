//
//  LobbyViewController.swift
//  TechMonster
//
//  Created by 木嶋将登 on 2015/06/08.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import UIKit
import AVFoundation

class LobbyViewController: UIViewController,AVAudioPlayerDelegate{
    var stamina: Float = 0
    var staminatimer: NSTimer!
    var util: TechDraUtility!
    var player: Player!
    @IBOutlet var namelabel:UILabel!
    @IBOutlet var staminaBar:UIProgressView!
    @IBOutlet var levellabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player()
        
        staminaBar.transform = CGAffineTransformMakeScale(1.0, 4.0)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        var level: Int = userDefaults.integerForKey("level")
        
        namelabel.text = player.name
        levellabel.text = String(format: "Lv. %d", level + 1)
        stamina = 100
        
        util = TechDraUtility()
        cureStamina()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        util.playBGM("lobby")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewDidDisappear(true)
        util.stopBGM()
    }
    
    func cureStamina(){
        staminatimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateStaminaValue", userInfo: nil, repeats: true)
        staminatimer.fire()
    }
    
    func updateStaminaValue() {
        if stamina <= 100{
            stamina = stamina + 1
            staminaBar.progress = stamina / 100
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
