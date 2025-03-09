unit UdbGenea;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDConnecSqLite: TFDConnection;
    FDConnecMysql: TFDConnection;
    FDQuerPays: TFDQuery;
    FDQuerDept: TFDQuery;
    FDQuerNomPren: TFDQuery;
    FDQuerMaj: TFDQuery;
    FDQuerSais: TFDQuery;
    FDQuerGlob: TFDQuery;
    FDQuerArbr: TFDQuery;
    FDQuerMajPlus: TFDQuery;
    FDQuerSais2: TFDQuery;
    FDQuerChoix: TFDQuery;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
