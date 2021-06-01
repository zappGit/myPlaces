//
//  MainViewController.swift
//  myPlaces
//
//  Created by Артем Хребтов on 14.05.2021.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var coctails: Results<Coctail>!
    
    @IBOutlet weak var tableView: UITableView!
    
    //var coctailsBar = Coctail.getCoctails()
    override func viewDidLoad() {
        super.viewDidLoad()
        coctails = realm.objects(Coctail.self)
        
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coctails.isEmpty ? 0 : coctails.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell

        let coctail = coctails[indexPath.row]
        
        cell.nameLabel.text = coctail.name
        cell.locationLabel.text = coctail.ingridients
        cell.typeLabel.text = coctail.type
        cell.imageOfPlace.image = UIImage(data: coctail.imageData!)
      



        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true



        return cell
    }
    
 //MARK: Table view delegate
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let coctail = coctails[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { (_,_,_) in
            
            StorageManager.deleteObject(coctail)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }

    
      //MARK: - Navigation
     
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let coctail = coctails[indexPath.row]
            let newCoctailVC = segue.destination as! NewPlaceViewController
            newCoctailVC.curentCoctail = coctail
        }
     }
     
    
    @IBAction func unwindSeque (_ segue: UIStoryboardSegue){
        guard let newCoctailVC = segue.source as? NewPlaceViewController else {return}
        newCoctailVC.saveCoctail()
        tableView.reloadData()
    }
    
}
