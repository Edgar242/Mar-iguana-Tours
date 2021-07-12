//
//  TableTableViewController.swift
//  Mar-iguana Tours
//
//  Created by Aplicaciones on 09/03/21.
//

import UIKit
import Alamofire
import Network

class TableTableViewController: UITableViewController {
    
    var viajeSelected:Tour?
    var arrTours:[Tour] = [Tour]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let monitor = NWPathMonitor()  // monitoreamos todas las interfaces de datos
        monitor.pathUpdateHandler = { Path in
            var internetEstatus = 1
            if Path.status == .satisfied {
                if Path.isExpensive {
                    internetEstatus = 0
                }
                else {
                    self.downloadInfo()
                }
            }
            else {
                internetEstatus = -1
            }
            if internetEstatus != 1 { // No hay internet o es solo celular
                DispatchQueue.main.async {  // ES INDISPENSABLE regresar al hilo principal para poder presentar el alert, porque implica un cambio en la UI
                    let alert = UIAlertController(title:"Internet Status", message:"", preferredStyle: .alert)
                    var boton1:UIAlertAction
                    if internetEstatus == 0 {
                        alert.message = "Conexion a internet disponible por datos celulares, desea descargar la info?"
                        boton1 = UIAlertAction(title:"cancelar", style:.destructive, handler: nil)
                        let boton2 = UIAlertAction(title: "adelante", style: .default, handler:{ elAlert in
                            self.downloadInfo()
                        })
                        alert.addAction(boton2)
                    }
                    else {
                        alert.message = "Conexion a internet NO disponible"
                        boton1 = UIAlertAction(title:"enterado", style: .default, handler: nil)
                    }
                    alert.addAction(boton1)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        } // closure: bloque de código, que se puede usar como una variable
        let elKiu = DispatchQueue (label: "NetworkMonitor")
        monitor.start(queue: elKiu)
      
        //Navigation bar
        navigationController?.navigationBar.barTintColor = UIColor(named: "myPrimaryColor")
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        
        print(">>>> Entra a will appear")
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
    

    var viajes: [Viaje] = [Viaje(titulo:"Gran Aventura en Guanajuato", fecha_inicio:"13 feb", fecha_fin:"18 feb", precio:500, foto_nombre:"guanajuato", valoracion:4),
        Viaje(titulo:"El Nevado de Toluca", fecha_inicio:"11 mar", fecha_fin:"15 mar", precio:700, foto_nombre:"nevado", valoracion:4)
    ]
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrTours.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        print(indexPath.row)
        
        if(arrTours.count>0){
            cell.travelTitle.text = arrTours[indexPath.row].title
            cell.travelPrice.text = "$" + String(arrTours[indexPath.row].price)
            cell.travelSchedule.text = arrTours[indexPath.row].dates[0] + " - " + arrTours[indexPath.row].dates[1]
            
            let url = URL(string: arrTours[indexPath.row].images[0])
            let data = try? Data(contentsOf: url!)
            cell.travelImage.image = UIImage(data: data!)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viajeSelected = arrTours[indexPath.row]
        performSegue(withIdentifier: "detailSegue", sender: indexPath)
    }
    
    //Prepare segue to pass selected tour info to DetailTourControllerView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailSegue") {
            let td = segue.destination as! TourDetailViewController
            td.tourSelected = viajeSelected
        }
    }
 
    func downloadInfo () {
        let urlStr = "https://demo4386931.mockable.io/tours"
        AF.request (urlStr, method: .get).validate().responseJSON {response in
            if let jsonTours = response.value as? [[String:Any]] {
                for tour in jsonTours {
                    let infoTour = Tour(jsonTour: tour)!
                    self.arrTours.append(infoTour)
                    print(infoTour.title)
                }
            }
            self.tableView.reloadData()
        }
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
