//
//  StudentsTableViewController.swift
//  Lec14
//
//  Created by hackeru on 24 Sivan 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {
    
    var students: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.beginRefreshing()
        refreshControl?.addTarget(self, action: #selector(self.notificationReceived), for: .valueChanged)
        
        retriveData()
        
        
        
        
        
        //
    }

    @objc func notificationReceived() {
        print("swipe")
        
        self.refreshControl?.beginRefreshing()
        retriveData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func retriveData() {
        print("retriving data")
   
        getAPIStudents { (res) in
            self.students = res.rows
            self.tableView.reloadData() // reload the table view
            self.refreshControl?.endRefreshing()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! students2TableViewCell

        // Configure the cell...
        
        
        
        cell.firstNameLabel.text = students[indexPath.row].firstname
        cell.lastNameLabel.text = students[indexPath.row].lastname
        cell.emailLabel.text = students[indexPath.row].email
 
        
        /*
       cell.firstNameLabel.text = students[indexPath.row].firstname != nil ? students[indexPath.row].firstname : "No fName Value"
        cell.lastNameLabel.text = students[indexPath.row].lastname != nil ? students[indexPath.row].lastname : "No lName Value"
        cell.emailLabel.text = students[indexPath.row].email != nil ? students[indexPath.row].email : "No email Value"
        */
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            // HomeWork
            
            // delete a student from the index *Memory
            students.remove(at: indexPath.row)
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
