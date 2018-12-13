import UIKit

class ParentViewController: UIViewController {

    let childVC = ChildViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        addChildViewController()
    }

    private func addChildViewController() {
        // Add Child View Controller
        addChild(childVC)
        // Add the child’s root view to your container’s view hierarchy
        view.addSubview(childVC.view!)
        // Setting constraints for managing the size and position of the child’s root view
        addConstraints(childVC.view!)
        // Notify Child View Controller
        childVC.didMove(toParent: self)
    }

    private func addConstraints(_ childView: UIView) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            childView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            childView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            childView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
            ])
    }
}
