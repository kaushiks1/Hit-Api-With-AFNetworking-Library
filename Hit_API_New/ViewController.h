//
//  ViewController.h
//  Hit_API_New
//
//  Created by Kaushik on 20/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSNumber *currentPage;
@property (nonatomic, strong) NSNumber *recordsPerPage;


- (IBAction)buttonActionClickToHitAPI:(id)sender;

@end

