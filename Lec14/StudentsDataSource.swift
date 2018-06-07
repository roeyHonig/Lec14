//
//  StudentsDataSource.swift
//  Lec14
//
//  Created by hackeru on 24 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import Foundation

// !!!!! swift 4 has something called codable and it will allow us to parse json very easy, but we have to create a struct \ class exactlly similaer to the json
/*
 like , let's say:
 
 struct studentAPI {
 var rows: [Student]
 }
 
 
 */

let apiAddress = "https://roeyhonigstudentserverapp.herokuapp.com/student"
let url = URL(string: apiAddress)! // the url is valid and we know it's ok (unlike if the user types something)
// 1). URLSession -> VS URLConnection (connection opens and closes the port, session is much smarter, it has history, it can save things to the cacuch so to not download the same pic)
let session = URLSession.shared // sheared session for the app

// lets imagin thier's a class with a very big name
// we can give it an alias , a nickname we know
typealias Json = Dictionary<String, Any>



// TODO: Discuss Observer Pattern

/*
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
                        let students = deserilazation(data: validData)
                        print(students)
                }
        
        
    }
    
    task.resume() // tasks start their life in a suspended state

    //
}
*/
 
 // we're defining a function, one of it's parmeters is a function byitself, this function is our callback,
// what's the @escaping annotation means? , it's swift way of notifying me, the programmer, that this thing will breach the scope of the getAPIStudents func
// and enter a all new other scope (in our case that scope can be found at the ViewController.swift)
func getAPIStudents(callback: @escaping (studentAPI)-> Void) {
    session.dataTask(with: url) { (data, res, err) in
        guard let data = data else {return}
        // if we got here, we have data
        let decoder = JSONDecoder()
        guard let result = try? decoder.decode(studentAPI.self, from: data) else {return /*SHOW DIALOG*/}
        
        // Run code on the UI Thread
        DispatchQueue.main.async {
            callback(result)
        }
        
        
        
        //print(result.rows)
    }.resume()
    
    
}


/*

// we have Data -> [Student]()
func deserilazation(data: Data) -> [Student] {
    var students = [Student]() // we created a struct named Student in a seperate swift file
    
    do {
        let json =  try JSONSerialization.jsonObject(with: data, options: []) as! Json
        let rows = json["rows"]! as! [Json]  //why ! because its optional, because we cann't be sure that there actually is a key called "rows" in the json, but we actually // do know , we know for sure that the value of the key "rows" is an array of Json oblects
        
        for row in rows {
            let firstName = row["firstname"]! as! String
            let lastName = row["lastname"]! as! String
            let email = row["email"]! as! String
            let id = row["id"]! as! Int
            
            students.append(Student(firstName: firstName, lastName: lastName, email: email, id: id))
            
        }
        
    }
    catch let err {
        print(err) // TODO Error call back - show an alert dialog "no connection to server"
    }
    return students
}

*/




