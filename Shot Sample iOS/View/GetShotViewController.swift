//
//  GetShotViewController.swift
//  Shot Sample iOS
//
//  Created by Arthur Givigir on 28/10/17.
//  Copyright © 2017 Arthur Givigir. All rights reserved.
//

import UIKit
import Moya
import Kingfisher

class GetShotViewController: UIViewController {

    let decoder = JSONDecoder()
    var idShotSelected = 0
    
    @IBOutlet weak var shotTitle: UILabel!
    @IBOutlet weak var shotImage: UIImageView!
    @IBOutlet weak var shotDescription: UITextView!
    @IBOutlet weak var viewsCount: UILabel!
    @IBOutlet weak var commentsCount: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(idShotSelected)
        
        self.shotDescription.isEditable = false
        self.shotDescription.dataDetectorTypes = .link
        
        providerDribble.request(.getShot(id: "\(idShotSelected)")) { results in
            do {
                let response = try results.dematerialize()
                let data = response.data
                let shot = try self.decoder.decode(Shots.self, from: data)
                self.populateScreen(shot: shot)
            } catch {
                print(error)
            }
        }
    }

    func populateScreen(shot: Shots) {
        self.shotTitle.text = shot.title
        self.shotDescription.attributedText = shot.description?.toHtml()
        self.viewsCount.text = "\(shot.views_count ?? 0)"
        self.commentsCount.text = "\(shot.comments_count ?? 0)"
        self.createdAt.text = shot.created_at?.toStringDateTime()
        
        let url = URL(string: (shot.images?.hidpi) ?? "")!
        self.shotImage?.kf.setImage(with: url)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
