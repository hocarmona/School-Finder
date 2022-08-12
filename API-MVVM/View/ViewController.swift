
import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var viewModelList = ViewModelList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        configureView()
        bind()
    }

    func configureView() {
        viewModelList.retrieveDataList()
    }
    
    func bind() {
        viewModelList.refresData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    @IBAction func filterButtonPressed(_ sender: UIButton) {
        viewModelList.dataArray = viewModelList.dataArray.filter {$0.borough == "MANHATTAN"}
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

//MARK: - UITableView datasource methods

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelList.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let object = viewModelList.dataArray[indexPath.row]
        cell.textLabel?.text = object.school_name
        cell.detailTextLabel?.text = object.overview_paragraph
        print(object.borough ?? "N/A")
        return cell
    }
}

