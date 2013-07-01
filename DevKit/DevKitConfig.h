//
//  DevKitConfig.h
//  DevKit
//
//  Created by Andrew Koslow on 26.06.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//


#ifndef DK_ENABLE
#define DK_ENABLE                                           DEBUG
#endif


#ifndef DK_MACRO_ENABLE
#define DK_MACRO_ENABLE                                     DK_ENABLE
#endif

#ifndef DK_MACRO_ASSERT_ENABLE
#define DK_MACRO_ASSERT_ENABLE                              DK_MACRO_ENABLE
#endif

#ifndef DK_MACRO_EXCEPTION_ENABLE
#define DK_MACRO_EXCEPTION_ENABLE                           DK_MACRO_ENABLE
#endif

#ifndef DK_MACRO_LOG_ENABLE
#define DK_MACRO_LOG_ENABLE                                 DK_MACRO_ENABLE
#endif

#ifndef DK_MACRO_LOG_LOG_TO_DEBUGGER_CONSOLE
#define DK_MACRO_LOG_LOG_TO_DEBUGGER_CONSOLE                0
#endif

#ifndef DK_MACRO_COMMON_ENABLE
#define DK_MACRO_COMMON_ENABLE                              DK_MACRO_ENABLE
#endif

#ifndef DK_MACRO_GEOMETRY_ENABLE
#define DK_MACRO_GEOMETRY_ENABLE                            DK_MACRO_ENABLE
#endif


#ifndef DK_CATEGORIES_ENABLE
#define DK_CATEGORIES_ENABLE                                DK_ENABLE
#endif

#ifndef DK_CATEGORIES_NS_ARRAY_ENABLE
#define DK_CATEGORIES_NS_ARRAY_ENABLE                       DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_NS_DATA_ENABLE
#define DK_CATEGORIES_NS_DATA_ENABLE                        DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_NS_DICTIONARY_ENABLE
#define DK_CATEGORIES_NS_DICTIONARY_ENABLE                  DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_NS_FILE_MANAGER_ENABLE
#define DK_CATEGORIES_NS_FILE_MANAGER_ENABLE                DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_NS_OBJECT_ENABLE
#define DK_CATEGORIES_NS_OBJECT_ENABLE                      DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_NS_SET_ENABLE
#define DK_CATEGORIES_NS_SET_ENABLE                         DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_NS_STRING_ENABLE
#define DK_CATEGORIES_NS_STRING_ENABLE                      DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_NS_URL_ENABLE
#define DK_CATEGORIES_NS_URL_ENABLE                         DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_NS_USER_DEFAULTS_ENABLE
#define DK_CATEGORIES_NS_USER_DEFAULTS_ENABLE               DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_UI_DEVICE_ENABLE
#define DK_CATEGORIES_UI_DEVICE_ENABLE                      DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_UI_NIB_ENABLE
#define DK_CATEGORIES_UI_NIB_ENABLE                         DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_UI_VIEW_ENABLE
#define DK_CATEGORIES_UI_VIEW_ENABLE                        DK_CATEGORIES_ENABLE
#endif

#ifndef DK_CATEGORIES_UI_VIEW_CONTROLLER_ENABLE
#define DK_CATEGORIES_UI_VIEW_CONTROLLER_ENABLE             DK_CATEGORIES_ENABLE
#endif


#ifndef DK_RUNTIME_ENABLE
#define DK_RUNTIME_ENABLE                                   DK_ENABLE
#endif

#ifndef DK_RUNTIME_EXTENSION_ENABLE
#define DK_RUNTIME_EXTENSION_ENABLE                         DK_RUNTIME_ENABLE
#endif

#ifndef DK_RUNTIME_MOCK_ENABLE
#define DK_RUNTIME_MOCK_ENABLE                              DK_RUNTIME_ENABLE
#endif


#ifndef DK_DEBUGGER_ENABLE
#define DK_DEBUGGER_ENABLE                                  DK_ENABLE
#endif

#ifndef DK_DEBUGGER_CONSOLE_AUTO_CREATE_SHARED
#define DK_DEBUGGER_CONSOLE_AUTO_CREATE_SHARED              1
#endif

#ifndef DK_DEBUGGER_CONSOLE_LOG_TO_FILE
#define DK_DEBUGGER_CONSOLE_LOG_TO_FILE                     0
#endif

