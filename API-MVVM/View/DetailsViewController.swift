//
//  DetailsViewController.swift
//  API-MVVM
//
//  Created by Hector Carmona on 8/12/22.
//

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
        navigationItem.title = schoolName ?? "No School Found"


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
