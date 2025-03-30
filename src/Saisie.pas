unit Saisie;

interface

uses
  Winapi.Windows, Winapi.Messages,System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Memo.Types, FMX.ListBox, FMX.Edit,
  FMX.ScrollBox, FMX.Memo,UdbGenea, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  System.Rtti,Firedac.stan.Param, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope,FMX.Platform;

type
  TFSaisie = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    btRec: TButton;
    btQuit: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Memo: TMemo;
    Label21: TLabel;
    lbInd: TLabel;
    edNom: TEdit;
    edPren: TEdit;
    edPren2: TEdit;
    edDNaiss: TEdit;
    edLNaiss: TEdit;
    edDDEC: TEdit;
    edLDec: TEdit;
    edDMaria: TEdit;
    edNEpou: TEdit;
    edPEpou: TEdit;
    edD2Maria: TEdit;
    edN2Epo: TEdit;
    edP2Epo: TEdit;
    edPPer: TEdit;
    edNPer: TEdit;
    edNMer: TEdit;
    edPMer: TEdit;
    cbDNaiss: TComboBox;
    cbPNaiss: TComboBox;
    cbDDec: TComboBox;
    cbPDec: TComboBox;
    edPren3: TEdit;
    Label23: TLabel;
    Panel1: TPanel;
    Label24: TLabel;
    lbEpo: TLabel;
    lbPer: TLabel;
    lbMer: TLabel;
    lbEpo2: TLabel;
    lbMaj: TLabel;
    procedure btQuitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btRecClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FSaisie: TFSaisie;

implementation

{$R *.fmx}
  uses
    Choix2;
 var
    datmaj:string;
procedure TFSaisie.btQuitClick(Sender: TObject);
begin
  Fsaisie.hide;
end;

procedure TFSaisie.btRecClick(Sender: TObject);
  var Nom, Prenom,NomPer,PrenomPer,NomMer,PrenomMer,NomEp,PrenomEp,Dnaiss,Dmar,Dmar2,PEpo2,NEpo2,Lnaiss,Ddec,Ldec,Pren2,Pren3,Datmaj : string;
 		idInd,idPer,idMer,IdNnaiss,IdNdec,IdDnaiss,IdDdec,IdEpo,IdEpo2,Total,nbP,nbM,nbEp,nbEp2,i,j : Integer;
begin
  Datmaj := DateToStr(Date);
    // test sur qualité des saisies
    //champs vide
    //MessageDlg ('ok',mtInformation,[mbOK],0);
    if (EdNom.Text='') or (EdPren.Text='' ) then
       raise Exception.Create('Des champs obligatoires sont vides');
//    		//saisie trop longue
    if Length(EdNom.Text)>20 then
       raise Exception.Create('Des Champs trop long !');
//
     Nom := Ednom.Text;
     Prenom := EdPren.Text;
     NomPer := EdNPer.Text;
     PrenomPer := EdPPer.Text;
     NomMer := EdNMer.Text;
     PrenomMer := EdPMer.Text;
     PrenomEp := edPEpou.Text;
     NomEp := edNEpou.Text;
     Dmar := EdDMaria.Text;
     Dnaiss := EdDNaiss.Text;
     Ddec := EdDDec.Text;
     Lnaiss := EdLNaiss.Text;
     Ldec := EdLDec.Text;
     Pren2 := EdPren2.Text;
     Pren3 := EdPren3.Text;
     Dmar2:=EdD2Maria.Text;
     PEpo2:=EdP2Epo.Text;
     NEpo2:=EdN2Epo.Text;
     if CbDNaiss.text<>'' then
            IdDnaiss:=CbDNaiss.ItemIndex
            else
            IdDnaiss:=0;
     if CbDdec.text<>'' then
            IdDdec:=CbDdec.ItemIndex
            else
            IdDdec:=0;
     if CbPNaiss.text<>'' then
            IdNnaiss:=CbPNaiss.ItemIndex
            else
            IdNnaiss:=0;
     if CbPDec.text<>'' then
            IdNdec:=CbPDec.ItemIndex
           else
            IdNdec:=0;
             IdEpo:=0;
             idInd:=0;
             idEpo2:=0;
     ///<summary>
     ///  controle sur les données : homonymie,....
     ///  </summary>
       //verification d homonymie
     try
         datamodule1.fdQuerSais.close;
         datamodule1.fdQuerSais.SQL.Clear;
         datamodule1.fdQuerSais.SQL.Text := 'SELECT count(*) as nbi,idperson,nom,prenom,datnaiss FROM personnes where nom= :Nom and prenom = :Prenom';
         datamodule1.fdQuerSais.ParamByName('Nom').AsString :=Nom;
         datamodule1.fdQuerSais.ParamByName('Prenom').AsString :=Prenom;
         datamodule1.fdQuerSais.Open;

         Total :=datamodule1.fdQuerSais.FieldByName('nbi').AsInteger;

       if (Total>0) and (lbInd.text='0') then
       	begin
               Fchoix.Caption:='Homonymie de la Personne';
               Fchoix.lbChoix.text:='Saisie';
               Fchoix.lbNom.Text:=edNom.Text ;
               Fchoix.lbPren.Text:=edPren.text ;
           	   Fchoix.RdChoix.Visible := False;
               Fchoix.cbDebArbre.Visible := false;
               Fchoix.lbSelect.Visible := False;
               Fchoix.btValid.Visible:=True;
               Fchoix.btNew.visible:=True;
               Fchoix.btQuit.Visible:=False;
               Fchoix.LbMsg.Text :='il y a déjà des individus avec cette identité';
               Fchoix.lbArbr.Visible:=False;
               Fchoix.lbNiv.Visible:=False;
               Fchoix.edNiv.Visible:=False;
               fchoix.height:=610;
               fchoix.Width:=695;
               Fchoix.Showmodal;
               //lbind.Text:=Fchoix.sgChoix.selected.ToString;
        end;
     except

     end;


     // on gère les parents
      try
       if (EdNPer.Text <>'') then
         begin
           datamodule1.fdQuerSais.close;
           datamodule1.fdQuerSais.SQL.Clear;
           datamodule1.fdQuerSais.SQL.add('SELECT count(*) as NbPer,idperson,nom,prenom,datnaiss FROM personnes where nom= :NomPer and prenom= :PrenomPer');
           datamodule1.fdQuerSais.ParamByName('NomPer').AsString :=UpperCase(NomPer);
           datamodule1.fdQuerSais.ParamByName('PrenomPer').AsString :=UpperCase(PrenomPer);
           datamodule1.fdQuerSais.Open;
           nbP :=datamodule1.fdQuerSais.FieldByName('NbPer').AsInteger;
           datamodule1.fdQuerSais.close;
         if (nbP=0) then
         		begin
                       datamodule1.fdQuerSaisPlus.close;
                       datamodule1.fdQuerSaisPlus.SQL.Clear;
                       datamodule1.fdQuerSaisPlus.SQL.Text := 'INSERT INTO personnes (nom, prenom,datmaj) '+
                        'VALUES (:Nom, :Prenom,:Datmaj)';
                       datamodule1.fdQuerSaisPlus.ParamByName('Nom').AsString := UpperCase(NomPer);
                       datamodule1.fdQuerSaisPlus.ParamByName('Prenom').AsString := UpperCase(PrenomPer);
                       datamodule1.fdQuerSaisPlus.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
                       datamodule1.fdQuerSaisPlus.ExecSQL;
                       datamodule1.fdQuerSaisPlus.close;
         		end
               else
               if (nbP>0) then
               begin
                             Fchoix.Caption:='Homonymie pour le Père';
                             Fchoix.lbChoix.Text:='Saisie';
                             Fchoix.RdChoix.Visible := False;
                             Fchoix.cbDebArbre.Visible := false;
                             Fchoix.lbSelect.Visible := False;
                             Fchoix.btValid.Visible:=True;
                             Fchoix.btNew.visible:=True;
                             Fchoix.btQuit.Visible:=False;
                             Fchoix.lbNom.Text:=edNPer.Text ;
                             Fchoix.lbPren.Text:=edPPer.text ;
                             Fchoix.LbMsg.Text :='il y a déjà des individus avec cette identité';
                             Fchoix.lbArbr.Visible:=False;
                             Fchoix.lbNiv.Visible:=False;
                             Fchoix.edNiv.Visible:=False;
                             fchoix.height:=610;
                             fchoix.Width:=695;
                             Fchoix.ShowModal;
               end;
         end;
      except
      end;

      try
       if (EdNMer.Text <>'') then
         begin
           datamodule1.fdQuerSais.close;
           datamodule1.fdQuerSais.SQL.Clear;
           datamodule1.fdQuerSais.SQL.add ('SELECT count(*) as NbMer,idperson,nom,prenom,if(datnaiss="0000/00/00", "",datnaiss) as Naissance FROM personnes where nom= :NomMer and prenom= :PrenomMer');
           datamodule1.fdQuerSais.ParamByName('NomMer').AsString :=UpperCase(NomMer);
           datamodule1.fdQuerSais.ParamByName('PrenomMer').AsString :=UpperCase(PrenomMer);
           datamodule1.fdQuerSais.Open;
           nbM :=datamodule1.fdQuerSais.FieldByName('NbMer').AsInteger;
            if (nbM=0) then
         		begin
                    datamodule1.fdQuerSaisPlus.close;
                    datamodule1.fdQuerSaisPlus.SQL.Clear;
                    datamodule1.fdQuerSaisPlus.SQL.Text := 'INSERT INTO personnes (nom, prenom,datmaj) '+
                      'VALUES (:Nom, :Prenom,:Datmaj)';
                    datamodule1.fdQuerSaisPlus.ParamByName('Nom').AsString :=UpperCase(NomMer);
                    datamodule1.fdQuerSaisPlus.ParamByName('Prenom').AsString := UpperCase(PrenomMer);
                    datamodule1.fdQuerSaisPlus.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
                    datamodule1.fdQuerSaisPlus.ExecSQL;
                    datamodule1.fdQuerSaisPlus.close;
         		end
               else
               if (nbM>0) then
               begin
                             Fchoix.Caption:='Homonymie pour la Mère';
                             Fchoix.lbChoix.Text:='Saisie';
                             Fchoix.RdChoix.Visible := False;
                             Fchoix.cbDebArbre.Visible := false;
                             Fchoix.lbSelect.Visible := False;
                             Fchoix.lbNom.Text:=edNMer.Text ;
                             Fchoix.lbPren.Text:=edPMer.text ;
                             Fchoix.btValid.Visible:=True;
                             Fchoix.btNew.visible:=True;
                             Fchoix.btQuit.Visible:=False;
                             Fchoix.LbMsg.Text :='il y a déjà des individus avec cette identité';
                               Fchoix.lbNiv.Visible:=False;
                               Fchoix.edNiv.Visible:=False;
                               fchoix.height:=610;
                               fchoix.Width:=695;
                               Fchoix.ShowModal;
               end;
         end;
     except
     end;
     //.... et l epoux s il y a lieu !
     try
      if (EdNEpou.Text <>'') then
        begin
           datamodule1.fdQuerSais.close;

           datamodule1.fdQuerSais.SQL.Clear;
           datamodule1.fdQuerSais.SQL.add('SELECT count(*) as NbEp,idperson,nom,prenom,if(datnaiss="0000/00/00", "",datnaiss) as Naissance FROM personnes where nom= :NomEp and prenom= :PrenomEp');
           datamodule1.fdQuerSais.ParamByName('NomEp').AsString :=UpperCase(NomEp);
           datamodule1.fdQuerSais.ParamByName('PrenomEp').AsString :=UpperCase(PrenomEp);

           datamodule1.fdQuerSais.Open;
           nbEp :=datamodule1.fdQuerSais.FieldByName('NbEp').AsInteger;

         if (nbEp=0) then
         		begin
                       datamodule1.fdQuerSais.close;
                       datamodule1.fdQuerSais.SQL.Clear;
                       datamodule1.fdQuerSais.SQL.Text := 'INSERT INTO personnes (nom, prenom,datmaj) '+
                        'VALUES (:Nom, :Prenom,:Datmaj)';
                       datamodule1.fdQuerSais.ParamByName('Nom').AsString := UpperCase(NomEp);
                       datamodule1.fdQuerSais.ParamByName('Prenom').AsString := UpperCase(PrenomEp);
                       datamodule1.fdQuerSais.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
                       datamodule1.fdQuerSais.ExecSQL;
                       datamodule1.fdQuerSais.close;

         		end
               else
               if (nbEp>0) then
               begin
                             Fchoix.Caption:='Homonymie pour l Epoux(se)';
                             Fchoix.lbChoix.Text:='Saisie';
                             Fchoix.RdChoix.Visible := False;
                             Fchoix.cbDebArbre.Visible := false;
                             Fchoix.lbSelect.Visible := False;
                             Fchoix.lbNom.Text:=edNEpou.Text ;
                             Fchoix.lbPren.Text:=edPEpou.text ;
                             Fchoix.btValid.Visible:=True;
                             Fchoix.btNew.visible:=True;
                             Fchoix.btQuit.Visible:=False;
                             Fchoix.LbMsg.text :='il y a déjà des individus avec cette identité';
                             Fchoix.lbNiv.Visible:=False;
                             Fchoix.edNiv.Visible:=False;
                             fchoix.height:=610;
                             fchoix.Width:=695;
                             Fchoix.ShowModal;
               end;
         end;
      except

      end;
      //et l epoux2 s'il y a eu second mariage
     try
      if (EdN2Epo.Text <>'') then
         begin
             datamodule1.fdQuerSais.close;
             datamodule1.fdQuerSais.SQL.Clear;
             datamodule1.fdQuerSais.SQL.add('SELECT count(*) as NbEp2,idperson,nom,prenom,if(datnaiss="0000/00/00", "",DATE_FORMAT(datnaiss,"%d/%m/%Y")) as Naissance FROM personnes where nom= :NomEp2 and prenom= :PrenomEp2');
             datamodule1.fdQuerSais.ParamByName('NomEp2').AsString :=UpperCase(NEpo2);
             datamodule1.fdQuerSais.ParamByName('PrenomEp2').AsString :=UpperCase(PEpo2);
             datamodule1.fdQuerSais.Open;
             NbEp2 :=datamodule1.fdQuerSais.FieldByName('NbEp2').AsInteger;
             datamodule1.fdQuerSais.close;
         if (NbEp2=0) then
         		begin
                       datamodule1.fdQuerSais.close;
                       datamodule1.fdQuerSais.SQL.Clear;
                       datamodule1.fdQuerSais.SQL.Text := 'INSERT INTO personnes (nom, prenom,datmaj) '+
                        'VALUES (:Nom, :Prenom,:Datmaj)';
                       datamodule1.fdQuerSais.ParamByName('Nom').AsString := UpperCase(NEpo2);
                       datamodule1.fdQuerSais.ParamByName('Prenom').AsString := UpperCase(PEpo2);
                       datamodule1.fdQuerSais.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
                       datamodule1.fdQuerSais.ExecSQL;
                       datamodule1.fdQuerSais.close;

         		end
               else
               if (NbEp2>0) then
               begin
                             Fchoix.Caption:='Homonymie pour l Epoux(se)2';
                             Fchoix.lbChoix.text:='Saisie';
                             Fchoix.RdChoix.Visible := False;
                             Fchoix.cbDebArbre.Visible := false;
                             Fchoix.lbSelect.Visible := False;
                             Fchoix.lbNom.Text:=edN2Epo.Text ;
                             Fchoix.lbPren.Text:=edP2Epo.text ;
                             Fchoix.btValid.Visible:=True;
                             Fchoix.btNew.visible:=True;
                             Fchoix.btQuit.Visible:=False;
                             Fchoix.LbMsg.text :='il y a déjà des individus avec cette identité';

                               	  Fchoix.sgChoix.Visible:=True;
                                   Fchoix.lbNiv.Visible:=False;
                                   Fchoix.edNiv.Visible:=False;
                               	   fchoix.height:=610;
                              	   fchoix.Width:=695;
                               	   Fchoix.ShowModal;
               end;
         end;
      except
     end;


    // on démarre l implementation dans la base de donnée
     try
     	try
              if (EdNEpou.Text <>'') and ((lbEpo.text='-1') or (lbEpo.text='0')) then
                 begin
                   datamodule1.fdQuerSais.close;
                   datamodule1.fdQuerSais.SQL.Clear;
                   datamodule1.fdQuerSais.SQL.add('SELECT idperson FROM personnes where nom= :NomEp and prenom= :PrenomEp');
                   datamodule1.fdQuerSais.ParamByName('NomEp').AsString :=UpperCase(NomEp);
                   datamodule1.fdQuerSais.ParamByName('PrenomEp').AsString :=UpperCase(PrenomEp);
                   datamodule1.fdQuerSais.Open;
                   IdEpo :=datamodule1.fdQuerSais.FieldByName('idperson').AsInteger;
                   datamodule1.fdQuerSais.close;

                 end
               else
                 if (lbEpo.text<>'0') and (lbEpo.text<>'-1') then
                   begin
                      IdEpo := StrToInt(lbEpo.text) ;
                   end
                   else
                   begin
                      IdEpo :=0;
                   end;
          	if (EdN2Epo.Text <>'') and ((lbEpo2.text='-1') or (lbEpo2.text='0')) then
                 begin
                   datamodule1.fdQuerSais.close;

                   datamodule1.fdQuerSais.SQL.Clear;
                   datamodule1.fdQuerSais.SQL.add('SELECT idperson FROM personnes where nom= :NomEp and prenom= :PrenomEp');
                   datamodule1.fdQuerSais.ParamByName('NomEp').AsString :=UpperCase(NEpo2);
                   datamodule1.fdQuerSais.ParamByName('PrenomEp').AsString :=UpperCase(PEpo2);

                   datamodule1.fdQuerSais.Open;
                   IdEpo2 :=datamodule1.fdQuerSais.FieldByName('idperson').AsInteger;
                   datamodule1.fdQuerSais.close;

                 end
               else
               	if (lbEpo2.text<>'0') and (lbEpo2.text<>'-1') then
                     begin
                        IdEpo2 := StrToInt(lbEpo.text) ;
                     end
                     else
                     begin
                        IdEpo2 :=0;
                     end;
              if (EdNPer.Text <>'') and ((lbPer.text='-1') or (lbPer.text='0')) then
                 begin
                   datamodule1.fdQuerSais.close;

                   datamodule1.fdQuerSais.SQL.Clear;
                   datamodule1.fdQuerSais.SQL.add('SELECT idperson FROM personnes where nom= :NomPer and prenom= :PrenomPer');
                   datamodule1.fdQuerSais.ParamByName('NomPer').AsString :=UpperCase(NomPer);
                   datamodule1.fdQuerSais.ParamByName('PrenomPer').AsString :=UpperCase(PrenomPer);

                   datamodule1.fdQuerSais.Open;
                   IdPer :=datamodule1.fdQuerSais.FieldByName('idperson').AsInteger;
                   datamodule1.fdQuerSais.close;
                 end
                  else
               if (lbPer.text<>'0') and (lbPer.text<>'-1') then
                 begin
                  IdPer := StrToInt(lbPer.text) ;
                 end
               else
                 begin
                 	IdPer :=0;
                 end;
               if (EdNMer.Text <>'') and ((lbMer.text='-1') or (lbMer.text='0')) then
                 begin
                   datamodule1.fdQuerSais.close;

                   datamodule1.fdQuerSais.SQL.Clear;
                   datamodule1.fdQuerSais.SQL.add('SELECT idperson FROM personnes where nom= :NomMer and prenom= :PrenomMer');
                   datamodule1.fdQuerSais.ParamByName('NomMer').AsString :=UpperCase(NomMer);
                   datamodule1.fdQuerSais.ParamByName('PrenomMer').AsString :=UpperCase(PrenomMer);

                   datamodule1.fdQuerSais.Open;
                   IdMer :=datamodule1.fdQuerSais.FieldByName('idperson').AsInteger;
                   datamodule1.fdQuerSais.close;
                 end
                 else
               if (lbMer.text<>'0') and (lbMer.text<>'-1') then
                 begin
                  IdMer := StrToInt(lbMer.text) ;
                 end
               else
                 begin
                 	IdMer :=0;
                 end;
             if (lbInd.text='0') or (lbInd.text='-1') then
              begin
             	with datamodule1.fdQuerSais do
               	begin
                     close;
                     SQL.Clear;
                     SQL.Text := 'INSERT INTO personnes (nom, prenom, datnaiss,datdec,lieunaiss,lieudec,prenom2,prenom3,datmaria,idnatnaiss,idnatdec,iddeptnaiss,iddeptdec,idepou,idepoubis,idper,idmer,memo,datmaj) '+
                      'VALUES (:Nom, :Prenom,:Dnaiss,:Ddec,:Lnaiss,:Ldec,:Pren2,:Pren3,:Dmar,:IdNnaiss,:IdNdec,:IdDnaiss,:IdDdec,:IdEpo,:IdEpo2,:IdPer,:IdMer,:MemI,:Datmaj)';
                     ParamByName('Nom').AsString :=UpperCase(Nom);
                     ParamByName('Prenom').AsString := UpperCase(Prenom);
                     ParamByName('MemI').AsString := Memo.Text;
                     if (EdDnaiss.text <>'') then
                           ParamByName('Dnaiss').AsDate := StrToDate(Dnaiss)
                      else
                           ParamByName('Dnaiss').AsString := '00/00/0000';
                      if (EdDdec.text <>'') then
                           ParamByName('Ddec').AsDate := StrToDate(Ddec)
                      else
                       ParamByName('Ddec').AsString := '00/00/0000';
                       ParamByName('Lnaiss').AsString := UpperCase(Lnaiss);
                       ParamByName('Ldec').AsString := UpperCase(Ldec);
                       ParamByName('Pren2').AsString := UpperCase(Pren2);
                       ParamByName('Pren3').AsString := UpperCase(Pren3);
                      if (EdDMaria.text <>'') then
                           ParamByName('Dmar').AsDate := StrToDate(Dmar)
                       else
                           ParamByName('Dmar').AsString := '00/00/0000';
                           ParamByName('IdNnaiss').AsInteger := IdNnaiss;
                           ParamByName('IdNdec').AsInteger := IdNdec;
                           ParamByName('IdDnaiss').AsInteger := IdDnaiss;
                           ParamByName('IdDdec').AsInteger := IdDdec;
                           ParamByName('IdEpo').AsInteger := IdEpo;
                           ParamByName('IdEpo2').AsInteger := IdEpo2;
                           ParamByName('IdPer').AsInteger := IdPer;
                           ParamByName('IdMer').AsInteger := IdMer;
                           ParamByName('Datmaj').AsDate := StrToDate(Datmaj);
                           ExecSQL;
                           close;
               	end;
               end
               else
               begin


               end;
      except

      end;
        finally
              ShowMessage ('Données insèrées dans la base');
           end;


     	 try
         		if (IdEpo <> 0) then
                 begin
//                   //ShowMessage ('Epoux :'+ IdEpo.ToString);
//                   //MessageDlg ('1',mtInformation,[mbOK],0);
                   datamodule1.fdQuerSais.close;

                   datamodule1.fdQuerSais.SQL.Clear;
                   datamodule1.fdQuerSais.SQL.Text := 'SELECT idperson FROM personnes where idepou=:IdEpo';
                   datamodule1.fdQuerSais.ParamByName('IdEpo').AsInteger := IdEpo;

                   datamodule1.fdQuerSais.Open;
                   idInd := datamodule1.fdQuerSais.FieldByName('idperson').AsInteger;


                    try
                         if (idInd <> 0) then
                         begin
//                           //ShowMessage ('Début Epoux et pers :'+ IdEpo.ToString + idInd.ToString);
                           datamodule1.fdQuerSaisPlus.SQL.Clear;
                           datamodule1.fdQuerSaisPlus.SQL.Text := 'UPDATE  personnes SET idepou=:idInd, datmaj=:Datmaj WHERE idperson=:IdEpo';
                           datamodule1.fdQuerSaisPlus.ParamByName('idInd').AsInteger := idInd;
                           datamodule1.fdQuerSaisPlus.ParamByName('IdEpo').AsInteger := IdEpo;
                           datamodule1.fdQuerSaisPlus.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);

                           datamodule1.fdQuerSaisPlus.ExecSQL;
                       	end;
//
                     except
                     end;
                 end;


                 if (IdEpo2 <> 0) then
                     begin
    //                   //ShowMessage ('Epoux :'+ IdEpo.ToString);
    //                   //MessageDlg ('1',mtInformation,[mbOK],0);
                       datamodule1.fdQuerSais.close;

                       datamodule1.fdQuerSais.SQL.Clear;
                       datamodule1.fdQuerSais.SQL.Text := 'SELECT idperson FROM personnes where idepoubis=:IdEpo2';
                       datamodule1.fdQuerSais.ParamByName('IdEpo2').AsInteger := IdEpo2;
                       datamodule1.fdQuerSais.Open;
                       idInd := datamodule1.fdQuerSais.FieldByName('idperson').AsInteger;
    //
    //
                        try
                             if (idInd <> 0) then
                             begin
    //                           //ShowMessage ('Début Epoux et pers :'+ IdEpo.ToString + idInd.ToString);
                               datamodule1.fdQuerSaisPlus.SQL.Clear;
                               datamodule1.fdQuerSaisPlus.SQL.Text := 'UPDATE  personnes SET idepoubis=:idEpo2, datmaj=:Datmaj WHERE idperson=:IdInd';
                               datamodule1.fdQuerSaisPlus.ParamByName('IdInd').AsInteger := idInd;
                               datamodule1.fdQuerSaisPlus.ParamByName('IdEpo2').AsInteger := IdEpo2;
                               datamodule1.fdQuerSaisPlus.ParamByName('Datmaj').AsDate := StrToDate(Datmaj);

                               datamodule1.fdQuerSaisPlus.ExecSQL;
                            end;
//
                          except
                          end;
                 end;
//
//
               except
               end;



     //finally
       //ShowMessage ('Données insèrées dans la base');


     //end;
      for i := 0 to Componentcount-1 do
         	begin
            		if Components[i] is TEdit  then
                     begin
                        TEdit(Components[i]).Text := '';
                     end;
//               end;
//         for i := 0 to Componentcount-1 do
//          	begin
            		if (Components[i] is TComboBox ) then
                     begin
                       TComboBox(Components[i]).itemindex:=0;
                     end;
//               end;
//           for i := 0 to Componentcount-1 do
//          	begin
            		if (Components[i] is TMemo ) then
                     begin
                       TMemo(Components[i]).Text := '';
                     end;
//               end;
//           for i := 0 to Componentcount-1 do
//          	begin
            		if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbInd') or (TLabel(Components[i]).Name = 'lbEpo') or (TLabel(Components[i]).Name =  'lbEpo2') or (TLabel(Components[i]).Name =  'lbMer') or (TLabel(Components[i]).Name =  'lbPer') )) then
                     begin
                        TLabel(Components[i]).Text:='';
                         if (TLabel(Components[i]).Name = 'lbInd') then
                            TLabel(Components[i]).Text:='0' ;
//
                     end;
          end;
end;

procedure TFSaisie.FormActivate(Sender: TObject);
  var
    i:integer;
begin
//    Datmaj := DateToStr(Date);
//    datamodule1.fdQuerPays.close;
//     datamodule1.fdQuerPays.open;
//     CbPNaiss.Items.Clear();
//     CbPNaiss.Items.Add('');
//     CbPNaiss.ItemIndex := 0;
//     CbPdec.Items.Clear();
//     CbPdec.Items.Add('');
//     CbPdec.ItemIndex := 0;
//  	while not datamodule1.fdQuerPays.Eof do
//       begin
//           CbPNaiss.Items.Add(datamodule1.fdQuerPays.FieldByName('nom').AsString);
//           CbPNaiss.ItemIndex := datamodule1.fdQuerPays.FieldByName('idnation').AsInteger;
//           CbPdec.Items.Add(datamodule1.fdQuerPays.FieldByName('nom').AsString);
//           CbPdec.ItemIndex := datamodule1.fdQuerPays.FieldByName('idnation').AsInteger;
//           //CbPNaiss.AddItem(datamodule1.fdQuerPays.FieldByName('nom').AsString,TObject(datamodule1.fdQuerPays.FieldByName('idnation').AsInteger));
//           //CbPdec.AddItem(datamodule1.fdQuerPays.FieldByName('nom').AsString,TObject(datamodule1.fdQuerPays.FieldByName('idnation').AsInteger));
//           datamodule1.fdQuerPays.Next;
//       end;
//         //CbPNaiss.Selected.Text :='';
////         CbPdec.Selected.Text :='';
//       datamodule1.fdQuerPays.close;
//       datamodule1.fdQuerDept.close;
//       datamodule1.fdQuerDept.open;
//       CbDNaiss.Items.Clear();
//       CbDNaiss.Items.Add('');
//       CbDNaiss.ItemIndex := 0;
//       CbDDec.Items.Clear();
//       CbDDec.Items.Add('');
//       CbDDec.ItemIndex := 0;
//     while not datamodule1.fdQuerDept.Eof do
//       begin
//           CbDNaiss.Items.Add(datamodule1.fdQuerDept.FieldByName('dept').AsString);
//           CbDNaiss.ItemIndex := datamodule1.fdQuerDept.FieldByName('iddept').AsInteger;
//           CbDdec.Items.Add(datamodule1.fdQuerDept.FieldByName('dept').AsString);
//           CbDdec.ItemIndex := datamodule1.fdQuerDept.FieldByName('iddept').AsInteger;
//////           CbDeptNaiss.AddItem(OutRequet.FieldByName('dept').AsString,TObject(OutRequet.FieldByName('iddept').AsInteger));
//////           CbDeptDec.AddItem(OutRequet.FieldByName('dept').AsString,TObject(OutRequet.FieldByName('iddept').AsInteger));
//          datamodule1.fdQuerDept.Next;
//       end;
//        datamodule1.fdQuerDept.close;
////         CbDNaiss.Selected.Text:='';
////         CbDDec.Selected.Text:='';
//    for i := 0 to Componentcount-1 do
//         	begin
//            		if Components[i] is TEdit  then
//                     begin
//                        TEdit(Components[i]).Text := '';
//                     end;
////               end;
////         for i := 0 to Componentcount-1 do
////          	begin
//            		if (Components[i] is TComboBox ) then
//                     begin
//                       TComboBox(Components[i]).itemindex:=0;
//                     end;
////               end;
////           for i := 0 to Componentcount-1 do
////          	begin
//            		if (Components[i] is TMemo ) then
//                     begin
//                       TMemo(Components[i]).Text := '';
//                     end;
////               end;
////           for i := 0 to Componentcount-1 do
////          	begin
//            		if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbInd') or (TLabel(Components[i]).Name = 'lbEpo') or (TLabel(Components[i]).Name =  'lbEpo2') or (TLabel(Components[i]).Name =  'lbMer') or (TLabel(Components[i]).Name =  'lbPer') )) then
//                     begin
//                        TLabel(Components[i]).Text:='';
//                         if (TLabel(Components[i]).Name = 'lbInd') then
//                            TLabel(Components[i]).Text:='0' ;
////
//                     end;
//                if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMaj'))) then
//                  begin
//                     lbMaj.Text:= 'Mise à jour le : ' ;
//                  end;
//          end;

end;

procedure TFSaisie.FormCreate(Sender: TObject);
 var
    i:integer;
begin
    Datmaj := DateToStr(Date);
    datamodule1.fdQuerPays.close;
     datamodule1.fdQuerPays.open;
     CbPNaiss.Items.Clear();
     CbPNaiss.Items.Add('');
     CbPNaiss.ItemIndex := 0;
     CbPdec.Items.Clear();
     CbPdec.Items.Add('');
     CbPdec.ItemIndex := 0;
  	while not datamodule1.fdQuerPays.Eof do
       begin
           CbPNaiss.Items.Add(datamodule1.fdQuerPays.FieldByName('nom').AsString);
           CbPNaiss.ItemIndex := datamodule1.fdQuerPays.FieldByName('idnation').AsInteger;
           CbPdec.Items.Add(datamodule1.fdQuerPays.FieldByName('nom').AsString);
           CbPdec.ItemIndex := datamodule1.fdQuerPays.FieldByName('idnation').AsInteger;

           datamodule1.fdQuerPays.Next;
       end;

       datamodule1.fdQuerPays.close;
       datamodule1.fdQuerDept.close;
       datamodule1.fdQuerDept.open;
       CbDNaiss.Items.Clear();
       CbDNaiss.Items.Add('');
       CbDNaiss.ItemIndex := 0;
       CbDDec.Items.Clear();
       CbDDec.Items.Add('');
       CbDDec.ItemIndex := 0;
     while not datamodule1.fdQuerDept.Eof do
       begin
           CbDNaiss.Items.Add(datamodule1.fdQuerDept.FieldByName('dept').AsString);
           CbDNaiss.ItemIndex := datamodule1.fdQuerDept.FieldByName('iddept').AsInteger;
           CbDdec.Items.Add(datamodule1.fdQuerDept.FieldByName('dept').AsString);
           CbDdec.ItemIndex := datamodule1.fdQuerDept.FieldByName('iddept').AsInteger;

          datamodule1.fdQuerDept.Next;
       end;
        datamodule1.fdQuerDept.close;

    for i := 0 to Componentcount-1 do
         	begin
            		if Components[i] is TEdit  then
                     begin
                        TEdit(Components[i]).Text := '';
                     end;
            		if (Components[i] is TComboBox ) then
                     begin
                       TComboBox(Components[i]).itemindex:=0;
                     end;
            		if (Components[i] is TMemo ) then
                     begin
                       TMemo(Components[i]).Text := '';
                     end;
            		if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbInd') or (TLabel(Components[i]).Name = 'lbEpo') or (TLabel(Components[i]).Name =  'lbEpo2') or (TLabel(Components[i]).Name =  'lbMer') or (TLabel(Components[i]).Name =  'lbPer') )) then
                     begin
                        TLabel(Components[i]).Text:='';
                         if (TLabel(Components[i]).Name = 'lbInd') then
                            TLabel(Components[i]).Text:='0' ;
                     end;
                if (Components[i] is TLabel and ((TLabel(Components[i]).Name = 'lbMaj'))) then
                  begin
                     lbMaj.Text:= 'Mise à jour le : ' ;
                  end;
          end;
end;

end.
