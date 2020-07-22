object dmCadastros: TdmCadastros
  OldCreateOrder = False
  Height = 365
  Width = 469
  object qryPessoas: TFDQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'select * from tpessoas')
    Left = 16
    Top = 8
    object qryPessoasID_PESSOA: TIntegerField
      FieldName = 'ID_PESSOA'
      Origin = 'ID_PESSOA'
      Required = True
    end
    object qryPessoasNOM_PESSOA: TStringField
      FieldName = 'NOM_PESSOA'
      Origin = 'NOM_PESSOA'
      Required = True
      Size = 70
    end
    object qryPessoasIDADE: TIntegerField
      FieldName = 'IDADE'
      Origin = 'IDADE'
    end
    object qryPessoasDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
      Origin = 'DATA_NASC'
    end
    object qryPessoasDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
    end
    object qryPessoasID_ENDERECOP: TIntegerField
      FieldName = 'ID_ENDERECOP'
      Origin = 'ID_ENDERECOP'
      Required = True
    end
  end
  object dsPessoas: TDataSource
    DataSet = qryPessoas
    Left = 72
    Top = 8
  end
  object qryFuncionarios: TFDQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'select * from tfuncionarios')
    Left = 16
    Top = 64
    object qryFuncionariosID_FUNCIONARIO: TIntegerField
      FieldName = 'ID_FUNCIONARIO'
      Origin = 'ID_FUNCIONARIO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFuncionariosNOM_FUNCIONARIO: TStringField
      FieldName = 'NOM_FUNCIONARIO'
      Origin = 'NOM_FUNCIONARIO'
      Required = True
      Size = 70
    end
    object qryFuncionariosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
    end
    object qryFuncionariosDATA_NASC: TDateField
      FieldName = 'DATA_NASC'
      Origin = 'DATA_NASC'
    end
    object qryFuncionariosSALARIO: TBCDField
      FieldName = 'SALARIO'
      Origin = 'SALARIO'
      Precision = 18
      Size = 2
    end
    object qryFuncionariosSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object qryFuncionariosID_ENDERECOP: TIntegerField
      FieldName = 'ID_ENDERECOP'
      Origin = 'ID_ENDERECOP'
      Required = True
    end
  end
  object dsFuncionarios: TDataSource
    DataSet = qryFuncionarios
    Left = 72
    Top = 64
  end
  object qryEmpresa: TFDQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'select * from tEmpresas')
    Left = 8
    Top = 128
    object qryEmpresaID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEmpresaNOM_RAZAO: TStringField
      FieldName = 'NOM_RAZAO'
      Origin = 'NOM_RAZAO'
      Required = True
      Size = 70
    end
    object qryEmpresaNOM_FANTASIA: TStringField
      FieldName = 'NOM_FANTASIA'
      Origin = 'NOM_FANTASIA'
      Size = 70
    end
    object qryEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
    end
    object qryEmpresaIE: TStringField
      FieldName = 'IE'
      Origin = 'IE'
      Size = 10
    end
  end
  object dsEmpresa: TDataSource
    DataSet = qryEmpresa
    Left = 72
    Top = 128
  end
end
