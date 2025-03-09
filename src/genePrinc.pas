unit genePrinc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Menus,UdbGenea;

type
  TGeneaPrinc = class(TForm)
    Layout1: TLayout;
    MenuBar1: TMenuBar;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    Button1: TButton;
    btQuit: TButton;
    menFich: TMenuItem;
    menEdit: TMenuItem;
    menGlob: TMenuItem;
    menArbr: TMenuItem;
    menFen: TMenuItem;
    MenSais: TMenuItem;
    menCons: TMenuItem;
    menMaj: TMenuItem;
    menQuit: TMenuItem;
    menPrint: TMenuItem;
    menOuv: TMenuItem;
    procedure btQuitClick(Sender: TObject);
    procedure menQuitClick(Sender: TObject);
    procedure MenSaisClick(Sender: TObject);
    procedure menMajClick(Sender: TObject);
    procedure menGlobClick(Sender: TObject);
    procedure menArbrClick(Sender: TObject);
    procedure menConsClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  GeneaPrinc: TGeneaPrinc;

implementation

{$R *.fmx}
 uses
  Saisie,Maj,Global,Arbre,Consult;
procedure TGeneaPrinc.btQuitClick(Sender: TObject);
begin
  close();
end;

procedure TGeneaPrinc.menArbrClick(Sender: TObject);
begin
  farbre.show;
end;

procedure TGeneaPrinc.menConsClick(Sender: TObject);
begin
  fcons.Show;
end;

procedure TGeneaPrinc.menGlobClick(Sender: TObject);
begin
  fglobal.show;
end;

procedure TGeneaPrinc.menMajClick(Sender: TObject);
begin
  fmaj.show;
end;

procedure TGeneaPrinc.menQuitClick(Sender: TObject);
begin
  close();
end;

procedure TGeneaPrinc.MenSaisClick(Sender: TObject);
begin
  fsaisie.show;
end;

end.
