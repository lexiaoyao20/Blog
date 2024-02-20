//
//  FontsManager.h
//  DynamicFont
//
//  Created by Subo on 2024/2/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FontsManager : NSObject

+ (UIFont *)openSansLightFontOfSize:(CGFloat)size;
+ (UIFont *)dinotBoldFontOfSize:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
