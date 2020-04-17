//
//  ComposeViewController.swift
//  Bcmbf14Memo
//
//  Created by jongchankim on 2020/04/14.
//  Copyright © 2020 jongchankim. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var editTarget: Memo?
    var originalMemoContent: String?

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var memoTextView: UITextView!
        
    @IBAction func save(_ sender: Any) {
        
        guard let memo = memoTextView.text, memo.count > 0 else {
            alert(message: "메모를 입력하세요.")
            return
        }
        
//        let newMemo = Memo(content: memo)
//        Memo.dummyMemoList.append(newMemo)
        
        if let target = editTarget {
            target.content = memo
            DataManager.shared.saveContext()
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)

        }else{
            DataManager.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)

        }

        
        
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        if let memo = editTarget {
            navigationItem.title = "메모 편집"
            memoTextView.text = memo.content
            originalMemoContent = memo.content
        }else {
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }
        
    
        memoTextView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        편집화면이 실행되기 직전에 델리게이트 설정
        navigationController?.presentationController?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        편집화면이 사라지기 직전에 델리게이트 해제
        navigationController?.presentationController?.delegate = nil
    }
    

  
}


extension ComposeViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
    static let memoDidChange = Notification.Name(rawValue: "memoDidChange")
    
}



extension ComposeViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        
//        하려는 것
//        메모를 수정하고 풀다운 했을 때, 저장해야할지 물어보기
//        원본과 지금 고친메모가 다른지 판단
        if let original = originalMemoContent, let edited = textView.text {
            if #available(iOS 13.0, *) {
                //모달방식으로 동작해야하는지 결정하는 플래그
                //다르다면 속성에 트루가 저장
                isModalInPresentation = original != edited
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
}



extension ComposeViewController : UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        let alert = UIAlertController(title: "확인", message: "편집한 내용을 저장할까요?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { [weak self] (action) in
            self?.save(action)
        }
        
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { [weak self] (action) in
            self?.close(action)
        }
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}
