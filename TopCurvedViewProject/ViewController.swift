//
//  ViewController.swift
//  TopCurvedViewProject
//
//  Created by Nabin Shrestha on 6/26/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var containerView: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemTeal
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        containerView.addTopRoundedCornerToView(desiredCurve: 0.7)
    }

}

extension UIView {

    func addTopRoundedCornerToView(desiredCurve: CGFloat?) {
        let offset: CGFloat = frame.width/desiredCurve!
        let bounds: CGRect = bounds

        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y+bounds.size.height / 2, width: bounds.size.width, height: bounds.size.height / 2)

        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        // Set the newly created shape layer as the mask for the view's layer
        layer.mask = maskLayer
    }
}

