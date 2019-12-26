//
//  GWLCustomButton.m
//  GWLCustomButton
//
//  Created by gwl on 2019/12/18.
//  Copyright © 2019 gwl. All rights reserved.
//

#import "GWLCustomButton.h"

@implementation GWLCustomButton

+ (instancetype)gwl_customButton:(GWLCustomButtonType)type {
    GWLCustomButton *customButton = [GWLCustomButton buttonWithType:UIButtonTypeCustom];
    customButton.customButtonType = type;
    return customButton;
}

- (void)gwl_updateCustomButton:(GWLCustomButtonType)type {
    self.customButtonType = type;
    [self layoutSubviews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.customButtonType == GWLCustomButtonTypeCenterImageCenterTitle) {
        [self buttonWithTypeCenterImageCenterTitle];
    } else if (self.customButtonType == GWLCustomButtonTypeTopImageBottomTitle) {
        [self buttonWithTypeTopImageBottomTitle];
    } else if (self.customButtonType == GWLCustomButtonTypeBottomImageTopTitle) {
        [self buttonWithTypeBottomImageTopTitle];
    } else if (self.customButtonType == GWLCustomButtonTypeLeftImageRightTitle) {
        [self buttonWithTypeLeftImageRightTitle];
    } else if (self.customButtonType == GWLCustomButtonTypeRightImageLeftTitle) {
        [self buttonWithTypeRightImageLeftTitle];
    } else {
        [self buttonWithTypeLeftImageRightTitle];
    }
    
    //    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.titleLabel.numberOfLines = 0;
}

#pragma mark - 图和文字都居中
- (void)buttonWithTypeCenterImageCenterTitle {
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;
    
    if (self.imageWidth == 0 && self.imageHeight == 0) {
        imageRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } else {
        imageRect.origin.x = (self.frame.size.width - self.imageWidth) * 0.5;
        imageRect.origin.y = (self.frame.size.height - self.imageHeight) * 0.5;
        imageRect.size.width = self.imageWidth;
        imageRect.size.height = self.imageHeight;
        imageRect = imageRect;
    }
    
    if (self.titleWidth == 0 && self.titleHeight == 0) {
        titleRect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } else {
        titleRect.origin.x = (self.frame.size.width - self.titleWidth) * 0.5;
        titleRect.origin.y = (self.frame.size.height - self.titleHeight) * 0.5;
        titleRect.size.width = self.titleWidth;
        titleRect.size.height = self.titleHeight;
        titleRect = titleRect;
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
#pragma mark - 上图下文字
- (void)buttonWithTypeTopImageBottomTitle {
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;
    
    if (imageRect.size.width != 0 && imageRect.size.height != 0) {
        if (self.imageWidth == 0 && self.imageHeight == 0) {
            imageRect.size.width = self.frame.size.height < self.frame.size.width ? self.frame.size.height : self.frame.size.width;
            imageRect.size.height = imageRect.size.width;
            imageRect.origin.x = (self.frame.size.width - imageRect.size.width) * 0.5;
            imageRect.origin.y = 0;
        } else {
            imageRect.origin.x = (self.frame.size.width - self.imageWidth) * 0.5;
            imageRect.origin.y = 0;
            imageRect.size.width = self.imageWidth;
            imageRect.size.height = self.imageHeight;
        }
    }
    
    if (titleRect.size.height != 0) {
        if (self.titleWidth == 0 && self.titleHeight == 0) {
            titleRect.origin.x = 0;
            titleRect.origin.y = imageRect.size.height + self.space;
            titleRect.size.width = self.frame.size.width;
            titleRect.size.height = ceil([self.titleLabel sizeThatFits:CGSizeMake(titleRect.size.width, MAXFLOAT)].height) + 1;
        } else {
            titleRect.origin.x = (self.frame.size.width - self.titleWidth) * 0.5;
            titleRect.origin.y = imageRect.size.height + self.space;
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
        }
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
//下图上文字
- (void)buttonWithTypeBottomImageTopTitle {
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;
    
    if (titleRect.size.height != 0) {
        if (self.titleWidth == 0 && self.titleHeight == 0) {
            titleRect.origin.x = 0;
            titleRect.origin.y = 0;
            titleRect.size.width = self.frame.size.width;
            titleRect.size.height = ceil([self.titleLabel sizeThatFits:CGSizeMake(titleRect.size.width, MAXFLOAT)].height) + 1;
        } else {
            titleRect.origin.x = (self.frame.size.width - self.titleWidth) * 0.5;
            titleRect.origin.y = 0;
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
        }
    } else {
        self.space = 0;
    }
    
    if (imageRect.size.width != 0 && imageRect.size.height != 0) {
        if (self.imageWidth == 0 && self.imageHeight == 0) {
            imageRect.size.width = self.frame.size.height < self.frame.size.width ? self.frame.size.height : self.frame.size.width;
            imageRect.size.height = imageRect.size.width;
            imageRect.origin.x = (self.frame.size.width - imageRect.size.width) * 0.5;
            if (titleRect.size.height != 0) {
                imageRect.origin.y = titleRect.size.height + self.space;
            } else {
                imageRect.origin.y = self.frame.size.height - imageRect.size.height;
            }
        } else {
            imageRect.origin.x = (self.frame.size.width - self.imageWidth) * 0.5;
            if (titleRect.size.height != 0) {
                imageRect.origin.y = titleRect.size.height + self.space;
            } else {
                imageRect.origin.y = self.frame.size.height - self.imageHeight;
            }
            imageRect.size.width = self.imageWidth;
            imageRect.size.height = self.imageHeight;
        }
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}
//左图右文字
- (void)buttonWithTypeLeftImageRightTitle {
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;
    
    if (imageRect.size.width != 0 && imageRect.size.height != 0) {
        if (self.imageWidth == 0 && self.imageHeight == 0) {
            imageRect.origin.x = 0;
            imageRect.origin.y = 0;
            imageRect.size.width = self.frame.size.height < self.frame.size.width ? self.frame.size.height : self.frame.size.width;
            imageRect.size.height = imageRect.size.width;
        } else {
            imageRect.origin.x = 0;
            imageRect.origin.y = (self.frame.size.height - self.imageHeight) * 0.5;
            imageRect.size.width = self.imageWidth;
            imageRect.size.height = self.imageHeight;
        }
    } else {
        self.space = 0;
    }
    
    if (titleRect.size.height != 0) {
        if (self.titleWidth == 0 && self.titleHeight == 0) {
            titleRect.origin.x = imageRect.size.width + self.space;
            titleRect.origin.y = 0;
            titleRect.size.width = self.frame.size.width - imageRect.size.width - self.space;
            titleRect.size.height = self.frame.size.height;
        } else {
            titleRect.origin.x = imageRect.size.width + self.space;
            titleRect.origin.y = (self.frame.size.height - self.titleHeight) * 0.5;
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
        }
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
}
//右图左文字
- (void)buttonWithTypeRightImageLeftTitle {
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;
    
    if (imageRect.size.width != 0 && imageRect.size.height != 0) {
        if (self.imageWidth == 0 && self.imageHeight == 0) {
            imageRect.size.width = self.frame.size.height < self.frame.size.width ? self.frame.size.height : self.frame.size.width;
            imageRect.size.height = imageRect.size.width;
            imageRect.origin.x = self.frame.size.width - imageRect.size.width;
            imageRect.origin.y = 0;
        } else {
            imageRect.size.width = self.imageWidth;
            imageRect.size.height = self.imageHeight;
            imageRect.origin.x = self.frame.size.width - self.imageWidth;
            imageRect.origin.y = (self.frame.size.height - self.imageHeight) * 0.5;
        }
    } else {
        self.space = 0;
    }
    
    if (titleRect.size.height != 0) {
        if (self.titleWidth == 0 && self.titleHeight == 0) {
            titleRect.origin.x = 0;
            titleRect.origin.y = 0;
            titleRect.size.width = self.frame.size.width - imageRect.size.width - self.space;
            titleRect.size.height = self.frame.size.height;
        } else {
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
            titleRect.origin.x = (self.frame.size.width - self.titleWidth - self.space - imageRect.size.width);
            titleRect.origin.y = (self.frame.size.height - self.titleHeight) * 0.5;
        }
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    self.titleLabel.textAlignment = NSTextAlignmentRight;
}


@end
