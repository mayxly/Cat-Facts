import Foundation
import UIKit

struct CatBreed: Codable {
    let name: String
    let id: String
}

struct CatImage: Codable {
    let url: String
}

class BreedViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var catPicker: UIPickerView!
    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var catName: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let responseArray = [String]()
    var breeds = [String]()
    var catBreeds = [CatBreed]()
    var catImages = [CatImage]()
    
    var chosenRow = 0
    
    let error = NSError(domain: "com.example.error", code: 0, userInfo: [NSLocalizedDescriptionKey: "message"])
    
    override func viewDidLoad() {
        let urlBreed = URL(string: "https://api.thecatapi.com/v1/breeds")!
        NetworkManager.performGETRequestArray(urlBreed) { [self] responseArray, error in
//            guard error != nil else {
//                print("ERROR:", error ?? "error")
//                return
//            }
            guard let responseArray else {
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let data = try JSONSerialization.data(withJSONObject: responseArray)
                catBreeds = try decoder.decode([CatBreed].self, from: data)
            } catch {
                print(error)
            }
//            print("Count", catBreeds.count)
//            print(catBreeds)
            for i in 0..<catBreeds.count {
                breeds.append(catBreeds[i].name)
//                print(i, breeds[i])
            }
            //Connect Data
            DispatchQueue.main.async {
                self.catPicker.delegate = self
                self.catPicker.dataSource = self
                self.collectionView.delegate = self
                self.collectionView.dataSource = self
            }
        }
        catPicker.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return breeds.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return breeds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectButton.setTitle("Generating...", for: [])
        catPicker.isHidden = true
        
        let selectedBreed = catBreeds[row]
        print(selectedBreed)
        let urlImages = URL(string: "https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=\(selectedBreed.id)")
        NetworkManager.performGETRequestArray(urlImages) { [self] responseArray
            , error in
            guard let responseArray else {
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let data = try JSONSerialization.data(withJSONObject: responseArray)
                catImages = try decoder.decode([CatImage].self, from: data)
            } catch {
                print(error)
            }
            print("Count", catImages.count)
            for i in 0..<catImages.count {
                print(i, catImages[i])
            }
        }
        selectButton.setTitle("Select a Breed", for: [])
        catName.text = selectedBreed.name
        self.chosenRow = row
        collectionView.reloadData()
        
    }
    
    @IBAction func selectPressed(_ sender: UIButton) {
        if catPicker.isHidden {
            catPicker.isHidden = false
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom", for: indexPath)
        cell.backgroundColor = UIColor.black
        
        let imageview:UIImageView=UIImageView(frame: CGRectMake(0, 0, 178, 178))
        
//        print("curCount:", catImages.count)
//        if (catImages.count != 0) {
//            print("chosenRow:", chosenRow)
//            print("url:", catImages[chosenRow].url)
            guard let url = URL(string: "https://cdn2.thecatapi.com/images/7isAO4Cav.jpg") else {
                return cell
            }
//            let data = try? Data(contentsOf: url)
            var image = UIImage(named: "logo.png")
            
//            if let imageData = data {
//                image = UIImage(data: imageData)
//            }
            imageview.image = image
            cell.contentView.addSubview(imageview)
            //        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(178, 178)
    }

}
