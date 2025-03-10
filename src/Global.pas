unit Global;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,UdbGenea,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, Data.Bind.Controls,
  Fmx.Bind.Navigator;

type
  TFGlobal = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    btDet: TButton;
    btQuit: TButton;
    dbgGenea2: TGrid;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    NavigatorBindSourceDB1: TBindNavigator;
    procedure btQuitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FGlobal: TFGlobal;

implementation

{$R *.fmx}
   var
    datmaj:string;
procedure TFGlobal.btQuitClick(Sender: TObject);
begin
    fglobal.hide;
end;

procedure TFGlobal.FormShow(Sender: TObject);
begin
          datamodule1.fdQuerGlob.close;
          datamodule1.fdQuerGlob.SQL.Clear;
          datamodule1.fdQuerGlob.SQL.Text:= 'SELECT idperson as "Rèf.",nom,prenom,if(datnaiss="0000/00/00", "",datnaiss) as Naissance,if(datdec="0000/00/00","",datdec) as Décès,'
          +'lieunaiss as "Lieu de naissance",lieudec as "Lieu de décès",idper as "Père",idmer as "Mère",idepou as "Epoux(se)",idepoubis as "Epoux(se)2"'
          + ' FROM personnes order by datnaiss desc ' ;
          //ReqGlob.ParamByName('NomMer').AsString := UpperCase(NomMer);
          //ReqGlob.ParamByName('PrenomMer').AsString := UpperCase(PrenomMer);
          datamodule1.fdQuerGlob.Open;


          //datamodule1.fdQuerGlob.FieldByName('nom').AsString;
//          dbgGenea.Columns[0].Width:=40;
//          dbgGenea.Columns[1].Width:=150;
//          dbgGenea.Columns[2].Width:=150;
//          dbgGenea.Columns[3].Width:=75;
//          dbgGenea.Columns[4].Width:=75;
//          dbgGenea.Columns[5].Width:=135;
//          dbgGenea.Columns[6].Width:=130;
//          dbgGenea.Columns[7].Width:=40;
//          dbgGenea.Columns[8].Width:=40;
//          dbgGenea.Columns[9].Width:=55;
//          dbgGenea.Columns[10].Width:=60;
          //dbgGenea.Update;
          //dbgGenea.BeginUpdate;
          datamodule1.fdQuerGlob.FieldByName('nom').AsString;
            dbgGenea2.Columns[0].Width:=40;
          dbgGenea2.Columns[1].Width:=150;
          dbgGenea2.Columns[2].Width:=150;
          dbgGenea2.Columns[3].Width:=75;
          dbgGenea2.Columns[4].Width:=75;
          dbgGenea2.Columns[5].Width:=135;
          dbgGenea2.Columns[6].Width:=130;
          dbgGenea2.Columns[7].Width:=40;
          dbgGenea2.Columns[8].Width:=40;
          dbgGenea2.Columns[9].Width:=55;
          dbgGenea2.Columns[10].Width:=60;

          dbgGenea2.Repaint;


end;

end.
