import UIKit


class FlickrPhotosViewController: UICollectionViewController {
  
  private let reuseIdentifier = "FlickrCell"
  private let sectionInsets = UIEdgeInsets(top : 50.0 ,left : 20.0, bottom : 50.0, right : 20.0)
  private var searches: [FlickrSearchResults] = []
  private let flickr = Flickr()
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Private
private extension FlickrPhotosViewController {
  func photo(for indexPath: IndexPath) -> FlickrPhoto {
    return searches[indexPath.section].searchResults[indexPath.row]
  }
}

// MARK: - Text Field Delegate
extension FlickrPhotosViewController : UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // 1
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    textField.addSubview(activityIndicator)
    activityIndicator.frame = textField.bounds
    activityIndicator.startAnimating()
    
    flickr.searchFlickr(for: textField.text!) { searchResults in
      activityIndicator.removeFromSuperview()
      
      switch searchResults {
      case .error(let error) :
        // 2
        print("Error Searching: \(error)")
      case .results(let results):
        // 3
        print("Found \(results.searchResults.count) matching \(results.searchTerm)")
        self.searches.insert(results, at: 0)
        // 4
        self.collectionView?.reloadData()
      }
    }
    
    textField.text = nil
    textField.resignFirstResponder()
    return true
  }
}

// MARK: - UICollectionViewDataSource
extension FlickrPhotosViewController {
  //1
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return searches.count
  }
  
  //2
  override func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
    return searches[section].searchResults.count
  }
  
  //3
  override func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
    let cell = collectionView
      .dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    cell.backgroundColor = .black
    // Configure the cell
    return cell
  }
}
