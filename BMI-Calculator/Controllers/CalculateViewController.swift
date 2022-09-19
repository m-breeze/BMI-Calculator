
import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hightSlider(_ sender: UISlider) {
        let currentValue = sender.value
        let height = String(format: "%.2f", currentValue)
        heightValue.text = "\(height)m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let currentValue = sender.value
        let weight = String(format: "%.0f", currentValue)
        weightValue.text = "\(weight)Kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight / pow(height, 2)
        bmiValue = String(format: "%.1f", bmi)
        print(bmi)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController
            destination.bmiValue = bmiValue
        }
    }
    
}

