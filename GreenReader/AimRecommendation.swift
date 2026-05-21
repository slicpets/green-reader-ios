import Foundation

struct AimRecommendation {

    static func text(for breakInches: Float) -> String {
        if abs(breakInches) < 1 {
            return "Aim straight"
        }

        if breakInches > 0 {
            return "Aim \(abs(breakInches), specifier: "%.1f") inches left"
        } else {
            return "Aim \(abs(breakInches), specifier: "%.1f") inches right"
        }
    }
}
