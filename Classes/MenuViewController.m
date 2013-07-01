//
//  MenuViewController.m
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import "MenuViewController.h"
#import "User2.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize viewmer, viewin, viewimage, inbox_but, camera_but, img_photo;

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [inbox_but setHidden:FALSE];
    [camera_but setHidden:FALSE];
}

#pragma mark - Image Picker Controller delegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    User2 *user=[User2 sharedUser];
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    user.imgv.image=[UIImage imageNamed:@"eric.jpg"];
    user.image=[UIImage imageNamed:@"cell.jpg"];
    
    [inbox_but setHidden:TRUE];
    [camera_but setHidden:TRUE];
    
//    if(self.viewimage == nil) {
        ImageViewController *secondxib =
        [[ImageViewController alloc] initWithNibName:@"ImageViewController" bundle:[NSBundle mainBundle]];
        secondxib.btnImage=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
        //secondxib.imgv.image=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
        self.viewimage = secondxib;
       // secondxib.btnImage=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
        [secondxib release];
//    }
    
    [self.navigationController pushViewController:self.viewimage animated:YES];
    
    
  //  self.imageView.image = chosenImage;
  //  self.imgv=[[UIImageView alloc] init];
  //  self.imgv.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

-(IBAction)picture{
    if(self.viewmer == nil) {
        MerDiscountsViewController *secondxib =
        [[MerDiscountsViewController alloc] initWithNibName:@"MerDiscountsViewController" bundle:[NSBundle mainBundle]];
        self.viewmer = secondxib;
        [secondxib release];
    }
    
    [self.navigationController pushViewController:self.viewmer animated:YES];
}

-(IBAction)inbox{
    if(self.viewin == nil) {
        InboxViewController *secondxib =
        [[InboxViewController alloc] initWithNibName:@"InboxViewController" bundle:[NSBundle mainBundle]];
        self.viewin = secondxib;
        [secondxib release];
    }
    
    [self.navigationController pushViewController:self.viewin animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{
    
    
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    User2 *user= [User2 sharedUser];
    user.imgv.image=[[UIImage alloc] init];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
