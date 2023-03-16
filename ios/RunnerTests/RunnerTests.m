#import <XCTest/XCTest.h>
#import <Flutter/Flutter.h>

@interface RunnerTests : XCTestCase

@end

@implementation RunnerTests

- (void)setUp {
  self.continueAfterFailure = NO;
  [[[XCUIApplication alloc] init] launch];
}

- (void)testExample {
  FlutterDriver *driver = [[FlutterDriver alloc] initWithHost:@"localhost" port:12345];
  [driver waitUntilReady];
  FlutterDriverResult *result = [driver checkHealth];
  [driver close];
  XCTAssertEqual(FlutterDriverSuccess, result.status);
}

@end
