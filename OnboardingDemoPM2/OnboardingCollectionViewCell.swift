//
//  OnboardingCollectionViewCell.swift
//  OnboardingDemoPM2
//
//  Created by marco rodriguez on 21/06/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imagenDiapositivaIV: UIImageView!
    @IBOutlet weak var tituloDiapositivaLbl: UILabel!
    @IBOutlet weak var descripcionDiapositivaLbl: UILabel!
    
    func configurar(diapositiva: OnboardingDiapositiva){
        imagenDiapositivaIV.image = diapositiva.imagen
        tituloDiapositivaLbl.text = diapositiva.titulo
        descripcionDiapositivaLbl.text = diapositiva.descripcion
    }
}
