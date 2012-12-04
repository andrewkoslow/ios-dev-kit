//
//  AWException.h
//  AWDevKit
//
//  Created by Andrew Koslow on 16.06.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef AWDevKit_AWException_h
#define AWDevKit_AWException_h


#define AWUnimplemented() [NSException raise:NSInternalInconsistencyException format:@"method -[%@ %@] unimplemented", NSStringFromClass([self class]), NSStringFromSelector(_cmd)]
#define AWInternalInconsistency() [NSException raise:NSInternalInconsistencyException format:@"internal inconsistency in -[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd)]


#endif
