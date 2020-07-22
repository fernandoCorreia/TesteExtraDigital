unit uPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask;

type
  TfrmPessoas = class(TForm)
    DBGrid1: TDBGrid;
    btnGravar: TButton;
    btnCancelar: TButton;
    edtNome: TEdit;
    edtIdade: TEdit;
    edtIdEnd: TEdit;
    btnBuscar: TButton;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnEndereco: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtDataNAsc: TMaskEdit;
    edtDataCAd: TMaskEdit;
    procedure btnGravarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure edtDataCadEnter(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEnderecoClick(Sender: TObject);
  private
    { Private declarations }
    bol_altera : boolean;
    procedure limpaCampos();
    procedure carregaCampos();
  public
    { Public declarations }
    codEndereco : integer;
  end;

var
  frmPessoas: TfrmPessoas;

implementation

uses
  uCadastro, uDmCadastro, uCadEndereco;


{$R *.dfm}

procedure TfrmPessoas.btnAlterarClick(Sender: TObject);
begin
  bol_altera := true;
  carregaCampos();
end;

procedure TfrmPessoas.btnBuscarClick(Sender: TObject);
var
  cadPessoa : tCadastroPessoa;
begin
  cadPessoa := tCadastroPessoa.create();
  cadPessoa.carregaPessoas();
  CadPessoa.Destroy;
end;

procedure TfrmPessoas.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPessoas.btnEnderecoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmEndereco, frmEndereco);
  frmEndereco.bol_Pessoa := true;
  frmEndereco.ShowModal;
  FreeAndNil(frmEndereco);
  edtIdEnd.Text := IntToStr(codEndereco);
end;

procedure TfrmPessoas.btnExcluirClick(Sender: TObject);
var
  cad : tCadastroPessoa;
begin
   cad := tCadastroPessoa.create;
   cad.deletaPessoas(StrToInt(DBGrid1.Columns.Items[4].Field.Text));
   cad.Destroy;
end;

procedure TfrmPessoas.btnGravarClick(Sender: TObject);
var
  Cad : tCadastroPessoa;
begin
   try
     Cad := tCadastroPessoa.create();

     if bol_altera = true then
       begin
         cad.alteraPessoas(StrToInt(DBGrid1.Columns.Items[4].Field.Text),
                           edtNome.Text,
                           strtoDate(edtDataNasc.Text),
                           strtoInt(edtIdade.Text),
                           codEndereco);
       end
     else
       begin
         cad.Nome     := edtNome.Text;
         Cad.Idade    := strtoInt(edtIdade.Text);
         cad.DataNasc := StrToDate(edtDataNasc.Text);
         Cad.DataCad  := strToDate(edtDataCad.Text);
         Cad.IdEnd    := codEndereco;

         Cad.gravaPessoas();
       end;

     limpaCampos();
     Cad.Destroy;
     ShowMessage('Cadastro Efetivado');
   except
     ShowMessage('Erro ao cadastrar');
   end;
end;

procedure TfrmPessoas.btnNovoClick(Sender: TObject);
begin
  bol_altera := false;
  limpaCampos();
end;

procedure TfrmPessoas.carregaCampos;
begin
  edtDataNasc.Text := DBGrid1.Columns.Items[1].Field.Text;
  edtNome.Text     := DBGrid1.Columns.Items[0].Field.Text;
  edtDataCad.Text  := DBGrid1.Columns.Items[3].Field.Text;
  edtIdade.Text    := DBGrid1.Columns.Items[2].Field.Text;
  edtIdEnd.Text    := DBGrid1.Columns.Items[5].Field.Text
end;

procedure TfrmPessoas.edtDataCadEnter(Sender: TObject);
begin
  edtDataCad.Text := DateToStr(Now);
end;

procedure TfrmPessoas.FormShow(Sender: TObject);
begin
  bol_altera := false;
end;


procedure TfrmPessoas.limpaCampos;
begin
  edtDataNasc.Clear;
  edtNome.Clear;
  edtDataCad.Clear;
  edtIdade.Clear;
  edtIdEnd.Clear;
  edtIdEnd.Clear;
end;

end.
