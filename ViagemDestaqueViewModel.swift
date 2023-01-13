//
//  ViagemDestaqueViewModel.swift
//  AluraViagens
//
//  Created by Admin on 10/12/22.
//

import Foundation

//ViewModel que será responsavel por montar a sessao de destaques da nossa lista

class ViagemDestaqueViewModel: ViagemViewModel {
    var tituloSessao: String {
        return "Destaques"
    }
    
    var tipo: ViagemViewModelType {
        return .destaques
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return viagens.count
    }
    
    // MARK: - Inicializador
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
}
