//
//  InboxViewController.h
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import <UIKit/UIKit.h>
#import "ImageViewController.h"
#import "DetailViewController.h"

@class ImageViewController;
@class DetailViewController;

@interface InboxViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    
    DetailViewController *viewdet;
    
    ImageViewController *viewimage;
    
    NSString *sent;
    
    UIImage *btnImage;
    
}

- (IBAction) Back:(id)sender;

@property (retain, nonatomic) DetailViewController *viewdet;

@property (retain, nonatomic) UIImage *btnImage;

@property (retain, nonatomic) NSString *sent;
@property (retain, nonatomic) ImageViewController *viewimage;

@end
