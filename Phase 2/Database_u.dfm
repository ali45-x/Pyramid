object DataM: TDataM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object DsScore: TDataSource
    DataSet = tblstats
    Left = 48
    Top = 72
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=PyramidDB.mdb;Persi' +
      'st Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 8
  end
  object tblUser: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableDirect = True
    TableName = 'Users'
    Left = 152
    Top = 32
  end
  object tblstats: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Statistics'
    Left = 152
    Top = 96
  end
end
