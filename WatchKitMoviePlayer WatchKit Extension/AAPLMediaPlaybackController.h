/*
	Copyright (C) 2015 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	'AAPLMediaPlaybackController' controller object used for eacth table row in a WKInterfaceTable.
 */

@import Foundation;
@import WatchKit;

@interface AAPLMediaPlaybackController : NSObject

// WKInterfaceMovie property for setting poster image and backing URL.
@property (weak, nonatomic) IBOutlet WKInterfaceMovie *movie;

@end
