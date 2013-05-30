//
//  DKAssert.h
//  DevKit
//
//  Created by Andrew Koslow on 13.06.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef DevKit_DKAssert_h
#define DevKit_DKAssert_h


#ifndef DK_ENABLE_MACRO_ASSERT
#define DK_ENABLE_MACRO_ASSERT 0
#endif


#if DK_ENABLE_MACRO_ASSERT

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
#define DKAssertThreadMain() NSAssert([NSThread isMainThread] == YES, @"[NSThread isMainThread] == YES")
#define DKAssertThreadBackground() NSAssert([NSThread isMainThread] == NO, @"[NSThread isMainThread] == NO")

#else

#define DKAssert(e) do {} while (0)
#define DKAssertNil(e) do {} while (0)
#define DKAssertNotNil(e) do {} while (0)
#define DKAssertZero(e) do {} while (0)
#define DKAssertGreaterThanZero(e) do {} while (0)
#define DKAssertGreater(e1, e2) do {} while (0)
#define DKAssertLess(e1, e2) do {} while (0)
#define DKAssertGreaterOrEqual(e1, e2) do {} while (0)
#define DKAssertLessOrEqual(e1, e2) do {} while (0)
#define DKAssertEquals(e1, e2) do {} while (0)
#define DKAssertNotEquals(e1, e2) do {} while (0)
#define DKAssertNO(e) do {} while (0)
#define DKAssertYES(e) do {} while (0)
#define DKAssertResponds(o, s) do {} while (0)
#define DKAssertConforms(o, p) do {} while (0)
#define DKAssertClass(o, c) do {} while (0)
#define DKAssertThreadMain() do {} while (0)
#define DKAssertThreadBackground() do {} while (0)

#endif


#endif
