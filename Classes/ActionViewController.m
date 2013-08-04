//
//  ActionViewController.m
//  tableView-Home
//
//  Created by lockUp on 7/31/13.
//
//

#import "ActionViewController.h"

@interface ActionViewController ()

@end

@implementation ActionViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissTheModal:(id)sender {
    
    //[self dismissModalViewControllerAnimated:YES];
    [[self view]removeFromSuperview];
    [self removeFromParentViewController];
}
@end
