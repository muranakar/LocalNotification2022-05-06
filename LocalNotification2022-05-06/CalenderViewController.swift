//
//  CalenderViewController.swift
//  LocalNotification2022-05-06
//
//  Created by 村中令 on 2022/05/06.
//

import UIKit

class CalenderViewController: UIViewController {
    var request:UNNotificationRequest!
    @IBOutlet weak var notificationDatePicker: UIDatePicker!

    @IBAction func tapNotificationButton(_ sender: Any) {
        let date = notificationDatePicker.date
        let format = DateFormatter()
        format.dateFormat = "yyyy/MM/dd/HH/mm/ss"
        let formatDate = format.string(from: date)
        let separatedFormatDate: [String] = formatDate.components(separatedBy: "/")
        let month = Int(separatedFormatDate[1])!
        let day = Int(separatedFormatDate[2])!
        let hour = Int(separatedFormatDate[3])!
        let minute = Int(separatedFormatDate[4])!
        let second = Int(separatedFormatDate[5])!

        // 直接日時を設定
        let triggerDate = DateComponents(month:month, day:day, hour:hour, minute:minute, second: second)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

        // 通知コンテンツの作成
        let content = UNMutableNotificationContent()
        content.title = "Calendar Notification"
        content.body = "\(month)/\(day)"
        content.sound = UNNotificationSound.default

        // 通知リクエストの作成
        request = UNNotificationRequest.init(
            identifier: "CalendarNotification",
            content: content,
            trigger: trigger)
        // 通知リクエストの登録
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }
}
