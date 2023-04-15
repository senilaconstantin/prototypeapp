//
//  HealthDataRead.swift
//  prototypeapp
//
//  Created by Constantin Senila on 14.04.2023.
//

import SwiftUI
import HealthKit

class HealthDataRead {
    static var shared = HealthDataRead()
    
    let healthStore = HKHealthStore()

    func requestAuthorization() {
        guard HKHealthStore.isHealthDataAvailable() else {
            return
        }

        let readDataTypes: Set<HKObjectType> = [HKObjectType.quantityType(forIdentifier: .stepCount)!, HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!, HKObjectType.quantityType(forIdentifier: .basalEnergyBurned)!, HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!]
//        let typesToRead = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
//        let typesToWrite = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])

        healthStore.requestAuthorization(toShare: nil, read: readDataTypes) { success, _ in
            if success {
                print("HealthKit authorization successful")
            } else {
                print("HealthKit authorization denied")
            }
        }
    }

    func readSteps() {
        guard let stepCount = HKObjectType.quantityType(forIdentifier: .stepCount) else {
            print("---Step count not available")
            return
        }

        let date = Date()
        let calendar = Calendar.current

        let interval = NSDateComponents()
        interval.day = 1

        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: date)
        guard let anchorDate = calendar.date(from: anchorComponents) else {
            fatalError("*** Unable to create a valid date from the given components ***")
        }

        let query = HKStatisticsCollectionQuery(quantityType: stepCount,
                                                quantitySamplePredicate: nil,
                                                options: [.cumulativeSum],
                                                anchorDate: anchorDate,
                                                intervalComponents: interval as DateComponents)

        query.initialResultsHandler = { _, results, _ in
            guard let results = results else {
                return
            }

            results.enumerateStatistics(from: anchorDate, to: date) { statistics, _ in
                if let sum = statistics.sumQuantity() {
                    let steps = sum.doubleValue(for: HKUnit.count())

                    print("---Steps taken: \(steps)")
                }
            }
        }

        healthStore.execute(query)
    }

    func getCaloriesBurned(completion: @escaping (Double) -> Void) {
        guard let activeEnergy = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else {
            print("---Active energy not available")
            return
        }

        let date = Date()
        let calendar = Calendar.current

        let interval = NSDateComponents()
        interval.day = 1

        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: date)
        guard let anchorDate = calendar.date(from: anchorComponents) else {
            fatalError("*** Unable to create a valid date from the given components ***")
        }

        let query = HKStatisticsCollectionQuery(quantityType: activeEnergy,
                                                quantitySamplePredicate: nil,
                                                options: [.cumulativeSum],
                                                anchorDate: anchorDate,
                                                intervalComponents: interval as DateComponents)

        query.initialResultsHandler = { _, results, _ in
            guard let results = results else {
                return
            }

            results.enumerateStatistics(from: anchorDate, to: date) { statistics, _ in
                if let sum = statistics.sumQuantity() {
                    let calories = sum.doubleValue(for: HKUnit.kilocalorie())
                    completion(calories)
                }
            }
        }

        healthStore.execute(query)
    }

    func readRestingEnergy() {
        guard let restingEnergy = HKObjectType.quantityType(forIdentifier: .basalEnergyBurned) else {
            print("---Resting energy not available")
            return
        }

        let date = Date()
        let calendar = Calendar.current

        let interval = NSDateComponents()
        interval.day = 1

        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: date)
        guard let anchorDate = calendar.date(from: anchorComponents) else {
            fatalError("*** Unable to create a valid date from the given components ***")
        }

        let query = HKStatisticsCollectionQuery(quantityType: restingEnergy,
                                                quantitySamplePredicate: nil,
                                                options: [.cumulativeSum],
                                                anchorDate: anchorDate,
                                                intervalComponents: interval as DateComponents)

        query.initialResultsHandler = { _, results, _ in
            guard let results = results else {
                return
            }

            results.enumerateStatistics(from: anchorDate, to: date) { statistics, _ in
                if let sum = statistics.sumQuantity() {
                    let restingEnergy = sum.doubleValue(for: HKUnit.kilocalorie())
                    print("---Resting energy: \(restingEnergy)")
                }
            }
        }

        healthStore.execute(query)
    }

    func getDistanceWalkingRunning() {
        let distanceWalkingRunning = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!

        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: [.strictStartDate, .strictEndDate])

        let query = HKStatisticsCollectionQuery(quantityType: distanceWalkingRunning, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: startOfDay, intervalComponents: DateComponents(day: 1))

        query.initialResultsHandler = { _, results, error in
            if let error = error {
                print("Error getting initial results: \(error.localizedDescription)")
                return
            }

            if let results = results {
                results.enumerateStatistics(from: startOfDay, to: now) { statistics, _ in
                    if let quantity = statistics.sumQuantity() {
                        let distanceInMeters = quantity.doubleValue(for: HKUnit.meter())
                        let distanceInKilometers = distanceInMeters / 1000.0
                        print("---Distance walked/run today: \(distanceInKilometers) km")
                    }
                }
            }
        }

        healthStore.execute(query)
    }
}
