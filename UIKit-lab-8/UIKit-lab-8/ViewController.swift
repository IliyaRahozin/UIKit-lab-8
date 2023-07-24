//
//  ViewController.swift
//  UIKit-lab-8
//
//  Created by Iliya Rahozin on 24.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = .init(systemName: "person.crop.circle.fill")
        view.tintColor = .gray
        
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentSize = .init(width: UIScreen.main.bounds.width, height: 1000)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        settingsUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var largeTitleView: UIView?
        navigationController?.navigationBar.subviews.forEach({ view in
            guard view.description.contains("UINavigationBarLargeTitleView") else { return }
            largeTitleView = view
        })
        
        guard let largeTitleSuperview = largeTitleView else {
            return
        }
        
        largeTitleSuperview.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalToConstant: 36),
            imageView.trailingAnchor.constraint(equalTo: largeTitleSuperview.trailingAnchor, constant: -16),
            imageView.bottomAnchor.constraint(equalTo: largeTitleSuperview.bottomAnchor, constant: -12)
        ])
      }
    
    func settingsUI() {
        view.backgroundColor = .systemGray6
        title = "Avatar"
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        navigationController?.navigationBar.prefersLargeTitles = true
     }



}

