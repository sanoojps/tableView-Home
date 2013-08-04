//
//  TUTorialViewController.m
//  tableView-Home
//
//  Created by marJinn on 02/08/13.
//
//

#import "TUTorialViewController.h"

@interface TUTorialViewController ()
-(void)scrollViewADD;
-(void)scrollViewADDPics;
@end

@implementation TUTorialViewController

@synthesize scrollView;
@synthesize pageControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    
        //ADd a bar button item
		
		//
        UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc]
                                            initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                            target:self action:@selector(DoneButtonOnPageClicked:)];//need to implement btn Action
		//action:@selector(clickedtheBUtton)
		//set this button as the the right item in the navigation Item
		
        [[self navigationItem]setRightBarButtonItem:rightBarBtnItem
										   animated:YES];
		
		[rightBarBtnItem release];
		rightBarBtnItem = nil;

        
    }
    return self;
}

-(IBAction)DoneButtonOnPageClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //[self scrollViewADD];
    [self scrollViewADDPics];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidUnload
{
    self.scrollView =nil;
    self.pageControl = nil;
}


- (void)dealloc {
    [pageControl release];
    [scrollView release];
    [super dealloc];
}


-(void)scrollViewADD
{
    NSArray *colors = [NSArray arrayWithObjects:
                       [UIColor orangeColor],
                       [UIColor greenColor],
                       [UIColor blueColor],
                       nil];
    
    NSArray *images = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"tutorials_img_12.png"],//enable Airport Mode
                       [UIImage imageNamed:@"tutorials_img_13.png"],//Restrictions ????
                       [UIImage imageNamed:@"tutorials_img_14.png"],//ADjust BrightNess & wallpaer
                       [UIImage imageNamed:@"tutorials_img_15.png"],//Adjust auto-lock Timing
                       [UIImage imageNamed:@"tutorials_img_20.png"],//Disable Automatic Time Zone Updates
                       [UIImage imageNamed:@"tutorials_img_21.png"],//Disable Siri
                       [UIImage imageNamed:@"tutorials_img_22.png"],//Restrict Third Party Apps
                       [UIImage imageNamed:@"tutorials_img_4.png"],//Disable Notifications
                       [UIImage imageNamed:@"tutorials_img_5.png"],//Disable Auto Sync
                       [UIImage imageNamed:@"tutorials_img_6.png"],//Disable Push notification
                       [UIImage imageNamed:@"tutorials_img_7.png"],//Disable auto check - Email Accounts
                       [UIImage imageNamed:@"tutorials_img_9.png"],//Disable blueTooth
                       nil];

    
    for (int i = 0; i < [colors count]; i++) {
        CGRect frame;
        frame.origin.x = [[self scrollView]frame].size.width *i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UIView *subView = [[UIView alloc]initWithFrame:frame];
        [subView setBackgroundColor:[colors objectAtIndex:i]];
        [self.scrollView addSubview:subView];
        
        //Image View Inside VIew
        UIImage *tempHolderForImage;
        tempHolderForImage = (UIImage *)[images objectAtIndex:i];
        
        float aspectRatio = tempHolderForImage.size.width / tempHolderForImage.size.height ;
        
        CGRect imageViewFrame;
        imageViewFrame.origin.x = (self.scrollView.frame.origin.x
                                   + subView.frame.size.width /2)
        - tempHolderForImage.size.width;
        
        imageViewFrame.origin.y = (self.scrollView.frame.origin.y
                                   + subView.frame.size.height /2)
        - tempHolderForImage.size.height;
        
        imageViewFrame.size.width = 100 *aspectRatio ;
        imageViewFrame.size.height = 100 *aspectRatio ;
        
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:imageViewFrame];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        [imageView setImage:(UIImage *)[images objectAtIndex:i]];
        [subView addSubview:imageView];
        [imageView release];
        imageView = nil;

        
        
        [subView release];
        subView = nil;
    }
    
    //set the whole scrollView size
    
    CGSize scrollViewTotalSize;
    scrollViewTotalSize =
    CGSizeMake
    (
     self.scrollView.frame.size.width * [colors count],
     self.scrollView.frame.size.height
     );
    
    [[self scrollView]setContentSize:scrollViewTotalSize];
    
    pageControlBeingUsed = NO;
    
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [colors count];
}


-(void)scrollViewADDPics
{
    NSArray *images = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"tutorials_img_12.png"],//enable Airport Mode
                       [UIImage imageNamed:@"tutorials_img_13.png"],//Restrictions ????
                       [UIImage imageNamed:@"tutorials_img_14.png"],//ADjust BrightNess & wallpaer
                       [UIImage imageNamed:@"tutorials_img_15.png"],//Adjust auto-lock Timing
                       [UIImage imageNamed:@"tutorials_img_20.png"],//Disable Automatic Time Zone Updates
                       [UIImage imageNamed:@"tutorials_img_21.png"],//Disable Siri
                       [UIImage imageNamed:@"tutorials_img_22.png"],//Restrict Third Party Apps
                       [UIImage imageNamed:@"tutorials_img_4.png"],//Disable Notifications
                       [UIImage imageNamed:@"tutorials_img_5.png"],//Disable Auto Sync
                       [UIImage imageNamed:@"tutorials_img_6.png"],//Disable Push notification
                       [UIImage imageNamed:@"tutorials_img_7.png"],//Disable auto check - Email Accounts
                       [UIImage imageNamed:@"tutorials_img_9.png"],//Disable blueTooth
                       nil];
    
    NSArray *labelTexts = [NSArray arrayWithObjects:
                           @"Enable Airport Mode",
                        @"Restrictions",//Restrictions ????
                        @"Adjust Brightness & Wallpaper",//ADjust BrightNess & wallpaer
                        @"Adjust auto-lock Timing",//Adjust auto-lock Timing
                        @"Disable Automatic Time Zone Updates",//Disable Automatic Time Zone Updates
                        @"Disable Siri",//Disable Siri
                        @"Restrict Third Party Apps",//Restrict Third Party Apps
                        @"Disable Notifications",//Disable Notifications
                        @"Disable Auto Sync",//Disable Auto Sync
                        @"Disable Push notification",//Disable Push notification
                        @"Disable Auto Check - Email Accounts",//Disable auto check - Email Accounts
                        @"Disable Bluetooth",//Disable blueTooth
                       nil];
    
    for (int i = 0; i < [images count]; i++) {
        
        //VIEW INSIDE SCrollView
        CGRect frame;
        frame.origin.x = [[self scrollView]frame].size.width *i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
    
        UIView *subView = [[UIView alloc]initWithFrame:frame];
        [subView setBackgroundColor:[UIColor viewFlipsideBackgroundColor]];
        [self.scrollView addSubview:subView];
        
        
        
        //Image View Inside VIew
        UIImage *tempHolderForImage;
        tempHolderForImage = (UIImage *)[images objectAtIndex:i];
        
        float aspectRatio = tempHolderForImage.size.width / tempHolderForImage.size.height ;
        
        CGRect imageViewFrame;
        imageViewFrame.origin.x = (self.scrollView.frame.origin.x
                                    + self.scrollView.frame.size.width /2)
                                    - tempHolderForImage.size.width /2;
        
        imageViewFrame.origin.y = (self.scrollView.frame.origin.y
                                    + self.scrollView.frame.size.height /2)
                                    - tempHolderForImage.size.height /2
        ;
        
        imageViewFrame.size.width = 100 *aspectRatio ;
        imageViewFrame.size.height = 100 *aspectRatio ;
                                   
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:imageViewFrame];
        [imageView setContentMode:UIViewContentModeScaleAspectFit];
        [imageView setImage:(UIImage *)[images objectAtIndex:i]];
        [subView addSubview:imageView];
        [imageView release];
        imageView = nil;
        
        
        //Title label
        ///*
        CGRect titleLabelFrame;
        titleLabelFrame.origin.x = self.scrollView.frame.origin.x;
        
        titleLabelFrame.origin.y = self.scrollView.frame.origin.y;
                                
        titleLabelFrame.size.width = self.scrollView.frame.size.width ;
        titleLabelFrame.size.height = 30.0 ;
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:titleLabelFrame];
        [titleLabel setText:[labelTexts objectAtIndex:i]];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        titleLabel.textColor = [UIColor orangeColor];
        titleLabel.backgroundColor = [UIColor viewFlipsideBackgroundColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        [subView addSubview:(UIView *)titleLabel];
        [titleLabel release];
        titleLabel = nil;
        //*/
        
        
        
        [subView release];
        subView = nil;
        
    }
    
    //set the whole scrollView size
    
    CGSize scrollViewTotalSize;
    scrollViewTotalSize =
    CGSizeMake
    (
     self.scrollView.frame.size.width * [images count],
     self.scrollView.frame.size.height
     );
    
    [[self scrollView]setContentSize:scrollViewTotalSize];
    
    //to avoid flickering while clicking the page control
    pageControlBeingUsed = NO;
    
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [images count];
}


#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (!pageControlBeingUsed) {
        
    
    //check how far you have scrolled
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = [self scrollView].frame.size.width;
    
    int page =
    floor
    (
     (
      self.scrollView.contentOffset.x - pageWidth/2
      )
     /
    pageWidth) + 1;
    
    self.pageControl.currentPage = page;
}
}

//on clicking page control dot got ot the appropriate page
- (IBAction)pageControlClicked:(id)sender {
    
    CGRect frame;
    frame.origin.x = [[self scrollView]frame].size.width * self.pageControl.currentPage ;
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    
    //self.pageControl.currentPageIndicatorTintColor =
    
    //move to that scroll
    [[self scrollView]scrollRectToVisible:frame animated:YES];
    pageControlBeingUsed = YES;
    
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlBeingUsed = NO;
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    pageControlBeingUsed = NO;
}
@end
