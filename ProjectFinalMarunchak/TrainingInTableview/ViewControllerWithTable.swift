//
//  ViewControllerWithTable.swift
//  ProjectFinalMarunchak
//
//  Created by Сергей Марунчак on 05.06.2022.
//

import UIKit

class ViewControllerWithTable: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    var myTable = UITableView()
    let id = "my cell"
    var array = ["1","2","3","4","5","6","7","8","9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatingTable()
        //        myTable.clipsToBounds = true
        //        view.backgroundColor = .red.withAlphaComponent(1)
    }
    
    private func creatingTable(){
        self.myTable = UITableView(frame: view.bounds, style: .plain)
        self.myTable.delegate = self
        view.addSubview(myTable)
        myTable.register(UITableViewCell.self, forCellReuseIdentifier: id)
        self.myTable.dataSource = self
        myTable.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        myTable.separatorStyle = .singleLine
        
        
    }
    //MARK: - data source
    func numberOfSections(in tableView: UITableView) -> Int {
         return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        
        let number = array[indexPath.row]
        cell.textLabel?.text = number
        cell.accessoryType = .detailDisclosureButton
        
        switch indexPath.section{
        case 0:
            cell.backgroundColor = UIColor.red
        case 1:
            cell.backgroundColor = UIColor.systemBlue
        case 2:
            cell.backgroundColor = UIColor.yellow
        case 3:
            cell.backgroundColor = UIColor.orange
        case 4:
            cell.backgroundColor = UIColor.systemGreen
       
        default:
            break
        }
        
        return cell
        
    }
 
    
    
//MARK:  - tableviewdelegate
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(item, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell number is =  \(indexPath.row),section number is  \(indexPath.section)")
    }
    
//    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        print("accessorypath = ", indexPath)
//
//        let ownerCell = tableView.cellForRow(at: indexPath)
//        print("Cell title =", ownerCell?.textLabel?.text ?? nil)
//
//    }
    
}
