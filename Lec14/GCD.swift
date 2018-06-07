//
//  GCD.swift
//  Lec14
//
//  Created by hackeru on 24 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import Foundation

// !!!!!!  important to understand   - We Work Work Work at the background (thread #!) and publish at the UI (thread #2 - UI thread)


// The Main queue // UI Queue // the Queue of the UI Thread
// get a ref to the main Thread
// very important to know this line!!!!!
let mainQ = DispatchQueue.main

func demo() {
    mainQ.async {
        // code that runs on the UI Thred
        // the ui thread should handle easy tasks , such as display text in the label
    }
    
    let q = DispatchQueue.global(qos: .userInteractive) // not a private Q   . the .global is a thread pool of the global system
    
    // performe a diffuclt task in the backgroudn and publish to the UI Thread
    q.async {
        // code that runs in the background , but very important to the user (because we said userInteractive)
        let pumpkin = growPumpkin()
        // report the result to the UI thread
        mainQ.async {
            print(pumpkin)
        }
    }
    
}


// growing pumpkins is a tedius tasks, it's diffuclt, it takes up to 5 Sec of our CPU
// iOs won't let us even think abouth stopping (sleep) the system every time we want to grow a pumpkin
func growPumpkin() -> String {
    sleep(5)
    return "Pumpkin"
}










// we should the following but know that ios is so so nice that it doesn't truss us to instintiate or manually use them

// fifo = serial queue
let serialQ = DispatchQueue(label: "MySerialQ") // a custome serial queue, every task i'll assign him will run one after the other

// concurent Queue: tasks run simultainaslly
// qos = quality of service = how important are the tasks in this queue
let usertInt = DispatchQoS.userInteractive

let concurrentQ = DispatchQueue(label: "MyConcernetQ", qos: usertInt, attributes: DispatchQueue.Attributes.concurrent)  // Attributes is enum so i could have just write .concurrent

