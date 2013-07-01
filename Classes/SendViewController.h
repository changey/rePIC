//
//  SendViewController.h
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import <UIKit/UIKit.h>
#import "DateViewController.h"
#import "InboxViewController.h"

@class DateViewController;
@class InboxViewController;


@interface SendViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    int check_i;
    
    InboxViewController *viewinbox;
    
    DateViewController *viewdate;
    
    IBOutlet UILabel *label;
    
    UIImage *btnImage;
    
    IBOutlet UIButton *imageButton;

}

@property (strong, nonatomic) IBOutlet UIButton *imageButton;

@property (strong, nonatomic) UIImage *btnImage;

@property (strong, nonatomic) InboxViewController *viewinbox;

@property (strong, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) DateViewController *viewdate;

-(IBAction)date_a;

-(IBAction)send;


@end
