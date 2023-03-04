//
//  ViewController.swift
//  ShopApp_ITI
//
//  Created by Zeinab on 17/02/2023.
//

import UIKit
import Floaty

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var res : ProductsResult?
    var catigories : CustomCollections?
    var flag : Int = 0
    
    @IBAction func kidd(_ sender: Any) {
       flag = 2
        NetworkService.fetch(url: "https://55d695e8a36c98166e0ffaaa143489f9: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@ios-q2-new-capital-2022-2023.myshopify.com/admin/api/2023-01/products.json?collection_id=437787296025") { result in
            self.res = result
            self.Products.reloadData()
        }
    }
    
    @IBAction func menn(_ sender: Any) {
        flag = 3
        NetworkService.fetch(url: "https://55d695e8a36c98166e0ffaaa143489f9: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@ios-q2-new-capital-2022-2023.myshopify.com/admin/api/2023-01/products.json?collection_id=437787230489") { result in
            self.res = result
            self.Products.reloadData()
        }
    }
    
    @IBAction func wommen(_ sender: Any) {
       flag = 4
        NetworkService.fetch(url: "https://55d695e8a36c98166e0ffaaa143489f9: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@ios-q2-new-capital-2022-2023.myshopify.com/admin/api/2023-01/products.json?collection_id=437787263257") { result in
            self.res = result
            self.Products.reloadData()
        }
        
    }
    @IBOutlet weak var toolBar: UIToolbar!
    
    @IBOutlet weak var Products: UICollectionView!
    @IBOutlet weak var floaty: Floaty!
    
    var name = ""
    var price = ""
    var img = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flag = 1
        NetworkService.fetch(url: "https://55d695e8a36c98166e0ffaaa143489f9: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@ios-q2-new-capital-2022-2023.myshopify.com/admin/api/2023-01/products.json?collection_id=437718647065") { result in
            self.res = result
            self.Products.reloadData()
        }
        floaty.addItem(icon: UIImage(named: "shoes")) { _ in
            switch self.flag {
            case 1 :
                NetworkService.fetch(url: "https://55d695e8a36c98166e0ffaaa143489f9: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@ios-q2-new-capital-2022-2023.myshopify.com/admin/api/2023-01/products.json?collection_id=437718647065&product_type=shoes") { result in
                    self.res = result
                    self.Products.reloadData()
                }
            case 2 :
                NetworkService.fetch(url: "https://55d695e8a36c98166e0ffaaa143489f9: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@ios-q2-new-capital-2022-2023.myshopify.com/admin/api/2023-01/products.json?collection_id=437787296025&product_type=shoes") { result in
                self.res = result
                self.Products.reloadData()
            }
            case 3 :
                NetworkService.fetch(url: "https://55d695e8a36c98166e0ffaaa143489f9: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@ios-q2-new-capital-2022-2023.myshopify.com/admin/api/2023-01/products.json?collection_id=437787230489&product_type=shoes") { result in
                self.res = result
                self.Products.reloadData()
            }
            default :
                break
            }
            self.Products.reloadData()
            
        }
        floaty.addItem(icon: UIImage(named: "clothes")) { _ in
            self.name = "clothes"
            self.price = "200$"
            self.img = "clothes"
            self.Products.reloadData()
           
        }
        floaty.addItem(icon: UIImage(named: "accesserios")) { _ in
            self.name = "accesserios"
            self.price = "50$"
            self.img = "accesserios"
            self.Products.reloadData()
            
        }
        
        self.view.addSubview(floaty)
        self.Products.reloadData()
        
        
        
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        Products.register(nib, forCellWithReuseIdentifier: "productCell")

    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return res?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell

        cell.layer.cornerRadius = CGFloat(20)
        
        cell.NameOfProduct.text = res?.products[indexPath.row].title
        cell.PriceOfProduct.text = res?.products[indexPath.row].variants?[0].price
        cell.ImageOfProduct.image = UIImage(named: img)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: (UIScreen.main.bounds.size.width/2) - 30, height: (UIScreen.main.bounds.size.height/4) - 30)
       
    }


}

