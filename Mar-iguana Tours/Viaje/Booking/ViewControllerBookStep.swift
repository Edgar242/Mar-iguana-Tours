//
//  ViewControllerBookStep.swift
//  Mar-iguana Tours
//
//  Created by Edgar on 14/06/21.
//

import UIKit
import StepView

let pageTitles = ["Escoge tus asientos",
                  "Selecciona promoción",
                  "Métodos de pago",
                  "Confirmación de compra"
                ]

//Global variable with the selected tour
var selectedTour: Tour = Tour(id: 1, title: "title",price: 100, dates:["dates"], rating: 5, images: ["images"], info: "info", itinerary: ["itinerary"],promo: " promo", roomOptions: ["roomOptions"],urlInfoWeb: "urlInfoWeb")
let notificationBookedSeatDidChange = Notification.Name(rawValue: "asientoModificado")
var seatsBooked = [Int]() // Used to track, the number of booked seats as well as quantity

class ViewControllerBookStep: UIViewController {
    var tourSelected:Tour? //gotten by the segue
    @IBOutlet private weak var stepView: StepView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var backButton: UIButton!
    

    private var pageViewController: UIPageViewController!

    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(withIdentifier: String.init(describing: ViewControllerStep1.self)),
            self.getViewController(withIdentifier: String.init(describing: ViewControllerStep2.self)),
            self.getViewController(withIdentifier: String.init(describing: ViewControllerStep4.self)),
            self.getViewController(withIdentifier: String.init(describing: ViewControllerStep3.self))
        ]
    }()
    
    override func viewDidLoad() {
        selectedTour = tourSelected ?? selectedTour //global variable recives segue tourSelected
        super.viewDidLoad()
        
        setupViewControllSteps()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "arrowBack"),
            landscapeImagePhone: nil,
            style: .plain,
            target: self,
            action: #selector(backButtonDidPress)
        )
        
        navigationItem.rightBarButtonItem?.title = "Siguiente"
        
        // Add observer
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(enableNextButton(notification:)),
            name: notificationBookedSeatDidChange ,
            object: nil
        )
    }
    
    @objc func enableNextButton(notification: NSNotification) {
        nextButton.isEnabled = seatsBooked.count > 0
    }

    private func setupViewControllSteps() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.view.frame = containerView.bounds
        containerView.addSubview(pageViewController.view)

        if let firstController = pages.first {
            navigationItem.title = pageTitles[stepView.selectedStep-1]
            pageViewController.setViewControllers([firstController], direction: .forward, animated: true, completion: nil)
        }
        // Hide back button in first page
        backButton.isHidden = true
    }

    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }

    private func getControllerToShow(from index: Int) -> UIViewController? {
        if index - 1 < pages.count {
            navigationItem.title = pageTitles[stepView.selectedStep-1]
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
        backButton.isHidden = false

        if let controllerToShow = getControllerToShow(from: stepView.selectedStep) {
            pageViewController.setViewControllers([controllerToShow], direction: .forward, animated: true, completion: nil)
        }
        
        if stepView.selectedStep == 4 {
            nextButton.isHidden = true
        }
    }

    @IBAction func backButtonDidPress(_ sender: Any) {
        if stepView.selectedStep == 1 {
            self.navigationController?.popViewController(animated: true)
        }
        else {
            stepView.showPreviousStep()
            
            // Hide bottom back button if we are in the first page
            if stepView.selectedStep == 1 {
                backButton.isHidden = true
            }
            
            if let controllerToShow = getControllerToShow(from: stepView.selectedStep) {
                pageViewController.setViewControllers([controllerToShow], direction: .reverse, animated: true, completion: nil)
            }
            
            nextButton.isHidden = false
        }
    }
}
