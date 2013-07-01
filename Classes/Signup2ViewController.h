//
//  Signup2ViewController.h
//  NB_list
//
//  Created by Shiyang Liu on 10/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Signup2ViewController : UIViewController{
    
    IBOutlet UITextField *user;
    IBOutlet UITextField *pass;
}


@property (nonatomic, retain) IBOutlet UITextField *user;
@property (nonatomic, retain) IBOutlet UITextField *pass;

-(IBAction)connect;

@end
