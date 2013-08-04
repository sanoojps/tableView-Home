//
//  Possession.m
//  RandomPossession
//
//  Created by lockUp on 6/18/13.
//  Copyright (c) 2013 lockUp. All rights reserved.
//

#import "Possession.h"

@implementation Possession
@synthesize valueInDollars;

//SETTERS and GETTERS
-(void)setPossessionName:(NSString *)pName
{
    [pName retain];
    [possessionName release];
    possessionName =  pName;
}
-(NSString *)possessionName
{
    return possessionName;
}

-(void)setSerialNumber:(NSString *)sNo;
{
    [sNo retain];
    [serialNumber release];
    serialNumber = sNo;
}
-(NSString *)serialNumber
{
    return serialNumber;
}


//-(void)setValueInDollars:(int)vInDollar
//{
  //  valueInDollars = vInDollar;
//}
//-(int)vauleInDollars
//{
    //return valueInDollars;
//}
 

/* not requred as date instance is cretaed by Possessio class
 * during INIT
 
-(void)setDateCreated:(NSDate *)dateCr
{
    [dateCr retain];
    [dateCreated release];
    dateCreated = dateCr;
}
-(NSDate *)dateCreated
{
    return dateCreated;
}

 */
 
#pragma mark -
#pragma mark CODING

//ENCODING
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:self.possessionName forKey:@"possessionName"];
    [aCoder encodeObject:self.serialNumber forKey:@"serialNumber"];
    [aCoder encodeObject:self->dateCreated forKey:@"dateCreated"];
    
}

//DECODING

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        
    
    possessionName = [aDecoder decodeObjectForKey:@"possessionName"];
     serialNumber = [aDecoder decodeObjectForKey:@"serialNumber"];
     dateCreated = [aDecoder decodeObjectForKey:@"dateCreated"];
    }
    return self ;
}


#pragma mark -
#pragma mark Cleanup

//Cleanup
-(void)dealloc
{
	[possessionName release];
	[serialNumber release];
    [dateCreated release];
    [super dealloc];
}
@end
