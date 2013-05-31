//
//  DKDebuggerConsoleController.m
//  DevKit
//
//  Created by Andrew Koslow on 29.05.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#if defined(DK_DEBUGGER_ENABLE) && DK_DEBUGGER_ENABLE


#import "DKDebuggerConsoleController.h"
#import "DKDebuggerConsole.h"
#import <MessageUI/MessageUI.h>


@interface DKDebuggerConsoleController () <UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

@property (retain) UITextView *textView;

@end


@implementation DKDebuggerConsoleController


- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.textView.editable = NO;
    self.textView.font = [UIFont fontWithName:@"Courier New" size:13.0];
    
    [self.view addSubview:self.textView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(showActionSheet)];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:DKDebuggerConsoleDidUpdateLogNotification object:nil];
    
    [self reloadData];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:DKDebuggerConsoleDidUpdateLogNotification object:nil];
}


- (void)reloadData {
    NSString *newLog = [DKDebuggerConsole sharedConsole].log;
    NSString *oldLog = self.textView.text;
    
    BOOL scroll = (self.textView.contentOffset.y >= (self.textView.contentSize.height + self.textView.contentInset.bottom - self.textView.bounds.size.height));
    
    if ([oldLog isEqualToString:newLog] == NO) {
        self.textView.text = newLog;
        
        if (scroll) {
            CGPoint contentOffset = self.textView.contentOffset;
            contentOffset.y = (self.textView.contentSize.height + self.textView.contentInset.bottom - self.textView.bounds.size.height);
            self.textView.contentOffset = contentOffset;
        }
    }
}


- (NSString *)logTextToPerformAction {
    NSString *text = [self.textView textInRange:self.textView.selectedTextRange];
    if (text.length == 0) text = [DKDebuggerConsole sharedConsole].log;
    if (text.length == 0) text = @"";
    
    return text;
}


- (void)copyLogToPasteboard {
    [[UIPasteboard generalPasteboard] setString:self.logTextToPerformAction];
}


- (void)mailLog {
    NSString *bundleName = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey];
    NSString *bundleVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString *bundleBuild = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateStyle = NSDateFormatterShortStyle;
    dateFormatter.timeStyle = NSDateFormatterShortStyle;
    
    NSString *date = [dateFormatter stringFromDate:[NSDate date]];
    NSString *subject = [NSString stringWithFormat:@"%@ %@ (%@) %@", bundleName, bundleVersion, bundleBuild, date];
    
    MFMailComposeViewController *mailComposeViewController = [MFMailComposeViewController new];
    mailComposeViewController.mailComposeDelegate = self;
    mailComposeViewController.subject = subject;
    [mailComposeViewController setMessageBody:self.logTextToPerformAction isHTML:NO];
    
    [self presentViewController:mailComposeViewController animated:YES completion:nil];
}


- (void)clearLog {
    [[DKDebuggerConsole sharedConsole] clearLog];
    [self reloadData];
}


- (void)showActionSheet {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Copy", @"Mail…", @"Clear", nil];
    [actionSheet showFromBarButtonItem:self.navigationItem.rightBarButtonItem animated:YES];
}


- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) [self copyLogToPasteboard];
    else if (buttonIndex == 1) [self mailLog];
    else if (buttonIndex == 2) [self clearLog];
}


- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [controller dismissViewControllerAnimated:YES completion:nil];
}


@end


#endif
