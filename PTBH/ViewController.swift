//
//  ViewController.swift
//  PTBH
//
//  Created by JACKLIEN on 5/13/18.
//  Copyright © 2018 JACKLIEN. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    //
    @IBOutlet weak var txt_A: UITextField!
    @IBOutlet weak var txt_B: UITextField!
    @IBOutlet weak var txt_C: UITextField!
    
    @IBOutlet weak var lbl_KQ: UILabel!
    @IBOutlet weak var lbl_X1: UILabel!
    @IBOutlet weak var lbl_X2: UILabel!
    @IBOutlet weak var txt_KQ: UITextField!
    @IBOutlet weak var txt_X1: UITextField!
    @IBOutlet weak var txt_X2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lbl_KQ.isHidden = true
        lbl_X1.isHidden = true
        lbl_X2.isHidden = true
        txt_KQ.isHidden = true
        txt_X1.isHidden = true
        txt_X2.isHidden = true
        //
        self.txt_A.delegate = self;
        self.txt_B.delegate = self;
        self.txt_C.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn_Reset(_ sender: Any)
    {
        txt_A.text = ""
        txt_B.text = ""
        txt_C.text = ""
        lbl_KQ.isHidden = true
        lbl_X1.isHidden = true
        lbl_X2.isHidden = true
        txt_KQ.isHidden = true
        txt_X1.isHidden = true
        txt_X2.isHidden = true
    }
    
    @IBAction func btn_Execute(_ sender: Any)
    {
        if(txt_A.text! == "" || txt_B.text! == "" || txt_C.text! == "" ||
            txt_A.text! == "." || txt_B.text! == "." || txt_C.text! == "." ||
             txt_A.text! == "-" || txt_B.text! == "-" || txt_C.text! == "-")
        {
            lbl_KQ.isHidden = false
            txt_KQ.isHidden = false
            txt_KQ.text = "Vui lòng nhập đủ dữ kiện!"
        }
        else
        {
            let a:Float! = Float(txt_A.text!)
            let b:Float! = Float(txt_B.text!)
            let c:Float! = Float(txt_C.text!)
            
            if(a==0)
            {
                if(b==0)
                {
                    lbl_KQ.isHidden = false
                    txt_KQ.isHidden = false
                    txt_KQ.text = "PT vô nghiệm"
                }
                else
                {
                    //var temp = -c/b
                    lbl_KQ.isHidden = false
                    txt_KQ.isHidden = false
                    lbl_X1.isHidden = false
                    txt_X1.isHidden = false
                    txt_KQ.text = "PT có nghiệm duy nhất."
                    txt_X1.text = String(-c/b)
                }
            }
            else
            {
                let delta = (b*b - 4*a*c)
                if(delta < 0)
                {
                    lbl_KQ.isHidden = false
                    txt_KQ.isHidden = false
                    txt_KQ.text = "PT Vô Nghiệm."
                }
                else
                {
                    if(delta == 0)
                    {
                        lbl_KQ.isHidden = false
                        txt_KQ.isHidden = false
                        lbl_X1.isHidden = false
                        txt_X1.isHidden = false
                        txt_KQ.text = "PT có nghiệm kép."
                        txt_X1.text = String(-b/(2*a))
                    }
                    else
                    {
                        lbl_KQ.isHidden = false
                        txt_KQ.isHidden = false
                        lbl_X1.isHidden = false
                        txt_X1.isHidden = false
                        lbl_X2.isHidden = false
                        txt_X2.isHidden = false
                        txt_KQ.text = "PT có 2 nghiệm phân biệt."
                        txt_X1.text = String((-b+sqrt(delta))/(2*a))
                        txt_X2.text = String((-b-sqrt(delta))/(2*a))
                    }
                }
            }
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = NSCharacterSet(charactersIn:"0123456789-.").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
}



