//
//  ORThumbnailOperation.h
//  Melia
//
//  Created by orta therox on 12/08/2012.
//  Copyright (c) 2012 orta therox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ORThumbnailOperation : NSOperation
+ (ORThumbnailOperation *)operationFromPath:(NSString *)imagePath toPath:(NSString *)toPath andSize:(CGFloat)theSize;
@end
