//
//  albumsViewController.swift
//  obu
//
//  Created by namik kaya on 2.02.2019.
//  Copyright © 2019 namik kaya. All rights reserved.
//

import UIKit
import MobileCoreServices
import Photos

enum AttachmentType: String{
    case camera, video, photoLibrary
}

class albumsViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewCollectionConfig()
        navigationBarConfig()
        grabPhotos()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func navigationBarConfig(){
        let leftButtonNormal: UIImage = UIImage(named: "menu_icon")!
        let leftButton_actBar = self.setLeftButton(normalType: leftButtonNormal, highLightType: leftButtonNormal, size: 28)
        leftButton_actBar.addTarget(self, action: #selector(actionBarLeftButtonActiongoType), for: .touchUpInside)
    }
    
    @objc func actionBarLeftButtonActiongoType(_ sender: Any){
        print("Click")
        //photoLibrary()
    }
    
    func collectionViewCollectionConfig() {
        collectionView.delegate = self
        collectionView.dataSource = self
        layoutCells()
        //collectionView.contentInset = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        //collectionView.alwaysBounceVertical = true
        
        let nib = UINib(nibName: "photoAlbumCollectionCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "photoAlbumCollectionCell")
    }
    
    func layoutCells() {
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width-5)/3, height: ((UIScreen.main.bounds.size.width-5)/3))
        collectionView!.collectionViewLayout = layout
    }
    
    
    private func grabPhotos() {
        let imgManager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.deliveryMode = .highQualityFormat
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        if (fetchResult.count > 0) {
            for i in 0..<fetchResult.count {
                imgManager.requestImage(for: fetchResult.object(at: i) as PHAsset, targetSize: CGSize(width: 200, height: 200), contentMode: PHImageContentMode.aspectFill, options: requestOptions) { (image, error) in
                    self.imageArray.append(image!)
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoAlbumCollectionCell", for: indexPath) as! photoAlbumCollectionCell
        cell.backgroundColor = UIColor.red
        cell.imageView.image = imageArray[indexPath.row]
        print("buraya geliyor mu")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.size.width-5)/3, height: ((UIScreen.main.bounds.size.width-5)/3))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? photoAlbumCollectionCell else { return }
        cell.check = !cell.check
        print("click")
    }
    
    /*
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        
        // print out the image size as a test
        print(image.size)
        picker.dismiss(animated: true)
    }
    
    private func saveImageLibrary(image:UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 1) else { return }
        guard let compressedJPGImage = UIImage(data: imageData) else { return }
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage, nil, nil, nil)
    }
    
    private func videoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self
            myPickerController.sourceType = .photoLibrary
            myPickerController.mediaTypes = [kUTTypeMovie as String, kUTTypeVideo as String]
            self.present(myPickerController, animated: true, completion: nil)
        }
    }

    
    private func photoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let myPickerController = UIImagePickerController()
            myPickerController.delegate = self;
            myPickerController.sourceType = .photoLibrary
            self.present(myPickerController, animated: true, completion: nil)
        }
    }
 */
}
