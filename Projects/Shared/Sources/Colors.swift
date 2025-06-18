import UIKit

public extension UIColor {

    static let primary = UIColor(hex: "#FF3C8D")
    static let secondary = UIColor(hex: "#D1D8DD")
    static let additionalBackground = UIColor(hex:"#F6F6F6")
    static let alert = UIColor(hex:"#F41F52")
    static let gray100 = UIColor(hex:"#171725")
    static let gray90 = UIColor(hex:"#434E58")
    static let gray70 = UIColor(hex: "#78828A")
    static let gray60 = UIColor(hex:"#9CA4AB")
    
    static let line = UIColor(hex:"#E9EBED")

    // convenience init (HEX → UIColor)
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.hasPrefix("#") ? String(hexSanitized.dropFirst()) : hexSanitized

        var rgb: UInt64 = 0
        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else { return nil }

        let length = hexSanitized.count
        switch length {
        case 6: // RRGGBB
            let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(rgb & 0x0000FF) / 255.0
            self.init(red: r, green: g, blue: b, alpha: 1)
        case 8: // AARRGGBB
            let a = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            let r = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            let g = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            let b = CGFloat(rgb & 0x000000FF) / 255.0
            self.init(red: r, green: g, blue: b, alpha: a)
        default:
            return nil
        }
    }
    
    func darker(by percentage: CGFloat = 20.0) -> UIColor {
        return self.adjust(by: -abs(percentage))
    }
    
    func adjust(by percentage: CGFloat = 20.0) -> UIColor {
          var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
          if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
              return UIColor(
                  red: max(red + percentage/100, 0.0),
                  green: max(green + percentage/100, 0.0),
                  blue: max(blue + percentage/100, 0.0),
                  alpha: alpha
              )
          }
          return self
      }
}
