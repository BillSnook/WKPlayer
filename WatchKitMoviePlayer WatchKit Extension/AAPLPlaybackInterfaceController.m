/*
	Copyright (C) 2015 Apple Inc. All Rights Reserved.
	See LICENSE.txt for this sample’s licensing information
	
	Abstract:
	'AAPLPlaybackInterfaceController' implements a WKInterfaceTable where each row is a WKInterfaceMovie with a poster frame and a URL.
 */

#import "AAPLPlaybackInterfaceController.h"
#import "AAPLMediaPlaybackController.h"

@interface AAPLPlaybackInterfaceController ()

@property (weak, nonatomic) IBOutlet WKInterfaceTable *playbackTable;

@property NSArray<NSURL *> *elementsList;
@property NSArray<WKImage *> *posterImages;

@end

@implementation AAPLPlaybackInterfaceController

#pragma mark - Initializers

- (instancetype)init {
	self = [super init];
	
	if (self) {
		NSURL *movieOne = [NSURL URLWithString: @"http://www.billsnook.com/watchkit/sample_clip1.m4v" ];

        NSURL *movieTwo = [[NSBundle mainBundle] URLForResource:@"sample_clip2" withExtension:@"mov"];
		
        _elementsList = @[movieOne, movieTwo];
        
		_posterImages = @[
            [WKImage imageWithImageName:@"Sample1"],	// These files are stored in WatchKit App Assets folder
            [WKImage imageWithImageName:@"Sample2"]
        ];
		
        [self loadTableRows];
	}
	
	return self;
}

#pragma mark - Convenience

- (void)loadTableRows {
	// Load the Table Rows with movies and poster images.
	[self.playbackTable setNumberOfRows:self.elementsList.count withRowType:@"Media Playback Controller"];
	
	// Create all of the table rows.
	[self.elementsList enumerateObjectsUsingBlock:^(NSURL *url, NSUInteger index, BOOL *stop) {
		AAPLMediaPlaybackController *elementRow = [self.playbackTable rowControllerAtIndex:index];

		// Set the poster image for the movie.
		WKImage *nextImage = self.posterImages[index];
		[elementRow.movie setPosterImage:nextImage];
		
		// Set the movie URL.
		[elementRow.movie setMovieURL:url];
	}];
}

@end
