
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var json: Model?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJson()
    }
    
    private func getJson() {
        NetworkManager.shared.getJson { [weak self] result, error in
            guard let self = self else { return }
            self.json = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.json?.view?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var text: String?
        
        switch indexPath.row {
        case 0: text = self.json?.view?[0]
        case 1: text = self.json?.view?[1]
        case 2: text = self.json?.view?[2]
        case 3: text = self.json?.view?[3]
        default:
            break
        }
        cell.textLabel?.text = text?.capitalized
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var data: Data?
        
        switch indexPath.row {
        case 0 : data = self.json?.data?[0]
        case 1 : data = self.json?.data?[2]
        case 2 : data = self.json?.data?[1]
        case 3 : data = self.json?.data?[0]
        default:
            break
        }
        
        let vc = DetailViewController.loadFromNib()
        vc.data = data
        self.present(vc, animated: true, completion: nil)
    }
}

