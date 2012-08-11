//
//  ARFileDownloadOperation.m
//  Artsy Folio
//
//  Created by orta therox on 24/07/2012.
//  Copyright (c) 2012 http://art.sy. All rights reserved.
//

#import "ARFileDownloadOperation.h"
#import "NSFileManager+SkipBackup.h"

@implementation ARFileDownloadOperation
@synthesize shouldBackupFileToCloud;

+ (ARFileDownloadOperation *)fileDownloadFromURL:(NSURL *)url toLocalPath:(NSString *)localPath {
    NSURLRequest *request= [NSURLRequest requestWithURL:url];
    ARFileDownloadOperation *this = [[self alloc] initWithRequest:request];
    this.responseFilePath = localPath;
    this.shouldBackupFileToCloud = NO;
    return this;
}

// take the original method wholesale and add our check for whether we should add the no-backup flag

- (void)setCompletionBlockWithSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    __block ARFileDownloadOperation *this = self;

    self.completionBlock = ^ {
        if ([this isCancelled]) {
            return;
        }

        if (self.error) {
            if (failure) {
                dispatch_async(this.failureCallbackQueue ? this.failureCallbackQueue : dispatch_get_main_queue(), ^{
                    failure(this, this.error);
                });
            }
        } else {
            if (success) {
                if (!this.shouldBackupFileToCloud) {
                    [[NSFileManager defaultManager] addSkipBackupAttributeToFileAtPath:self.responseFilePath];
                }
                
                dispatch_async(this.successCallbackQueue ? this.successCallbackQueue : dispatch_get_main_queue(), ^{
                    success(this, this.responseData);
                });
            }
        }
    };
}


@end
