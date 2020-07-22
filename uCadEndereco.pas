unit uCadEndereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmEndereco = class(TForm)
    edtUf: TEdit;
    edtCep: TEdit;
    edtBairro: TEdit;
    edtNumCasa: TEdit;
    edtCidade: TEdit;
    btnCancelar: TButton;
    btnGravar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    labelBairro: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    edtCod: TEdit;
    qryEndereco: TFDQuery;
    qryGen: TFDQuery;
    qryGenGEN: TLargeintField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bol_Pessoa : boolean;
  end;

var
  frmEndereco: TfrmEndereco;

implementation

uses
  uDmPrincipal, upessoas, ufuncionario;
{$R *.dfm}

procedure TfrmEndereco.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmEndereco.btnGravarClick(Sender: TObject);
begin
  qryGen.Close;
  qryGen.Open();

  qryEndereco.Close;
  qryEndereco.ParamByName( 'id_endereco' ).Value := qryGenGEN.Value;
  qryEndereco.ParamByName( 'cidade'      ).Value :=edtCidade.Text;
  qryEndereco.ParamByName( 'bairro'      ).Value :=edtBairro.Text;
  qryEndereco.ParamByName( 'cep'         ).Value :=edtCep.Text;
  qryEndereco.ParamByName( 'num_casa'    ).Value :=edtNumCasa.Text;
  qryEndereco.ParamByName( 'estado'      ).Value :=edtUf.Text;
  qryEndereco.ExecSQL;
  dmPrincipal.Transacao.Commit;

  if bol_Pessoa then
    frmPessoas.codEndereco := qryGenGEN.Value
  else
    frmFuncionario.codEndereco := qryGenGEN.Value;

  qryGen.Close;
  qryEndereco.Close;
  Close;
end;

end.
