object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Form2'
  ClientHeight = 456
  ClientWidth = 696
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 224
    Top = 40
    object Cadastros1: TMenuItem
      Caption = '&Cadastros'
      object Empresa1: TMenuItem
        Action = actEmpresa
      end
      object Funcionrios1: TMenuItem
        Action = actFunc
      end
      object Pessoas1: TMenuItem
        Action = actPessoas
      end
    end
  end
  object ActionList1: TActionList
    Left = 272
    Top = 40
    object actEmpresa: TAction
      Caption = 'Empresas'
      OnExecute = actEmpresaExecute
    end
    object actFunc: TAction
      Caption = 'Funcion'#225'rios'
      OnExecute = actFuncExecute
    end
    object actPessoas: TAction
      Caption = 'Pessoas'
      OnExecute = actPessoasExecute
    end
  end
end
