//
//  Viaje.swift
//  Mar-iguana Tours
//
//  Created by Aplicaciones on 10/03/21.
//

import Foundation

class Viaje{
    
    let titulo : String
    let fecha_inicio : String
    let fecha_fin : String
    let precio : Int
    let foto_nombre : String
    let valoracion : Int
    
    init(titulo : String, fecha_inicio : String, fecha_fin : String, precio : Int, foto_nombre : String, valoracion : Int){
        self.titulo = titulo
        self.fecha_inicio = fecha_inicio
        self.fecha_fin = fecha_fin
        self.precio = precio
        self.foto_nombre = foto_nombre
        self.valoracion = valoracion
    }
    
}
