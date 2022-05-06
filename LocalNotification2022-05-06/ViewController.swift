//
//  ViewController.swift
//  LocalNotification2022-05-06
//
//  Created by 村中令 on 2022/05/06.
//

import UIKit

class ViewController: UIViewController {
    var request:UNNotificationRequest!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func setButton(_ sender: Any) {
        // 日付フォーマット
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ja_JP")

        // 現在時刻の1分後に設定
        let date2 = Date(timeInterval: 60, since: date)
        let targetDate = Calendar.current.dateComponents(
            [.year, .month, .day, .hour, .minute],
            from: date2)

        let dateString = dateFormatter.string(from: date2)
        print(dateString)

        // トリガーの作成
        let trigger = UNCalendarNotificationTrigger.init(dateMatching: targetDate, repeats: false)

        // 通知コンテンツの作成
        let content = UNMutableNotificationContent()
        content.title = "Calendar Notification"
        content.body = dateString
        content.sound = UNNotificationSound.default

        // 通知リクエストの作成
        request = UNNotificationRequest.init(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        // 通知リクエストの登録
        let center = UNUserNotificationCenter.current()
        center.add(request)
    }

}

