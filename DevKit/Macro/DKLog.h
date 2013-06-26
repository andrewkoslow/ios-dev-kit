//
//  DKLog.h
//  DevKit
//
//  Created by Andrew Koslow on 13.06.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef DK_MACRO_LOG
#define DK_MACRO_LOG


#if (DK_MACRO_LOG_LOG_TO_DEBUGGER_CONSOLE + 0)
#define ____DKConsoleLog(format...) DKConsoleLog(format)
#else
#define ____DKConsoleLog(...) do {} while (0)
#endif


#define DKLog(variables...) DKLogSV(variables)
#define DKLogM(message) DKLogSevMes(DK_MACRO_LOG_ENABLE, message)
#define DKLogV(variables...) DKLogSevVars(DK_MACRO_LOG_ENABLE, variables)
#define DKLogF() DKLogSevFunc(DK_MACRO_LOG_ENABLE)
#define DKLogS() DKLogSevSel(DK_MACRO_LOG_ENABLE)
#define DKLogSM(message) DKLogSevSelMes(DK_MACRO_LOG_ENABLE, message)
#define DKLogSV(variables...) DKLogSevSelVars(DK_MACRO_LOG_ENABLE, variables)


#if (DK_MACRO_LOG_ENABLE + 0)

#define DKLogSevMes(severity, message) if (severity) {\
    NSLog(@"%@", message);\
    ____DKConsoleLog(message);\
}

#define DKLogSevVars(severity, variables...) if (severity) { ____DKLogSevVarsArgs(severity, ____DKLogArgCount(variables), variables); }

#define DKLogSevFunc(severity) if (severity) {\
    NSLog(@"%s", __PRETTY_FUNCTION__);\
    ____DKConsoleLog(@"%s", __PRETTY_FUNCTION__);\
}

#define DKLogSevSel(severity) if (severity) {\
    NSLog(@"%@[%@ %@]", ((self == self.class) ? @"+" : @"-"), NSStringFromClass([self class]), NSStringFromSelector(_cmd));\
    ____DKConsoleLog(@"%@[%@ %@]", ((self == self.class) ? @"+" : @"-"), NSStringFromClass([self class]), NSStringFromSelector(_cmd));\
}

#define DKLogSevSelMes(severity, message) if (severity) {\
    NSLog(@"%@[%@ %@] --- %@", ((self == self.class) ? @"+" : @"-"), NSStringFromClass([self class]), NSStringFromSelector(_cmd), message);\
    ____DKConsoleLog(@"%@[%@ %@] --- %@", ((self == self.class) ? @"+" : @"-"), NSStringFromClass([self class]), NSStringFromSelector(_cmd), message);\
}

#define DKLogSevSelVars(severity, variables...) if (severity) { ____DKLogSevSelVarsArgs(severity, ____DKLogArgCount(variables), variables); }


#define ____DKLogSevVarsArgs(S, ARG_COUNT, ...) ____DKLogSevVarsImpl(S, ARG_COUNT, __VA_ARGS__)
#define ____DKLogSevVarsImpl(S, ARG_COUNT, ...)\
do {\
    ____DKLogTmp ## ARG_COUNT(__VA_ARGS__);\
    NSString *__argsString = [[NSArray arrayWithObjects:____DKLogVal ## ARG_COUNT(__VA_ARGS__), nil] componentsJoinedByString:@", "];\
    if (S) {\
        NSLog(@"%@", __argsString);\
        ____DKConsoleLog(@"%@", __argsString);\
    };\
} while (0);


#define ____DKLogSevSelVarsArgs(S, ARG_COUNT, ...) ____DKLogSevSelVarsImpl(S, ARG_COUNT, __VA_ARGS__)
#define ____DKLogSevSelVarsImpl(S, ARG_COUNT, ...)\
do {\
    ____DKLogTmp ## ARG_COUNT(__VA_ARGS__);\
    NSString *__argsString = [[NSArray arrayWithObjects:____DKLogVal ## ARG_COUNT(__VA_ARGS__), nil] componentsJoinedByString:@", "];\
    if (S) {\
        NSLog(@"%@[%@ %@] --- %@", ((self == self.class) ? @"+" : @"-"), NSStringFromClass([self class]), NSStringFromSelector(_cmd), __argsString);\
        ____DKConsoleLog(@"%@[%@ %@] --- %@", ((self == self.class) ? @"+" : @"-"), NSStringFromClass([self class]), NSStringFromSelector(_cmd), __argsString);\
    };\
} while (0);


#define ____DKLogArgCount(...) ____DKLogArgCountImpl(__VA_ARGS__, 8, 7, 6, 5, 4, 3, 2, 1)
#define ____DKLogArgCountImpl(_1,_2,_3,_4,_5,_6,_7,_8,N,...) N

#define ____DKLogTmp8(v1, v2, v3, v4, v5, v6, v7, v8) ____DKLogTmp(8, v1) ____DKLogTmp7(v2, v3, v4, v5, v6, v7, v8)
#define ____DKLogTmp7(v1, v2, v3, v4, v5, v6, v7) ____DKLogTmp(7, v1) ____DKLogTmp6(v2, v3, v4, v5, v6, v7)
#define ____DKLogTmp6(v1, v2, v3, v4, v5, v6) ____DKLogTmp(6, v1) ____DKLogTmp5(v2, v3, v4, v5, v6)
#define ____DKLogTmp5(v1, v2, v3, v4, v5) ____DKLogTmp(5, v1) ____DKLogTmp4(v2, v3, v4, v5)
#define ____DKLogTmp4(v1, v2, v3, v4) ____DKLogTmp(4, v1) ____DKLogTmp3(v2, v3, v4)
#define ____DKLogTmp3(v1, v2, v3) ____DKLogTmp(3, v1) ____DKLogTmp2(v2, v3)
#define ____DKLogTmp2(v1, v2) ____DKLogTmp(2, v1) ____DKLogTmp1(v2)
#define ____DKLogTmp1(v1) ____DKLogTmp(1, v1)
#define ____DKLogTmp(n, v) const __typeof(v) __attribute__((unused)) __tmp_val_ ## n = v; void const *__tmp_val_ptr_ ## n = &__tmp_val_ ## n;

#define ____DKLogVal8(v1, v2, v3, v4, v5, v6, v7, v8) ____DKLogVal(8, v1), ____DKLogVal7(v2, v3, v4, v5, v6, v7, v8)
#define ____DKLogVal7(v1, v2, v3, v4, v5, v6, v7) ____DKLogVal(7, v1), ____DKLogVal6(v2, v3, v4, v5, v6, v7)
#define ____DKLogVal6(v1, v2, v3, v4, v5, v6) ____DKLogVal(6, v1), ____DKLogVal5(v2, v3, v4, v5, v6)
#define ____DKLogVal5(v1, v2, v3, v4, v5) ____DKLogVal(5, v1), ____DKLogVal4(v2, v3, v4, v5)
#define ____DKLogVal4(v1, v2, v3, v4) ____DKLogVal(4, v1), ____DKLogVal3(v2, v3, v4)
#define ____DKLogVal3(v1, v2, v3) ____DKLogVal(3, v1), ____DKLogVal2(v2, v3)
#define ____DKLogVal2(v1, v2) ____DKLogVal(2, v1), ____DKLogVal1(v2)
#define ____DKLogVal1(v1) ____DKLogVal(1, v1)

#define ____DKLogVal(n, v)\
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
: @"<Unknown Type>"\
))))))))))))))))))))))))

#else

#define DKLogSevMes(DK_MACRO_LOG_ENABLE, message) do {} while (0)
#define DKLogSevVars(DK_MACRO_LOG_ENABLE, variables) do {} while (0)
#define DKLogSevFunc(DK_MACRO_LOG_ENABLE) do {} while (0)
#define DKLogSevSel(DK_MACRO_LOG_ENABLE) do {} while (0)
#define DKLogSevSelMes(DK_MACRO_LOG_ENABLE, message) do {} while (0)
#define DKLogSevSelVars(DK_MACRO_LOG_ENABLE, variables) do {} while (0)

#endif


#endif
