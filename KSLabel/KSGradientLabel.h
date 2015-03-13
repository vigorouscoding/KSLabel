//
//  KSLabel.h
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

#import <UIKit/UIKit.h>

@interface KSGradientLabel : UILabel {
	CGFloat gradientColors[8];
	CGPoint startPoint;
	CGPoint endPoint;
}

@property BOOL drawOutline;
@property (strong, nonatomic) UIColor *outlineColor;
@property (nonatomic) CGFloat outlineThickness;

@property BOOL drawGradient;
-(void) setGradientStartColor: (UIColor*)startColor
                     endColor: (UIColor*)endColor;

@property BOOL customDirection;
-(void) setDirectionStart:(CGPoint)start
                      end:(CGPoint)end;
@end