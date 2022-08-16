
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModelList = ViewModelList()
    var selectedSchoolModel = SelectedSchoolModel()
    
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
    
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        configureView()
        bind()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailsViewController
        vc.schoolName = selectedSchoolModel.schoolName ?? "No School Found"
        vc.academicOpportunities = "\(selectedSchoolModel.academicOpportunities ?? "")\n\(selectedSchoolModel.academicOpportunities2 ?? "")"
        vc.schoolSports = selectedSchoolModel.schoolSports ?? "No Sport Found"
        vc.overviewParagraph = selectedSchoolModel.overviewParagraph ?? "No Description"
        vc.arrayOfData = [vc.overviewParagraph!, vc.academicOpportunities!, vc.schoolSports!]
        
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
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSchoolModel.schoolName = viewModelList.dataArray[indexPath.row].school_name
        selectedSchoolModel.academicOpportunities = viewModelList.dataArray[indexPath.row].academicopportunities1
        selectedSchoolModel.academicOpportunities2 = viewModelList.dataArray[indexPath.row].academicopportunities2
        selectedSchoolModel.schoolSports = viewModelList.dataArray[indexPath.row].school_sports
        selectedSchoolModel.overviewParagraph = viewModelList.dataArray[indexPath.row].overview_paragraph
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
}

