//
//  ViewController.swift
//  KnockKnock
//
//  Created by Craig Stojsin on 2015-05-26.
//  Copyright (c) 2015 CraigCode. All rights reserved.
//

import UIKit


class ViewController: UIViewController, FBSDKLoginButtonDelegate  {
let permissions = ["public_profile","user_friends"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
    
    
        
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
            {
                // User is already logged in, do work such as go to next view controller.
                presentViewController(MatchesView(), animated: true, completion: nil)
        }
        else
        {
            let loginButton:FBSDKLoginButton = FBSDKLoginButton()
            loginButton.center = self.view.center
            loginButton.delegate = self
            loginButton.readPermissions = ["public_profile","email","user_friends"]
            self.view.addSubview(loginButton)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {

            PFFacebookUtils.logInInBackgroundWithAccessToken(result.token, block:{
                
                (user: PFUser?, error: NSError?) -> Void in
                
                if let parseUser = user {
                    
                    if parseUser.isNew {
                        
                        
                        println("User signed up and logged in through Facebook!")
                    } else {
                        println("User logged in through Facebook!")
                    
                        
                        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me?fields=id,name,picture.type(square).width(300).height(300)", parameters: nil)
                        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                            
                            if ((error) != nil)
                            {
                                
                                
                                // Process error
                                println("Error: \(error)")
                            }
                            else
                            {
                                println("fetched user: \(result)")
                                parseUser["name"] = result.valueForKey("name")
                                println("User Name is: \(parseUser)")
                                //  Sort through the picture Dictionary to retreive the URL
                                let userPicture = result.valueForKey("picture") as? NSDictionary
                                let userPictureData = userPicture!.valueForKey("data") as? NSDictionary
                                let userPictureURL = userPictureData!.valueForKey("url") as? String
                                //println("The url is \(userPictureURL)")
                                
                                parseUser["photoURL"] = userPictureURL
                                
                                
//                                user["email"] = result.valueForKey("email")
//                                println("User Email is: \(userEmail)")
                                
                                parseUser.saveInBackground()
                        self.presentViewController(MatchesView(), animated: false, completion: nil)
                                
                                
                                
                            }
                        })

                        
                    }
                    
                    
                    
                } else {
                    println("Uh oh. The user cancelled the Facebook login.")
                }
                
                })
        }
    }
    
//            // If you ask for multiple permissions at once, you
//            // should check if specific permissions missing
//            if result.grantedPermissions.contains("email")
//            {
                // Do work
    
        
        
    
    
            
            
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!)
    {
        PFUser.logOut()
    }
    

    

}

    










