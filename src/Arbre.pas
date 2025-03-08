unit Arbre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,UdbGenea,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts;

type
  TFArbre = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    btCreate: TButton;
    btQuit: TButton;
    procedure btQuitClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FArbre: TFArbre;

implementation

{$R *.fmx}
   var
    datmaj:string;
procedure TFArbre.btQuitClick(Sender: TObject);
begin
  farbre.hide;
end;

end.
