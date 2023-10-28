//
//  LaunchVC.swift
//  Bring
//
//  Created by Tolga Sarikaya on 19.10.23.
//

import UIKit
import Lottie

class LaunchVC: UIViewController {

    // MARK: - Properties
    var animationView: LottieAnimationView?
    
    // MARK: - UI Elements
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView = .init(name: "cart")
        animationView?.frame = view.bounds
        animationView?.loopMode = .loop
        view.addSubview(animationView!)
        animationView?.play()
        view.sendSubviewToBack(animationView!)
        
        startButton.layer.cornerRadius = 15
        startButton.layer.masksToBounds = true

       
    }
    
    // MARK: - Actions
    @IBAction func startButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toHome", sender: nil)
    }
    

}
