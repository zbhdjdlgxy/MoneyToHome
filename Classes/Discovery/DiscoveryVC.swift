//
//  DiscoveryVC.swift
//  MoneyToHome
//
//  Created by 张标 on 17/5/4.
//  Copyright © 2017年 szgyzb. All rights reserved.
//  发现

import UIKit

class DiscoveryVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,DiscoveryViewCellDelegate {
    
    static let cellIdentifier = "DiscoveryViewCell"
    static let headerIdentifier = "discoveryHeader"
    var index : Int = 1
    
    var goodsCollectionView : UICollectionView = {
        
        let flowLayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        flowLayout.headerReferenceSize = CGSize(width: SCREEN_WIDTH, height: 200)
        let itemW = SCREEN_WIDTH * 0.48
        let itemH = itemW + 68.0
        flowLayout.minimumInteritemSpacing = 4
        flowLayout.sectionInset = UIEdgeInsetsMake(4, 4, 0, 4)
        flowLayout.itemSize = CGSize(width: itemW, height: itemH)
        let collectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(DiscoveryViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        return collectionView
    }()
    
    
    
    var goodsArr = [GoodsItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        goodsCollectionView.delegate = self
        goodsCollectionView.dataSource = self
        goodsCollectionView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMore))
        goodsCollectionView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(updateGoodsList))
        self.view.addSubview(goodsCollectionView)
        self.requestForCategoryGoodsList()
    }
    
    //下拉刷新
    func updateGoodsList(){
        
        index = 1
        goodsArr.removeAll()
        self.requestForCategoryGoodsList()
    }
    
    //上拉加载更多
    func loadMore(){
        
        index += 1
        self.requestForCategoryGoodsList()
        
    }

    //请求商品列表
    func requestForCategoryGoodsList(){
        
        let userResult : UserLoginResult = NSKeyedUnarchiver.unarchiveObject(withFile: USER_FILE_PATH) as! UserLoginResult
        let param : GetCategoryGoodsListParam = GetCategoryGoodsListParam()
        param.StationId = "\(userResult.StationId)"
        param.PageIndex = index

        DiscoveryTool.getCategoryGoodsListWithParam(param, success: { (result ) in
            
            if result.Status == 0{
                
                
                if result.DataList.count == 0 {
                    self.goodsCollectionView.mj_footer.endRefreshingWithNoMoreData()
                }else{
                    self.goodsArr = self.goodsArr + result.DataList
                    self.goodsCollectionView.mj_header.endRefreshing()
                    self.goodsCollectionView.mj_footer.endRefreshing()
                    self.goodsCollectionView.reloadData()
                    
                }
            }
            
        }) { (error) in
            
            
        }
    }
    
    //MARK: UICollectionViewDataSource
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        return self.goodsArr.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let itemCell :  DiscoveryViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: DiscoveryVC.cellIdentifier, for: indexPath) as! DiscoveryViewCell
        itemCell.goodsItem = self.goodsArr[indexPath.row]
        itemCell.delegate = self
        return itemCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        var headerView : UICollectionReusableView?
        if kind == UICollectionElementKindSectionHeader {

            headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DiscoveryVC.headerIdentifier, for: indexPath)
            let imageView : UIImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 200))
            imageView.image = UIImage.init(named: "dis_head_bg")
            headerView?.addSubview(imageView)
            
        }
        return headerView!
    }
    
    //MARK: DiscoveryViewCellDelegate
    func discoveryViewCellDidCarClicked(cell : DiscoveryViewCell){
        
        ALERT(title:"加入购物车成功" , message: cell.goodsItem.GoodsName!, controller: self)
    }
}
