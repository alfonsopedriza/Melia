//
//  ORViewController.h
//  Melia
//
//  Created by orta therox on 08/08/2012.
//  Copyright (c) 2012 orta therox. All rights reserved.
//

#import "ORAlbumFinderViewController.h"
#import "ORAlbumSyncViewController.h"
#import "GMGridView.h"

@interface ORAllAlbumsViewController : UIViewController <ORAlbumFinderDelegate, ORAlbumSyncDelegate, GMGridViewActionDelegate, GMGridViewDataSource>

@end
