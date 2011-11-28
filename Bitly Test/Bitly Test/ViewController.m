//
//  ViewController.m
//  Bitly Test
//
//  Created by Brandon Tate on 11/28/11.
//  Copyright (c) 2011 Ironworks Consulting. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize bitlyHelper=_bitlyHelper, textView=_textView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void) dealloc{
    [_bitlyHelper release]; _bitlyHelper = nil;
    [_textView release]; _textView = nil;
    [super dealloc];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



#pragma mark - UITextViewDelegate Methods

- (void) textViewDidChange:(UITextView *)textView{
    
    // For now let's check on " "
    if (self.textView.text.length > 0) {
        
        // Get the last character
        unichar last = [self.textView.text characterAtIndex:[self.textView.text length] - 1];
        
        // Check it against white space and new line
        if ([[NSCharacterSet whitespaceAndNewlineCharacterSet] characterIsMember:last]) {
            [self shortenBlastTextUrls];
        }
    }
}



#pragma mark - Bitly Methods

/**
 *  Checks the blast text, extracts any urls that may need changing, and sends them to bit.ly.
 */
- (void) shortenBlastTextUrls{
    
    // Create bit.ly helper if nil
    if (self.bitlyHelper == nil) {
        self.bitlyHelper = [[[BTBitlyHelper alloc] init] autorelease];
        self.bitlyHelper.delegate = self;
    }
    
    [self.bitlyHelper shortenURLSInText:self.textView.text];
    
}


#pragma mark - Bitly Helper Delegate Methods

/**
 *  Receives the shortened url for the given original url.
 *
 *  @param  shortUrl    The short url received from bit.ly.
 *  @param  originalUrl The original url given to bit.ly.
 */
- (void) BTBitlyShortUrl: (NSString *) shortUrl receivedForOriginalUrl: (NSString *) originalUrl{
    
    // Replace and update the char count
    self.textView.text = [self.textView.text stringByReplacingOccurrencesOfString:originalUrl withString:shortUrl];
    
    
}


/**
 *  Called when the queue starts processing.
 */
- (void) BTBitlyQueueStartedProcessing{
    
    
}


/**
 *  Called when the queue is done processing.
 */
- (void) BTBitlyQueueFinishedProcessing{
    
}


@end
