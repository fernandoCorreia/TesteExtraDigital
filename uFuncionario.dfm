object frmFuncionario: TfrmFuncionario
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Funcion'#225'rios'
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
    Top = 98
    Width = 49
    Height = 13
    Caption = 'Data Cad.'
  end
  object Label4: TLabel
    Left = 522
    Top = 98
    Width = 32
    Height = 13
    Caption = 'Salario'
  end
  object Label5: TLabel
    Left = 82
    Top = 153
    Width = 70
    Height = 13
    Caption = 'Cidade/Estado'
  end
  object Label6: TLabel
    Left = 599
    Top = 98
    Width = 24
    Height = 13
    Caption = 'Sexo'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 252
    Width = 670
    Height = 205
    DataSource = dmCadastros.dsFuncionarios
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOM_FUNCIONARIO'
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
        FieldName = 'SEXO'
        Title.Caption = 'Sexo'
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
        FieldName = 'SALARIO'
        Title.Caption = 'Salario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_FUNCIONARIO'
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
    TabOrder = 9
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 522
    Top = 463
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 10
    OnClick = btnCancelarClick
  end
  object edtNome: TEdit
    Left = 8
    Top = 117
    Width = 289
    Height = 21
    TabOrder = 0
  end
  object edtIdEnd: TEdit
    Left = 83
    Top = 170
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object btnBuscar: TButton
    Left = 603
    Top = 221
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 7
    OnClick = btnBuscarClick
  end
  object btnNovo: TButton
    Left = 8
    Top = 24
    Width = 75
    Height = 50
    Caption = 'Novo'
    TabOrder = 11
    OnClick = btnNovoClick
  end
  object btnAlterar: TButton
    Left = 89
    Top = 24
    Width = 75
    Height = 50
    Caption = 'Alterar'
    TabOrder = 12
    OnClick = btnAlterarClick
  end
  object btnExcluir: TButton
    Left = 170
    Top = 24
    Width = 75
    Height = 50
    Caption = 'Excluir'
    TabOrder = 13
    OnClick = btnExcluirClick
  end
  object btnEndereco: TButton
    Left = 8
    Top = 168
    Width = 75
    Height = 25
    Caption = 'Cad Endere'#231'o'
    TabOrder = 5
    OnClick = btnEnderecoClick
  end
  object cbSexo: TComboBox
    Left = 599
    Top = 117
    Width = 81
    Height = 21
    TabOrder = 4
    Items.Strings = (
      'Feminino'
      'Masculino'
      'Outros')
  end
  object edtDataCAd: TMaskEdit
    Left = 430
    Top = 117
    Width = 73
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    ReadOnly = True
    TabOrder = 2
    Text = '  /  /    '
    OnEnter = edtDataCadEnter
  end
  object edtDataNAsc: TMaskEdit
    Left = 303
    Top = 117
    Width = 121
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object edtSalario: TEdit
    Left = 522
    Top = 117
    Width = 71
    Height = 21
    TabOrder = 3
    OnExit = edtSalarioExit
  end
end
