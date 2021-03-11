//
//  TableTableViewController.swift
//  Mar-iguana Tours
//
//  Created by Aplicaciones on 09/03/21.
//

import UIKit

class TableTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    var viajes: [Viaje] = [Viaje(titulo:"Gran Aventura en Guanajuato", fecha_inicio:"13 feb", fecha_fin:"18 feb", precio:500, foto_nombre:"guanajuato", valoracion:4),
        Viaje(titulo:"El Nevado de Toluca", fecha_inicio:"11 mar", fecha_fin:"15 mar", precio:700, foto_nombre:"nevado", valoracion:4),
        Viaje(titulo:"Semana en Cancún", fecha_inicio:"10 may", fecha_fin:"18 may", precio:2900, foto_nombre:"cancun", valoracion:4)
        
    ]
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viajes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        cell.travelTitle.text = viajes[indexPath.row].titulo
        cell.travelPrice.text = "$" + String(viajes[indexPath.row].precio)
        cell.travelSchedule.text = "Del "+viajes[indexPath.row].fecha_inicio + " al " + viajes[indexPath.row].fecha_fin
        cell.travelImage.image = UIImage(named: viajes[indexPath.row].foto_nombre)
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
