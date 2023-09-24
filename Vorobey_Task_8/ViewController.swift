//
//  ViewController.swift
//  Vorobey_Task_8
//
//  Created by Roman Priiskalov on 24.09.2023.
//

import UIKit

//На экране UINavigationController с большим заголовком и скрол вью. Справа от заголовка картинка аватара.

//- Картинка SF Symbols person.crop.circle.fill. Размер 36x36pt.
//- Картинка двигается и обрезается вместе с заголовком.

class ViewController: UIViewController, UIScrollViewDelegate {
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.tintColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Avatar"
        
        view = scrollView
        view.backgroundColor = .white
        
        setupAvatar()
    }
    
    
    private func setupAvatar(){
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        // Находим вью с большим заголовком
        if let largeTitleView = navigationBar.subviews.first(where: { NSStringFromClass($0.classForCoder).contains("UINavigationBarLargeTitleView") }) {
            // Добавляем картинку на вью
            largeTitleView.addSubview(image)

            // Устанавливаем констрейнты для картинки
            NSLayoutConstraint.activate([
                image.topAnchor.constraint(equalTo: largeTitleView.bottomAnchor, constant: 20),
                image.bottomAnchor.constraint(equalTo: image.superview?.bottomAnchor ?? navigationBar.bottomAnchor, constant: -10),
                
                image.rightAnchor.constraint(equalTo: largeTitleView.rightAnchor, constant: -20),
                
                image.heightAnchor.constraint(equalToConstant: 36),
                image.widthAnchor.constraint(equalToConstant: 36)
            ])
            

        }
    }
}
