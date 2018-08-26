import UIKit

@IBDesignable
final class CurrencyTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }

    override func prepareForInterfaceBuilder() {
        setUpViews()
    }
    
    private func setUpViews() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        layer.cornerRadius = 5
        textAlignment = .center
        tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        if let placeHolder = placeholder {
            let place = NSAttributedString(string: placeHolder, attributes: [.foregroundColor: UIColor.lightGray])
            attributedPlaceholder = place
        }
        
        textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

}
