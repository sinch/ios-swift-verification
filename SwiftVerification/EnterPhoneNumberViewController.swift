//
//  EnterPhoneNumberViewController.swift
//  SwiftVerification
//
//  Created by christian jensen on 6/1/15.
//  Copyright (c) 2015 christian jensen. All rights reserved.
//

import UIKit
import SinchVerification;



class EnterPhoneNumberViewController: UIViewController {
    @IBOutlet weak var phoneNumber: UITextField!
   var verification:Verification?
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.phoneNumber.becomeFirstResponder();
    }
    @IBAction func startVerification(sender: AnyObject) {
        self.verification = SMSVerification(applicationKey:"<your key>", phoneNumber: phoneNumber.text)
        
        self.verification!.initiate { (success: Bool, error: NSError?) -> Void in
            if (success)
            {
                self.performSegueWithIdentifier("verifySeg", sender:self)
            }
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? VerifyCodeViewController {
        vc.verification = verification;
        }
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
