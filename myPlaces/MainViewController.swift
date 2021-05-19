//
//  MainViewController.swift
//  myPlaces
//
//  Created by Артем Хребтов on 14.05.2021.
//

import UIKit

class MainViewController: UITableViewController {
    let coctails = ["Gin Tonic", "Margarita", "Tom Colins", "Daikirie", "Martinez", "Negroni", "B-52", "Clover Club"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coctails.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var configuration = cell.defaultContentConfiguration()
        configuration.text = coctails[indexPath.row]
        configuration.image = UIImage(named: coctails[indexPath.row])
        configuration.textProperties.numberOfLines = 0
        configuration.imageProperties.cornerRadius = cell.frame.size.height / 2
        
       
        
        cell.contentConfiguration = configuration
        
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
