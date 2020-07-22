object frmPessoas: TfrmPessoas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 496
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 99
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 303
    Top = 98
    Width = 53
    Height = 13
    Caption = 'Data Nasc.'
  end
  object Label3: TLabel
    Left = 430
    Top = 97
    Width = 49
    Height = 13
    Caption = 'Data Cad.'
  end
  object Label4: TLabel
    Left = 557
    Top = 97
    Width = 28
    Height = 13
    Caption = 'Idade'
  end
  object Label5: TLabel
    Left = 82
    Top = 153
    Width = 65
    Height = 13
    Caption = 'cod Endereco'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 252
    Width = 670
    Height = 205
    DataSource = dmCadastros.dsPessoas
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOM_PESSOA'
        Title.Caption = 'Nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_NASC'
        Title.Caption = 'Nasc.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDADE'
        Title.Caption = 'Idade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CADASTRO'
        Title.Caption = 'Data Cad.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_PESSOA'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ID_ENDERECOP'
        Visible = False
      end>
  end
  object btnGravar: TButton
    Left = 605
    Top = 463
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 8
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 522
    Top = 463
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 9
    OnClick = btnCancelarClick
  end
  object edtNome: TEdit
    Left = 8
    Top = 117
    Width = 289
    Height = 21
    TabOrder = 0
  end
  object edtIdade: TEdit
    Left = 557
    Top = 116
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtIdEnd: TEdit
    Left = 83
    Top = 170
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object btnBuscar: TButton
    Left = 603
    Top = 221
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 6
    OnClick = btnBuscarClick
  end
  object btnNovo: TButton
    Left = 8
    Top = 24
    Width = 75
    Height = 50
    Caption = 'Novo'
    TabOrder = 10
    OnClick = btnNovoClick
  end
  object btnAlterar: TButton
    Left = 89
    Top = 24
    Width = 75
    Height = 50
    Caption = 'Alterar'
    TabOrder = 11
    OnClick = btnAlterarClick
  end
  object btnExcluir: TButton
    Left = 170
    Top = 24
    Width = 75
    Height = 50
    Caption = 'Excluir'
    TabOrder = 12
    OnClick = btnExcluirClick
  end
  object btnEndereco: TButton
    Left = 8
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cad Endere'#231'o'
    TabOrder = 4
    OnClick = btnEnderecoClick
  end
  object edtDataNAsc: TMaskEdit
    Left = 303
    Top = 117
    Width = 120
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object edtDataCAd: TMaskEdit
    Left = 430
    Top = 116
    Width = 121
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    ReadOnly = True
    TabOrder = 2
    Text = '  /  /    '
    OnEnter = edtDataCadEnter
  end
end
