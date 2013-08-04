//
//  tableItemCell.m
//  tableView-Home
//
//  Created by theNotSoBrightLazyNovice on 7/2/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "tableItemCell.h"
#import "Possession.h"

@implementation tableItemCell

@synthesize valueLabel;
@synthesize  nameLabel;
@synthesize  imageView;


- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	
	if (self) {
		//create a subview - no need for position/size
		valueLabel = [[UILabel alloc]initWithFrame:CGRectZero];
		//add it it to the content view
		[[self contentView]addSubview:valueLabel];
		//release as it has been retained by its superview
		[valueLabel release];
		valueLabel =nil;
		
		nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
		[[self contentView]addSubview:nameLabel];
		[nameLabel release];
		nameLabel = nil;
		
		imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
		[[self contentView]addSubview:imageView];
		
		
		//make the image view to center its image inside the frame
		[imageView setContentMode:UIViewContentModeCenter];
		[imageView release];
		imageView = nil;
		
	}
	
	return self;
}


//When a view size changes ,it is sent the message "layoutSubviews
//So tableview cell is also sent that meeasge

//we give subviews  aframe
-(void)layoutSubviews
{
	//always first
	[super layoutSubviews];
	
	//add spacing between borders
	float inset = 5.0;
	
	//space we have to work with
	CGRect bounds = [[self contentView]bounds]; 
	//this is essentially the size of the UITABLEVIEWCELL
	
	//height and width of the cell
	float h = bounds.size.height; 
	float w = bounds.size.width;
	
	//set the width of the value Field
	float valueWidth = 40.0;
	
	//create a rect on the left handside for the imageView
	CGRect imageFrame = CGRectMake(inset, inset, 40, 40);
	[imageView setFrame:imageFrame];
	
	//create a rect in the middle for the name
	//origin x = width of imageFrame + origin x of image frame + spacing between borders
	//origin y = spacing between borders
	//width = width of cell - (height of cell + width of value field + spacing between borders *4.0)
	//height = height of cell - spacing between borders * 2.0
	CGRect nameFrame = CGRectMake(imageFrame.size.width + imageFrame.origin.x + inset, 
									inset, w - (h + valueWidth + inset + 4.0),
												h - inset * 2.0);
	[nameLabel setFrame:nameFrame];
	
	//create  arect on the right side of teh cell for teh value
	CGRect valueFrame = CGRectMake(nameFrame.size.width + nameFrame.origin.x
								   +inset, 
								   inset,valueWidth, h - inset * 2.0);
	[valueLabel setFrame:valueFrame];
	
								  
}


-(void)setPossession:(Possession *)possession
{
	[valueLabel setText:[NSString stringWithFormat:@"%d",[possession valueInDollars]]];
	[nameLabel setText:[possession possessionName]];
}
@end
