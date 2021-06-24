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
    
    var paginaActual = 0 {
        didSet {
            pageControl.currentPage = paginaActual
            if paginaActual == diapositivas.count - 1 {
                botonSiguiente.setTitle("Empezar", for: .normal)
            } else {
                botonSiguiente.setTitle("Siguiente", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        diapositivas = [
            OnboardingDiapositiva(titulo: "Hola Bieenvenido a APPCitasOnline", descripcion: "Con esta app podrás reservar citas en la comodidad de tu mano", imagen: #imageLiteral(resourceName: "citas5")),
            OnboardingDiapositiva(titulo: "Registrate", descripcion: "Solo necesitas registrar un correo y contraseña o con una cuenta de Google", imagen: #imageLiteral(resourceName: "citas3")),
            OnboardingDiapositiva(titulo: "Elige la fecha deseada", descripcion: "Una vez elegida la fecha deberás verificar la disponiblidiad", imagen: #imageLiteral(resourceName: "citas1")),
            OnboardingDiapositiva(titulo: "Confirmacion de cita", descripcion: "Si hay horario disponible podras registrar la cita, caso contrario deberás escoger otro dia u hora", imagen: #imageLiteral(resourceName: "citas2")),
            OnboardingDiapositiva(titulo: "Confirma tus datos", descripcion: "Podrás ver la ubicacion de nuestas instalaciones y la distancia desde tu ubicacion en tiempo real para poder llegar fácilmente", imagen: #imageLiteral(resourceName: "citas4"))
        ]
        CollectionViewOn.delegate = self
        CollectionViewOn.dataSource = self
        
    }
    
    @IBAction func botonSiguienteClick(_ sender: UIButton) {
        //Si estamos en la última diapositiva ir a HOME
        if paginaActual == diapositivas.count - 1 {
            let controlador = storyboard?.instantiateViewController(identifier: "HOMEVC") as! UIViewController
            controlador.modalPresentationStyle = .fullScreen
            controlador.modalTransitionStyle = .crossDissolve
            
            present(controlador, animated: true, completion: nil)
        } else {
            paginaActual += 1
            let indexPath = IndexPath(item: paginaActual, section: 0)
            CollectionViewOn.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
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

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionViewOn.frame.width, height: CollectionViewOn.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let ancho = scrollView.frame.width
        paginaActual = Int(scrollView.contentOffset.x/ancho)
        
    }
}
