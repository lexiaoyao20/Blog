//
//  FontsManager.m
//  DynamicFont
//
//  Created by Subo on 2024/2/20.
//

#import "FontsManager.h"
#import <CoreText/CoreText.h>

@implementation FontsManager

+ (UIFont *)openSansLightFontOfSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"OpenSans-Light" size:size];
    if (!font) {
        [[self class] dynamicallyLoadFontNamed:@"OpenSans-Light" extension:@"ttf"];
        font = [UIFont fontWithName:@"OpenSans-Light" size:size];

        // safe fallback
        if (!font) font = [UIFont systemFontOfSize:size];
    }

    return font;
}

+ (UIFont *)dinotBoldFontOfSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"DINOT-BOLD" size:size];
    if (!font) {
        [[self class] dynamicallyLoadFontNamed:@"DINOT-BOLD" extension:@"TTF"];
        font = [UIFont fontWithName:@"DINOT-BOLD" size:size];

        // safe fallback
        if (!font) font = [UIFont systemFontOfSize:size];
    }

    return font;
}

+ (void)dynamicallyLoadFontNamed:(NSString *)name extension:(NSString *)extension {
//    NSString *resourceName = [NSString stringWithFormat:@"%@/%@", kBundle, name];
    NSURL *url = [[NSBundle mainBundle] URLForResource:name withExtension:extension];
    NSData *fontData = [NSData dataWithContentsOfURL:url];
    if (fontData) {
        CFErrorRef error;
        CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)fontData);
        CGFontRef font = CGFontCreateWithDataProvider(provider);
        if (! CTFontManagerRegisterGraphicsFont(font, &error)) {
            CFStringRef errorDescription = CFErrorCopyDescription(error);
            NSLog(@"Failed to load font: %@", errorDescription);
            CFRelease(errorDescription);
        }
        CFRelease(font);
        CFRelease(provider);
    }
}

@end
