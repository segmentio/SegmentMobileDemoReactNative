#import "ABKUIURLUtils.h"
#import "ABKUIUtils.h"
#import "ABKModalWebViewController.h"

@implementation ABKUIURLUtils

+ (BOOL)URLDelegate:(id<ABKURLDelegate>)urlDelegate
         handlesURL:(NSURL *)url
        fromChannel:(ABKChannel)channel
         withExtras:(NSDictionary *)extras {
  if ([ABKUIURLUtils URLDelegateIsValid:urlDelegate]) {
    if ([urlDelegate handleAppboyURL:url fromChannel:channel withExtras:extras]) {
      NSLog(@"Braze is not handling the URL %@, as the ABKURLDelegate %@ returned YES"
            "in handleAppboyURL:fromChannel:withExtras:", url.absoluteString, urlDelegate);
      return YES;
    }
  }
  return NO;
}

+ (BOOL)URLDelegateIsValid:(id<ABKURLDelegate>)urlDelegate {
  return [urlDelegate respondsToSelector:@selector(handleAppboyURL:fromChannel:withExtras:)];
}

+ (BOOL)URL:(NSURL *)url shouldOpenInWebView:(BOOL)openUrlInWebView {
  if ([ABKUIUtils objectIsValidAndNotEmpty:url.absoluteString] && openUrlInWebView) {
    if ([ABKUIURLUtils URLHasValidWebScheme:url]) {
      return YES;
    } else {
      NSLog(@"Unsupported web URL scheme received: %@. Not opening URL in web view.", url.absoluteString);
    }
  }
  return NO;
}

+ (BOOL)URLHasValidWebScheme:(NSURL *)url {
  return ([[url.scheme lowercaseString] isEqualToString:@"http"] ||
          [[url.scheme lowercaseString] isEqualToString:@"https"]);
}

+ (void)openURLWithSystem:(NSURL *)url {
  if (![NSThread isMainThread]) {
    dispatch_sync(dispatch_get_main_queue(), ^{
      [self openURL:url];
    });
  } else {
    [self openURL:url];
  }
}

+ (void)openURL:(NSURL *)url {
  if (@available(iOS 10.0, *)) {
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
  } else {
    [[UIApplication sharedApplication] openURL:url];
  }
}

+ (UIViewController *)topmostViewControllerWithRootViewController:(UIViewController *)viewController {
  while (viewController.presentedViewController) {
    viewController = viewController.presentedViewController;
  }
  return viewController;
}

+ (void)displayModalWebViewWithURL:(NSURL *)URL
             topmostViewController:(UIViewController *)topmostViewController {
  ABKModalWebViewController *webViewController = [[ABKModalWebViewController alloc] init];
  webViewController.url = URL;
  [topmostViewController presentViewController:webViewController animated:YES completion:nil];
}

@end
