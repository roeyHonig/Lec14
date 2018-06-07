//
//  StudentsDataSource.swift
//  Lec14
//
//  Created by hackeru on 24 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import Foundation

let apiAddress = "https://roeyhonigstudentserverapp.herokuapp.com/student"
let url = URL(string: apiAddress)! // the url is valid and we know it's ok (unlike if the user types something)
// 1). URLSession -> VS URLConnection (connection opens and closes the port, session is much smarter, it has history, it can save things to the cacuch so to not download the same pic)
let session = URLSession.shared // sheared session for the app

// lets imagin thier's a class with a very big name
// we can give it an alias , a nickname we know
typealias Json = Dictionary<String, Any>



// TODO: Discuss Observer Pattern
func getStudents() {
    // Data: Binary Data -> 010101
    //URLResponse: status code_emask
    // error
    
    let task = session.dataTask(with: url){(data, res, err) in
                if let errCode = err{
                    print(errCode)
                } else {
                    // connection estabnlished with no errors
                    guard let validData = data else {return}
                    
                    // cheack if we have an eror?
                    // else use the data
                    do {
                       let json =  try JSONSerialization.jsonObject(with: validData, options: []) as! Json
                        let rows = json["rows"]! as! [Json]  //why ! because its optional, because we cann't be sure that there actually is a key called "rows" in the json, but we actually // do know , we know for sure that the value of the key "rows" is an array of Json oblects
                        
                        for row in rows {
                            let firstName = row["firstname"]! as! String
                            print(firstName)
                            
                        }
                        
                        
                    }
                    catch let err {
                        print(err) // TODO Error call back - show an alert dialog "no connection to server"
                    }
                    
                    
                    
                    print(validData)
                    
                }
        
        
    }
    
    task.resume() // tasks start their life in a suspended state

    //
}


