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
    btQuit: TButton;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    NavigatorBindSourceDB1: TBindNavigator;
    sgGenea1: TStringGrid;
    LinkGridToDataSourceBindSourceDB12: TLinkGridToDataSource;
    procedure btQuitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgGenea1CellClick(const Column: TColumn; const Row: Integer);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FGlobal: TFGlobal;

implementation

{$R *.fmx}
  uses
      infGene;
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
          + ' FROM personnes order by nom,prenom,datnaiss desc ' ;
          
          datamodule1.fdQuerGlob.Open;



          datamodule1.fdQuerGlob.FieldByName('nom').AsString;
          sgGenea1.Columns[0].Width:=40;
          sgGenea1.Columns[1].Width:=150;
          sgGenea1.Columns[2].Width:=150;
          sgGenea1.Columns[3].Width:=75;
          sgGenea1.Columns[4].Width:=75;
          sgGenea1.Columns[5].Width:=135;
          sgGenea1.Columns[6].Width:=130;
          sgGenea1.Columns[7].Width:=40;
          sgGenea1.Columns[8].Width:=40;
          sgGenea1.Columns[9].Width:=55;
          sgGenea1.Columns[10].Width:=60;

          sgGenea1.Repaint;


end;

procedure TFGlobal.sgGenea1CellClick(const Column: TColumn; const Row: Integer);
var
    idnom,t:string;
begin
     idNom:=sgGenea1.selected.ToString();
    if idnom.ToInteger()<>0 then
        begin
          t:=sgGenea1.Cells[0,idnom.ToInteger()];
          Finfgen.edNom.Visible:=true;


          Finfgen.Show;
        end
       else
        t:='0';
   ShowMessage ('IdNom :' + t );
end;
end.
