//
//  DKAssert.h
//  DevKit
//
//  Created by Andrew Koslow on 13.06.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef DevKit_DKAssert_h
#define DevKit_DKAssert_h


#define DKAssert(e) NSAssert(e, @#e)
#define DKAssertNil(e) NSAssert(e == nil, @#e" == nil")
#define DKAssertNotNil(e) NSAssert(e != nil, @#e" != nil")
#define DKAssertZero(e) NSAssert(e == 0, @#e" == 0")
#define DKAssertGreaterThanZero(e) NSAssert(e > 0, @#e" > 0")
#define DKAssertGreater(e1, e2) NSAssert(e1 > e2, @#e1" > "#e2)
#define DKAssertLess(e1, e2) NSAssert(e1 < e2, @#e1" < "#e2)
#define DKAssertGreaterOrEqual(e1, e2) NSAssert(e1 >= e2, @#e1" >= "#e2)
#define DKAssertLessOrEqual(e1, e2) NSAssert(e1 <= e2, @#e1" <= "#e2)
#define DKAssertEquals(e1, e2) NSAssert(e1 == e2, @#e1" == "#e2)
#define DKAssertNotEquals(e1, e2) NSAssert(e1 != e2, @#e1" != "#e2)
#define DKAssertNO(e) NSAssert(e == NO, @#e" == NO")
#define DKAssertYES(e) NSAssert(e == YES, @#e" == YES")
#define DKAssertResponds(o, s) NSAssert1(o == nil || [o respondsToSelector:s], @""#o" == nil || ["#o" respondsToSelector:(%@)]", NSStringFromSelector(s))
#define DKAssertConforms(o, p) NSAssert1(o == nil || [o conformsToProtocol:@protocol(p)], @""#o" == nil || ["#o" conformsToProtocol:(%@)]", NSStringFromProtocol(@protocol(p)))
#define DKAssertClass(o, c) NSAssert(o == nil || [o isKindOfClass:[c class]], @""#o" == nil || ["#o" isKindOfClass:["#c" class]]")


#endif
