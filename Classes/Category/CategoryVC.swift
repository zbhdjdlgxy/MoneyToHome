//
//  CategoryVC.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/4.
//  Copyright © 2017年 szgyzb. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController, UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource{

    static let leftCellidentifer : String = "CategoryCell"
    static let rightCellIdentifier = "CategoryGoodsCell"
    static let rightHeaderIdentifier = "CategoryGoodsHeader"
    
    var leftGoodsCategorys = [GoodsCategoryItem]()  //左边的父品类
    
    var selectLeftCategoryTitle : String = ""    //左边选中的父品类标题
    
    var rightCategoryGoodsArr = [GoodsCategoryItem]() //右边的子品类
    
    var categoryTable : UITableView = {
        
        let tableView : UITableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: 120, height: SCREEN_HEIGHT))
        tableView.backgroundColor = UIColor.groupTableViewBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: leftCellidentifer)
        return tableView
    }()
    
    var goodsCollectionView : UICollectionView = {
        
        let collectionViewW = SCREEN_WIDTH - 120
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.headerReferenceSize = CGSize(width: collectionViewW, height: 26)
        let itemW = collectionViewW / 4 - 8
        let itemH = itemW + 10
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsetsMake(4, 4, 0, 4)
        flowLayout.itemSize = CGSize(width: itemW, height: itemH)
        let collectionView = UICollectionView.init(frame: CGRect.init(x: 120, y: 64, width: SCREEN_WIDTH - 120, height: SCREEN_HEIGHT), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: rightCellIdentifier)
        collectionView.register(CategoryGoodsHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: rightHeaderIdentifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.groupTableViewBackground
        categoryTable.delegate = self
        categoryTable.dataSource = self
        goodsCollectionView.delegate = self
        goodsCollectionView.dataSource = self
        self.view.addSubview(categoryTable)
        self.view.addSubview(goodsCollectionView)
        self.requestForCategoryGoodsList(categoryFatherId: "0")
    }

    //请求商品列表
    func requestForCategoryGoodsList(categoryFatherId : String){
        
        let param : GetGoodsCategoryListParam = GetGoodsCategoryListParam()
        param.CategoryFatherId = categoryFatherId
        CategoryTool.getCategoryGoodsListWithParam(param, success: { (result ) in
            
            if result.Status == 0{
                if categoryFatherId == "0"{
                    
                    self.leftGoodsCategorys = result.DataList
                    self.categoryTable.reloadData()
                    self.selectLeftCategoryTitle = self.leftGoodsCategorys[0].CategoryName!
                    let index : IndexPath = IndexPath(row: 0, section: 0)
                    self.categoryTable.selectRow(at: index, animated: false, scrollPosition: UITableViewScrollPosition.top)
                    self.requestForCategoryGoodsList(categoryFatherId: "1")
                }else{
                    self.rightCategoryGoodsArr = result.DataList
                    self.goodsCollectionView.reloadData()
                }
                
                
            }
            
        }) { (error) in
            
            
        }
    }
    
    //MARK: UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return self.leftGoodsCategorys.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: CategoryVC.leftCellidentifer, for: indexPath)
        cell.backgroundColor = UIColor.groupTableViewBackground
        let item : GoodsCategoryItem = self.leftGoodsCategorys[indexPath.row]
        cell.textLabel?.text = item.CategoryName
        return cell
    
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let item : GoodsCategoryItem = self.leftGoodsCategorys[indexPath.row]
        self.selectLeftCategoryTitle = item.CategoryName!
        self.requestForCategoryGoodsList(categoryFatherId: (item.CategoryId?.description)!)
    }
    
    //MARK: UICollectionViewDataSource
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return self.rightCategoryGoodsArr.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let itemCell :  CategoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryVC.rightCellIdentifier, for: indexPath) as! CategoryCollectionViewCell
        itemCell.goodsItem = self.rightCategoryGoodsArr[indexPath.row]
        return itemCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        var headerView : CategoryGoodsHeaderView?
        if kind == UICollectionElementKindSectionHeader {
            
            headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CategoryVC.rightHeaderIdentifier, for: indexPath) as? CategoryGoodsHeaderView
            headerView?.title = self.selectLeftCategoryTitle
        
        }
        return headerView!
    }
}
