//
//  DKDebuggerController.m
//  DevKit
//
//  Created by Andrew Koslow on 29.05.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#if (DK_DEBUGGER_ENABLE + 0)


#import "DKDebuggerController.h"
#import "DKDebuggerConsoleController.h"


@implementation DKDebuggerController


static UIWindow __strong *debuggerWindow = nil;


+ (void)present {
    if (debuggerWindow) return;
    
    debuggerWindow = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    debuggerWindow.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    debuggerWindow.autoresizesSubviews = YES;
    debuggerWindow.backgroundColor = [UIColor clearColor];
    
    DKDebuggerController *debuggerController = [[[self class] alloc] initWithStyle:UITableViewStyleGrouped];
    debuggerController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:[self class] action:@selector(dismiss)];
    
    debuggerWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:debuggerController];
    
    [debuggerWindow makeKeyAndVisible];
}


+ (void)dismiss {
    [debuggerWindow resignKeyWindow];
    debuggerWindow = nil;
}


- (BOOL)wantsFullScreenLayout {
    return YES;
}


- (NSString *)title {
    return @"Dev Kit Debugger";
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Console";
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    UIViewController *controller = nil;
    
    if (indexPath.row == 0) {
        controller = [DKDebuggerConsoleController new];
    }
    
    controller.title = cell.textLabel.text;
    
    [self.navigationController pushViewController:controller animated:YES];
}


@end


#endif
