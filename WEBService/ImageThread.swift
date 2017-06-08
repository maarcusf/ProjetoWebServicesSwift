//
//  ImageThread.swift
//  WEBService
//
//  Created by labmacmini02 on 08/06/17.
//  Copyright © 2017 Unitins. All rights reserved.
//

import Foundation
import UIKit

class ImageThread:UIImageView
{
    //Referencias para filas do tipo
    let filaGeral = OperationQueue()
    let filaInterface = OperationQueue.main
    
    //Inicializadores da classe
    required init(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
    }
    
    func downloadImage(url:String){
        
        let url = URL(string: url)
        var data:Data!
        
        filaGeral.addOperation {
            do
            {
                data = try Data(contentsOf: url!)
            }
            catch
            {}
            self.filaInterface.addOperation {
                if(data != nil && data.count > 0)
                {
                    self.image = UIImage(data: <#T##Data#>)
                }
            }
        }
        
        
    }
}
