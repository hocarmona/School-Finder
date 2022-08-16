
import UIKit

class DetailsViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    var schoolName: String?
    var academicOpportunities: String?
    var academicOpportunities2: String?
    var schoolSports: String?
    var overviewParagraph: String?
    var arrayOfData: [String]? = []
    let arrayOfSectionsTitles: [String] = ["Overview", "Academic Opportunities", "Sports"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        tableView.tableHeaderView = header
        let label = UILabel(frame: header.bounds)
        label.text = schoolName
        label.numberOfLines = 0
        header.backgroundColor = .blue
        label.textColor = .white
        label.textAlignment = .center
        header.addSubview(label)

    }
    

}

extension DetailsViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfData!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayOfSectionsTitles[indexPath.row]
        cell.detailTextLabel?.text = arrayOfData![indexPath.row]
        return cell
    }
}
