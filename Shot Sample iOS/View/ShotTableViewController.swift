//
//  ViewController.swift
//  Shot Sample iOS
//
//  Created by Arthur Givigir on 26/10/17.
//  Copyright © 2017 Arthur Givigir. All rights reserved.
//

import UIKit
import Moya
import Kingfisher

class ShotTableViewController: UITableViewController {
    
    let decoder = JSONDecoder()
    var idShotSelected = 0
    var shots: [Shots] = [Shots]()

    override func viewDidLoad() {
        super.viewDidLoad()
        providerDribble.request(.listShots) { results in
            do {
                let response = try results.dematerialize()
                let data = response.data
                self.shots = try self.decoder.decode([Shots].self, from: data)
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! ShotTableViewCell
        let url = URL(string: (shots[indexPath.row].images?.teaser) ?? "")!
        
        cell.title.text = shots[indexPath.row].title
        cell.createdAt.text = shots[indexPath.row].created_at?.toStringDateTime()
        cell.viewsCount.text = "\(shots[indexPath.row].views_count ?? 0)"
        
        
        let processor = ResizingImageProcessor(referenceSize: CGSize(width: 100, height: 60), mode: ContentMode.aspectFit)

        cell.imageView?.kf.setImage(with: url, options: [.processor(processor)], completionHandler: {
            (image, error, cacheType, imageUrl) in
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        })
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        idShotSelected = self.shots[indexPath.row].id ?? 0
        performSegue(withIdentifier: "getShotViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getShotViewController" {
            let vc = segue.destination as! GetShotViewController
            vc.idShotSelected = self.idShotSelected
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shots.count
    }
}

extension String
{
    func toStringDateTime() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "eu") as Locale!
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm"
        
        let dateFromString : Date? = dateFormatter.date(from: self)
        return dateFormatter.string(from: dateFromString ?? Date())
    }
    
    func toHtml() -> NSAttributedString? {
        do {
            let data = self.data(using: String.Encoding.unicode, allowLossyConversion: true)
            if let d = data {
                let str = try NSAttributedString(data: d,
                                                 options: [.documentType: NSAttributedString.DocumentType.html],
                                                 documentAttributes: nil)
                return str
            }
        } catch {
        }
        return nil
    }
}
