//
//  GachaViewController.swift
//  TechMonster
//
//  Created by 木嶋将登 on 2015/10/05.
//  Copyright (c) 2015年 mycompany. All rights reserved.
//

import UIKit

class GachaViewController: UIViewController {
    
    var number: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getRandomNumber(){
        number = Int(arc4random_uniform(10))
        NSLog("発生した乱数は...%dです", number)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var resultViewController = segue.destinationViewController as!
        ResultViewController
        
        resultViewController.number = self.number
    }
    
    @IBAction func back(){
        self.dismissViewControllerAnimated(true, completion: nil)
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
