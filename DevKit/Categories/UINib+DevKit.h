//
//  UINib+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_UI_NIB_ENABLE + 0)


#import <UIKit/UIKit.h>


@interface UINib (DevKit)

- (id)instantiatedWithOwner:(id)owner objectOfClass:(Class)objectClass;

@end


#endif
