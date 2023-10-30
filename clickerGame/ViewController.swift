//
//  ViewController.swift
//  clickerGame
//
//  Created by ALVIN CHEN on 10/3/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pointsVariable: UILabel!
    //
    var pointCount = 0
    var upgrade1 = false
    var upgrade2 = false
    



    //make alerts do something
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pointsVariable.text = "\(pointCount)"
    }
    
    @IBAction func debuggingAction(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Debug", message: "Pick a option", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Points", style: .default){ (action) in
            self.pointCount += 100
            self.pointsVariable.text = "\(self.pointCount)"
        }
        let restartAction = UIAlertAction(title: "Reset", style: .default){ (action) in
            self.pointCount = 0
            self.pointsVariable.text = "\(self.pointCount)"
            self.upgrade1 = false
            self.upgrade2 = false
        }
        let nvmAction = UIAlertAction(title: "Back", style: .default, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(restartAction)
        alert.addAction(nvmAction)
        
        present(alert, animated: true, completion: nil)
        

        
    }
    
    
    
    
    
    @IBAction func shopButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    @IBAction func pointsButton(_ sender: UIButton) {
        if(upgrade1 == true && upgrade2 == true){
            pointCount = pointCount + 20
        }
        else if(upgrade1 == true){
            pointCount = pointCount + 5
        }
        else if(upgrade2 == true){
            pointCount = pointCount + 15
        }
        else{
            pointCount = pointCount + 1
        }
        pointsVariable.text = "\(pointCount)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //NVC (next view controller) giving access to the next view controller
        let nvc = segue.destination as! ViewController3
        nvc.totalPoints = pointCount
        nvc.delegate = self
    }
}

//
