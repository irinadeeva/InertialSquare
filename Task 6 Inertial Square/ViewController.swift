//
//  ViewController.swift
//  Task 6 Inertial Square
//
//  Created by Irina Deeva on 17/11/24.
//

import UIKit

final class ViewController: UIViewController {
    private lazy var square = UIView(frame: CGRect(x: 100,
                                                   y: 100,
                                                   width: 100,
                                                   height: 100))
    private lazy var recogniser = UITapGestureRecognizer()
    private lazy var animator = UIDynamicAnimator()

    override func viewDidLoad() {
        super.viewDidLoad()

        square.layer.cornerRadius = 8
        square.backgroundColor = .blue
        view.addSubview(square)

        recogniser.addTarget(self, action: #selector(handleTapGesture(gestureRecognizer:)))
        view.addGestureRecognizer(recogniser)
    }

    @objc private func handleTapGesture(gestureRecognizer: UITapGestureRecognizer) {
        let targetPoint = gestureRecognizer.location(in: view)

        animator.removeAllBehaviors()

        let snap = UISnapBehavior(item: square, snapTo: targetPoint)
        animator.addBehavior(snap)
    }
}
