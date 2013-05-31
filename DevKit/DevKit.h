//
//  DKDevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 04.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//


#ifndef DK_ENABLE

#ifdef DEBUG
#define DK_ENABLE DEBUG
#else
#define DK_ENABLE 0
#endif

#endif


#ifndef DK_MACRO_ENABLE
#define DK_MACRO_ENABLE DK_ENABLE
#endif

#ifndef DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_ENABLE DK_ENABLE
#endif

#ifndef DK_DEBUGGER_ENABLE
#define DK_DEBUGGER_ENABLE DK_ENABLE
#endif


#import "Macro/DKMacro.h"
#import "Categories/DKCategories.h"
#import "Debugger/DKDebugger.h"
