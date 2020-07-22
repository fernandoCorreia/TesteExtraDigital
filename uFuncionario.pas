unit uFuncionario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask;

type
  TfrmFuncionario = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    btnGravar: TButton;
    btnCancelar: TButton;
    edtNome: TEdit;
    edtIdEnd: TEdit;
    btnBuscar: TButton;
    btnNovo: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnEndereco: TButton;
    cbSexo: TComboBox;
    Label6: TLabel;
    edtDataCAd: TMaskEdit;
    edtDataNAsc: TMaskEdit;
    edtSalario: TEdit;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtDataCadEnter(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtSalarioExit(Sender: TObject);
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
  frmFuncionario: TfrmFuncionario;

implementation

uses
  uCadastro, uDmCadastro, uCadEndereco;

{$R *.dfm}

{ TfrmFuncionario }

procedure TfrmFuncionario.btnAlterarClick(Sender: TObject);
begin
  bol_altera := true;
  carregaCampos();
end;

procedure TfrmFuncionario.btnBuscarClick(Sender: TObject);
var
  cad : tCadastroFunc;
begin
  cad := tCadastroFunc.create();
  cad.carregaFunc();
  Cad.Destroy;
end;

procedure TfrmFuncionario.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFuncionario.btnEnderecoClick(Sender: TObject);
begin
  Application.CreateForm(TfrmEndereco, frmEndereco);
  frmEndereco.bol_Pessoa := false;
  frmEndereco.ShowModal;
  FreeAndNil(frmEndereco);
  edtIdEnd.Text := IntToStr(codEndereco);
end;

procedure TfrmFuncionario.btnExcluirClick(Sender: TObject);
var
  cad : tCadastroFunc;
begin
   cad := tCadastroFunc.create;
   cad.deletaFunc(StrToInt(DBGrid1.Columns.Items[5].Field.Text));
   cad.Destroy;
end;

procedure TfrmFuncionario.btnGravarClick(Sender: TObject);
var
  cad : tCadastroFunc;
  sexo: string;
begin
  try
     Cad := tCadastroFunc.create();

     case cbSexo.ItemIndex of
       0 : sexo := 'F';
       1 : sexo := 'M';
       2 : sexo := 'O';
     end;

     if bol_altera = true then
       begin
         cad.alteraFunc(StrToInt(DBGrid1.Columns.Items[5].Field.Text),
                        edtNome.Text,
                        strtoDate(edtDataNasc.Text),
                        sexo,
                        StrToFloat(edtSalario.Text),
                        strToInt(edtIdEnd.Text));
       end
     else
       begin
         cad.Nome     := edtNome.Text;
         Cad.sexo     := sexo;
         cad.DataNasc := StrToDate(edtDataNasc.Text);
         Cad.DataCad  := strToDate(edtDataCad.Text);
         cad.salario  := StrToFloat(edtSalario.Text);
         Cad.IdEnd    := strToInt(edtIdEnd.Text);

         Cad.gravaFunc();
       end;

     limpaCampos();
     Cad.Destroy;
     ShowMessage('Cadastro Efetivado');
   except
     ShowMessage('Erro ao cadastrar');
   end;

end;

procedure TfrmFuncionario.btnNovoClick(Sender: TObject);
begin
  limpaCampos();
end;

procedure TfrmFuncionario.carregaCampos;
begin
  edtDataNasc.Text := DBGrid1.Columns.Items[1].Field.Text;
  edtNome.Text     := DBGrid1.Columns.Items[0].Field.Text;
  edtDataCad.Text  := DBGrid1.Columns.Items[3].Field.Text;
  edtSalario.Text  := DBGrid1.Columns.Items[4].Field.Text;
  edtIdEnd.Text    := DBGrid1.Columns.Items[6].Field.Text;

  if DBGrid1.Columns.Items[2].Field.Text = 'M' then
    cbSexo.ItemIndex := 1
  else
    if DBGrid1.Columns.Items[2].Field.Text = 'F' then
      cbSexo.ItemIndex := 0
  else
    cbSexo.ItemIndex := 2;
end;

procedure TfrmFuncionario.edtDataCadEnter(Sender: TObject);
begin
  edtDataCad.Text := DateToStr(Now);
end;

procedure TfrmFuncionario.edtSalarioExit(Sender: TObject);
begin
  try
     StrToFloat(edtSalario.Text)
  except
    ShowMessage('Informe apenas valor númericos separando os centavos por vírgula, se houver!');
    edtSalario.SetFocus;
  end;

end;

procedure TfrmFuncionario.FormShow(Sender: TObject);
begin
  bol_altera := false;
end;

procedure TfrmFuncionario.limpaCampos;
begin
  edtDataNasc.Clear;
  edtNome.Clear;
  edtSalario.Clear;
  edtDataCad.Clear;
  cbSexo.ItemIndex := -1;
  edtIdEnd.Clear;
end;

end.
