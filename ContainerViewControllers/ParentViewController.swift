import UIKit

class ParentViewController: UIViewController {

    private let childVC = ChildViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        addToogleButton()
    }

    private func addToogleButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Toogle", style: .plain, target: self, action: #selector(toggle))
    }

    @objc private func toggle() {
        let isPresenting = !children.isEmpty
        isPresenting ? removeChildViewController() : addChildViewController()
    }

    private func removeChildViewController() {
        // Notify Child View Controller
        childVC.willMove(toParent: nil)
        // Remove the child’s root view from your container’s view hierarchy
        childVC.view!.removeFromSuperview()
        // Remove Child From Parent View Controller
        childVC.removeFromParent()
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
