unit uDmPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB,
  FireDAC.Phys.ODBCDef, FireDAC.Phys.ODBCBase, FireDAC.Phys.ODBC,
  FireDAC.Phys.IBBase;

type
  TdmPrincipal = class(TDataModule)
    Conexao: TFDConnection;
    Transacao: TFDTransaction;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
