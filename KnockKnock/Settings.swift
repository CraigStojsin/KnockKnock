//
//  Settings.swift
//  KnockKnock
//
//  Created by Craig Stojsin on 2015-05-27.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//
import Foundation
import UIKit


class Settings : UITableViewController {

    var genderSwitch : UISwitch!
    var genderLabel : UILabel!
    var locationSlider: UISlider!
    var locationLabel : UILabel!
    var seinfeldSwitch: UISwitch!
    var seinfeldLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    

   genderLabel = UILabel(frame: CGRectMake(10, 50, 60, 33))
   genderLabel.font = UIFont(name: "TimesNewRoman", size: 20)
   genderLabel.text = "Gender"
    self.view.addSubview(genderLabel)
   
        genderSwitch = UISwitch(frame: CGRectMake(0, 0, 100, 100))
        genderSwitch.on = false
        println("male")
        view.addSubview(genderSwitch)
        genderSwitch.addTarget(self, action: Selector("switchOn"), forControlEvents: UIControlEvents.ValueChanged)
        
   seinfeldSwitch = UISwitch(frame: CGRectMake(0, 10, 100, 100))
   seinfeldSwitch.on = false
   println("Likes Seinfeld")
   view.addSubview(seinfeldSwitch)
   seinfeldSwitch.addTarget(self, action: Selector("seinfeldSwitchOn"), forControlEvents: UIControlEvents.ValueChanged)
  
        seinfeldLabel = UILabel(frame: CGRectMake(10, 60, 80, 33))
        seinfeldLabel.font = UIFont(name: "TimesNewRoman", size: 20)
        seinfeldLabel.text = "Likes Seinfeld"
        self.view.addSubview(seinfeldLabel)
    
        
        
        
  locationLabel = UILabel(frame: CGRectMake(10, 60, 70, 33))
  locationLabel.font = UIFont(name: "TimesNewRoman", size: 20)
  locationLabel.text = "Location"
        self.view.addSubview(locationLabel)
    }
   
    func switchOn() {
        
        if genderSwitch.on   {
            println("Female")
        }else{
            
            println("Male")
            
            
            
        }
    }
    
    func seinfeldSwitchOn() {
        
        if genderSwitch.on   {
            println("Female")
        }else{
            
            println("Male")
            
            
            
        }
    }
    



}