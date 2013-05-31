//
//  DKMacro.h
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//


#ifndef DK_MACRO_ENABLE
#define DK_MACRO_ENABLE 0
#endif

#ifndef DK_MACRO_ASSERT_ENABLE
#define DK_MACRO_ASSERT_ENABLE DK_MACRO_ENABLE
#endif

#ifndef DK_MACRO_EXCEPTION_ENABLE
#define DK_MACRO_EXCEPTION_ENABLE DK_MACRO_ENABLE
#endif

#ifndef DK_MACRO_LOG_ENABLE
#define DK_MACRO_LOG_ENABLE DK_MACRO_ENABLE
#endif

#ifndef DK_MACRO_COMMON_ENABLE
#define DK_MACRO_COMMON_ENABLE DK_MACRO_ENABLE
#endif

#ifndef DK_MACRO_GEOMETRY_ENABLE
#define DK_MACRO_GEOMETRY_ENABLE DK_MACRO_ENABLE
#endif


#import "DKAssert.h"
#import "DKException.h"
#import "DKLog.h"
#import "DKCommon.h"
#import "DKGeometry.h"
