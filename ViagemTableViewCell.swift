//
//  ViagemTableViewCell.swift
//  AluraViagens
//
//  Created by Admin on 10/12/22.
//

import UIKit

class ViagemTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var diariaViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoLabel: UILabel!
    @IBOutlet weak var precoViagemLabel: UILabel!
    @IBOutlet weak var statusCancelamentoViagemLabel: UILabel!
    
    //configurando as celulas de acordo com as informacoes que vem do nosso json
    
    func configuraCelula(_ viagem: Viagem?) {
        viagemImage.image = UIImage(named: viagem?.asset ?? "")//espera receber o valor do metodo por parametro
        tituloViagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        precoViagemLabel.text = "R$ \(viagem?.preco ?? 0)"
        
        //criando o atributo strikethroungstyle para criar o risco em cima do preco da passagem aerea
        
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        precoSemDescontoLabel.attributedText = atributoString
        
        if let numeroDeDias = viagem?.diaria, let numeroDeHospedes = viagem?.hospedes {
            let diarias = numeroDeDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroDeHospedes == 1 ? "Pessoa" : "Pessoas"
            
            //criando string customizada através da validacao que acabamos de fazer
            diariaViagemLabel.text = "\(numeroDeDias) \(diarias) - \(numeroDeHospedes) \(hospedes)"
        }
        //Adicionando a sombra na nossa célula e atualizando o UI
        DispatchQueue.main.async {
            self.backgroundViewCell.addSombra()//usando o self para referenciar a closure por estar atualizando o ui e add o metodo sombra dentro da funcao
        }
        
    }
}
