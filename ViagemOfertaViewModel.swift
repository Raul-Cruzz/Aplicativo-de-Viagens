//
//  ViagemOfertaViewModel.swift
//  AluraViagens
//
//  Created by Admin on 12/12/22.
//

import Foundation

//ViewModel que será responsavel por montar a sessao de ofertas da nossa lista

class ViagemOfertaViewModel: ViagemViewModel {
    var tituloSessao: String {
        return "Ofertas"
    }
    
    var tipo: ViagemViewModelType {
        return .ofertas
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return 1
    }
    
    // MARK: - Inicializador
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
    
}
