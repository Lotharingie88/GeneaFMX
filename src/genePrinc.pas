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
    edLog: TEdit;
    edMdp: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    btInscrip: TButton;
    edNom: TEdit;
    edPren: TEdit;
    edPseudo: TEdit;
    edMel: TEdit;
    EdPmdp: TEdit;
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
var
  nb,id : integer;
  pseu,prof : string;
begin
    if (edLog.Text<>'') and (edMdp.Text<>'') then
    begin
      datamodule1.FDQuerGene.SQL.Clear;
      datamodule1.FDQuerGene.SQL.text:= 'select count(*) as nb from utilisateur where pseudo= :nom and pwd= :mdp';
      datamodule1.FDQuerGene.ParamByName('nom').asString:=edLog.Text;
      datamodule1.FDQuerGene.ParamByName('mdp').asString:=edMdp.Text;
      datamodule1.FDQuerGene.open;
      nb:= datamodule1.FDQuerGene.FieldByName('nb').asInteger;
      datamodule1.FDQuerGene.close;
      datamodule1.FDQuerGene.SQL.Clear;
      if nb=1 then
          begin
            datamodule1.FDQuerGene.SQL.Clear;
            datamodule1.FDQuerGene.SQL.text:= 'select iduser,pseudo,b.profil from utilisateur as a left join profil as b on a.cprofil=b.cprofil where pseudo= :nom and pwd= :mdp';
            datamodule1.FDQuerGene.ParamByName('nom').asString:=edLog.Text;
            datamodule1.FDQuerGene.ParamByName('mdp').asString:=edMdp.Text;
            datamodule1.FDQuerGene.open;
            id:= datamodule1.FDQuerGene.FieldByName('iduser').asInteger;
            pseu:= datamodule1.FDQuerGene.FieldByName('pseudo').asString;
            prof:= datamodule1.FDQuerGene.FieldByName('profil').asString;
            datamodule1.FDQuerGene.close;
            datamodule1.FDQuerGene.SQL.Clear;
             if prof='ADMIN' then
                begin
                    pconnect.Visible:=false;
                    menArbr.Enabled:=true;
                    menCons.Enabled:=true;
                    menGlob.Enabled:=true;
                    menMaj.Enabled:=true;
                    menSais.Enabled:=true;

                end;
              if prof='UTILISATEUR' then
                begin
                       pconnect.Visible:=false;
                       menArbr.Enabled:=true;
                        menCons.Enabled:=true;
                        menGlob.Enabled:=true;
                        menMaj.Enabled:=false;
                        menSais.Enabled:=false;

                end;
          end;


    end;

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
