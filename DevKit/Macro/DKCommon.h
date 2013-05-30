//
//  DKCommon.h
//  DevKit
//
//  Created by Andrew Koslow on 10.01.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef DevKit_DKCommon_h
#define DevKit_DKCommon_h


#ifndef DK_ENABLE_MACRO_COMMON
#define DK_ENABLE_MACRO_COMMON 0
#endif


#if DK_ENABLE_MACRO_COMMON

#define UIUserInterfaceIdiomIsPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define UIUserInterfaceIdiomIsPhone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)

#endif


#endif
