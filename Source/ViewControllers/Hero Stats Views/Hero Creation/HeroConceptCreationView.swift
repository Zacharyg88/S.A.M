//
//  HeroConceptCreationView.swift
//  S.A.M
//
//  Created by Zach Eidenberger on 9/1/21.
//

import Foundation
import UIKit
import Photos


class HeroConceptCreationView: UIView, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var conceptTextView: UITextView!
    @IBOutlet weak var addImageButton: UIButton!
    
    var image: UIImage?
    var hostVC: SWHeroCreationViewController?
    var imagePicker = UIImagePickerController()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadAndShowNib()
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadAndShowNib()
        setupView()
    }
    
    
    func setupView() {
        conceptTextView.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        conceptTextView.keyboardDismissMode = .onDrag

    }
    
    @IBAction func addPhoto(_ sender: Any) {
        self.hostVC?.present(imagePicker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.addImageButton.setImage(image, for: UIControl.State())
        self.image = image
        self.imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Type your concept here." {
            textView.text = ""
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Type your concept here."
        }
    }
}
