//
//  TUTorialViewController.h
//  tableView-Home
//
//  Created by marJinn on 02/08/13.
//
//

#import <UIKit/UIKit.h>

@interface TUTorialViewController : UIViewController <UIScrollViewDelegate>

{
    UIScrollView *scrollView;
    
    UIPageControl *pageControl;
    
    BOOL pageControlBeingUsed;
}

@property(nonatomic,retain)IBOutlet UIScrollView *scrollView;
@property(nonatomic,retain)IBOutlet UIPageControl *pageControl;
- (IBAction)pageControlClicked:(id)sender;
@end
