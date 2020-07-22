program Teste;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form2},
  uDmPrincipal in 'uDmPrincipal.pas' {dmPrincipal: TDataModule},
  Ucadastro in 'Ucadastro.pas',
  uEndereco in 'uEndereco.pas' {Form1},
  uPessoas in 'uPessoas.pas' {frmPessoas},
  uDmCadastro in 'uDmCadastro.pas' {dmCadastros: TDataModule},
  uFuncionario in 'uFuncionario.pas' {frmFuncionario},
  uEmpresa in 'uEmpresa.pas' {frmEmpresa},
  uCadEndereco in 'uCadEndereco.pas' {frmEndereco};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmPessoas, frmPessoas);
  Application.CreateForm(TdmCadastros, dmCadastros);
  Application.CreateForm(TfrmFuncionario, frmFuncionario);
  Application.CreateForm(TfrmEmpresa, frmEmpresa);
  Application.CreateForm(TfrmEndereco, frmEndereco);
  Application.Run;
end.
