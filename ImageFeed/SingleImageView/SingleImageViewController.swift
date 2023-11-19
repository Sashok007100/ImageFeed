import UIKit

final class SingleImageViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var image: UIImage! {
        didSet {
            guard isViewLoaded else { return }
            imageView.image = image
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
}
