object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 272
  Width = 377
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=D:\teste\TESTE.FDB'
      'User_Name=SYSDBA'
      'Password=saf4win'
      'DriverID=FB')
    TxOptions.AutoStop = False
    Connected = True
    LoginPrompt = False
    Transaction = Transacao
    Left = 40
    Top = 128
  end
  object Transacao: TFDTransaction
    Options.AutoStop = False
    Connection = Conexao
    Left = 40
    Top = 184
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'D:\teste\fbclient.dll'
    Left = 40
    Top = 80
  end
end
