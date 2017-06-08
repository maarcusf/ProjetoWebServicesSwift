//
//  ViewController.swift
//  WEBService
//
//  Created by labmacmini02 on 01/06/17.
//  Copyright © 2017 Unitins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    //Referencia para o vetor de clientes vindos do servico
    var vrClientes:[Cliente]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vrClientes = ParseJSON().buscaDados()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Metodos dataSource
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return vrClientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula") as! Celula
        celula.vrNome.text = vrClientes[indexPath.row].nome
        celula.vrDescricao.text =  vrClientes[indexPath.row].desc
        celula.vrData.text =  String(vrClientes[indexPath.row].data)
        //celula.vrImagem.downloadImage(url: vrClientes[indexPath.row].url_foto)
        
        return celula
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
