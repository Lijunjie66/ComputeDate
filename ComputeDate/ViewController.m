//
//  ViewController.m
//  ComputeDate
//
//  Created by Geraint on 2019/4/18.
//  Copyright © 2019 kilolumen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 现在时间
    NSString *dateStr = [self getDateDisplayString:[NSDate date]];
    NSLog(@"时间：= %@", dateStr);
    
}

- (NSString *)getDateDisplayString:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth |  NSCalendarUnitYear ;
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    NSDateComponents *myCmps = [calendar components:unit fromDate:date];
    NSDateFormatter *dateFmt = [[NSDateFormatter alloc ] init ];
    
    NSDateComponents *comp =  [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:date];
    
    if (nowCmps.day==myCmps.day) {
        dateFmt.AMSymbol = @"上午";
        dateFmt.PMSymbol = @"下午";
        dateFmt.dateFormat = @"aaa hh:mm"; // 时间：= 下午 08:08
//        dateFmt.dateFormat = @"hh:mm:ss";  // 时间：= 10:49:04
//        dateFmt.dateFormat = @"aaa yyyy-MM-dd hh:mm:ss"; //  时间：= 下午 2019-04-18 08:08:05
        
    } else if((nowCmps.day-myCmps.day)==1) {
        dateFmt.AMSymbol = @"上午";
        dateFmt.PMSymbol = @"下午";
        dateFmt.dateFormat = @"昨天 aaahh:mm";
        
    } else {
        dateFmt.AMSymbol = @"上午";
        dateFmt.PMSymbol = @"下午";
        if ((nowCmps.day-myCmps.day) <=7) {
            switch (comp.weekday) {
                case 1:
                    dateFmt.dateFormat = @"星期日 aaahh:mm";
                    break;
                case 2:
                    dateFmt.dateFormat = @"星期一 aaahh:mm";
                    break;
                case 3:
                    dateFmt.dateFormat = @"星期二 aaahh:mm";
                    break;
                case 4:
                    dateFmt.dateFormat = @"星期三 aaahh:mm";
                    break;
                case 5:
                    dateFmt.dateFormat = @"星期四 aaahh:mm";
                    break;
                case 6:
                    dateFmt.dateFormat = @"星期五 aaahh:mm";
                    break;
                case 7:
                    dateFmt.dateFormat = @"星期六 aaahh:mm";
                    break;
                default:
                    break;
            }
        }else {
            dateFmt.dateFormat = @"yyyy年MM月dd日 aaahh:mm";
        }
    }
    return [dateFmt stringFromDate:date];
}

@end
