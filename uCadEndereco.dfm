object frmEndereco: TfrmEndereco
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Endere'#231'o'
  ClientHeight = 443
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 111
    Top = 169
    Width = 13
    Height = 13
    Caption = 'UF'
  end
  object Label2: TLabel
    Left = 111
    Top = 219
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label3: TLabel
    Left = 111
    Top = 265
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object labelBairro: TLabel
    Left = 111
    Top = 311
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label5: TLabel
    Left = 111
    Top = 357
    Width = 39
    Height = 13
    Caption = 'N'#186' Casa'
  end
  object Label4: TLabel
    Left = 111
    Top = 105
    Width = 44
    Height = 13
    Caption = 'Cod End.'
  end
  object edtUf: TEdit
    Left = 111
    Top = 188
    Width = 121
    Height = 21
    MaxLength = 2
    TabOrder = 0
  end
  object edtCep: TEdit
    Left = 111
    Top = 284
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtBairro: TEdit
    Left = 111
    Top = 330
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtNumCasa: TEdit
    Left = 111
    Top = 373
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object edtCidade: TEdit
    Left = 111
    Top = 238
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnCancelar: TButton
    Left = 82
    Top = 410
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object btnGravar: TButton
    Left = 181
    Top = 410
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 6
    OnClick = btnGravarClick
  end
  object edtCod: TEdit
    Left = 111
    Top = 124
    Width = 121
    Height = 21
    MaxLength = 2
    ReadOnly = True
    TabOrder = 7
  end
  object qryEndereco: TFDQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      
        'INSERT INTO TENDERECOS (ID_ENDERECO, CEP, CIDADE, ESTADO, NUM_CA' +
        'SA, BAIRRO)'
      
        '     VALUES (:ID_ENDERECO, :CEP, :CIDADE, :ESTADO, :NUM_CASA, :B' +
        'AIRRO)')
    Left = 48
    Top = 32
    ParamData = <
      item
        Name = 'ID_ENDERECO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 9
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'ESTADO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'NUM_CASA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
  end
  object qryGen: TFDQuery
    Connection = dmPrincipal.Conexao
    SQL.Strings = (
      'SELECT MAX(ID_ENDERECO) + 1 AS GEN FROM TENDERECOS')
    Left = 128
    Top = 32
    object qryGenGEN: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'GEN'
      Origin = 'GEN'
      ProviderFlags = []
      ReadOnly = True
    end
  end
end
