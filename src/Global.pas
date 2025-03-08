unit Global;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,UdbGenea,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid;

type
  TFGlobal = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    btDet: TButton;
    btQuit: TButton;
    StringGrid1: TStringGrid;
    procedure btQuitClick(Sender: TObject);
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

end.
