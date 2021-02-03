
import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    var data: Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let endData = data?.data else { return }
        self.nameLabel.text = data?.name?.uppercased()
        setData(data: endData)
    }
    
    func setData(data: EndData){
        if data.text != nil {
            textLabel.text = data.text
        }
        
        if data.url != nil {
            let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width/2 , height: self.view.frame.width/2 ))
            imageView.center.x = self.view.center.x
            if let url = URL(string: data.url!) {
                imageView.kf.setImage(with: url)
            }
            self.view.addSubview(imageView)
        }
        if data.selectedId != nil {
            self.setSelector(id: data.selectedId!)
        }
    }
    
    private func setSelector(id: Int) {
        var text: String?
        switch id {
        case 1: text = data?.data?.variants?[0].text
        case 2: text = data?.data?.variants?[1].text
        case 3: text = data?.data?.variants?[2].text
        default:
            break
        }
        textLabel.text = text
    }
}

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        
        return instantiateFromNib()
    }
}
