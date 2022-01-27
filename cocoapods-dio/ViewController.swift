//
//  ViewController.swift
//  cocoapods-dio
//
//  Created by Fernando Vergis on 27/01/22.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

    @IBOutlet weak var calendario: FSCalendar!
    @IBOutlet weak var labelDataSelecionada: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendario.delegate = self
        
        self.labelDataSelecionada.text = trataDataSelecionada(dataSelecionada:Date())
    }
    
    private func trataDataSelecionada(dataSelecionada:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, d MMMM, yyyy"
        dateFormatter.string(from: dataSelecionada)
        
        return dateFormatter.string(from: dataSelecionada).capitalized
    }

}

extension ViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        self.labelDataSelecionada.text = trataDataSelecionada(dataSelecionada:date)
    }
}
