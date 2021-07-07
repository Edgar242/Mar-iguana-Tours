//
//  CollectionViewControllerSeat.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 05/07/21.
//

import UIKit


struct Seat {
    var number: Int
    let status: Int
}

class CollectionViewControllerSeat: UICollectionViewController {
    private let reuseIdentifier = "MyCell"

    // Bus seats distribution
    let dataSource: [Seat] = [
        Seat(number: -1, status: 0), // Steering wheel
        Seat(number: 0, status: 0),
        Seat(number: 0, status: 0),
        Seat(number: 0, status: 0),
        Seat(number: 0, status: 0),

        Seat(number: 1, status: 0),
        Seat(number: 2, status: 2),
        Seat(number: 0, status: 0),  // Aisle
        Seat(number: 3, status: 2),
        Seat(number: 4, status: 0),

        Seat(number: 5, status: 0),
        Seat(number: 6, status: 2),
        Seat(number: 0, status: 0),  // Aisle
        Seat(number: 7, status: 0),
        Seat(number: 8, status: 0),

        Seat(number: 9, status: 0),
        Seat(number: 10, status: 0),
        Seat(number: 0, status: 0),  // Aisle
        Seat(number: 11, status: 0),
        Seat(number: 12, status: 2),

        Seat(number: 13, status: 2),
        Seat(number: 14, status: 2),
        Seat(number: 0, status: 0),  // Aisle
        Seat(number: 15, status: 0),
        Seat(number: 16, status: 0),

        Seat(number: 17, status: 2),
        Seat(number: 18, status: 0),
        Seat(number: 0, status: 0),  // Aisle
        Seat(number: 19, status: 0),
        Seat(number: 20, status: 0),

        Seat(number: 21, status: 0),
        Seat(number: 22, status: 0),
        Seat(number: 0, status: 0),  // Aisle
        Seat(number: 23, status: 0),
        Seat(number: 24, status: 0),

        Seat(number: 25, status: 0),
        Seat(number: 26, status: 0),
        Seat(number: 0, status: 0),  // Aisle
        Seat(number: 27, status: 0),
        Seat(number: 28, status: 0),

        Seat(number: 29, status: 2),
        Seat(number: 30, status: 0),
        Seat(number: 0, status: 0),  // Aisle
        Seat(number: 31, status: 0),
        Seat(number: 32, status: 2),

        Seat(number: 33, status: 0),
        Seat(number: 34, status: 0),
        Seat(number: 0, status: 0),  // Aisle
        Seat(number: 35, status: 0),
        Seat(number: 36, status: 0),

        Seat(number: 37, status: 0),
        Seat(number: 38, status: 0),
        Seat(number: 0, status: 0),  // Aisle
        Seat(number: 39, status: 0),
        Seat(number: 40, status: 0),

        Seat(number: 41, status: 0),
        Seat(number: 42, status: 0),
        Seat(number: 0, status: 0),  // Aisle
        Seat(number: 43, status: 0),
        Seat(number: 44, status: 0),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        collectionView.dataSource = self
        collectionView.delegate = self

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // 2 seats, 1 Aisle, 2 seats = 5
        return 5
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//        // Configure the cell
//
//        return cell
        
        print("\(indexPath.row) \(dataSource[indexPath.row].number)")
        
        
        let seatCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCellSeat
            
        seatCell.seatNumber.text = String(dataSource[indexPath.row].number)
        return seatCell
        
//            as? CollectionViewCellSeat
//            print(seatCell)
//            seatCell.configure(with: dataSource[indexPath.row].number)
            //        print(seatCell as Any)
//            cell = seatCell
            
        
        
        
//        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
