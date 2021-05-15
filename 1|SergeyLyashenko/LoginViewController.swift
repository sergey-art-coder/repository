//
//  ViewController.swift
//  1|SergeyLyashenko
//
//  Created by Сергей Ляшенко on 27.02.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown (notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue) . cgRectValue.size
        let contentInsets = UIEdgeInsets (top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    // Когда клавиатура исчезнет
    @objc func keyboardWillBeHidden (notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Подписываемся на два ведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector (self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // Второе - когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector (self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // Добавим метод отписки при исчезновении контроллера с экрана
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    // Исчезновение клавиатуры при клике по пустому месту на экране и метод, который будет вызываться при клике
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    // Добавим жест нажатия к UIScrollView
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // клик по любому месту scrollView для скрытия клавиатуры - Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer (target: self, action: #selector(hideKeyboard))
        // присваиваем его UIScrollView
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        // * делегаты для переноса фокуса на следующее поле ввода
        self.loginField.delegate = self
        self.passwordField.delegate = self
        
    }
    
    // Напишем логику авторизации в метод нажатия кнопки
    @IBAction func onButtonTapped(_ sender: Any) {

    }
    
    // Создаем метод который будет маркером для перехода назад (Unwind Segue)
    @IBAction func backToLogin (unwindSegue: UIStoryboardSegue) {
   //     При выходе очищам логин и пароль
        loginField.text = ""
        passwordField.text = ""
    }
    
    // Метод чтобы подтвердить или отменить переход, в UIViewController
    override func shouldPerformSegue (withIdentifier identifer: String, sender: Any?) -> Bool {
        // Проверяем данные
        let checkResult = checkUserData()
        
        // Если данные не верны, покажем ошибку
        if !checkResult {
            showLoginError()
        }
        
        // Вернем результат
        return checkResult
    }
        
    func checkUserData() -> Bool {
        // Получаем текст логина
        guard let login = loginField.text,
              // Получаем текст-пароль
              let password = passwordField.text else {  return false }
        
        // Проверяем, верны ли они (lowercased() - возвращает строчную версию строки)

        if login == "Admin".lowercased() && password == "123456" {
            
            return true

        } else {
            
            return false
        }
    }
        
    func showLoginError() {
        
        // Создаем контроллер
        let alter = UIAlertController (title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
        
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction (title: "ОК", style: .cancel, handler: nil)
        
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
    }
}

