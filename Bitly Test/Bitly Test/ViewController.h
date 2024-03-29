//
//  ViewController.h
//  Bitly Test
//
//  Created by Brandon Tate on 11/28/11.
//  Copyright (c) 2011 Brandon Tate. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BTBitlyHelper.h"

@interface ViewController : UIViewController <BTBitlyHelperDelegate, UITextViewDelegate>


@property (nonatomic, retain)   IBOutlet    UITextView      *textView;
@property (nonatomic, retain)               BTBitlyHelper   *bitlyHelper;

- (void) shortenBlastTextUrls;

@end
