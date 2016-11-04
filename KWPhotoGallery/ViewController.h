//
//  ViewController.h
//  KWPhotoGallery
//
//  Created by Kalyani on 04/11/16.
//  Copyright © 2016 kalyaniWarke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
@interface ViewController : UIViewController<UIImagePickerControllerDelegate,MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
- (IBAction)openCamera:(id)sender;

- (IBAction)openAlbumAction:(id)sender;
- (IBAction)mailAction:(id)sender;
- (IBAction)SMSAction:(id)sender;

@end

