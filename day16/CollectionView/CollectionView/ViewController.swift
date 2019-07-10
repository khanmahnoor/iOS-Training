//
//  ViewController.swift
//  CollectionView
//
//  Created by Mahnoor Khan on 08/07/2019.
//  Copyright © 2019 Mahnoor Khan. All rights reserved.
//

import UIKit

struct Item {
    var imageName : String
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items : [Item] = [Item(imageName: "1"),
                        Item(imageName: "2"),
                        Item(imageName: "3"),
                        Item(imageName: "4"),
                        Item(imageName: "5"),
                        Item(imageName: "6"),
                        Item(imageName: "7"),
                        Item(imageName: "8"),
                        Item(imageName: "9"),
                        Item(imageName: "10"),
                        Item(imageName: "11"),
                        Item(imageName: "12 "),
                        Item(imageName: "13"),
                        Item(imageName: "14"),
                        Item(imageName: "15"),
                        Item(imageName: "16"),
                        Item(imageName: "17"),
                        Item(imageName: "18"),
                        Item(imageName: "19")]
    
    let cellIdentifier = "ItemCollectionViewCell"
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    let viewImageSegueIdentifier = "viewImageSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionViewItemSize()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpCollectionView()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let item = sender as! Item
        if segue.identifier == viewImageSegueIdentifier {
            if let vc = segue.destination as? ImageViewerViewController {
                vc.imageName = item.imageName
            }
        }
    }
    private func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }

    private func setupCollectionViewItemSize() {
        if collectionViewFlowLayout == nil {
            let numberOfItemForRow : CGFloat = 3
            let lineSpacing : CGFloat = 5
            let interItemSpacing : CGFloat  = 5
            
            let width = (collectionView.frame.width  - (numberOfItemForRow - 1) * interItemSpacing) / numberOfItemForRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true )
        }
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCollectionViewCell
        
        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt: \(indexPath)" )
        let item = items[indexPath.item]
        performSegue(withIdentifier: viewImageSegueIdentifier, sender: item)
    }
}
