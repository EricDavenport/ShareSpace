//
//  MainViewController.swift
//  ShareSpace
//
//  Created by Bienbenido Angeles on 5/24/20.
//  Copyright © 2020 Bienbenido Angeles. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    
    private let mainView = MainView()
    
    private var posts = [Post](){
        didSet{
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
            }
        }
    }

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addNavSignOutButton()
        delegatesAndDataSources()
      loadPost()
    }
    
    private func delegatesAndDataSources(){

        
mainView.searchBar.delegate = self
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
  
//  private var databaseServices = DatabaseService.shared
  
  
  private func loadPost() {
    DatabaseService.shared.loadPost { (result) in
      switch result {
      case .failure(let error):
        print("It failed")
      case .success(let post):
        self.post = post
      }
    }
  }
  
  

        
    }
    
    private func registerCell(){
        mainView.collectionView.register(FeedCell.self, forCellWithReuseIdentifier: "feedCell")
    }

    
    private func addNavSignOutButton(){
        let barButtonItem = UIBarButtonItem(title: "Signout", style: .plain, target: self, action: #selector(signOutButtonPressed(_:)))
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc private func signOutButtonPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            UIViewController.showViewController(viewcontroller: LoginViewController())
        } catch {
            DispatchQueue.main.async {
                self.showAlert(title: "Unable to signout", message: "Error: \(error.localizedDescription)")
            }
        }
    }

}

extension MainViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainView.collectionView.dequeueReusableCell(withReuseIdentifier: "feedCell", for: indexPath) as? FeedCell else {
            fatalError()
        }
        let post = posts[indexPath.row]
        cell.configureCell(for: post)
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let maxSize:CGSize = UIScreen.main.bounds.size
        let itemWidth:CGFloat = maxSize.width
        return CGSize(width: itemWidth, height: itemWidth)
    }
}
