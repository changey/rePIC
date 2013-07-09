//
//  DetailViewController.h
//  NB_list
//
//  Created by Eric Chang on 6/30/13.
//
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController{
    IBOutlet UIImageView *imgv;
    
    NSString *url;
}

@property(nonatomic,retain) NSString *url; 

@property(nonatomic,retain) IBOutlet UIImageView *imgv;

@end
