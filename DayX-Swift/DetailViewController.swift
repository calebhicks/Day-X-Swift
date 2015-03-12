//
//  DetailViewController.swift
//  DayX-Swift
//
//  Created by Caleb Hicks on 3/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var entry: Entry?

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let entry = self.entry {
            self.updateWithEntry(entry)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWithEntry(entry: Entry) {
        self.titleField.text = entry.title
        self.textView.text = entry.text
    }
    
    @IBAction func saveEntry(sender: AnyObject) {
        
        if let entry = self.entry {
            entry.title = self.titleField.text
            entry.text = self.textView.text
            entry.timestamp = NSDate()
            
            EntryController.sharedInstance.save()
            
        } else {
            EntryController.sharedInstance.createEntryWithDetails(self.titleField.text, text: self.textView.text, date: NSDate())
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func clearEntry(sender: AnyObject) {
        titleField.text = ""
        textView.text = ""
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
