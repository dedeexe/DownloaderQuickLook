//
//  ViewController.swift
//  DownloaderQuickLook
//
//  Created by dede.exe on 17/08/18.
//  Copyright © 2018 dede.exe. All rights reserved.
//

import UIKit
import QuickLook

class ViewController: UIViewController, View {
    
    @IBOutlet weak var urlTextField : UITextField!
    
    var controller : Controller?
    var previewItens : [QLPreviewItem] = []
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let controllerLogic = ControllerLogic()
        controllerLogic.view = self
        controller = controllerLogic
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.becomeFirstResponder()
    }
    
    //MARK: - Actions
    @IBAction func previewFiles() {
        controller?.retrievePreviewItens()
    }
    
    @IBAction func download() {
        executeDownload()
    }
    
    //MARK: - View Interface methods
    func show(message: String) {
        showMessage(message)
    }
    
    func show(previewItens: [QLPreviewItem]) {
        self.previewItens = previewItens
        let quickLook = QLPreviewController()
        quickLook.dataSource = self
        present(quickLook, animated: true, completion: nil)
    }
    
    //MARK: - Methods
    func executeDownload() {
        controller?.downloadFile(at: urlTextField.text ?? "")
    }
    
}

//MARK: - QuickLook DataSource
extension ViewController : QLPreviewControllerDataSource {
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return previewItens.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return previewItens[index]
    }
    
}

//MARK: - TextField Delegate
extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        executeDownload()
        textField.resignFirstResponder()
        return true
    }
    
}
