//
//  ViewController.swift
//  Day4
//
//  Created by Jovan A on 16/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dummy: [String] = ["File", "Edit", "View", "Find", "Navigate", "Editor", "Product", "Debug", "Source Control", "Window", "Help"]
    var dataArray: [List] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup()
    }
    
    func setup() {
        dataArray = getData().reversed()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    @IBAction func btnAdd(_ sender: Any) {
        let addVC = self.storyboard?.instantiateViewController(withIdentifier: "add") as! AddViewController
        addVC.isDismissed = { [weak self] in
            self?.dataArray = getData().reversed()
            self?.tableView.reloadData()
        }
        self.navigationController?.present(addVC, animated: true) {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return TableViewCell() }
        cell.txtTitle.text = dataArray[indexPath.row].title
        cell.txtSubTitle.text = dataArray[indexPath.row].subTitle
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(try? UserDefaults.standard.getObject(forKey: "data", castTo: [List].self))
        guard let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as? DetailViewController else { return }
        detailVC.judul = dataArray[indexPath.row].title
        detailVC.subjudul = dataArray[indexPath.row].subTitle
        detailVC.content = dataArray[indexPath.row].content ?? ""
        navigationController?.pushViewController(detailVC, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            do {
                try UserDefaults.standard.setObject(dataArray, forKey: "data")
            }
            catch {
                print(error.localizedDescription)
            }
            
        }
        else if editingStyle == .insert {
            
        }
    }
}

