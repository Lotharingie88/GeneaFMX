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
    lbSelect: TLabel;
    Label4: TLabel;
    lbNiv: TLabel;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    procedure btQuitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btValidClick(Sender: TObject);
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
   arbre,saisie,maj;
 var
  j:integer;
  IndPers,idNom:string;
procedure TFChoix.btNewClick(Sender: TObject);
begin
  if lbChoix.Text='Saisie' then
	begin
    if Fchoix.Caption = 'Homonymie de la Personne' then
       	begin
         		Fsaisie.lbInd.text:=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
           begin
         		Fsaisie.lbEpo.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
        else
       if Fchoix.Caption = 'Homonymie pour le Père' then
           begin
         		Fsaisie.lbPer.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'Homonymie pour la Mère' then
          begin
         		Fsaisie.lbMer.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
           begin
         		Fsaisie.lbEpo.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end;
       //Fchoix.close;
  end
     else
     if lbChoix.text='MAJ' then
     begin

      if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)' then
           begin
         		Fmaj.lbEpMaj.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
        else
       if Fchoix.Caption = 'MAJ-Homonymie pour le Père' then
           begin
         		Fmaj.lbPMaj.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'MAJ-Homonymie pour la Mère' then
          begin
         		Fmaj.lbMMaj.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)2' then
           begin
         		Fmaj.lbEp2Maj.text :=  '-1';
            lbSelect.text:='-1';
            Fchoix.Close;
          end;


       //Fchoix.close;


     end;
end;

procedure TFChoix.btQuitClick(Sender: TObject);
begin
  Fchoix.Close;
end;

procedure TFChoix.btValidClick(Sender: TObject);
  var
    idnom:string;
begin
   if lbChoix.text='Saisie' then
   	begin
       //if dbgChoix.SelectedRows.Count >0 then


             //for i := 0 to dbgChoix.SelectedRows.Count -1 do
               // begin
                	//Nom:=dbgChoix.SelectedField.AsString;
                  //Nom:=dbgChoix.Fields[0].AsString ;
                  //idNom:=dbgChoix.DataSource.DataSet.Fields.Fields[0].AsInteger;
                //end;
             //ShowMessage ('IdNom :' + idNom.ToString);
        //i:=sgChoix.Selection.Top ;
        i:=sgChoix.TopRow;
       idNom:=sgChoix.Cells[0,i];
       //motif := Fchoix.Caption;
       //switch( motif)
       //{
          //case 'Homonymie de la Personne' :  Fsaisie.lbInd.Caption:=  idNom;
            //  break;
          //default:
                 // break;
        //}
       //end;
       if Fchoix.Caption = 'Homonymie de la Personne' then
       	begin
         		Fsaisie.lbInd.text:=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
           begin
         		Fsaisie.lbEpo.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour le Père' then
           begin
         		Fsaisie.lbPer.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour la Mère' then
          begin
         		Fsaisie.lbMer.text :=  idNom;
             Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
           begin
         		Fsaisie.lbEpo2.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end;


       //close;
     end
     else
     if lbChoix.text='MAJ' then
     begin
       //i:=sgChoix.Selection.Top ;
       i:=sgChoix.TopRow;

       idNom:=sgChoix.Cells[0,i];

       if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)' then
           begin
         		Fmaj.lbEpMaj.text :=  idNom;
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end
        else
       if Fchoix.Caption = 'MAJ-Homonymie pour le Père' then
           begin
         		Fmaj.lbPMaj.text :=  idNom;
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end
       else
       if Fchoix.Caption = 'MAJ-Homonymie pour la Mère' then
          begin
            //ShowMessage ('IdNom :' + idNom);
         		Fmaj.lbMMaj.text :=  idNom;
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end
        else
        if Fchoix.Caption = 'MAJ-Homonymie pour l Epoux(se)2' then
           begin
         		Fmaj.lbEp2Maj.text :=  idNom;
            //lbSelect.Caption:=idnom;
            Fchoix.Close;
          end;



     end
     else
     if lbChoix.text='Arbre' then
     begin
             Individu := cbDebArbre.Text;
             //idNom := cbDebArbre.Items.Objects[cbDebArbre.ItemIndex];

	           Farbre.edInd0.Text:= idnom;
             Fchoix.Close;
     end;
end;

procedure TFChoix.FormActivate(Sender: TObject);

begin
  if Fchoix.lbChoix.Text='Saisie' then
    begin
      if Fchoix.Caption = 'Homonymie de la Personne' then
       	begin
         		Fsaisie.lbInd.text:=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
           begin
         		Fsaisie.lbEpo.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour le Père' then
           begin
         		Fsaisie.lbPer.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour la Mère' then
          begin
         		Fsaisie.lbMer.text :=  idNom;
             Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
           begin
         		Fsaisie.lbEpo2.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end;
      datamodule1.fdQuerChoix.close;
      datamodule1.fdQuerChoix.SQL.clear;
      datamodule1.fdQuerChoix.SQL.add( 'SELECT idperson,nom,prenom,if(datnaiss="0000/00/00", "",DATE_FORMAT(datnaiss,"%d/%m/%Y")) as Naissance FROM personnes where nom= :Nom and prenom = :Prenom');
      datamodule1.fdQuerChoix.ParamByName('Nom').AsString := UpperCase(Fsaisie.EdNMer.Text);
      datamodule1.fdQuerChoix.ParamByName('Prenom').AsString := UpperCase(Fsaisie.EdPMer.Text);
      datamodule1.fdQuerChoix.Open;
      datamodule1.fdQuerChoix.first;
      j:=0;
      while not datamodule1.fdQuerChoix.Eof do
      begin
//
//                     //IndPers := Fchoix.ReqChoix.FieldByName('idperson').AsString;
        Fchoix.sgChoix.cells[0,j]:=  datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
        Fchoix.sgChoix.cells[1,j]:=   datamodule1.fdQuerChoix.FieldByName('nom').AsString ;
        Fchoix.sgChoix.cells[2,j]:=  datamodule1.fdQuerChoix.FieldByName('prenom').AsString;
        Fchoix.sgChoix.cells[3,j]:=  datamodule1.fdQuerChoix.FieldByName('Naissance').AsString;
        j:=j+1;
        datamodule1.fdQuerChoix.Next;
      end;
    end;
    if Fchoix.lbChoix.Text='Maj' then
    begin
        if Fchoix.Caption = 'Homonymie de la Personne' then
       	begin
         		Fsaisie.lbInd.text:=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)' then
           begin
         		Fsaisie.lbEpo.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour le Père' then
           begin
         		Fsaisie.lbPer.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
       else
       if Fchoix.Caption = 'Homonymie pour la Mère' then
          begin
         		Fsaisie.lbMer.text :=  idNom;
             Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end
        else
       if Fchoix.Caption = 'Homonymie pour l Epoux(se)2' then
           begin
         		Fsaisie.lbEpo2.text :=  idNom;
            Fchoix.Close;
            //lbSelect.Caption:=idnom;
          end;
    end;
   if Fchoix.lbChoix.Text='Arbre' then
    begin
        datamodule1.fdQuerChoix.close;
        datamodule1.fdQuerChoix.SQL.clear;
        datamodule1.fdQuerChoix.SQL.Text:= 'SELECT idperson,nom,prenom,datnaiss FROM personnes order by nom,prenom';
        datamodule1.fdQuerChoix.Open;
//        datamodule1.fdQuerChoix.Active:=True;
        //cbDebArbre.selected.Text:='';
        cbDebArbre.Items.Clear();
        cbDebArbre.ItemIndex := 0;
        cbDebArbre.Items.Add('');
        datamodule1.fdQuerChoix.first;
      	while not datamodule1.fdQuerChoix.Eof do
          begin
//               IndPers := datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
//               individu :=  datamodule1.fdQuerChoix.FieldByName('nom').AsString + ' ' + datamodule1.fdQuerChoix.FieldByName('prenom').AsString + ' -'+datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
//               //fchoix.cbDebArbre.AddItem(individu,TObject(StrtoInt(IndPers)));
               datamodule1.fdQuerChoix.Next;
       	  end;
        	cbDebArbre.selected.Text:='';

    end;
end;

end.
