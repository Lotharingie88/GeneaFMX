program GeneaFM;

uses
  System.StartUpCopy,
  FMX.Forms,
  genePrinc in 'genePrinc.pas' {Form1},
  UdbGenea in 'UdbGenea.pas' {DataModule1: TDataModule},
  Saisie in 'Saisie.pas' {FSaisie},
  Arbre in 'Arbre.pas' {FArbre},
  Global in 'Global.pas' {FGlobal},
  Maj in 'Maj.pas' {FMaj},
  Consult in 'Consult.pas' {FCons},
  Choix2 in 'Choix2.pas' {FChoix},
  geneFMaprop in 'geneFMaprop.pas' {FAprop},
  infGene in 'infGene.pas' {FinfGen};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TGeneaPrinc, GeneaPrinc);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFSaisie, FSaisie);
  Application.CreateForm(TFArbre, FArbre);
  Application.CreateForm(TFGlobal, FGlobal);
  Application.CreateForm(TFMaj, FMaj);
  Application.CreateForm(TFCons, FCons);
  Application.CreateForm(TFChoix, FChoix);
  Application.CreateForm(TFAprop, FAprop);
  Application.CreateForm(TFinfGen, FinfGen);
  Application.Run;
end.
