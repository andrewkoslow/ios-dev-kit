//
//  DKCommon.h
//  DevKit
//
//  Created by Andrew Koslow on 10.01.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef DK_MACRO_COMMON
#define DK_MACRO_COMMON


#if (DK_MACRO_COMMON_ENABLE + 0)

#define UIUserInterfaceIdiomIsPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define UIUserInterfaceIdiomIsPhone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

#endif


#endif
