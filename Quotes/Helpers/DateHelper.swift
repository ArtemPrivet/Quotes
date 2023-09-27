//
//  DateHelper.swift
//  Quotes
//
//  Created by Artem Orlov on 26.09.23.
//

import Foundation

enum DateHelper {
    static var dayMonthFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        dateFormatter.locale = Locale(identifier: "en-US")
        return dateFormatter
    }
}
