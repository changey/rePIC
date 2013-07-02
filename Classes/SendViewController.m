//
//  SendViewController.m
//  NB_list
//
//  Created by Eric Chang on 6/29/13.
//
//

#import "SendViewController.h"
#import "SendCell.h"
#import "User2.h"

@interface SendViewController ()

@end

@implementation SendViewController

@synthesize viewdate, label, viewinbox, btnImage, imageButton;

-(IBAction)send{
//    UIImageView *imageView = [[UIImageView alloc] init];
//    UIGraphicsBeginImageContext(self.view.frame.size);
//    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
//    
//    //UIImage *viewImage = self.imgv.image;
//    
//    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
//    NSData *imageData = UIImageJPEGRepresentation(btnImage, 0.02);
    
    
   // NSString *urlString = @"http://107.22.99.26/startup/upload.php";
    User2 *user=[User2 sharedUser];
    //user.url=@"http://107.22.99.26";
    
    NSString *urlString2 = [NSString stringWithFormat:@"%@/startup/schedule.php", user.url];
    NSLog(@"%@", urlString2);
    
    
    
    NSMutableURLRequest *request2 = [[[NSMutableURLRequest alloc] init] autorelease];
    [request2 setURL:[NSURL URLWithString:urlString2]];
    [request2 setHTTPMethod:@"POST"];
    
    // [request2 setHTTPBody:body2];
    
    // now lets make the connection to the web
    NSData *returnData2 = [NSURLConnection sendSynchronousRequest:request2 returningResponse:nil error:nil];
    NSString *returnString2 = [[NSString alloc] initWithData:returnData2 encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", returnString2);
    
    NSString *urlString = [NSString stringWithFormat:@"%@/startup/messages.php", user.url];
    
    
    
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = [NSString stringWithString:@"---------------------------14737809831466499882746641449"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    
    NSMutableData *body = [NSMutableData data];
    
    //  parameter username
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"sender\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"changey" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //  parameter username
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"receiver\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"heather" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //  parameter username
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"time\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"lala" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //  parameter username
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"url\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"lala" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    //  parameter username
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"captions\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"dada" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[[NSString stringWithString:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"%@", user.captions);
    
//    [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"image\"; filename=\"dr3.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [body appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[NSData dataWithData:imageData]];
//    [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    
    // now lets make the connection to the web
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", returnString);
    
    if(self.viewinbox == nil) {
        InboxViewController *secondxib =
        [[InboxViewController alloc] initWithNibName:@"InboxViewController" bundle:[NSBundle mainBundle]];
        secondxib.sent=@"1";
        secondxib.btnImage=btnImage;
        self.viewinbox  = secondxib;
        [secondxib release];
    }
    
    [self.navigationController pushViewController:self.viewinbox animated:YES];
}

-(IBAction)date_a{
    if(self.viewdate == nil) {
        DateViewController *secondxib =
        [[DateViewController alloc] initWithNibName:@"DateViewController" bundle:[NSBundle mainBundle]];
        self.viewdate = secondxib;
        [secondxib release];
    }
    
    [self.navigationController pushViewController:self.viewdate animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    User2 *user=[User2 sharedUser];
    
    label.text=user.date;
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
    
    self.title=@"Send to";
    
    [imageButton setImage:btnImage forState:UIControlStateNormal];
    
    check_i=0;
    // Do any additional setup after loading the view from its nib.
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
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"SendCell";
	
    SendCell *cell = (SendCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.accessoryType=UITableViewCellAccessoryCheckmark;
    
    if (cell == nil) {
        
		NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SendCell" owner:self options:nil];
		
		for (id currentObject in topLevelObjects){
			if ([currentObject isKindOfClass:[UITableViewCell class]]){
				cell =  (SendCell *) currentObject;
				break;
			}
		}
	}
    
    if (indexPath.row==0){
        cell.imgv.image=[UIImage imageNamed:@"heather.jpg"];
        cell.name.text=@"Heather Wilk";
    }
//    else if(indexPath.row==1){
//        cell.imgv.image=[UIImage imageNamed:@"jill.jpg"];
//        cell.name.text=@"Jill Rosok";
//    }
//    else if(indexPath.row==2){
//        cell.imgv.image=[UIImage imageNamed:@"eric.jpg"];
//        cell.name.text=@"Eric Chang";
//    }
//    else if(indexPath.row==3){
//        cell.imgv.image=[UIImage imageNamed:@"jace.jpg"];
//        cell.name.text=@"Jace Lieberman";
//    }
    
    
    //NSString *urlString =@"";
    int num;
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SendCell *row = [tableView cellForRowAtIndexPath:indexPath];
    
    
    if (check_i==0){
        [row.check_v setImage:[UIImage imageNamed:@"check.png"]];
        check_i=1;
    }
    else{
        [row.check_v setImage:[UIImage imageNamed:@"uncheck.png"]];
        check_i=0;
    }
    
    // User *user=[User sharedUser];
    // user.imageNum=[self.mut objectAtIndex:length-indexPath.row-1];
    
    
}

@end
