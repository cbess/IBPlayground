//
//  CBNibHelpers.h
//  IBPlayground
//
//  Created by Christopher Bess on 6/5/12.
//  Copyright (c) 2012 C. Bess. All rights reserved.
//

#ifndef CBNibHelpers_h
#define CBNibHelpers_h

// Specifies the type of device executing the code (running the app)
typedef enum {
    DeviceTypeUnknown,
    DeviceTypePad,
    DeviceTypePhone
} DeviceType;

// Determines the type of device this application is running on (4.0+)
static BOOL IsDevice(DeviceType dType)
{
    static DeviceType deviceType = DeviceTypeUnknown;
    // I'm confident that the device type won't change during runtime
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
            deviceType = DeviceTypePad;
        else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            deviceType = DeviceTypePhone;
    });
    
    return (deviceType == dType);
}

// Returns YES, if this device is of the iPhone family
static inline BOOL IsPhone() 
{
    return IsDevice(DeviceTypePhone);
}

// Returns YES, if this device is of the iPad family
static inline BOOL IsPad()
{
    return IsDevice(DeviceTypePad);
}

static void MoveSubviewsToView(UIView *sourceView, UIView *newParentView)
{
    for (UIView *view in sourceView.subviews)
        [newParentView addSubview:view];
}

// if 'is iPad' macro, for inline ternary-style expressions
// ex: frame.size.width = IF_PAD(2048, 640);
#define IF_PAD(T_BLOCK, F_BLOCK) (IsPad() ? T_BLOCK : F_BLOCK)

#endif
