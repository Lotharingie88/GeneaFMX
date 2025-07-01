unit genePrinc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Menus,UdbGenea, FMX.Edit;

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
    menHelp: TMenuItem;
    menAbout: TMenuItem;
    menGuid: TMenuItem;
    pConnect: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btConnec: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btInscrip: TButton;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    procedure btQuitClick(Sender: TObject);
    procedure menQuitClick(Sender: TObject);
    procedure MenSaisClick(Sender: TObject);
    procedure menMajClick(Sender: TObject);
    procedure menGlobClick(Sender: TObject);
    procedure menArbrClick(Sender: TObject);
    procedure menConsClick(Sender: TObject);
    procedure menAboutClick(Sender: TObject);
    procedure btConnecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  Saisie,Maj,Global,Arbre,Consult,geneFMaprop;
procedure TGeneaPrinc.btConnecClick(Sender: TObject);
begin
    pconnect.Visible:=false;
    menArbr.Enabled:=true;
    menCons.Enabled:=true;
    menGlob.Enabled:=true;
    menMaj.Enabled:=true;
    menSais.Enabled:=true;

end;

procedure TGeneaPrinc.btQuitClick(Sender: TObject);
begin
  close();
end;

procedure TGeneaPrinc.FormCreate(Sender: TObject);
begin
    menArbr.Enabled:=false;
    menCons.Enabled:=False;
    menGlob.Enabled:=False;
    menMaj.Enabled:=False;
    menSais.Enabled:=False;
    pConnect.Visible:=true;
end;

procedure TGeneaPrinc.menAboutClick(Sender: TObject);
begin
  fAprop.Show;
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
