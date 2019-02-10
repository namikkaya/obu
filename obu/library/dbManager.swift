//
//  dbManager.swift
//  obu
//
//  Created by namik kaya on 28.01.2019.
//  Copyright © 2019 namik kaya. All rights reserved.
//

import UIKit
import SQLite

protocol dbManagerDelegate: class {
    func dbManagerSetNumbers()
    /*func dbManagerResult(data:[luckyNumbersData])
    func dbManagerDelete(id:Int64)
    func dbManagerError(error:standartErrorCode)*/
}


class dbManager:NSObject {
    weak var setDelegate:dbManagerDelegate?
    private var dbFileURL:URL!
    private var dbName:String = "obu.sqlite3"
    
    var db:Connection!
    var path:String = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
    let tableName = Table("obu")
    let id = Expression<Int64>("id")
    
    let luckyNumbers = Expression<String>("luckyNumbers")
    
    override init() {
        super.init()
        createDB()
    }
    
    func createDB(){
        do {
            if db == nil {
                db = try Connection("\(path)/\(dbName)")
            }
            try db.run(tableName.create { t in
                t.column(id, primaryKey: true)
                t.column(luckyNumbers)
            })
        } catch {
            
        }
    }
    /*
    /// DB den bütün kaydedilmiş verileri döndürür. Dizi [luckyNumbersData]
    func getDB(){
        var luckyNumberList: [luckyNumbersData] = []
        do {
            if db == nil {
                db = try Connection("\(path)/\(dbName)")
            }
            for item in try db.prepare(tableName) {
                let d:luckyNumbersData = luckyNumbersData(_id: item[id], _luckyNumbers: item[luckyNumbers])
                luckyNumberList.append(d)
            }
        } catch {
            setDelegate?.dbManagerError(error: standartErrorCode.dbConnectionError)
        }
        
        
        if(luckyNumberList.count > 0){
            setDelegate?.dbManagerResult(data: luckyNumberList)
        }else{
            setDelegate?.dbManagerError(error: standartErrorCode.dbEmptyError)
        }
    }
    
    /// Eklenen sayılar
    func insertNumbers(_luckyNumbers:String){
        do {
            if db == nil {
                db = try Connection("\(path)/\(dbName)")
            }
            let insert = tableName.insert(
                luckyNumbers <- _luckyNumbers
            )
            try db.run(insert)
            setDelegate?.dbManagerSetNumbers()
        } catch {
            print("dataBase: addUserDB => Bağlantı problemli")
        }
    }
    
    /// silinecek sayı serisi
    func deleteNumbers(_id:Int64){
        do {
            if db == nil {
                db = try Connection("\(path)/\(dbName)")
            }
            let removeData = tableName.filter(id == _id)
            //try db.run(removeData.delete())
            
            do {
                if try db.run(removeData.delete()) > 0 {
                    setDelegate?.dbManagerDelete(id: _id)
                } else {
                    setDelegate?.dbManagerError(error: standartErrorCode.dbDeleteError)
                }
            } catch {
                print("delete failed: \(error)")
                setDelegate?.dbManagerError(error: standartErrorCode.dbDeleteError)
            }
            
            
        } catch {
            setDelegate?.dbManagerError(error: standartErrorCode.dbDeleteError)
            return
        }
    }*/
}
