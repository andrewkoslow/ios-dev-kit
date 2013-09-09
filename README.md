General
=======

### What is iOS Development Kit?

Dev Kit is neither a framework nor library, it is simply a collection of macros, class
categories and functions.

It consist of:
* Assertion and exception macros;
* [Logging macros](#simplified-logging);
* Geometry structs manipulation macros;
* Collection class categories;
* `UIView` geometry category based on geometry macros;
* `NSObject` [KVO](#nsobject-category-for-kvo) and
[notification](#nsobject-category-for-notifications) category;
* Other `NS` and `UI` class categories;
* Runtime manipulation functions;
* Debugging UI console.


### Requirements

* ARC;
* depending on options:
  * `Foundation.framework`;
  * `UIKit.framework`;
  * `CoreGraphics.framework`;
  * `MessageUI.framework`.


### Setup

1. Import `DevKit` folder to your project;
2. In `<target>-Prefix.pch` file:
   * add `#import "DevKit.h"`;
   * `#define` [options](#options) if necessary;
3. Link required frameworks.


### Structure

* [`DevKit.h`](DevKit/DevKit.h) imports
  * [`DevKitConfig.h`](DevKit/DevKitConfig.h)
  * [`Categories/DKCategories.h`](DevKit/Categories/DKCategories.h)
  * [`Debugger/DKDebugger.h`](DevKit/Debugger/DKDebugger.h)
  * [`Macro/DKMacro.h`](DevKit/Macro/DKMacro.h)
  * [`Runtime/DKRuntime.h`](DevKit/Runtime/DKRuntime.h)
* [`Categories`](DevKit/Categories/) contains
  * [`DKCategories.h`](DevKit/Categories/DKCategories.h)
  common header, imports `Categories/*.h`
  * concrete `*.(h|m)` files
* [`Debugger`](DevKit/Debugger/) contains
  * [`DKDebugger.h`](DevKit/Debugger/DKDebugger.h)
  common header, imports `Debugger/*.h`
  * concrete `*.(h|m)` files
* [`Macro`](DevKit/Macro/) contains
  * [`DKMacro.h`](DevKit/Macro/DKMacro.h)
  common header, imports `Macro/*.h`
  * concrete `*.(h|m)` files
* [`Runtime`](DevKit/Runtime/) contains
  * [`DKRuntime.h`](DevKit/Runtime/DKRuntime.h)
  common header, imports `Runtime/*.h`
  * concrete `*.(h|m)` files


### Options

All available options are defined in [`DevKit/DevKitConfig.h`](DevKit/DevKitConfig.h).

`*_ENABLE` options are switches of modules for compilation. For example, if you
`#define DK_RUNTIME_EXTENSION_ENABLE 0` all of the code from
`DKRuntimeExtension.(h|m)` become unavailable and will not be included to the binary.

By default `*_ENABLE` options has hierarchical dependency.

```Objective-C
// enable entire Dev Kit
#define DK_ENABLE                                           DEBUG

// ---------------------------------------------------------------------------------------
// enable all macros
#define DK_MACRO_ENABLE                                     DK_ENABLE
#define DK_MACRO_ASSERT_ENABLE                              DK_MACRO_ENABLE
#define DK_MACRO_EXCEPTION_ENABLE                           DK_MACRO_ENABLE
#define DK_MACRO_LOG_ENABLE                                 DK_MACRO_ENABLE

// send log messages also to debugging console
// using DKConsoleLog() macro
// see Debugger/DKDebuggerConsole.h
#define DK_MACRO_LOG_LOG_TO_DEBUGGER_CONSOLE                0
#define DK_MACRO_COMMON_ENABLE                              DK_MACRO_ENABLE

// enable CGRect + CGPoint various operation functions
#define DK_MACRO_GEOMETRY_ENABLE                            DK_MACRO_ENABLE

// ---------------------------------------------------------------------------------------
// enable all categories
#define DK_CATEGORIES_ENABLE                                DK_ENABLE
#define DK_CATEGORIES_NS_ARRAY_ENABLE                       DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_NS_DATA_ENABLE                        DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_NS_DICTIONARY_ENABLE                  DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_NS_FILE_MANAGER_ENABLE                DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_NS_OBJECT_ENABLE                      DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_NS_SET_ENABLE                         DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_NS_STRING_ENABLE                      DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_NS_URL_ENABLE                         DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_NS_USER_DEFAULTS_ENABLE               DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_UI_DEVICE_ENABLE                      DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_UI_NIB_ENABLE                         DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_UI_VIEW_ENABLE                        DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_UI_VIEW_CONTROLLER_ENABLE             DK_CATEGORIES_ENABLE

// ---------------------------------------------------------------------------------------
// enable all runtime functions
#define DK_RUNTIME_ENABLE                                   DK_ENABLE
#define DK_RUNTIME_EXTENSION_ENABLE                         DK_RUNTIME_ENABLE
#define DK_RUNTIME_MOCK_ENABLE                              DK_RUNTIME_ENABLE

// ---------------------------------------------------------------------------------------
// enable debugging console
#define DK_DEBUGGER_ENABLE                                  DK_ENABLE

// whether shared instance of DKDebuggerConsole
// will be created at class initialization time
// see + (void)initialize; in Debugger/DKDebuggerConsole.m
#define DK_DEBUGGER_CONSOLE_AUTO_CREATE_SHARED              1

// whether DKDebuggerConsole will dump messages to file
// commonly used in conjunction with DK_DEBUGGER_ENABLE
// see - (id)init; in Debugger/DKDebuggerConsole.m
#define DK_DEBUGGER_CONSOLE_LOG_TO_FILE                     0
```

Usage
=====

### NSObject category for KVO

Regular code to use Key-Value Observing on `self`:

```Objective-C

- (void)start {
	[self addObserver:self forKeyPath:@"target.property.value" options:NSKeyValueObservingOptionOld context:nil];
	[self addObserver:self forKeyPath:@"property.value" options:NSKeyValueObservingOptionOld context:nil];
}

- (void)stop {
    [self removeObserver:self forKeyPath:@"target.property.value"];
    [self removeObserver:self forKeyPath:@"property.value"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self) {
    	if ([keyPath isEqualToString:@"target.property.value"]) {
    		// self.target.property.value did change
    	} else if ([keyPath isEqualToString:@"property.value"]) {
    		// self.property.value did change
    	}
    }
}
```

Dev Kit shorthand:

```Objective-C

- (void)start {
	[self observeKeyPaths:@"target.property.value", @"property.value", nil];
}

- (void)stop {
	[self stopObservingKeyPaths:@"target.property.value", @"property.value", nil];
}

- (void)targetPropertyValueChange {
	// self.target.property.value did change
}

- (void)propertyValueChange:(NSDictionary *)change {
	// self.property.value did change
}
```

Rules of message sending in response to observed key path change:

1. Key path `@"target.property.value"` mapped to `@selector(targetPropertyValueChange)`:
   * key path camel-cased, `@"target.Property.Value"`;
   * all `.` are removed, `@"targetPropertyValue"`; and
   * suffix `Change` appended, `@"targetPropertyValueChange"`;
2. Message sent with `@selector(targetPropertyValueChange)` if `self` responds to; if not
3. Message sent with `@selector(targetPropertyValueChange:)` with change dictionary
if `self` responds to.


### NSObject category for Notifications

Regular code to use notifications:

```Objective-C

- (void)start {
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(updateView) name:ZZNetworkBecomeUnavailableNotification object:nil];
    [notificationCenter addObserver:self selector:@selector(updateView) name:ZZNetworkBecomeAvailableNotification object:nil];
    [notificationCenter addObserver:self selector:@selector(dataDidChange:) name:ZZDataDidChangeNotification object:nil];
}

- (void)stop {
	NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter removeObserver:self name:ZZNetworkBecomeUnavailableNotification object:nil];
    [notificationCenter removeObserver:self name:ZZNetworkBecomeAvailableNotification object:nil];
    [notificationCenter removeObserver:self name:ZZDataDidChangeNotification object:nil];
}

- (void)updateView {
	
}

- (void)dataDidChange:(ZZDataDidChangeNotification *)notification {
	
}
```

Dev Kit shorthand:

```Objective-C

- (void)start {
	[self observeWithSelector:@selector(updateView) notificationsNames:ZZNetworkBecomeUnavailableNotification, ZZNetworkBecomeAvailableNotification, nil];
	[self observeNotificationsNames:ZZDataDidChangeNotification, nil];
}

- (void)stop {
	[self stopObservingNotificationsNames:ZZNetworkBecomeUnavailableNotification, ZZNetworkBecomeAvailableNotification, ZZDataDidChangeNotification, nil];
}

- (void)updateView {
	
}

- (void)dataDidChange:(ZZDataDidChangeNotification *)notification {
	
}
```

Rules of automatic `@selector` deduction from notification name:

1. Notification name string `@"ZZSomethingHappenNotification"` mapped to
`@selector(somethingHappen)`:
   * prefix of (n-1) uppercase letters removed, `@"SomethingHappenNotification"`;
   * suffix `Notification` removed, `@"SomethingHappen"`;
   * first letter lowercased, `@"somethingHappen"`;
2. `@selector(somethingHappen)` used if `self` responds to; if not
3. `@selector(somethingHappen:)` used if `self` responds to; if not, exception raised.


### Simplified logging

Dev Kit defines several `DKLog*()` macros as a replacement for standard `NSLog`. With
these macros you need to provide only argument list (where appropriate), formatting
pattern will be constructed automatically. In addition, you have the way to control
logging with severity. So, instead:

```Objective-C

- (void)viewWillLayoutSubviews {
	NSLog(@"%@ %@ %d", self, NSStringFromCGRect(self.view.frame), self.shouldAutorotate);
	// will output something like
	// <ZZViewController 0x01234567>, {{0, 0}, {320, 568}}, 1
}
```

you can:

```Objective-C

- (void)viewWillLayoutSubviews {
	DKLog(self, self.view.frame, self.shouldAutorotate);
	// will output something like
	// -[ZZViewController viewWillLayoutSubviews] --- self <ZZViewController 0x01234567>, self.view.frame {{0, 0}, {320, 568}}, self.shouldAutorotate YES
}
```

Suffixes of `DKLog*`:

* `M` stands for _message_ for output, `DKLogM(message)`;
* `V` stands for _variables_, or argument list for output, `DKLogV(variables...)`;
* `F` stands for _function name_, `DKLogF()`;
* `S` stands for _selector name_, `DKLogS()`;
* `SM` stands for _selector name_ + _message_, `DKLogSM(message)`;
* `SV` stands for _selector name_ + _variables_, `DKLogSV(variables...)`.

where

* _function name_ is simply `__PRETTY_FUNCTION__`;
* _selector name_ is `+[<class-name> <selector>]` for class;
* _selector name_ is `-[<class-name> <selector>]` for instance.

There are extended versions with use of severity:

* `DKLogSevMes(severity, message)` = `DKLogM(message)`;
* `DKLogSevVars(severity, variables)` = `DKLogV(variables...)`;
* `DKLogSevFunc(severity)` = `DKLogF()`;
* `DKLogSevSel(severity)` = `DKLogS()`;
* `DKLogSevSelMes(severity, message)` = `DKLogSM(message)`;
* `DKLogSevSelVars(severity, variables)` = `DKLogSV(variables...)`.

where _severity_ by default is `DK_MACRO_LOG_ENABLE` (see [options](#options)).

**Note**: when `#define DK_MACRO_LOG_ENABLE 0`, `DKLog*` macros remain valid but noop
`do {} while (0)` expressions. So, when logging disabled with `DK_MACRO_LOG_ENABLE`,
it doesn't force you to remove all occurrences of `DKLog*` from code.
