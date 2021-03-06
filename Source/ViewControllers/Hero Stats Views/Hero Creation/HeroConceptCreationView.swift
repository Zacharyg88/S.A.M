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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
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
        addImageButton.layer.cornerRadius = addImageButton.frame.height / 2
        addImageButton.layer.borderWidth = 2
        addImageButton.layer.borderColor = UIColor(named: "SWButton_Border")?.cgColor
        self.clipsToBounds = true
        
        let dismissKeyboardTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(dismissKeyboardTap)
        

    }
    
    @objc func dismissKeyboard() {
        self.nameTextField.resignFirstResponder()
        self.nickNameTextField.resignFirstResponder()
        self.conceptTextView.resignFirstResponder()
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
