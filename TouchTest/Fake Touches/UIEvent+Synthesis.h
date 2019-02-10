//
//  GSEvent.h
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface UIEvent (Synthesis)

- (instancetype)initWithTouch:(UITouch *)touch;

@end

NS_ASSUME_NONNULL_END
