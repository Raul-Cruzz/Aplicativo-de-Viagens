//
//  ViewController.swift
//  AluraViagens
//
//  Created by Admin on 08/12/22.
//

import UIKit

class ViewController: UIViewController  {
    

    @IBOutlet weak var viagensTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()//chamando o metodo que cuidara da tableViews
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
    
    func configuraTableView() {//Metodo para registrar a celula customzada e as classes
        viagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        viagensTableView.register(UINib(nibName: "OfertaTableViewCell", bundle: nil), forCellReuseIdentifier: "OfertaTableViewCell")
        viagensTableView.dataSource = self//implementando o protocolo table view datasource
        viagensTableView.delegate = self
    }

    
    }
    
extension ViewController:  UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {//numero de secao e views models que estiver dentro da lista
        return sessaoDeViagens?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    //usando o metodo para reutilizar a celula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell") as? ViagemTableViewCell else {
            fatalError("Error to create ViagemTableViewCell")
        }
        
        //vamos informar a view qual sessao irá receber do viewmodel, sessao que vem do json
        let viewModel = sessaoDeViagens?[indexPath.section] // podemos ter tres tipos de sessao do json
        
        //criando a verificacao para saber qual o tipo da sessao que iremos acessar
        
        switch viewModel?.tipo {
        case .destaques:
            celulaViagem.configuraCelula(viewModel?.viagens[indexPath.row])//se for a lista de destaques
            return celulaViagem//monta a célula
        
        case .ofertas: //verificando o segundo elemento
            
            guard let celulaOferta = tableView.dequeueReusableCell(withIdentifier: "OfertaTableViewCell") as? OfertaTableViewCell else {
                fatalError("Error to create ViagemTableViewCell")
            }
            
            return celulaOferta
            
        default://se nao cai no padrao e retorna a cell padrao
            return UITableViewCell()
        }
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
            headerView?.configuraView()
            
            return headerView

        }
        
        return nil
    }
       
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { //passando o valor apenas para o primeiro index
            return 300 //Altura cabecalho sempre utilizar na celula customizada
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 475 //Altura tableviewcell, sempre utilizar na celula customizada
    }
        
}
