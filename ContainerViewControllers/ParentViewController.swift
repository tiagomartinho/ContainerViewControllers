import UIKit

class ParentViewController: UIViewController {

    let childVC = ChildViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        addChild(childVC)
        let childView = childVC.view!
        view.addSubview(childView)
        addConstraints(childView)
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
