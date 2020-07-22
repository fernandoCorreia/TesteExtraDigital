unit uCadastro;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Winapi.Windows, Winapi.Messages;

  //classe de pessoas
type
  tCadastroPessoa = class
    private
      fNome : string;
      fIdade: integer;
      fDataNasc : TDate;
      fDataCad : TDate;
      fIdEnd : integer;
      function getNome: string;
      function getIdade: Integer;
      function getDataNasc: TDate;
      function getDataCad: TDate;
      function getIdEnd: Integer;

      procedure setNome(const Value: String);
      procedure setIdade(const Value: Integer);
      procedure setDataNasc(const Value: TDate);
      procedure setDataCad(const Value: TDate);
      procedure setIdEnd(const Value: Integer);

    public
      procedure carregaPessoas();
      procedure gravaPessoas();
      procedure deletaPessoas(id_pessoa : integer);
      procedure alteraPessoas(id_pessoa: integer; nom_pessoa : string; data_nasc : TDate; idade: integer; id_end: integer );
      function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
      property Nome:String read GetNome write SetNome;
      property Idade:Integer read GetIdade write SetIdade;
      property DataNasc:TDate read GetDataNasc write SetDataNasc;
      property DataCad:TDate read GetDataCad write SetDataCad;
      property IdEnd:Integer read GetIdEnd write SetIdEnd;
      constructor create();
      destructor Destroy(); override;
end;

//Classe de funcionários
{os elementos em comuns com a classe de funcionários poderiam ter sido herdados da classe pessoa
 tcadastroFunc = class(tCadastroPessoa)}
type
   tCadastroFunc = class
    private
      fNome : string;
      fSexo: string;
      fDataNasc : TDate;
      fDataCad : TDate;
      fIdEnd : integer;
      fSalario : Double;
      function getNome: string;
      function getSexo: String;
      function getDataNasc: TDate;
      function getDataCad: TDate;
      function getIdEnd: Integer;
      function getSalario: double;

      procedure setNome(const Value: String);
      procedure setSexo(const Value: String);
      procedure setDataNasc(const Value: TDate);
      procedure setDataCad(const Value: TDate);
      procedure setIdEnd(const Value: Integer);
      procedure setSalario(const Value: double);

    public
      procedure carregaFunc();
      procedure gravaFunc();
      procedure deletaFunc(id_Func : integer);
      procedure alteraFunc(id_Func: integer; nom_Func : string; data_nasc : TDate; sexo: string; salario: Double; id_end: integer );
      function QueryInterface(const IID: TGUID; out Obj): HRESULT; stdcall;
      property Nome:String read GetNome write SetNome;
      property Sexo:String read GetSexo write SetSexo;
      property DataNasc:TDate read GetDataNasc write SetDataNasc;
      property DataCad:TDate read GetDataCad write SetDataCad;
      property IdEnd:Integer read GetIdEnd write SetIdEnd;
      property Salario:double read GetSalario write SetSalario;
      constructor create();
      destructor Destroy(); override;
end;

Type
  tCadastroEmpresa = class
    private
      fNomeRazao : string;
      fNomeFantasia: string;
      fCnpj : string ;
      fIe : string;
      function getNomeRazao: string;
      function getNomeFantasia: String;
      function getCnpj: string;
      function getIe: string;

      procedure setNomeRazao(const Value: String);
      procedure setNomeFantasia(const Value: String);
      procedure setCnpj(const Value: String);
      procedure setIe(const Value: String);

    public
      procedure carregaEmp();
      procedure gravaEmp();
      procedure deletaEmp(id_Emp : integer);
      procedure alteraEmp(id_Emp: integer; nom_Razao : string; nom_Fantasia: string; Cnpj: string; IE:string);
      property NomeFantasia:String read getNomeFantasia write setNomeFantasia;
      property NomeRazao:string read getNomeRazao write setNomeRazao;
      property Cnpj:String read getCnpj write setCnpj;
      property Ie:string read getIe write setIe;
      constructor create();
      destructor Destroy(); override;

  end;

implementation

uses
 uDmPrincipal, uDmCadastro;

{ tCadastroPessoa }

procedure tCadastroPessoa.alteraPessoas(id_pessoa: integer; nom_pessoa: string;
  data_nasc: TDate; idade, id_end: integer);
begin
  if not dmPrincipal.Transacao.Active then
   dmPrincipal.Transacao.StartTransaction;

  dmcadastros.alteraPessoas();
  dmCadastros.qryPessoas.ParamByName( 'id_pessoa'  ).AsInteger := id_pessoa;
  dmCadastros.qryPessoas.ParamByName( 'nom_pessoa' ).AsString  := nom_pessoa;
  dmCadastros.qryPessoas.ParamByName( 'data_nasc'  ).AsDate    := data_nasc;
  dmCadastros.qryPessoas.ParamByName( 'idade'      ).AsInteger := idade;
  dmCadastros.qryPessoas.ParamByName( 'id_end'     ).AsInteger := id_end;

  dmCadastros.qryPessoas.ExecSQL();
  dmPrincipal.Transacao.CommitRetaining;
end;

procedure tCadastroPessoa.carregaPessoas;
begin
  dmCadastros.carregaPessoas;
end;

constructor tCadastroPessoa.create;
begin
  //não faz nada
end;


procedure tCadastroPessoa.deletaPessoas(id_pessoa: integer);
begin
  if not dmPrincipal.Transacao.Active then
    dmPrincipal.Transacao.StartTransaction;

  dmCadastros.deletaPessoas();
  dmCadastros.qryPessoas.ParamByName('id_pessoa').Value := id_pessoa;
  dmCadastros.qryPessoas.ExecSQL();
  dmPrincipal.Transacao.CommitRetaining;
end;

destructor tCadastroPessoa.Destroy;
begin

  inherited;
end;

function tCadastroPessoa.getDataCad: TDate;
begin
  Result := fDataCad;
end;

function tCadastroPessoa.getDataNasc: TDate;
begin
  Result := fDataNasc;
end;

function tCadastroPessoa.getIdade: Integer;
begin
  Result := fIdade;
end;

function tCadastroPessoa.getIdEnd: Integer;
begin
  result := fIdEnd;
end;

function tCadastroPessoa.getNome: string;
begin
  result := fNome;
end;

procedure tCadastroPessoa.gravaPessoas;
begin
  if not dmPrincipal.Transacao.Active then
    dmPrincipal.Transacao.StartTransaction;
  try
    dmCadastros.gravaPessoas();
    dmCadastros.qryPessoas.ParamByName( 'NOM_PESSOA'    ).AsString   := getNome;
    dmCadastros.qryPessoas.ParamByName( 'IDADE'         ).AsInteger  := getIdade;
    dmCadastros.qryPessoas.ParamByName( 'DATA_NASC'     ).AsDate     := getDataNasc;
    dmCadastros.qryPessoas.ParamByName( 'DATA_CADASTRO' ).AsDate     := getDataCad;
    dmCadastros.qryPessoas.ParamByName( 'ID_ENDERECOP'  ).AsInteger  := getIdEnd;
    dmCadastros.qryPessoas.ExecSQL;

    dmPrincipal.Transacao.CommitRetaining;
  Except
    dmPrincipal.Transacao.RollbackRetaining;
    raise
  end;
end;

function tCadastroPessoa.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin
 //
end;

procedure tCadastroPessoa.setDataCad(const Value: TDate);
begin
 fDataCad := Value;
end;

procedure tCadastroPessoa.setDataNasc(const Value: TDate);
begin
  fDataNasc := Value;
end;

procedure tCadastroPessoa.setIdade(const Value: Integer);
begin
  fIdade := Value;
end;

procedure tCadastroPessoa.setIdEnd(const Value: Integer);
begin
  fIdEnd := Value;
end;

procedure tCadastroPessoa.setNome(const Value: String);
begin
  fNome := Value;
end;

{ tCadastroFunc }

procedure tCadastroFunc.alteraFunc(id_Func: integer; nom_Func: string;
  data_nasc: TDate; sexo: string; salario: Double; id_end: integer);
begin
  if not dmPrincipal.Transacao.Active then
   dmPrincipal.Transacao.StartTransaction;

  dmcadastros.alteraFunc();
  dmCadastros.qryFuncionarios.ParamByName( 'id_funcionario'  ).AsInteger := id_Func;
  dmCadastros.qryFuncionarios.ParamByName( 'nom_funcionario' ).AsString  := nom_Func;
  dmCadastros.qryFuncionarios.ParamByName( 'data_nasc'       ).AsDate    := data_nasc;
  dmCadastros.qryFuncionarios.ParamByName( 'sexo'            ).AsString  := sexo;
  dmCadastros.qryFuncionarios.ParamByName( 'salario'         ).AsFloat   := salario;
  dmCadastros.qryFuncionarios.ParamByName( 'id_end'          ).AsInteger := id_end;

  dmCadastros.qryFuncionarios.ExecSQL();
  dmPrincipal.Transacao.CommitRetaining;
end;

procedure tCadastroFunc.carregaFunc;
begin
  dmCadastros.carregaFunc();
end;

constructor tCadastroFunc.create;
begin
  // não faz nada
end;

procedure tCadastroFunc.deletaFunc(id_Func: integer);
begin
  if not dmPrincipal.Transacao.Active then
    dmPrincipal.Transacao.StartTransaction;

  dmCadastros.deletaFunc();
  dmCadastros.qryFuncionarios.ParamByName('id_funcionario').Value := id_func;
  dmCadastros.qryFuncionarios.ExecSQL();
  dmPrincipal.Transacao.CommitRetaining;
end;

destructor tCadastroFunc.Destroy;
begin

  inherited;
end;

function tCadastroFunc.getDataCad: TDate;
begin
  result := fDataCad;
end;

function tCadastroFunc.getDataNasc: TDate;
begin
  result := fdataNasc;
end;

function tCadastroFunc.getIdEnd: Integer;
begin
  result :=  fIdEnd;
end;

function tCadastroFunc.getNome: string;
begin
  result :=  fNome;
end;

function tCadastroFunc.getSalario: double;
begin
  result := fSalario;
end;

function tCadastroFunc.getSexo: String;
begin
  result := fSexo;
end;

procedure tCadastroFunc.gravaFunc;
begin
  if not dmPrincipal.Transacao.Active then
    dmPrincipal.Transacao.StartTransaction;
  try
    dmCadastros.gravaFunc();
    dmCadastros.qryFuncionarios.ParamByName( 'NOM_funcionario' ).AsString  := getNome;
    dmCadastros.qryFuncionarios.ParamByName( 'sexo'            ).AsString  := getSexo;
    dmCadastros.qryFuncionarios.ParamByName( 'salario'         ).AsFloat   := getSalario;
    dmCadastros.qryFuncionarios.ParamByName( 'DATA_NASC'       ).AsDate    := getDataNasc;
    dmCadastros.qryFuncionarios.ParamByName( 'DATA_CADASTRO'   ).AsDate    := getDataCad;
    dmCadastros.qryFuncionarios.ParamByName( 'ID_ENDERECOP'    ).AsInteger := getIdEnd;
    dmCadastros.qryFuncionarios.ExecSQL;

    dmPrincipal.Transacao.CommitRetaining;
  Except
    dmPrincipal.Transacao.RollbackRetaining;
    raise
  end;
end;

function tCadastroFunc.QueryInterface(const IID: TGUID; out Obj): HRESULT;
begin

end;

procedure tCadastroFunc.setDataCad(const Value: TDate);
begin
  fdataCad := value;
end;

procedure tCadastroFunc.setDataNasc(const Value: TDate);
begin
  fDataNAsc := value;
end;

procedure tCadastroFunc.setIdEnd(const Value: Integer);
begin
  fIdEnd := value;
end;

procedure tCadastroFunc.setNome(const Value: String);
begin
  fNome := value;
end;

procedure tCadastroFunc.setSalario(const Value: double);
begin
  fSalario := value;
end;

procedure tCadastroFunc.setSexo(const Value: String);
begin
 fSexo := value;
end;

{ tCadastroEmpresa }

procedure tCadastroEmpresa.alteraEmp(id_Emp: integer; nom_Razao: string;
  nom_Fantasia:string; Cnpj, IE: string);
begin
  if not dmPrincipal.Transacao.Active then
   dmPrincipal.Transacao.StartTransaction;

  dmcadastros.alteraEmp();
  dmCadastros.qryEmpresa.ParamByName( 'id_empresa'   ).AsInteger := id_Emp;
  dmCadastros.qryEmpresa.ParamByName( 'nom_razao'    ).AsString  := nom_Razao;
  dmCadastros.qryEmpresa.ParamByName( 'nom_fantasia' ).AsString  := nom_Fantasia;
  dmCadastros.qryEmpresa.ParamByName( 'cnpj'         ).AsString  := cnpj;
  dmCadastros.qryEmpresa.ParamByName( 'ie'           ).AsString  := ie;

  dmCadastros.qryEmpresa.ExecSQL();
  dmPrincipal.Transacao.CommitRetaining;

end;

procedure tCadastroEmpresa.carregaEmp;
begin
  dmCadastros.carregaEmp();
end;

constructor tCadastroEmpresa.create;
begin
  // não faz nada
end;

procedure tCadastroEmpresa.deletaEmp(id_Emp: integer);
begin
  if not dmPrincipal.Transacao.Active then
    dmPrincipal.Transacao.StartTransaction;

  dmCadastros.deletaEmp();
  dmCadastros.qryEmpresa.ParamByName('id_empresa').Value := id_Emp;
  dmCadastros.qryEmpresa.ExecSQL();
  dmPrincipal.Transacao.CommitRetaining;
end;

destructor tCadastroEmpresa.Destroy;
begin

  inherited;
end;

function tCadastroEmpresa.getCnpj: string;
begin
  Result := fCnpj
end;

function tCadastroEmpresa.getIe: string;
begin
  Result :=  fIe;
end;

function tCadastroEmpresa.getNomeFantasia: String;
begin
  Result := fNomeFantasia;
end;

function tCadastroEmpresa.getNomeRazao: string;
begin
  Result := fNomeRazao;
end;

procedure tCadastroEmpresa.gravaEmp;
begin
  if not dmPrincipal.Transacao.Active then
    dmPrincipal.Transacao.StartTransaction;
  try
    dmCadastros.gravaEmpr();
    dmCadastros.qryEmpresa.ParamByName( 'NOM_Razao'     ).AsString  := getNomeRazao;
    dmCadastros.qryEmpresa.ParamByName( 'nom_fantasia'  ).AsString  := getNomeFantasia;
    dmCadastros.qryEmpresa.ParamByName( 'cnpj'          ).AsString  := getCnpj;
    dmCadastros.qryEmpresa.ParamByName( 'IE'            ).AsString  := getIe;
    dmCadastros.qryEmpresa.ExecSQL;

    dmPrincipal.Transacao.CommitRetaining;
  Except
    dmPrincipal.Transacao.RollbackRetaining;
    raise
  end;

end;

procedure tCadastroEmpresa.setCnpj(const Value: String);
begin
  fCnpj := value;
end;

procedure tCadastroEmpresa.setIe(const Value: String);
begin
  fIe := Value;
end;

procedure tCadastroEmpresa.setNomeFantasia(const Value: String);
begin
  fNomeFantasia := Value;
end;

procedure tCadastroEmpresa.setNomeRazao(const Value: String);
begin
  fNomeRazao := value;
end;

end.
