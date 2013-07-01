//
//  InboxViewController.m
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import "InboxViewController.h"
#import "CustomCell.h"
#import "User2.h"

@interface InboxViewController ()

@end

@implementation InboxViewController

@synthesize viewimage, sent, btnImage, viewdet;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    if ([sent isEqualToString:@"1"]){
        
        
        NSData *imageData = UIImageJPEGRepresentation(btnImage, 0.1);
        
        
        NSString *urlString = @"http://107.22.99.26/startup/upload.php";
        
        
        NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
        [request setURL:[NSURL URLWithString:urlString]];
        [request setHTTPMethod:@"POST"];
        
        NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        NSMutableData *body = [NSMutableData data];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"image\"; filename=\"dr3.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:imageData]];
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        // setting the body of the post to the reqeust
        [request setHTTPBody:body];
        
        // now lets make the connection to the web
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", returnString);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    self.navigationItem.hidesBackButton = YES;
    //
    //    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(Back:)];
    //	[self.navigationItem setLeftBarButtonItem:backButton];
    
    self.title=@"Inbox";
    // Do any additional setup after loading the view from its nib.
}

- (IBAction) Back:(id)sender{
	[self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    User2 *user=[User2 sharedUser];
    int inbox_num=[user.inbox intValue];
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

void UIImageFromURL( NSURL * URL, void (^imageBlock)(UIImage * image), void (^errorBlock)(void) )
{
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                   {
                       NSData * data = [[[NSData alloc] initWithContentsOfURL:URL] autorelease];
                       UIImage * image = [[[UIImage alloc] initWithData:data] autorelease];
                       dispatch_async( dispatch_get_main_queue(), ^(void){
                           if( image != nil )
                           {
                               imageBlock( image );
                           } else {
                               errorBlock();
                           }
                       });
                   });
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CustomCell";
	
    CustomCell *cell = (CustomCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (CustomCell *) currentObject;
				break;
			}
		}
	}
    //NSString *urlString =@"";
    User2 *user=[User2 sharedUser];
    int inbox_num=[user.inbox intValue];
    
    //if ([sent isEqualToString:@"1"]){
        inbox_num=inbox_num+1;
        NSLog(@"%@", user.captions);
        user.inbox=[NSString stringWithFormat:@"%d", inbox_num];
        
        
        
        if (indexPath.row==1){
            cell.mer_name.text=@"Have you seen white doug";
            cell.imgv.image=[UIImage imageNamed:@"phil.png"];
            cell.name.text=@"Phil";
        }
        else if(indexPath.row==2){
            cell.mer_name.text=@"Dude, where's your tooth??";
            cell.imgv.image=[UIImage imageNamed:@"wolf.png"];
            cell.name.text=@"1manWolfRck";
        }
        else if(indexPath.row==3){
            cell.mer_name.text=@"The internet sucks in here!";
            cell.imgv.image=[UIImage imageNamed:@"eric.jpg"];
            cell.name.text=@"Eric Chang";
        }
        else if(indexPath.row==4){
            cell.mer_name.text=@"I bet you can't wait to see this fireworks setup..damn!";
            cell.imgv.image=[UIImage imageNamed:@"jace.jpg"];
            cell.name.text=@"Jace Lieberman";
        }
        else if(indexPath.row==5){
            cell.mer_name.text=@"this is awesome";
            cell.imgv.image=[UIImage imageNamed:@"jace.jpg"];
            cell.name.text=@"Terry Anderson";
        }
        else{
//            if ([user.captions isEqualToString:@"Captions"]==false){
//                cell.mer_name.text=user.captions;
//            }
            cell.mer_name.text=@"Take a look at these good looking judges:)";
            cell.imgv.image=[UIImage imageNamed:@"heather.jpg"];
            cell.name.text=@"Heather Wilk";
            
        }
//    }
//    else{
//        if (indexPath.row==0){
//            cell.mer_name.text=@"No for Jay's, that needs to change.";
//            cell.imgv.image=[UIImage imageNamed:@"jill.jpg"];
//            cell.name.text=@"Jill Rosok";
//        }
//        else if(indexPath.row==1){
//            cell.mer_name.text=@"To be a successful business, you need money.";
//            cell.imgv.image=[UIImage imageNamed:@"heather.jpg"];
//            cell.name.text=@"Heather Wilk";
//        }
//        else if(indexPath.row==2){
//            cell.mer_name.text=@"The internet sucks in here!";
//            cell.imgv.image=[UIImage imageNamed:@"eric.jpg"];
//            cell.name.text=@"Eric Chang";
//        }
//        else if(indexPath.row==3){
//            cell.mer_name.text=@"I bet you can't wait to see this fireworks setup..damn!";
//            cell.imgv.image=[UIImage imageNamed:@"jace.jpg"];
//            cell.name.text=@"Jace Lieberman";
//        }
//        else if(indexPath.row==4){
//            cell.mer_name.text=@"this is awesome";
//            cell.imgv.image=[UIImage imageNamed:@"jace.jpg"];
//            cell.name.text=@"Terry Anderson";
//        }
//        else{
//            
//        }
//    }
    
    
    
    // cell.
    
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0){
        if(self.viewdet == nil) {
            DetailViewController *secondxib =
            [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
            self.viewdet = secondxib;
            [secondxib release];
        }
        
        [self.navigationController pushViewController:self.viewdet animated:YES];
    }
    
    // User *user=[User sharedUser];
    // user.imageNum=[self.mut objectAtIndex:length-indexPath.row-1];
    
    
}

@end
