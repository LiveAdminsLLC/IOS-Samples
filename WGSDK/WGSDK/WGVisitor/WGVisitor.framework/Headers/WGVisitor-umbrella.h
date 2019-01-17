#ifdef __OBJC__
#import <UIKit/UIKit.h>
#endif

#import "ChatDetailViewController.h"
#import "NSString+JSMessagesView.h"
#import "UIColor+JSMessagesView.h"
#import "UIImage+JSMessagesView.h"
#import "JSAvatarImageFactory.h"
#import "JSBubbleImageViewFactory.h"
#import "JSBubbleMessageCell.h"
#import "JSBubbleView.h"
#import "JSDismissiveTextView.h"
#import "JSMessageInputView.h"
#import "JSMessageSoundEffect.h"
#import "JSMessagesViewController.h"
#import "JSMessageTextView.h"
#import "JSQSystemSoundPlayer.h"
#import "SharedData.h"
#import "WGChatDraggingCoordinator.h"
#import "WGContactUsViewController.h"
#import "WGTextFieldCell.h"
#import "WGTextViewCell.h"
#import "WGVisitor.h"
#import "WGVisitorSoundPlayer.h"
#import "WGVisitorViewController.h"

FOUNDATION_EXPORT double WGVisitorVersionNumber;
FOUNDATION_EXPORT const unsigned char WGVisitorVersionString[];

