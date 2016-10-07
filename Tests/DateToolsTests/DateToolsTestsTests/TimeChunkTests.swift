//
//  TimeChunkTests.swift
//  DateToolsTests
//
//  Created by Grayson Webster on 8/26/16.
//  Copyright © 2016 Matthew York. All rights reserved.
//

import XCTest
@testable import DateToolsTests

class TimeChunkTests: XCTestCase {
    
    var controlChunkSeconds = TimeChunk()
    var controlChunkMinutes = TimeChunk()
    var controlChunkHours = TimeChunk()
    var controlChunkDays = TimeChunk()
    var controlChunkWeeks = TimeChunk()
    var controlChunkMonths = TimeChunk()
    var controlChunkYears = TimeChunk()
    
    override func setUp() {
        super.setUp()
        
        controlChunkSeconds = 60.seconds
        controlChunkMinutes = 60.minutes
        controlChunkHours = 24.hours
        controlChunkDays = 7.days
        controlChunkWeeks = 5.weeks
        controlChunkMonths = 12.months
        controlChunkYears = 2.years
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Comparisons
    
    func testEqualsSeconds() {
        let testChunk = 60.seconds
        XCTAssertTrue(controlChunkSeconds.equals(chunk: testChunk))
        XCTAssertFalse(controlChunkSeconds.equals(chunk: 1.minutes))
    }
    
    func testEqualsMinutes() {
        let testChunk = 60.minutes
        XCTAssertTrue(controlChunkMinutes.equals(chunk: testChunk))
        XCTAssertFalse(controlChunkMinutes.equals(chunk: 1.hours))
    }
    
    func testEqualsHours() {
        let testChunk = 24.hours
        XCTAssertTrue(controlChunkHours.equals(chunk: testChunk))
        XCTAssertFalse(controlChunkHours.equals(chunk: 25.hours))
    }
    
    func testEqualsDays() {
        let testChunk = 8.days
        XCTAssertTrue(controlChunkDays.equals(chunk: 7.days))
        XCTAssertFalse(controlChunkDays.equals(chunk: testChunk))
    }
    
    func testEqualsWeeks() {
        let testChunk = 5.weeks
        XCTAssertTrue(controlChunkWeeks.equals(chunk: testChunk))
        XCTAssertFalse(controlChunkWeeks.equals(chunk: 50.weeks))
    }
    
    func testEqualMonths() {
        let testChunk = 12.months
        XCTAssertTrue(controlChunkMonths.equals(chunk: testChunk))
        XCTAssertFalse(controlChunkMonths.equals(chunk: 15.months))
    }
    
    func testEqualYears() {
        let testChunk = TimeChunk(seconds: 43, minutes: 324, hours: 3, days: 342, weeks: 3, months: 4, years: 2)
        XCTAssertTrue(controlChunkYears.equals(chunk: 2.years))
        XCTAssertFalse(controlChunkYears.equals(chunk: testChunk))
    }
    
    
    // MARK: - Comparisons
    
    func testConversionTo() {
        
        // Ascending tests
        XCTAssertTrue(controlChunkSeconds.to(.minutes) == 1)
        XCTAssertTrue(controlChunkMinutes.to(.hours) == 1)
        XCTAssertTrue(controlChunkHours.to(.days) == 1)
        XCTAssertTrue(controlChunkDays.to(.weeks) == 1)
        
        // Descending tests
        XCTAssertTrue(controlChunkYears.to(.weeks) == 52)
        XCTAssertTrue(controlChunkWeeks.to(.days) == 7*5)
        XCTAssertTrue(controlChunkDays.to(.hours) == 7*24)
        XCTAssertTrue(controlChunkHours.to(.minutes) == 60*24)
        XCTAssertTrue(controlChunkMinutes.to(.seconds) == 60*60)
        
        // Large conversions (years)
        XCTAssertTrue(controlChunkYears.to(.seconds) == 2*365*24*60*60)
        XCTAssertTrue(controlChunkYears.to(.minutes) == 2*365*24*60)
        XCTAssertTrue(controlChunkYears.to(.hours) == 2*365*24)
        
        // Large conversions (weeks)
        XCTAssertTrue(controlChunkWeeks.to(.seconds) == 5*7*24*60*60)
        XCTAssertTrue(controlChunkWeeks.to(.minutes) == 5*7*24*60)
        XCTAssertTrue(controlChunkWeeks.to(.hours) == 5*7*24)
        XCTAssertTrue(controlChunkYears.to(.days) == 365*2)
        
        // Large conversions (days)
        XCTAssertTrue(controlChunkDays.to(.seconds) == 7*24*60*60)
        XCTAssertTrue(controlChunkDays.to(.minutes) == 7*24*60)
        
        // Large conversions (hours)
        XCTAssertTrue(controlChunkHours.to(.seconds) == 24*60*60)
        
        // Sanity checks
        XCTAssertTrue(controlChunkSeconds.to(.hours) == 0)
        XCTAssertTrue(controlChunkSeconds.to(.days) == 0)
        XCTAssertTrue(controlChunkSeconds.to(.weeks) == 0)
        XCTAssertTrue(controlChunkSeconds.to(.years) == 0)
        
        XCTAssertTrue(controlChunkMinutes.to(.days) == 0)
        XCTAssertTrue(controlChunkMinutes.to(.weeks) == 0)
        XCTAssertTrue(controlChunkMinutes.to(.years) == 0)
        
        XCTAssertTrue(controlChunkHours.to(.weeks) == 0)
        XCTAssertTrue(controlChunkHours.to(.years) == 0)
        
        XCTAssertTrue(controlChunkDays.to(.years) == 0)
        
        XCTAssertTrue(controlChunkWeeks.to(.years) == 0)
    }
    
    
    // MARK: - Date Creation
    
    func testAgo() {
        XCTFail()
    }
    
    func testUntil() {
        XCTFail()
    }
    
    func testEarlierThan() {
        XCTFail()
    }
    
    func testLaterThan() {
        XCTFail()
    }
    
    
    // MARK: - Lengthen / Shorten
    
    // MARK: In Place
    
    // Lengthened
    func testLengthenedBySeconds() {
        let testChunk = controlChunkSeconds.lengthened(by: 30.seconds)
        XCTAssertTrue(testChunk == 90.seconds)
    }
    
    func testLengthenedByMinutes() {
        let testChunk = controlChunkMinutes.lengthened(by: 30.minutes)
        XCTAssertTrue(testChunk == 90.minutes)
    }
    
    func testLengthenedByHours() {
        let testChunk = controlChunkHours.lengthened(by: 3.hours)
        XCTAssertTrue(testChunk == 27.hours)
    }
    
    func testLengthenedByDays() {
        let testChunk = controlChunkDays.lengthened(by: 2.days)
        XCTAssertTrue(testChunk == 9.days)
    }
    
    func testLengthenedByWeeks() {
        let testChunk = controlChunkWeeks.lengthened(by: 1.weeks)
        XCTAssertTrue(testChunk == 6.weeks)
    }
    
    func testLengthenedByMonths() {
        let testChunk = controlChunkMonths.lengthened(by: 4.months)
        XCTAssertTrue(testChunk == 16.months)
    }
    
    func testLengthenedByYears() {
        let testChunk = controlChunkYears.lengthened(by: 5.years)
        XCTAssertTrue(testChunk == 7.years)
    }
    
    // Shortened
    func testShortenedBySeconds() {
        let testChunk = controlChunkSeconds.shortened(by: 30.seconds)
        XCTAssertTrue(testChunk == 30.seconds)
    }
    
    func testShortenedByMinutes() {
        let testChunk = controlChunkMinutes.shortened(by: 30.minutes)
        XCTAssertTrue(testChunk == 30.minutes)
    }
    
    func testShortenedByHours() {
        let testChunk = controlChunkHours.shortened(by: 3.hours)
        XCTAssertTrue(testChunk == 21.hours)
    }
    
    func testShortenedByDays() {
        let testChunk = controlChunkDays.shortened(by: 2.days)
        XCTAssertTrue(testChunk == 5.days)
    }
    
    func testShortenedByWeeks() {
        let testChunk = controlChunkWeeks.shortened(by: 1.weeks)
        XCTAssertTrue(testChunk == 4.weeks)
    }
    
    func testShortenedByMonths() {
        let testChunk = controlChunkMonths.shortened(by: 4.months)
        XCTAssertTrue(testChunk == 8.months)
    }
    
    func testShortenedByYears() {
        let testChunk = controlChunkYears.shortened(by: 5.years)
        XCTAssertTrue(testChunk == -3.years)
    }
    
    // MARK: Mutation
    
    // Lengthen
    func testLenghtenBySeconds() {
        controlChunkSeconds.lengthen(by: 30.seconds)
        XCTAssertTrue(controlChunkSeconds == 90.seconds)
    }
    
    func testLengthenByMinutes() {
        controlChunkMinutes.lengthen(by: 30.minutes)
        XCTAssertTrue(controlChunkMinutes == 90.minutes)
    }
    
    func testLengthenByHours() {
        controlChunkHours.lengthen(by: 3.hours)
        XCTAssertTrue(controlChunkHours == 27.hours)
    }
    
    func testLenghtenByDays() {
        controlChunkDays.lengthen(by: 2.days)
        XCTAssertTrue(controlChunkDays == 9.days)
    }
    
    func testLenghtenByWeeks() {
        controlChunkWeeks.lengthen(by: 4.weeks)
        XCTAssertTrue(controlChunkWeeks == 9.weeks)
    }
    
    func testLengthenByYears() {
        controlChunkYears.lengthen(by: 1.years)
        XCTAssertTrue(controlChunkYears == 3.years)
    }
    
    // Shorten
    func testShortenBySeconds() {
        controlChunkSeconds.shorten(by: 30.seconds)
        XCTAssertTrue(controlChunkSeconds == 30.seconds)
    }
    
    func testShortenByMinutes() {
        controlChunkMinutes.shorten(by: 30.minutes)
        XCTAssertTrue(controlChunkMinutes == 30.minutes)
    }
    
    func testShortenByHours() {
        controlChunkHours.shorten(by: 3.hours)
        XCTAssertTrue(controlChunkHours == 21.hours)
    }
    
    func testShortenByDays() {
        controlChunkDays.shorten(by: 2.days)
        XCTAssertTrue(controlChunkDays == 5.days)
    }
    
    func testShortenByWeeks() {
        controlChunkWeeks.shorten(by: 4.weeks)
        XCTAssertTrue(controlChunkWeeks == 1.weeks)
    }
    
    func testShortenByYears() {
        controlChunkYears.shorten(by: 1.years)
        XCTAssertTrue(controlChunkYears == 1.years)
    }
    
    
    // MARK: - Operator Overloads
    
    func testEqualsOperator() {
        let testChunk = 4.seconds
        XCTAssertTrue(testChunk == 4.seconds)
    }
    
    func testPlusOperator() {
        let testChunk = controlChunkSeconds + 5.seconds
        XCTAssertTrue(testChunk == 65.seconds)
    }
    
    func testMinusOperator() {
        let testChunk = controlChunkSeconds - 10.seconds
        XCTAssertTrue(testChunk == 50.seconds)
    }
    
    func testNegativeSeconds() {
        let testChunk = -controlChunkSeconds
        XCTAssertTrue(testChunk == -60.seconds)
    }
    
    func testNegativeMinutes() {
        let testChunk = -controlChunkMinutes
        XCTAssertTrue(testChunk == -60.minutes)
    }
    
    func testNegativeHours() {
        let testChunk = -controlChunkHours
        XCTAssertTrue(testChunk == -24.hours)
    }
    
    func testNegativeDays() {
        let testChunk = -controlChunkDays
        XCTAssertTrue(testChunk == -7.days)
    }
    
    func testNegativeWeeks() {
        let testChunk = -controlChunkWeeks
        XCTAssertTrue(testChunk == -5.weeks)
    }
    
    func testNegativeMonths() {
        let testChunk = -controlChunkMonths
        XCTAssertTrue(testChunk == -12.months)
    }
    
    func testNegativeYears() {
        let testChunk = -controlChunkYears
        XCTAssertTrue(testChunk == -2.years)
    }
    
}