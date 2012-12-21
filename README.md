KSLabel
=======

Introduction
---------------------

A (hopefully) nice UILabel subclass which adds support for gradients and outlines.

Go to http://www.vigorouscoding.com/2012/02/custom-gradient-uilabel-with-an-outline/ to see a detailed description.

It's pretty straight-forward. You can separately enable/disable the gradient and the outline. The following example should be all you need to know to get you started.


Usage
---------------------

```objective-c

KSLabel *myLabel = [[KSLabel alloc] initWithFrame:CGRectMake(0, 0, 768, 200)];

[myLabel setDrawOutline:YES];
[myLabel setOutlineColor:[UIColor blueColor]];

[myLabel setDrawGradient:YES];
CGFloat colors [] = {
	255.0f/255.0f, 255.0f/255.0f, 255.0f/255.0f, 1.0,
	0.0f/255.0f, 0.0f/255.0f, 0.0f/255.0f, 1.0
};
[myLabel setGradientColors:colors];


myLabel.text = @"Your gradient/outlined text here";
myLabel.font = [UIFont boldSystemFontOfSize:80];
[self.view addSubview:myLabel];

```