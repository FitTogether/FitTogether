//
//  ChallengeTeamViewController.swift
//  fittogethertwo
//
//  Created by Matthew Whitesides on 12/8/14.
//  Copyright (c) 2014 Fit Together. All rights reserved.
//

import UIKit

class ChallengeTeamViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var stepPickerView: UIPickerView!
    var pickerData = ["1,000","2,000","3,000","4,000","5,000","6,000","7,000","8,000","9,000","10,000","11,000","12,000","13,000","14,000","15,000","16,000","17,000","18,000","19,000","20,000"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        stepPickerView.delegate = self
        stepPickerView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: Delegates
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //stuff for did select row
    }
}
