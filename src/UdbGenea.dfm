object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\user\GitLocal\geneaFM\src\libmysql.dll'
    Left = 32
    Top = 16
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 408
    Top = 8
  end
  object FDConnecSqLite: TFDConnection
    ConnectionName = 'geneasqlite'
    Params.Strings = (
      'Database=C:\user\GitLocal\geneaFM\data\adn.db'
      'DriverID=SQLite'
      'LockingMode=Normal')
    LoginPrompt = False
    Left = 528
    Top = 8
  end
  object FDConnecMysql: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Database=adn'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 104
    Top = 16
  end
  object FDQuerPays: TFDQuery
    Connection = FDConnecSqLite
    SQL.Strings = (
      'select idnation,nom from pays')
    Left = 408
    Top = 64
  end
  object FDQuerDept: TFDQuery
    Connection = FDConnecSqLite
    SQL.Strings = (
      'select iddept,dept from departement')
    Left = 528
    Top = 64
  end
  object FDQuerNomPren: TFDQuery
    Connection = FDConnecSqLite
    SQL.Strings = (
      'select idperson,nom,prenom from personnes  order by nom,prenom')
    Left = 400
    Top = 136
  end
  object FDQuerMaj: TFDQuery
    Connection = FDConnecSqLite
    Left = 512
    Top = 136
  end
  object FDQuerSais: TFDQuery
    Connection = FDConnecSqLite
    Left = 400
    Top = 192
  end
  object FDQuerGlob: TFDQuery
    Connection = FDConnecSqLite
    Left = 504
    Top = 192
  end
  object FDQuerArbr: TFDQuery
    Connection = FDConnecSqLite
    Left = 400
    Top = 256
  end
  object FDQuerMajPlus: TFDQuery
    Connection = FDConnecSqLite
    Left = 488
    Top = 256
  end
  object FDQuerSais2: TFDQuery
    Connection = FDConnecSqLite
    Left = 408
    Top = 320
  end
  object FDQuerChoix: TFDQuery
    Connection = FDConnecSqLite
    Left = 512
    Top = 320
  end
end
