//
//  KSLabel.m
//
//  Created by Kai from VigorousCoding
//  Copyright (c) 2012 VigorousCoding.com. All rights reserved.
//

//  Licensing (Zlib)
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software in
//     a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not
//     be misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.

//  If you are using this code, you might want to consider giving some credit to me by
//	1) linking my website (http://www.vigorouscoding.com) from your app's website 
//	2) or crediting me inside the app's credits page 
//	3) or a tweet mentioning @modogo

#import "KSLabel.h"

@implementation KSLabel

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
	
	if (self) {
		self.backgroundColor = [UIColor clearColor];
	}
    
    return self;
}


-(void) setGradientColors: (CGFloat [8]) colors {
	memcpy(gradientColors, colors, 8 * sizeof (CGFloat));
}


- (void)drawTextInRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();  
	
	CGContextSaveGState(context);
	CGContextSetTextDrawingMode(context, kCGTextFill);    
	
	// Draw the text without an outline
	[super drawTextInRect:rect];
	
	CGImageRef alphaMask = NULL;
	
	if ([self drawGradient]) {
		// Create a mask from the text
		alphaMask = CGBitmapContextCreateImage(context);
		
		// clear the image
		CGContextClearRect(context, rect);
		
		CGContextSaveGState(context);
		CGContextTranslateCTM(context, 0, rect.size.height);
		
		// invert everything because CoreGraphics works with an inverted coordinate system
		CGContextScaleCTM(context, 1.0, -1.0);
		
		// Clip the current context to our alphaMask
		CGContextClipToMask(context, rect, alphaMask);
		
		CGColorSpaceRef baseSpace = CGColorSpaceCreateDeviceRGB();
		CGGradientRef gradient = CGGradientCreateWithColorComponents(baseSpace, gradientColors, NULL, 2);
		CGColorSpaceRelease(baseSpace), baseSpace = NULL;
		
		CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
		CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
		
		// Draw the gradient
		CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
		CGGradientRelease(gradient), gradient = NULL;
		CGContextRestoreGState(context);

		// Clean up because ARC doesnt handle CG
		CGImageRelease(alphaMask);
	}
	
	if ([self drawOutline]) {
		// Create a mask from the text (with the gradient)
		alphaMask = CGBitmapContextCreateImage(context);
		
		// Outline width
		CGContextSetLineWidth(context, self.outlineDimension);
		CGContextSetLineJoin(context, kCGLineJoinRound);
		
		// Set the drawing method to stroke
		CGContextSetTextDrawingMode(context, kCGTextStroke);
		
		// Outline color
		UIColor *tmpColor = self.textColor;
		self.textColor = [self outlineColor];
		
		// notice the +1 for the y-coordinate. this is to account for the face that the outline appears to be thicker on top
		[super drawTextInRect:CGRectMake(rect.origin.x, rect.origin.y+1, rect.size.width, rect.size.height)];
		
		// Draw the saved image over the outline
		// and invert everything because CoreGraphics works with an inverted coordinate system
		CGContextTranslateCTM(context, 0, rect.size.height);
		CGContextScaleCTM(context, 1.0, -1.0);
		CGContextDrawImage(context, rect, alphaMask);
		
		// Clean up because ARC doesnt handle CG
		CGImageRelease(alphaMask);
		
		// restore the original color
		self.textColor = tmpColor;
	}
}
@end
