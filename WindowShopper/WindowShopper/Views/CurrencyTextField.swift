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
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        
        let lblFrame = CGRect(x: 15, y: ((frame.size.height / 2) - size / 2), width: size, height: size)
        
        let currencyLbl = UILabel(frame: lblFrame)
        currencyLbl.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 0.4780340325)
        currencyLbl.textAlignment = .center
        currencyLbl.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        currencyLbl.layer.cornerRadius = 5
        currencyLbl.clipsToBounds = true
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        
        currencyLbl.text = formatter.currencySymbol
        
        addSubview(currencyLbl)
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
