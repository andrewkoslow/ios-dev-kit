//
//  AWAssert.h
//  DevKit
//
//  Created by Andrew Koslow on 13.06.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef AWDevKit_AWAssert_h
#define AWDevKit_AWAssert_h


#define AWAssert(e) NSAssert(e, @#e)
#define AWAssertNil(e) NSAssert(e == nil, @#e" == nil")
#define AWAssertNotNil(e) NSAssert(e != nil, @#e" != nil")
#define AWAssertZero(e) NSAssert(e == 0, @#e" == 0")
#define AWAssertGreaterThanZero(e) NSAssert(e > 0, @#e" > 0")
#define AWAssertGreater(e1, e2) NSAssert(e1 > e2, @#e1" > "#e2)
#define AWAssertLess(e1, e2) NSAssert(e1 < e2, @#e1" < "#e2)
#define AWAssertGreaterOrEqual(e1, e2) NSAssert(e1 >= e2, @#e1" >= "#e2)
#define AWAssertLessOrEqual(e1, e2) NSAssert(e1 <= e2, @#e1" <= "#e2)
#define AWAssertEquals(e1, e2) NSAssert(e1 == e2, @#e1" == "#e2)
#define AWAssertNotEquals(e1, e2) NSAssert(e1 != e2, @#e1" != "#e2)
#define AWAssertNO(e) NSAssert(e == NO, @#e" == NO")
#define AWAssertYES(e) NSAssert(e == YES, @#e" == YES")
#define AWAssertResponds(o, s) NSAssert1(o == nil || [o respondsToSelector:s], @""#o" == nil || ["#o" respondsToSelector:(%@)]", NSStringFromSelector(s))
#define AWAssertConforms(o, p) NSAssert1(o == nil || [o conformsToProtocol:@protocol(p)], @""#o" == nil || ["#o" conformsToProtocol:(%@)]", NSStringFromProtocol(@protocol(p)))
#define AWAssertClass(o, c) NSAssert(o == nil || [o isKindOfClass:[c class]], @""#o" == nil || ["#o" isKindOfClass:["#c" class]]")


#endif
