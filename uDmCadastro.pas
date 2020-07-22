unit uDmCadastro;

interface

uses
  System.SysUtils, System.Classes,  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmCadastros = class(TDataModule)
    qryPessoas: TFDQuery;
    qryPessoasID_PESSOA: TIntegerField;
    qryPessoasNOM_PESSOA: TStringField;
    qryPessoasIDADE: TIntegerField;
    qryPessoasDATA_NASC: TDateField;
    qryPessoasDATA_CADASTRO: TDateField;
    qryPessoasID_ENDERECOP: TIntegerField;
    dsPessoas: TDataSource;
    qryFuncionarios: TFDQuery;
    dsFuncionarios: TDataSource;
    qryFuncionariosID_FUNCIONARIO: TIntegerField;
    qryFuncionariosNOM_FUNCIONARIO: TStringField;
    qryFuncionariosDATA_CADASTRO: TDateField;
    qryFuncionariosDATA_NASC: TDateField;
    qryFuncionariosSALARIO: TBCDField;
    qryFuncionariosSEXO: TStringField;
    qryFuncionariosID_ENDERECOP: TIntegerField;
    qryEmpresa: TFDQuery;
    dsEmpresa: TDataSource;
    qryEmpresaID_EMPRESA: TIntegerField;
    qryEmpresaNOM_RAZAO: TStringField;
    qryEmpresaNOM_FANTASIA: TStringField;
    qryEmpresaCNPJ: TStringField;
    qryEmpresaIE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    {pessoas}
    procedure carregaPessoas;
    procedure gravaPessoas;
    procedure deletaPessoas;
    procedure alteraPessoas;

    {funcionarios}
    procedure carregaFunc;
    procedure gravaFunc;
    procedure deletaFunc;
    procedure alteraFunc;

    {Empresas}
    procedure carregaEmp;
    procedure gravaEmpr;
    procedure deletaEmp;
    procedure alteraEmp;

  end;

var
  dmCadastros: TdmCadastros;

implementation

uses
  uDmPrincipal;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmCadastros }

procedure TdmCadastros.alteraEmp;
begin
  qryEmpresa.Close;
  qryEmpresa.SQL.Clear;
  qryEmpresa.SQL.Add( 'UPDATE TEMPRESAS SET NOM_razao = :NOM_RAZAO,       ' );
  qryEmpresa.SQL.Add( '                     NOM_FANTASIA = :NOM_FANTASIA, ' );
  qryEmpresa.SQL.Add( '                     CNPJ= :CNPJ,                  ' );
  qryEmpresa.SQL.Add( '                     IE= :IE                       ' );
  qryEmpresa.SQL.Add( ' WHERE ID_EMPRESA = :ID_EMPRESA                    ' );
end;

procedure TdmCadastros.alteraFunc;
begin
  qryFuncionarios.Close;
  qryFuncionarios.SQL.Clear;
  qryFuncionarios.SQL.Add( 'UPDATE TFUNCIONARIOS SET NOM_FUNCIONARIO = :NOM_Funcionario, ' );
  qryFuncionarios.SQL.Add( '                         sexo = :sexo,                       ' );
  qryFuncionarios.SQL.Add( '                         sALARIO = :SALARIO,                 ' );
  qryFuncionarios.SQL.Add( '                         DATA_NASC = :DATA_NASC,             ' );
  qryFuncionarios.SQL.Add( '                         ID_ENDERECOP = :ID_END              ' );
  qryFuncionarios.SQL.Add( ' WHERE ID_FUNCIONARIO = :ID_funcionario                      ' );
end;

procedure TdmCadastros.alteraPessoas;
begin
  qryPessoas.Close;
  qryPessoas.SQL.Clear;
  qryPessoas.SQL.Add( 'UPDATE TPESSOAS SET NOM_PESSOA = :NOM_PESSOA, ' );
  qryPessoas.SQL.Add( '                    IDADE = :IDADE,           ' );
  qryPessoas.SQL.Add( '                    DATA_NASC = :DATA_NASC,   ' );
  qryPessoas.SQL.Add( '                    ID_ENDERECOP = :ID_END    ' );
  qryPessoas.SQL.Add( ' WHERE ID_PESSOA = :ID_PESSOA                 ' );
end;

procedure TdmCadastros.carregaEmp;
begin
  qryEmpresa.Close;
  qryEmpresa.SQL.Clear;
  qryEmpresa.SQL.Add( 'SELECT * FROM TEMPRESAS' );
  qryEmpresa.Open();
end;

procedure TdmCadastros.carregaFunc;
begin
  qryFuncionarios.Close;
  qryFuncionarios.SQL.Clear;
  qryFuncionarios.SQL.Add(' SELECT * FROM TFUNCIONARIOS');
  qryFuncionarios.Open;
end;

procedure TdmCadastros.carregaPessoas;
begin
  qryPessoas.Close;
  qryPessoas.SQL.Clear;
  qryPessoas.SQL.Add( 'SELECT * FROM TPESSOAS' );
  qryPessoas.Open();
end;

procedure TdmCadastros.deletaEmp;
begin
  qryEmpresa.Close;
  qryEmpresa.SQL.Clear;
  qryEmpresa.SQL.Add(' delete from tEMPRESAS where id_EMPRESA = :id_EMPRESA');
end;

procedure TdmCadastros.deletaFunc;
begin
  qryFuncionarios.Close;
  qryFuncionarios.SQL.Clear;
  qryFuncionarios.SQL.Add(' delete from tfuncionarios where id_funcionario = :id_funcionario');
end;

procedure TdmCadastros.deletaPessoas;
begin
  qryPessoas.Close;
  qryPessoas.SQL.Clear;
  qryPessoas.SQL.Add(' delete from tpessoas where id_pessoa = :id_pessoa');
end;

procedure TdmCadastros.gravaEmpr;
begin
 qryEmpresa.Close;
 qryEmpresa.SQL.Clear;
 qryEmpresa.SQL.Add('   INSERT INTO TEMPRESAS (NOM_RAZAO,   NOM_FANTASIA, CNPJ, IE)   '    );
 qryEmpresa.SQL.Add('                  VALUES (:NOM_RAZAO,  :NOM_FANTASIA, :CNPJ, :IE)'  );
end;

procedure TdmCadastros.gravaFunc;
begin
 qryFuncionarios.Close;
 qryFuncionarios.SQL.Clear;
 qryFuncionarios.SQL.Add('   INSERT INTO TFUNCIONARIOS (NOM_FUNCIONARIO,     DATA_CADASTRO, ID_ENDERECOP, SALARIO, SEXO, DATA_NASC) '    );
 qryFuncionarios.SQL.Add('                      VALUES (:NOM_FUNCIONARIO,  :DATA_CADASTRO, :ID_ENDERECOP, :SALARIO, :SEXO, :DATA_NASC)'  );
end;

procedure TdmCadastros.gravaPessoas;
begin
 qryPessoas.Close;
 qryPessoas.SQL.Clear;
 qryPessoas.SQL.Add('   INSERT INTO TPESSOAS (ID_PESSOA, NOM_PESSOA, IDADE, DATA_NASC,   DATA_CADASTRO, ID_ENDERECOP) '    );
 qryPessoas.SQL.Add('                 VALUES (:ID_PESSOA, :NOM_PESSOA, :IDADE, :DATA_NASC, :DATA_CADASTRO, :ID_ENDERECOP)'  );
end;

end.
