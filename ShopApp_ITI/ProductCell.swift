//
//  ProductCell.swift
//  ShopApp_ITI
//
//  Created by Zeinab on 20/02/2023.
//

import UIKit

class ProductCell: UICollectionViewCell {

    
    @IBOutlet weak var ImageOfProduct: UIImageView!
    
    @IBOutlet weak var NameOfProduct: UILabel!
    
    
    @IBOutlet weak var PriceOfProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
