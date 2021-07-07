//
//  ViewControllerBookStep.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 14/06/21.
//

import UIKit
import StepView

let pageTitles = ["Escoge tus asientos",
                  "Selecciona una promoción",
                  "Seleciona el medio de pago",
                  "Sube tu comprobante",
                ]

class ViewControllerBookStep: UIViewController {
    @IBOutlet private weak var stepView: StepView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var stepTitle: UILabel!
    

    private var pageViewController: UIPageViewController!

    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: String.init(describing: ViewControllerStep1.self)),
            self.getViewController(withIdentifier: String.init(describing: ViewControllerStep2.self)),
            self.getViewController(withIdentifier: String.init(describing: ViewControllerStep3.self)),
            self.getViewController(withIdentifier: String.init(describing: ViewControllerStep4.self))
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrowBack"), landscapeImagePhone: nil, style: .plain, target: self, action: #selector(backButtonDidPress))
        
        setupControllers()
    }
    

    private func setupControllers() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.view.frame = containerView.bounds
        containerView.addSubview(pageViewController.view)

        if let firstController = pages.first {
            stepTitle.text = pageTitles[stepView.selectedStep-1]
            pageViewController.setViewControllers([firstController], direction: .forward, animated: true, completion: nil)
        }
    }

    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }

    private func getControllerToShow(from index: Int) -> UIViewController? {
        if index - 1 < pages.count {
            stepTitle.text = pageTitles[stepView.selectedStep-1]
            return pages[index - 1]
        }
        else {
            print("Index is out of range")
            return nil
        }
    }
    
    @IBAction func nextButtonDidPress(_ sender: Any) {
        stepView.showNextStep()
        backButton.isEnabled = true

        if let controllerToShow = getControllerToShow(from: stepView.selectedStep) {
            pageViewController.setViewControllers([controllerToShow], direction: .forward, animated: true, completion: nil)
        }
    }

    @IBAction func backButtonDidPress(_ sender: Any) {
        if stepView.selectedStep == 1 {
            self.navigationController?.popViewController(animated: true)
        }
        else {
            stepView.showPreviousStep()
            
            // Disable back button if we are in first page
            if stepView.selectedStep == 1 {
                backButton.isEnabled = false
            }
            
            if let controllerToShow = getControllerToShow(from: stepView.selectedStep) {
                pageViewController.setViewControllers([controllerToShow], direction: .reverse, animated: true, completion: nil)
            }
        }
    }
}
