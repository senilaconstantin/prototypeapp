//
//  Date.swift
//  prototypeapp
//
//  Created by Constantin Senila on 15.05.2023.
//

import Foundation

extension Date {
    
    static func convertDateFromString(date: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        var convertedDate = Date()
        
        if let date = formatter.date(from: date) {
            convertedDate = date
        }
        return convertedDate
    }
    
    static func convertStringFromDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let convertedDateString = formatter.string(from: date)
        
        return convertedDateString
    }
    
    static func getCustomDate(numberOfDaysToPass: Int) -> Date? {
        let today = Calendar.current.dateComponents([.day, .month, .year], from: Date())
        let duration = DateComponents(calendar: Calendar.current, day: numberOfDaysToPass)
        let later = Calendar.current.date(byAdding: duration, to: today.date ?? Date())
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        if let later = later {
            let currentDateString = formatter.string(from: later)
            let currentDate = formatter.date(from: currentDateString)
            
            return currentDate
        }
        
        return nil
    }
    
    static func getCurrentDate() -> Date {
        if let date = self.getCustomDate(numberOfDaysToPass: 0) {
            return date
        }
        
        return Date()
    }
}
