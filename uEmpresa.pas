unit uEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmEmpresa = class(TForm)
    edtCod: TEdit;
    edtFantasia: TEdit;
    edtRazao: TEdit;
    edtInsc: TEdit;
    edtCnpj: TEdit;
    btnCancelar: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    btnNovo: TButton;
    btnGravar: TButton;
    btnBuscar: TButton;
    ListView1: TListView;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure btnGravarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    bol_altera : boolean;
    procedure limpaCampos();
    procedure carregaCampos();

  public
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

{$R *.dfm}

uses
 uCadastro, uDmCadastro;

procedure TfrmEmpresa.btnAlterarClick(Sender: TObject);
begin
  bol_altera := true;
  carregaCampos();
end;

procedure TfrmEmpresa.btnBuscarClick(Sender: TObject);
var
  cad : tCadastroEmpresa;
begin
   cad := tCadastroEmpresa.create();
   cad.carregaEmp();
   cad.Destroy();

end;

procedure TfrmEmpresa.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEmpresa.btnExcluirClick(Sender: TObject);
var
  cad : tCadastroEmpresa;
begin
   cad := tCadastroEmpresa.create;
   cad.deletaEmp(StrToInt(ListView1.Items.Item[ListView1.Selected.Index].Caption));
   cad.Destroy;
end;

procedure TfrmEmpresa.btnGravarClick(Sender: TObject);
var
 cad : tCadastroEmpresa;
begin
     try
     Cad := tCadastroEmpresa.create();

     if bol_altera = true then
       begin
         cad.alteraEmp(StrToInt(edtCod.Text),
                       edtRazao.Text,
                       edtFantasia.Text,
                       edtCnpj.Text,
                       edtInsc.Text);
       end
     else
       begin
         cad.NomeFantasia := edtFantasia.Text;
         Cad.NomeRazao    := edtRazao.Text;
         cad.Cnpj         := edtCnpj.Text;
         Cad.Ie           := edtInsc.Text;

         Cad.gravaEmp();
       end;

     limpaCampos();
     Cad.Destroy;
     ShowMessage('Cadastro Efetivado');
   except
     ShowMessage('Erro ao cadastrar');
   end;

end;

procedure TfrmEmpresa.btnNovoClick(Sender: TObject);
begin
  bol_altera := false;
  limpaCampos();
end;

procedure TfrmEmpresa.carregaCampos;
begin
  edtCod.text       := ListView1.Items.Item[ListView1.Selected.Index].Caption;
  edtRazao.text     := ListView1.Items.Item[ListView1.Selected.Index].SubItems[0];
  edtFantasia.text  := ListView1.Items.Item[ListView1.Selected.Index].SubItems[1];
  edtcnpj.text      := ListView1.Items.Item[ListView1.Selected.Index].SubItems[2];
  edtInsc.text      := ListView1.Items.Item[ListView1.Selected.Index].SubItems[3];
end;

procedure TfrmEmpresa.limpaCampos;
begin
  edtCod.Clear;
  edtFantasia.Clear;
  edtrazao.Clear;
  edtcnpj.Clear;
  edtInsc.Clear;
end;

end.
