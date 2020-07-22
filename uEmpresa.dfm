object frmEmpresa: TfrmEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Empresas'
  ClientHeight = 526
  ClientWidth = 291
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
    Left = 30
    Top = 241
    Width = 63
    Height = 13
    Caption = 'Cod Empresa'
  end
  object Label2: TLabel
    Left = 30
    Top = 285
    Width = 60
    Height = 13
    Caption = 'Nome Raz'#227'o'
  end
  object Label3: TLabel
    Left = 30
    Top = 331
    Width = 71
    Height = 13
    Caption = 'Nome Fantasia'
  end
  object Label4: TLabel
    Left = 30
    Top = 381
    Width = 22
    Height = 13
    Caption = 'Cnpj'
  end
  object Label5: TLabel
    Left = 30
    Top = 429
    Width = 54
    Height = 13
    Caption = 'Insc. Estad'
  end
  object edtCod: TEdit
    Left = 30
    Top = 257
    Width = 237
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object edtFantasia: TEdit
    Left = 30
    Top = 349
    Width = 237
    Height = 21
    TabOrder = 2
  end
  object edtRazao: TEdit
    Left = 30
    Top = 304
    Width = 237
    Height = 21
    TabOrder = 1
  end
  object edtInsc: TEdit
    Left = 30
    Top = 448
    Width = 237
    Height = 21
    TabOrder = 4
  end
  object edtCnpj: TEdit
    Left = 30
    Top = 400
    Width = 237
    Height = 21
    TabOrder = 3
  end
  object btnCancelar: TButton
    Left = 50
    Top = 493
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object btnExcluir: TButton
    Left = 192
    Top = 24
    Width = 75
    Height = 50
    Caption = 'Excluir'
    TabOrder = 6
    OnClick = btnExcluirClick
  end
  object btnAlterar: TButton
    Left = 111
    Top = 24
    Width = 75
    Height = 50
    Caption = 'Alterar'
    TabOrder = 7
    OnClick = btnAlterarClick
  end
  object btnNovo: TButton
    Left = 30
    Top = 24
    Width = 75
    Height = 50
    Caption = 'Novo'
    TabOrder = 8
    OnClick = btnNovoClick
  end
  object btnGravar: TButton
    Left = 149
    Top = 493
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 9
    OnClick = btnGravarClick
  end
  object btnBuscar: TButton
    Left = 111
    Top = 98
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 10
    OnClick = btnBuscarClick
  end
  object ListView1: TListView
    Left = 30
    Top = 132
    Width = 237
    Height = 99
    Columns = <
      item
        Caption = 'Cod'
      end
      item
        Caption = 'razao'
      end
      item
        Caption = 'fantasia'
      end
      item
        Caption = 'cnpj'
      end
      item
        Caption = 'IE'
      end>
    TabOrder = 11
    ViewStyle = vsReport
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = dmCadastros.qryEmpresa
    ScopeMappings = <>
    Left = 8
    Top = 64
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkListControlToField1: TLinkListControlToField
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      FieldName = 'ID_EMPRESA'
      Control = ListView1
      FillExpressions = <
        item
          SourceMemberName = 'NOM_RAZAO'
          ControlMemberName = 'SubItems[0]'
        end
        item
          SourceMemberName = 'NOM_FANTASIA'
          ControlMemberName = 'SubItems[1]'
        end
        item
          SourceMemberName = 'CNPJ'
          ControlMemberName = 'SubItems[2]'
        end
        item
          SourceMemberName = 'IE'
          ControlMemberName = 'SubItems[3]'
        end>
      FillHeaderExpressions = <>
      FillBreakGroups = <>
    end
  end
end
