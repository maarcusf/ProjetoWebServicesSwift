//
//  File.swift
//  WEBService
//
//  Created by labmacmini02 on 01/06/17.
//  Copyright © 2017 Unitins. All rights reserved.
//

import Foundation

class Cliente
{
    var id:Int!
    var nome:String!
    var desc:String!
    var data:Int!
    var url_foto:String!
    
    
    
}


//Classe utilizada para fazer o parser dos dados JSON

class ParseJSON
{
    func buscaDados()->[Cliente]
    {
        var clientes = [Cliente]()
        
        do
        {
          //Baixa os dados da WEB
        
            let path = URL(string: "http://agenciamercadocentral.com.br/app_agencia/clientes.php")
            let dados = try Data(contentsOf:path!)
            
            if(dados.count == 0)
            {
                return clientes
            }
            
            //Realiza o parsing dos dados
            
            let arrayClientes = try JSONSerialization.jsonObject(with: dados, options: .mutableContainers)
                as? Array<Any>
        
        if let vetorClientes = arrayClientes
        {
            for json in vetorClientes
            {
                let json = json as! NSDictionary
                let cliente = Cliente()
                cliente.id = json["idcliente"] as! Int
                cliente.nome = json["nome"] as! String
                cliente.desc = json["descricao"] as! String
                cliente.data = json["cliente_desde"] as! Int
                cliente.url_foto = json["icone"] as! String
                clientes.append(cliente)
            }
        }
        }
        catch{}
        return clientes
    }
  
    }
    
