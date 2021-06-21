//
//  OnboardingViewController.swift
//  OnboardingDemoPM2
//
//  Created by marco rodriguez on 21/06/21.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var botonSiguiente: UIButton!
    @IBOutlet weak var CollectionViewOn: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var diapositivas: [OnboardingDiapositiva] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        diapositivas = [
            OnboardingDiapositiva(titulo: "Titulo Diapositiva 1", descripcion: "Esta es la descripcion de la diapositiva numero 1 donde describe que trata la diapositiva 1", imagen: #imageLiteral(resourceName: "4")),
            OnboardingDiapositiva(titulo: "Titulo Diapositiva 2", descripcion: "Esta es la descripcion de la diapositiva numero 2 donde describe que trata la diapositiva 1", imagen: #imageLiteral(resourceName: "4")),
            OnboardingDiapositiva(titulo: "Titulo Diapositiva 3", descripcion: "Esta es la descripcion de la diapositiva numero 3 donde describe que trata la diapositiva 1", imagen: #imageLiteral(resourceName: "2")),
            OnboardingDiapositiva(titulo: "Titulo Diapositiva 4", descripcion: "Esta es la descripcion de la diapositiva numero 4 donde describe que trata la diapositiva 1", imagen: #imageLiteral(resourceName: "4")),
            OnboardingDiapositiva(titulo: "Titulo Diapositiva 5", descripcion: "Esta es la descripcion de la diapositiva numero 5 donde describe que trata la diapositiva 1", imagen: #imageLiteral(resourceName: "2"))
        ]
        CollectionViewOn.delegate = self
        CollectionViewOn.dataSource = self
        
    }
    
    @IBAction func botonSiguienteClick(_ sender: UIButton) {
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return diapositivas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = CollectionViewOn.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        celda.configurar(diapositiva: diapositivas[indexPath.row])
        return celda
    }
    
    
}
