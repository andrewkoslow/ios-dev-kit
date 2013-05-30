//
//  DKDevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 04.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//


#ifndef DK_ENABLE_ALL

#ifdef DEBUG
#define DK_ENABLE_ALL DEBUG
#else
#define DK_ENABLE_ALL 0
#endif

#endif


#ifndef DK_ENABLE_MACRO
#define DK_ENABLE_MACRO DK_ENABLE_ALL
#endif

#ifndef DK_ENABLE_CATEGORIES
#define DK_ENABLE_CATEGORIES DK_ENABLE_ALL
#endif

#ifndef DK_ENABLE_DEBUGGER
#define DK_ENABLE_DEBUGGER DK_ENABLE_ALL
#endif

#import "Macro/DKMacro.h"
#import "Categories/DKCategories.h"
#import "Debugger/DKDebugger.h"
