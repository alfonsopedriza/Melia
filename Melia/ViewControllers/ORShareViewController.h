//
//  ORShareViewController.h
//  Melia
//
//  Created by orta therox on 16/08/2012.
//  Copyright (c) 2012 orta therox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>

@interface ORShareViewController : UIViewController <FBLoginViewDelegate>

@property (strong, nonatomic) NSArray* photoPaths;

- (IBAction)shareFacebook:(id)sender;
- (IBAction)shareTwitter:(id)sender;
- (IBAction)shareEmail:(id)sender;

@end
