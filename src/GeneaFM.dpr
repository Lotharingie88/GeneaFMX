program GeneaFM;

uses
  System.StartUpCopy,
  FMX.Forms,
  genePrinc in 'genePrinc.pas' {Form1},
  UdbGenea in 'UdbGenea.pas' {DataModule1: TDataModule},
  Saisie in 'Saisie.pas' {FSaisie},
  Arbre in 'Arbre.pas' {FArbre},
  Global in 'Global.pas' {FGlobal},
  Maj in 'Maj.pas' {FMaj};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGeneaPrinc, GeneaPrinc);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFSaisie, FSaisie);
  Application.CreateForm(TFArbre, FArbre);
  Application.CreateForm(TFGlobal, FGlobal);
  Application.CreateForm(TFMaj, FMaj);
  Application.Run;
end.
