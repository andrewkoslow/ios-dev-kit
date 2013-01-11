//
//  DKLog.h
//  DevKit
//
//  Created by Andrew Koslow on 13.06.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef DevKit_DKLog_h
#define DevKit_DKLog_h


#ifndef DK_LOG_ENABLE

#if defined(DEBUG) && DEBUG
#define DK_LOG_ENABLE DEBUG
#else
#define DK_LOG_ENABLE 0
#endif

#endif


#define DKLog(...) DKLogLev(DK_LOG_ENABLE, __VA_ARGS__)
#define DKLogF() DKLogLevF(DK_LOG_ENABLE)
#define DKLogM(M) DKLogLevM(DK_LOG_ENABLE, M)
#define DKLogS() DKLogLevS(DK_LOG_ENABLE)
#define DKLogV(M, ...) DKLogLevV(DK_LOG_ENABLE, M, __VA_ARGS__)


#if DK_LOG_ENABLE

#define DKLogLev(L, ...) if (L) { DKLogCA(L, VA_COUNT(__VA_ARGS__), __VA_ARGS__); }
#define DKLogLevF(L) if (L) { NSLog(@"%s", __PRETTY_FUNCTION__); }
#define DKLogLevM(L, M) if (L) { NSLog(@"%s --- %@", __PRETTY_FUNCTION__, M); }
#define DKLogLevS(L) if (L) { NSLog(@"-[%@ %@]", NSStringFromClass([self class]), NSStringFromSelector(_cmd)); }
#define DKLogLevV(L, M, ...) if (L) { DKLogVCA(L, M, VA_COUNT(__VA_ARGS__), __VA_ARGS__); }

#define DKLogCA(L, ARGS_COUNT, ...) DKLogCAVA(L, ARGS_COUNT, __VA_ARGS__)
#define DKLogCAVA(L, ARGS_COUNT, ...)\
do {\
    DKLogTmp ## ARGS_COUNT(__VA_ARGS__);\
    NSString *__argsString = [[NSArray arrayWithObjects:DKLogVal ## ARGS_COUNT(__VA_ARGS__), nil] componentsJoinedByString:@", "];\
    if (L) { NSLog(@"%s --- %@", __PRETTY_FUNCTION__, __argsString); };\
} while (0);

#define DKLogVCA(L, M, ARGS_COUNT, ...) DKLogVCAVA(L, M, ARGS_COUNT, __VA_ARGS__)
#define DKLogVCAVA(L, M, ARGS_COUNT, ...)\
do {\
    DKLogTmp ## ARGS_COUNT(__VA_ARGS__);\
    NSString *__argsString = [[NSArray arrayWithObjects:DKLogVal ## ARGS_COUNT(__VA_ARGS__), nil] componentsJoinedByString:@", "];\
    if (L) { NSLog(@"%s --- %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:@"%@: %@", M, __argsString]); };\
} while (0);

#define VA_COUNT(...) VA_COUNT_IMPL(__VA_ARGS__, 8, 7, 6, 5, 4, 3, 2, 1)
#define VA_COUNT_IMPL(_1,_2,_3,_4,_5,_6,_7,_8,N,...) N

#define DKLogTmp8(v1, v2, v3, v4, v5, v6, v7, v8) DKLogTmp(8, v1) DKLogTmp7(v2, v3, v4, v5, v6, v7, v8)
#define DKLogTmp7(v1, v2, v3, v4, v5, v6, v7) DKLogTmp(7, v1) DKLogTmp6(v2, v3, v4, v5, v6, v7)
#define DKLogTmp6(v1, v2, v3, v4, v5, v6) DKLogTmp(6, v1) DKLogTmp5(v2, v3, v4, v5, v6)
#define DKLogTmp5(v1, v2, v3, v4, v5) DKLogTmp(5, v1) DKLogTmp4(v2, v3, v4, v5)
#define DKLogTmp4(v1, v2, v3, v4) DKLogTmp(4, v1) DKLogTmp3(v2, v3, v4)
#define DKLogTmp3(v1, v2, v3) DKLogTmp(3, v1) DKLogTmp2(v2, v3)
#define DKLogTmp2(v1, v2) DKLogTmp(2, v1) DKLogTmp1(v2)
#define DKLogTmp1(v1) DKLogTmp(1, v1)
#define DKLogTmp(n, v) const __typeof(v) __attribute__((unused)) __tmp_val_ ## n = v; void const *__tmp_val_ptr_ ## n = &__tmp_val_ ## n;

#define DKLogVal8(v1, v2, v3, v4, v5, v6, v7, v8) DKLogVal(8, v1), DKLogVal7(v2, v3, v4, v5, v6, v7, v8)
#define DKLogVal7(v1, v2, v3, v4, v5, v6, v7) DKLogVal(7, v1), DKLogVal6(v2, v3, v4, v5, v6, v7)
#define DKLogVal6(v1, v2, v3, v4, v5, v6) DKLogVal(6, v1), DKLogVal5(v2, v3, v4, v5, v6)
#define DKLogVal5(v1, v2, v3, v4, v5) DKLogVal(5, v1), DKLogVal4(v2, v3, v4, v5)
#define DKLogVal4(v1, v2, v3, v4) DKLogVal(4, v1), DKLogVal3(v2, v3, v4)
#define DKLogVal3(v1, v2, v3) DKLogVal(3, v1), DKLogVal2(v2, v3)
#define DKLogVal2(v1, v2) DKLogVal(2, v1), DKLogVal1(v2)
#define DKLogVal1(v1) DKLogVal(1, v1)

#define DKLogVal(n, v)\
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

#define DKLogLev(L, args...) do {} while (0)
#define DKLogLevF(L) do {} while (0)
#define DKLogLevM(L, M) do {} while (0)
#define DKLogLevS(L) do {} while (0)
#define DKLogLevV(L, M, ...) do {} while (0)

#endif


#endif
