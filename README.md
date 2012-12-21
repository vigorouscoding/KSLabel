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


License (Zlib)
---------------------

This software is provided 'as-is', without any express or implied
warranty. In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. 	The origin of this software must not be misrepresented; you must not
	claim that you wrote the original software. If you use this software in
	a product, an acknowledgment in the product documentation would be
	appreciated but is not required.

2. 	Altered source versions must be plainly marked as such, and must not
	be misrepresented as being the original software.

3. 	This notice may not be removed or altered from any source distribution.


If you are using this code, you might want to consider giving some credit to me by

- linking my website (http://www.vigorouscoding.com) from your app's website 
- or crediting me inside the app's credits page 
- or a tweet mentioning @modogo