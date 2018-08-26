
import Foundation

final class Wage {
    
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
        
        let workingHoursInMonth: Double = 8 * 5 * 4
        let hourlyWage = wage / workingHoursInMonth
        return Int(ceil(price / hourlyWage))
    }
    
}
