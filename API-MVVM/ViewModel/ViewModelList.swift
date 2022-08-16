
import Foundation

class ViewModelList {

    let url: String = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    
    var refresData = { () -> () in }
    
    var dataArray: [List] = [] {
        didSet {
            refresData()
        }
    }

    
    func retrieveDataList() {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, responce, error in
            guard let json = data else { return }
            
            do {
                let decoder = JSONDecoder()
                self.dataArray = try decoder.decode([List].self, from: json)
            } catch {
                print(error)
            }
        } .resume()
    }

}
