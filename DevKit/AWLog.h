//
//  AWLog.h
//  AWDevKit
//
//  Created by Andrew Koslow on 13.06.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef AWDevKit_AWLog_h
#define AWDevKit_AWLog_h


#ifndef AW_LOG_ENABLE

#if defined(DEBUG) && DEBUG
#define AW_LOG_ENABLE DEBUG
#else
#define AW_LOG_ENABLE 0
#endif

#endif


#define AWLog(...) AWLogLev(AW_LOG_ENABLE, __VA_ARGS__)
#define AWLogF() AWLogLevF(AW_LOG_ENABLE)
#define AWLogM(M) AWLogLevM(AW_LOG_ENABLE, M)
#define AWLogS() AWLogLevS(AW_LOG_ENABLE)
#define AWLogV(M, ...) AWLogLevV(AW_LOG_ENABLE, M, __VA_ARGS__)


#if AW_LOG_ENABLE

#define AWLogLev(L, ...) if (L) { AWLogCA(L, VA_COUNT(__VA_ARGS__), __VA_ARGS__); }
#define AWLogLevF(L) if (L) { NSLog(@"%s", __PRETTY_FUNCTION__); }
#define AWLogLevM(L, M) if (L) { NSLog(@"%s --- %@", __PRETTY_FUNCTION__, M); }
#define AWLogLevS(L) if (L) { NSLog(@"-[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd)); }
#define AWLogLevV(L, M, ...) if (L) { AWLogVCA(L, M, VA_COUNT(__VA_ARGS__), __VA_ARGS__); }

#define AWLogCA(L, ARGS_COUNT, ...) AWLogCAVA(L, ARGS_COUNT, __VA_ARGS__)
#define AWLogCAVA(L, ARGS_COUNT, ...)\
do {\
    AWLogTmp ## ARGS_COUNT(__VA_ARGS__);\
    NSString *__argsString = [[NSArray arrayWithObjects:AWLogVal ## ARGS_COUNT(__VA_ARGS__), nil] componentsJoinedByString:@", "];\
    if (L) { NSLog(@"%s --- %@", __PRETTY_FUNCTION__, __argsString); };\
} while (0);

#define AWLogVCA(L, M, ARGS_COUNT, ...) AWLogVCAVA(L, M, ARGS_COUNT, __VA_ARGS__)
#define AWLogVCAVA(L, M, ARGS_COUNT, ...)\
do {\
    AWLogTmp ## ARGS_COUNT(__VA_ARGS__);\
    NSString *__argsString = [[NSArray arrayWithObjects:AWLogVal ## ARGS_COUNT(__VA_ARGS__), nil] componentsJoinedByString:@", "];\
    if (L) { NSLog(@"%s --- %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:@"%@: %@", M, __argsString]); };\
} while (0);

#define VA_COUNT(...) VA_COUNT_IMPL(__VA_ARGS__, 8, 7, 6, 5, 4, 3, 2, 1)
#define VA_COUNT_IMPL(_1,_2,_3,_4,_5,_6,_7,_8,N,...) N

#define AWLogTmp8(v1, v2, v3, v4, v5, v6, v7, v8) AWLogTmp(8, v1) AWLogTmp7(v2, v3, v4, v5, v6, v7, v8)
#define AWLogTmp7(v1, v2, v3, v4, v5, v6, v7) AWLogTmp(7, v1) AWLogTmp6(v2, v3, v4, v5, v6, v7)
#define AWLogTmp6(v1, v2, v3, v4, v5, v6) AWLogTmp(6, v1) AWLogTmp5(v2, v3, v4, v5, v6)
#define AWLogTmp5(v1, v2, v3, v4, v5) AWLogTmp(5, v1) AWLogTmp4(v2, v3, v4, v5)
#define AWLogTmp4(v1, v2, v3, v4) AWLogTmp(4, v1) AWLogTmp3(v2, v3, v4)
#define AWLogTmp3(v1, v2, v3) AWLogTmp(3, v1) AWLogTmp2(v2, v3)
#define AWLogTmp2(v1, v2) AWLogTmp(2, v1) AWLogTmp1(v2)
#define AWLogTmp1(v1) AWLogTmp(1, v1)
#define AWLogTmp(n, v) const __typeof(v) __attribute__((unused)) __tmp_val_ ## n = v; void const *__tmp_val_ptr_1 = &__tmp_val_1;

#define AWLogVal8(v1, v2, v3, v4, v5, v6, v7, v8) AWLogVal(8, v1), AWLogVal7(v2, v3, v4, v5, v6, v7, v8)
#define AWLogVal7(v1, v2, v3, v4, v5, v6, v7) AWLogVal(7, v1), AWLogVal6(v2, v3, v4, v5, v6, v7)
#define AWLogVal6(v1, v2, v3, v4, v5, v6) AWLogVal(6, v1), AWLogVal5(v2, v3, v4, v5, v6)
#define AWLogVal5(v1, v2, v3, v4, v5) AWLogVal(5, v1), AWLogVal4(v2, v3, v4, v5)
#define AWLogVal4(v1, v2, v3, v4) AWLogVal(4, v1), AWLogVal3(v2, v3, v4)
#define AWLogVal3(v1, v2, v3) AWLogVal(3, v1), AWLogVal2(v2, v3)
#define AWLogVal2(v1, v2) AWLogVal(2, v1), AWLogVal1(v2)
#define AWLogVal1(v1) AWLogVal(1, v1)

#define AWLogVal(n, v)\
(__builtin_types_compatible_p(__typeof(v), id) ? [NSString stringWithFormat:@"%s %@", #v, *(const id *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), Class) ? [NSString stringWithFormat:@"%s %@", #v, NSStringFromClass(*(Class *)__tmp_val_ptr_ ## n)]\
: (__builtin_types_compatible_p(__typeof(v), SEL) ? [NSString stringWithFormat:@"%s %@", #v, NSStringFromSelector(*(SEL *)__tmp_val_ptr_ ## n)]\
: (__builtin_types_compatible_p(__typeof(v), CGSize) ? [NSString stringWithFormat:@"%s %@", #v, NSStringFromCGSize(*(CGSize *)__tmp_val_ptr_ ## n)]\
: (__builtin_types_compatible_p(__typeof(v), CGPoint) ? [NSString stringWithFormat:@"%s %@", #v, NSStringFromCGPoint(*(CGPoint *)__tmp_val_ptr_ ## n)]\
: (__builtin_types_compatible_p(__typeof(v), CGRect) ? [NSString stringWithFormat:@"%s %@", #v, NSStringFromCGRect(*(CGRect *)__tmp_val_ptr_ ## n)]\
: (__builtin_types_compatible_p(__typeof(v), NSRange) ? [NSString stringWithFormat:@"%s %@", #v, NSStringFromRange(*(NSRange *)__tmp_val_ptr_ ## n)]\
: (__builtin_types_compatible_p(__typeof(v), UIEdgeInsets) ? [NSString stringWithFormat:@"%s %@", #v, NSStringFromUIEdgeInsets(*(UIEdgeInsets *)__tmp_val_ptr_ ## n)]\
: (__builtin_types_compatible_p(__typeof(v), NSUInteger) ? [NSString stringWithFormat:@"%s %u", #v, *(NSUInteger *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), NSInteger) ? [NSString stringWithFormat:@"%s %d", #v, *(NSInteger *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), CGFloat) ? [NSString stringWithFormat:@"%s %f", #v, *(CGFloat *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), int) ? [NSString stringWithFormat:@"%s %d", #v, *(int *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), uint) ? [NSString stringWithFormat:@"%s %u", #v, *(uint *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), char) ? [NSString stringWithFormat:@"%s %c", #v, *(char *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), unsigned int) ? [NSString stringWithFormat:@"%s %u", #v, *(unsigned int *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), long int) ? [NSString stringWithFormat:@"%s %ld", #v, *(long int *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), unsigned long int) ? [NSString stringWithFormat:@"%s %lu", #v, *(unsigned long int *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), long long int) ? [NSString stringWithFormat:@"%s %llu", #v, *(long long int *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), unsigned long long int) ? [NSString stringWithFormat:@"%s %llu", #v, *(unsigned long long int *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), float) ? [NSString stringWithFormat:@"%s %f", #v, *(float *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), double) ? [NSString stringWithFormat:@"%s %f", #v, *(double *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), long double) ? [NSString stringWithFormat:@"%s %Lf", #v, *(long double *)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), void *) ? [NSString stringWithFormat:@"%s %p", #v, *(void **)__tmp_val_ptr_ ## n]\
: (__builtin_types_compatible_p(__typeof(v), BOOL) ? [NSString stringWithFormat:@"%s %@", #v, ((*(BOOL *)__tmp_val_ptr_ ## n) ? @"YES" : @"NO")]\
: @"__UNKNOWN__TYPE__"\
))))))))))))))))))))))))

#else

#define AWLogLev(L, args...) do {} while (0)
#define AWLogLevF(L) do {} while (0)
#define AWLogLevM(L, M) do {} while (0)
#define AWLogLevS(L) do {} while (0)
#define AWLogLevV(L, M, ...) do {} while (0)

#endif


#endif
