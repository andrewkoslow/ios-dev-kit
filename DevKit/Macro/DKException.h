//
//  DKException.h
//  DevKit
//
//  Created by Andrew Koslow on 16.06.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef DK_MACRO_EXCEPTION
#define DK_MACRO_EXCEPTION


#if (DK_MACRO_EXCEPTION_ENABLE + 0)

#define DKUnimplemented() [NSException raise:NSInternalInconsistencyException format:@"method ~[%@ %@] unimplemented", NSStringFromClass([self class]), NSStringFromSelector(_cmd)]
#define DKInternalInconsistency() [NSException raise:NSInternalInconsistencyException format:@"internal inconsistency in -[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd)]

#endif


#endif
