//
//  ViewController.swift
//  Lec14
//
//  Created by hackeru on 24 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // GDC: Grand Central Dispatch
        // iOS tries to give us a system that knoes how to run tasks on threds
        
        // the system organize the ques (FIFO) of the tasks
        
        
        // exacute an asycronic task, in the main thread (The UI Theread)
        // excaute it at a later date, which is the deadline
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // so according to the parmeters, this task will excute 5 seconds after loading the view
            
            // we caould also do something like performeSegue
            print("Haf-Saka")
        }
        
        
        
        
        
        //
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

