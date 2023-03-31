////
////  IncercareDeSters.swift
////  prototypeapp
////
////  Created by Senila Constantin on 31.03.2023.
///:
//TODO: tab bar
//import Foundation
//
//struct TabBarView: View {
//    @State private var selected: String = ""
//    var color: Color
//    @State var textsNameBar: [String] = ["Home", "Stats", "Profile"]
//    @State var iconsBar: [String] = ["homekit", "list.star", "person.crop.circle"]
//    var body: some View {
//        VStack() {
//            TabView(selection: $selected) {
//                ItemTabBar(nameImage: "homekit", titleName: "Home", color: Color.yellow)
//                    .tag("Home")
//                ItemTabBar(nameImage: "list.star", titleName: "Stats", color: Color.yellow)
//                    .tag("Stats")
//                ItemTabBar(nameImage: "person.crop.circle", titleName: "Profile", color: Color.yellow)
//                    .tag("Profile")
//            }
//            .accentColor(.blue)
//            //            .cornerRadius(200, corners: [.topLeft, .topRight])
//            //            .background(Color.clear)
//            ZStack {
//                color
//                    .cornerRadius(40, corners: [.topLeft, .topRight])
//                    .edgesIgnoringSafeArea(.bottom)
//                    .frame(width: UIScreen.main.bounds.size.width, height: 60)
//                HStack(alignment: .top, spacing: 40) {
//                    ForEach(0..<3) { index in
//                        Button(action: {
//                            selected = textsNameBar[index]
//                        }) {
////                            VStack(spacing: 4) {
//                                ItemTabBar(nameImage: iconsBar[index], titleName: textsNameBar[index], color: selected == textsNameBar[index] ? .primaryGreen : .gray)
//                                .padding(.top, 0)
////                            }
//
//                            //                        .padding(.bottom, 30)
//                            //                        .edgesIgnoringSafeArea(.bottom)
//                            //                        .foregroundColor(selected == textsNameBar[index] ? .blue : .gray)
//                            //                        .background(selected == textsNameBar[index] ? Color.white : Color.clear)
//                            //                        .frame(maxWidth: .infinity)
//                        }
//                        .offset(y: selected == textsNameBar[index] ? -20 : 0)
//                    }
//                }.padding(.top, 0)
//
//                //            .background(Color.gray.opacity(0.1))
//                //            .border(Color.gray.opacity(0.4), width: 1)
//                //            .cornerRadius(60, corners: [.topLeft, .topRight])
//            }
////            .frame(width: UIScreen.main.bounds.size.width)
////            .edgesIgnoringSafeArea(.bottom)
////            .ignoresSafeArea(.all)
////            .background(Color.red.cornerRadius(50, corners: [.topLeft, .topRight]))
//        }
//        //        .edgesIgnoringSafeArea(.bottom)
////        .background(color.cornerRadius(5060, corners: [.topLeft, .topRight]))
//        //        .foregroundColor(Color.yellow)
//        //        .cornerRadius(60, corners: [.topLeft, .topRight])
//    }
//}
//
////struct TabBarView_Previews: PreviewProvider {
////    static var previews: some View {
////        TabBarView(color: Color.blue)
////    }
////}
//
//struct ItemTabBar: View {
//    @State private var circleSize: CGSize = .zero
//    var nameImage: String
//    var titleName: String
//    var color: Color
//    var body: some View {
//        ZStack {
//            Circle()
//                .frame(width: circleSize.width + 20, height: circleSize.height + 20)
//                .foregroundColor(Color.white)
//            VStack {
//                Image(systemName: nameImage)
//                    .foregroundColor(color) // Color.primaryGreen // Color.black
//                Text(titleName)
//                    .cardTextStyle(font: Font.avenirMedium13(), color: color)
//            }
//            .background(GeometryReader { proxy in
//                Color.clear
//                    .onAppear {
//                        circleSize = proxy.size
//                    }
//            })
//        }
//    }
//}
//
//struct ItemTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemTabBar(nameImage: "homekit", titleName: "Home", color: Color.primaryGreen)
//    }
//}
//
//
//import Foundation
//import SwiftUI
//
//struct CardTextViewModifier: ViewModifier {
//    var font: Font
//    var color: Color
//
//    func body(content: Content) -> some View {
//        content
//            .font(font)
//            .foregroundColor(color)
//            .fixedSize(horizontal: false, vertical: true)
//    }
//}
//
//extension View {
//    func cardTextStyle(font: Font, color: Color) -> some View {
//        modifier(CardTextViewModifier(font: font, color: color))
//    }
//}
//
//


//import SwiftUI
//
//struct EventTabBar: ViewModifier {
//    var backgroundColor: Color
//    func body(content: Content) -> some View {
//        content
////            .padding([.leading, .trailing], 10)
//            .background(backgroundColor)
//            .cornerRadius(AppConstants.EventView.headerCornerRadius, corners: [.topLeft, .topRight])
//    }
//}
//
//extension View {
//    func eventTabBar(backgroundColor: Color) -> some View {
//        modifier(EventTabBar(backgroundColor: backgroundColor))
//    }
//}



//
IHealth  API

       /// Call getClinics
//        getClinics(token: token) { dataR in
//            if let dataResponse = dataR {
//                dataResponse.forEach({ clinic in
//                    if let clinic = clinic.name {
//                        print("\(clinic)")
//
//                    }
//                })
//            }
//        }

 /// Call getTests
//        getTests(token: token, uuidClinic: "9f7421b0-1746-4ba7-a38d-bd73d6680d7c") { dataR in
//            if let dataResponse = dataR {
//                dataResponse.forEach({ test in
//                    if let test = test.name {
//                        print("\(test)")
//
//                    }
//                })
//            }
//        }

///Call getAppointmentByClinicId
//        getAppointmentClinicId(token: token, uuidClinic: "4e37e6be-ef74-4d1f-8ed4-b3d032b33c30") { dataR in
//            if let dataResponse = dataR {
//                dataResponse.forEach({ appointment in
//                    print("----------aici\(appointment.date)")
//                    if let appointmentC = appointment.date {
//                        print("\(appointmentC)")
//                    }
//                })
//            }
//        }

/// Call addAppointmentByClinicId & update
//        let appointment : AppointmentModel = .init(uuid: "nimwresdfghjh231312rewfs52eeedic",
//                                                   clinicID: "4e37e6be-ef74-4d1f-8ed4-b3d032b33c30",
//                                                   date: "2022/10/20/15:00",
//                                                   nameTest: "Covid Maine",
//                                                   clientID: "5d65facd-0994-4434-a421-2f7ccb7b0765",
//                                                   nameClient: "Senila Constantin")
//        updateAppointment(token: token, apppointment: appointment) { error in
//            if let error = error {
//                print(error)
//            } else {
//                print("-----esti bbravo!")
//            }
//        }

//
/// Call addSymptomQuestion
//        let sqna: SymptomQuestionNoAnswerModelPost = .init(uuid: "", title: "Titlu Swift1")
//        addSymptomQuestion(token: token, symptomQuestionNoAnswer: sqna) { error in
//            if let dataResponse = error {
//                print("---------\(dataResponse)")
//            } else {
//                print("------totul  amers bine!")
//            }
//        }
//


 ///addAnswer
//        let answer: AnswerModelPost = .init(uuid: "",
//                                            symptomQuestionID: "00bd6740-2c29-41c6-a91d-1ac22dc6f183",
//                                            optionTItle: "swift1",
//                                            optionDescription: "swiftDescription1")
//        addAnswer(token: token, answer: answer) { error in
//            if let dataResponse = error {
//                print("---------\(dataResponse)")
//            } else {
//                print("------totul a mers bine!")
//            }
//        }
//        ///


//        //Call getSymptomQuestions
//        getSymptomQuestions(token: token, testResponse: { dataR in
//            if let dataResponse = dataR {
//                dataResponse.forEach({ smt in
//                    print("----------aici\(smt.title)")
//                    if let smtC = smt.title {
//                        print("\(smtC)")
//                    }
//                    if let answer = smt.answers {
//                        answer.forEach { answ in
//                            print("\(answ.optionDescription)")
//                        }
//                    }
//                })
//            }
//        })
//        ///


////////////////////
// func getClinicsByTestIdData(token: TokenModel, testID: String, clinicResponse: @escaping (_ data: Data?) -> Void) {
//        let urlString = "\(ApiConstants.basePath)\(ApiConstants.URLEndpoint.getClinicsByTestId)/\(testID)"
//        guard let url = URL(string: urlString) else {
//            print("url found nil")
//            return
//        }
//
//        let accessToken = token.accessToken // token is type TokenModel
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.addValue("Bearer \(accessToken ?? "")", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil, let response = response as? HTTPURLResponse,
//                  response.statusCode >= 200, response.statusCode < 300
//            else {
//                clinicResponse(nil)
//                print("getClinicsByTest Response Error")
//                return
//            }
//            clinicResponse(data)
//        }
//        .resume()
//    }
//
//    func getClinicsByTestId(token: TokenModel, testID: String, clinicResponse: @escaping (_ data: [ClinicModel]?) -> Void) {
//        getClinicsByTestIdData(token: token, testID: testID) { dataR in
//            if let dataResponse = dataR {
//                guard let decodedData = try? JSONDecoder().decode([ClinicModel].self, from: dataResponse) else {
//                    clinicResponse(nil)
//                    return
//                }
//                clinicResponse(decodedData)
//            }
//        }
//    }
/////////////////////////////
//
// /////
//        ///
//        ///
////        let card: DashboardCardModel = .init(title: "iosT", time: "ceva data", description: "String?", cardType: CardType.SPORTS)
////        addCard(token: token, card: card) { error in
////            if let error = error {
////                print(error)
////            } else {
////                print("-----esti bbravo!")
////            }
////        }
//        ///
//        ///
//        /////
//
/////////delete Card
//// deleteCard
//        APIDashboardCard.shared.deleteCard(token: token, idCard: "31e41ca0-a423-437b-9340-4c5caa0613f9") { error in
//            if let err = error {
//                print("----\(err)")
//            } else {
//                print("----bine ma")
//            }
//        }
//        //
//
//////
/////get progress Call
//
//        getProgress(token: token) { data in
//            if let data = data {
//                print("----\(data.progress)")
//            } else {
//                print("----nu e bine")
//            }
//        }
//        //
////////
///
///
///
//{
//    let healthStore = HKHealthStore()
//
//    func requestAuthorization() {
//        guard HKHealthStore.isHealthDataAvailable() else {
//            return
//        }
//
//        let readDataTypes: Set<HKObjectType> = [HKObjectType.quantityType(forIdentifier: .stepCount)!, HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!, HKObjectType.quantityType(forIdentifier: .basalEnergyBurned)!, HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!]
////        let typesToRead = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
////        let typesToWrite = Set([HKObjectType.quantityType(forIdentifier: .stepCount)!])
//
//        healthStore.requestAuthorization(toShare: nil, read: readDataTypes) { success, _ in
//            if success {
//                print("HealthKit authorization successful")
//            } else {
//                print("HealthKit authorization denied")
//            }
//        }
//    }
//
//    func readSteps() {
//        guard let stepCount = HKObjectType.quantityType(forIdentifier: .stepCount) else {
//            print("---Step count not available")
//            return
//        }
//
//        let date = Date()
//        let calendar = Calendar.current
//
//        let interval = NSDateComponents()
//        interval.day = 1
//
//        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: date)
//        guard let anchorDate = calendar.date(from: anchorComponents) else {
//            fatalError("*** Unable to create a valid date from the given components ***")
//        }
//
//        let query = HKStatisticsCollectionQuery(quantityType: stepCount,
//                                                quantitySamplePredicate: nil,
//                                                options: [.cumulativeSum],
//                                                anchorDate: anchorDate,
//                                                intervalComponents: interval as DateComponents)
//
//        query.initialResultsHandler = { _, results, _ in
//            guard let results = results else {
//                return
//            }
//
//            results.enumerateStatistics(from: anchorDate, to: date) { statistics, _ in
//                if let sum = statistics.sumQuantity() {
//                    let steps = sum.doubleValue(for: HKUnit.count())
//
//                    print("---Steps taken: \(steps)")
//                }
//            }
//        }
//
//        healthStore.execute(query)
//    }
//
//    func getCaloriesBurned(completion: @escaping (Double) -> Void) {
//        guard let activeEnergy = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else {
//            print("---Active energy not available")
//            return
//        }
//
//        let date = Date()
//        let calendar = Calendar.current
//
//        let interval = NSDateComponents()
//        interval.day = 1
//
//        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: date)
//        guard let anchorDate = calendar.date(from: anchorComponents) else {
//            fatalError("*** Unable to create a valid date from the given components ***")
//        }
//
//        let query = HKStatisticsCollectionQuery(quantityType: activeEnergy,
//                                                quantitySamplePredicate: nil,
//                                                options: [.cumulativeSum],
//                                                anchorDate: anchorDate,
//                                                intervalComponents: interval as DateComponents)
//
//        query.initialResultsHandler = { _, results, _ in
//            guard let results = results else {
//                return
//            }
//
//            results.enumerateStatistics(from: anchorDate, to: date) { statistics, _ in
//                if let sum = statistics.sumQuantity() {
//                    let calories = sum.doubleValue(for: HKUnit.kilocalorie())
//                    completion(calories)
//                }
//            }
//        }
//
//        healthStore.execute(query)
//    }
//
//    func readRestingEnergy() {
//        guard let restingEnergy = HKObjectType.quantityType(forIdentifier: .basalEnergyBurned) else {
//            print("---Resting energy not available")
//            return
//        }
//
//        let date = Date()
//        let calendar = Calendar.current
//
//        let interval = NSDateComponents()
//        interval.day = 1
//
//        let anchorComponents = calendar.dateComponents([.day, .month, .year], from: date)
//        guard let anchorDate = calendar.date(from: anchorComponents) else {
//            fatalError("*** Unable to create a valid date from the given components ***")
//        }
//
//        let query = HKStatisticsCollectionQuery(quantityType: restingEnergy,
//                                                quantitySamplePredicate: nil,
//                                                options: [.cumulativeSum],
//                                                anchorDate: anchorDate,
//                                                intervalComponents: interval as DateComponents)
//
//        query.initialResultsHandler = { _, results, _ in
//            guard let results = results else {
//                return
//            }
//
//            results.enumerateStatistics(from: anchorDate, to: date) { statistics, _ in
//                if let sum = statistics.sumQuantity() {
//                    let restingEnergy = sum.doubleValue(for: HKUnit.kilocalorie())
//                    print("---Resting energy: \(restingEnergy)")
//                }
//            }
//        }
//
//        healthStore.execute(query)
//    }
//
//    func getDistanceWalkingRunning() {
//        let distanceWalkingRunning = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!
//
//        let now = Date()
//        let startOfDay = Calendar.current.startOfDay(for: now)
//        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: [.strictStartDate, .strictEndDate])
//
//        let query = HKStatisticsCollectionQuery(quantityType: distanceWalkingRunning, quantitySamplePredicate: predicate, options: .cumulativeSum, anchorDate: startOfDay, intervalComponents: DateComponents(day: 1))
//
//        query.initialResultsHandler = { _, results, error in
//            if let error = error {
//                print("Error getting initial results: \(error.localizedDescription)")
//                return
//            }
//
//            if let results = results {
//                results.enumerateStatistics(from: startOfDay, to: now) { statistics, _ in
//                    if let quantity = statistics.sumQuantity() {
//                        let distanceInMeters = quantity.doubleValue(for: HKUnit.meter())
//                        let distanceInKilometers = distanceInMeters / 1000.0
//                        print("---Distance walked/run today: \(distanceInKilometers) km")
//                    }
//                }
//            }
//        }
//
//        healthStore.execute(query)
//    }
//}
///
///
///
//spring:
//  datasource:
//    url: jdbc:postgresql://localhost:5432/health
//    username: postgres
//    password: Senila1234
//  cloud:
//    refresh:
//      enabled: false
//  jpa:
//    properties:
//      hibernate:
//        jdbc:
//          time_zone: UTC
//    properties.hibernate.dialect: org.hibernate.dialect.PostgreSQLDialect
//    database-platform: org.hibernate.dialect.PostgreSQL9Dialect
//    properties.hibernate.temp.use_jdbc_metadata_defaults: false
//    hibernate.ddl-auto: update
//  main:
//    allow-bean-definition-overriding: true
//  jackson:
//    default-property-inclusion: non_null
//
//security:
//  jwt:
//    keyStore: guildakeystore.jks
//    keyStorePassword: RKx%?#7+5!H!B
//    keyPairAlias: guildakey
//  auth:
//    resourceId: guilda
//    clientId: GUILDA_CLIENT
//    clientSecret: SECRET
//  times:
//    accessTimeout: 21600
//    refreshTimeout: 518400
//    forgotPasswordTimeout: 10
//  routes:
//    baseUrl: http://localhost:8080
//    forgotPasswordUrl: http://localhost:8080/forgot-password?token=
//    loginUrl: http://localhost:8080/login
//
//mail:
//  type: smtp
//  sender:
//    id: internal@zynksoftware.com
//    password: qccM3Jn3tfVPGDZY
//    personal: Zynk Software
//  smtp:
//    host: smtp.gmail.com
//    port: 587
//    auth: true
//    starttls:
//      enable: true
//
//# LOGGING
//logging.level.org.springframework.security: DEBUG
//#logging.level.org.hibernate: DEBUG
//logging.level.org.springframework.web: DEBUG
//
//
//
