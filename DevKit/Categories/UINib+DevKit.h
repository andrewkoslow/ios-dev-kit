//
//  UINib+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UINib (DevKit)

- (id)instantiatedWithOwner:(id)owner objectOfClass:(Class)objectClass;

@end
