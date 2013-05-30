//
//  DKException.h
//  DevKit
//
//  Created by Andrew Koslow on 16.06.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef DevKit_DKException_h
#define DevKit_DKException_h


#ifndef DK_ENABLE_MACRO_EXCEPTION
#define DK_ENABLE_MACRO_EXCEPTION 0
#endif


#if DK_ENABLE_MACRO_EXCEPTION

#define DKUnimplemented() [NSException raise:NSInternalInconsistencyException format:@"method -[%@ %@] unimplemented", NSStringFromClass([self class]), NSStringFromSelector(_cmd)]
#define DKInternalInconsistency() [NSException raise:NSInternalInconsistencyException format:@"internal inconsistency in -[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd)]

#endif


#endif
