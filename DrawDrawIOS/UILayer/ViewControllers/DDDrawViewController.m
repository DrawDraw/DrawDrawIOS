//
//  DDDrawViewController.m
//  DrawDrawIOS
//
//  Created by  Anson Ng on 10/09/2017.
//  Copyright © 2017 DrawDraw. All rights reserved.
//

#import "DDDrawViewController.h"

@interface DDDrawViewController ()


@property (assign, nonatomic) BOOL mouseSwiped;
@property (assign, nonatomic) CGPoint lastPoint;
@property (weak, nonatomic) IBOutlet UIImageView *canvasImageView;

@end

@implementation DDDrawViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    self.mouseSwiped = NO;
    UITouch *touch = [touches anyObject];
    self.lastPoint = [touch locationInView:self.canvasImageView];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    self.mouseSwiped = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.canvasImageView];

    UIGraphicsBeginImageContext(self.canvasImageView.frame.size);
    [self.canvasImageView.image drawInRect:CGRectMake(0, 0, self.canvasImageView.frame.size.width, self.canvasImageView.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint.x, currentPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 10.0f );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0, 0, 0, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);

    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.canvasImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.canvasImageView setAlpha:1.0f];
    UIGraphicsEndImageContext();

    self.lastPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {


    UIGraphicsBeginImageContext(self.canvasImageView.frame.size);
    [self.canvasImageView.image drawInRect:CGRectMake(0, 0, self.canvasImageView.frame.size.width, self.canvasImageView.frame.size.height)];
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), self.lastPoint.x, self.lastPoint.y);
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 10.0f );
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0, 0, 0, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(),kCGBlendModeNormal);

    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.canvasImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.canvasImageView setAlpha:1.0f];
    UIGraphicsEndImageContext();

}

@end
