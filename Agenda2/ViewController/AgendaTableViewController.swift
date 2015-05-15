//
//  AgendaTableViewController.swift
//  Agenda2
//
//  Created by MIguel Saravia on 5/11/15.
//  Copyright (c) 2015 MIguel Saravia. All rights reserved.
//

import UIKit
import Parse
class AgendaTableViewController: UITableViewController {

    var AgendaObject: NSMutableArray = NSMutableArray()
    // la funcion override func viewDidAppear(animated: Bool) { sirve para hacer un refresh al talbleView
   override func viewDidAppear(animated: Bool) {

        self.DataFetch()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
  @IBAction func DataFetch(){
        AgendaObject.removeAllObjects()
        var query : PFQuery = PFQuery(className: "AgendaPersons")
        query.findObjectsInBackgroundWithBlock{
            (objects, error) -> Void in
        if (error == nil) {
            for object in objects! {
                self.AgendaObject.addObject(object)
            }
        }
        let array:NSArray = self.AgendaObject.reverseObjectEnumerator().allObjects
        self.AgendaObject =  NSMutableArray(array: array)
        self.tableView.reloadData()        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var auxAgenda: AgendaViewController = segue.destinationViewController as! AgendaViewController
        if (segue.identifier == "AgendaCell"){
            
            let indexPath = self.tableView.indexPathForSelectedRow()
            var object: PFObject = self.AgendaObject.objectAtIndex(indexPath!.row) as! PFObject
            auxAgenda.ObjectAgenda = object
            self.tableView.deselectRowAtIndexPath(indexPath!, animated: true)
            
        }
    }*/


}

extension AgendaTableViewController: UITableViewDataSource{
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AgendaObject.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("CellAgenda", forIndexPath: indexPath) as! AgendaTableViewCell
        
        let ObjectA : PFObject = self.AgendaObject[indexPath.row] as! PFObject
        var labelDate:NSDateFormatter = NSDateFormatter()
        labelDate.dateFormat = "yyyy-MM-dd HH:mm"
        cell.CreatAtLabel.text = labelDate.stringFromDate(ObjectA.createdAt!)
        
        cell.NameCell.text = ObjectA.objectForKey("name") as? String
        cell.LastNameLabelCell.text = ObjectA.objectForKey("lastname") as? String
        cell.PhoneLabelCell.text = ObjectA.objectForKey("phone") as? String
        cell.EmailLabelCell.text = ObjectA.objectForKey("email") as? String
        
        
        
       
        //self.tableView.reloadData()
        
        return cell
    }
}

/*extension AgendaTableViewController: UITableViewDelegate{
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        //self.AuxAgenda = self.AgendaObject[indexPath.row] as! NSMutableArray
        self.performSegueWithIdentifier("CellAgenda", sender: self)
    }
}*/
