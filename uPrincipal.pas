unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus;

type
  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Empresa1: TMenuItem;
    Funcionrios1: TMenuItem;
    Pessoas1: TMenuItem;
    ActionList1: TActionList;
    actEmpresa: TAction;
    actFunc: TAction;
    actPessoas: TAction;
    procedure actEmpresaExecute(Sender: TObject);
    procedure actFuncExecute(Sender: TObject);
    procedure actPessoasExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
 uPessoas, uFuncionario, uEmpresa;

{$R *.dfm}

procedure TForm2.actEmpresaExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmEmpresa,frmEmpresa);
  frmEmpresa.ShowModal;
  FreeAndNil(frmEmpresa);
end;

procedure TForm2.actFuncExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmFuncionario,frmFuncionario);
  frmFuncionario.ShowModal;
  FreeAndNil(frmFuncionario);
end;

procedure TForm2.actPessoasExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmPessoas,frmPessoas);
  frmPessoas.ShowModal;
  FreeAndNil(frmPessoas);
end;

end.
