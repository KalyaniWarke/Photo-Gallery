//
//  ViewController.m
//  KWPhotoGallery
//
//  Created by Kalyani on 04/11/16.
//  Copyright © 2016 kalyaniWarke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSLog(@"%@",info);
    
    UIImage *image =[info valueForKey:@"UIImagePickerControllerOriginalImage"];
    self.myImageView.image =image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)openCamera:(id)sender {
    UIImagePickerController *imagePickerController= [[UIImagePickerController alloc]init];
    imagePickerController.delegate =self;
    [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (IBAction)openAlbumAction:(id)sender {
    UIImagePickerController *imagePickerController= [[UIImagePickerController alloc]init];
    imagePickerController.delegate =self;
    [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

- (IBAction)mailAction:(id)sender {
    
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc]init];
    
    mailController.mailComposeDelegate = self;
    
    [mailController setToRecipients:@[@"chaitali.cpatil@gmail.com",@"rane.gunjan94@gmail.com",@"kalyani.warke18@gmail.com",@"patiljagruti8693"]];
    
    [self presentViewController:mailController animated:YES completion:nil];
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    if (error) {
        NSLog(@"%@",error.localizedDescription);
    }
    else {
        switch (result) {
            case MFMailComposeResultCancelled:
                
                NSLog(@"Mail Cancelled");
                break;
                
            case MFMailComposeResultSaved:
                NSLog(@"Mail Saved");
                break;
            case MFMailComposeResultSent:
                NSLog(@"Mail Sent");
                break;
            case MFMailComposeResultFailed:
                NSLog(@"Mail Failed");
                break;
        }
    }
    
    [controller dismissViewControllerAnimated:YES completion:nil];

    
}

- (IBAction)SMSAction:(id)sender {
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc]init];
    
    messageController.messageComposeDelegate = self;
    
    [messageController setRecipients:@[@"+919421693946"]];
    
    [self presentViewController:messageController animated:YES completion:nil];
}
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    
    switch (result) {
            
        case MessageComposeResultCancelled:
            NSLog(@"Mail Cancelled");
            break;
            
        case MessageComposeResultSent:
            NSLog(@"Mail Sent");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Mail Failed");
            break;
    }
    [controller dismissViewControllerAnimated:YES completion:nil];
    

    
}
@end
