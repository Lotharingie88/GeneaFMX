unit Choix2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, FMX.Edit, FMX.ListBox,udbgenea, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope;

type
  TFChoix = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    btQuit: TButton;
    btValid: TButton;
    btNew: TButton;
    rdChoix: TRadioButton;
    cbDebArbre: TComboBox;
    edNiv: TEdit;
    sgChoix: TStringGrid;
    lbChoix: TLabel;
    lbMsg: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    lbNiv: TLabel;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure btQuitClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FChoix: TFChoix;

implementation

{$R *.fmx}
  uses
   arbre,saisie;

procedure TFChoix.btQuitClick(Sender: TObject);
begin
  Fchoix.Close;
end;

end.
