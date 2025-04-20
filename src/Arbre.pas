unit Arbre;

interface

uses
  System.SysUtils, System.Types,system.Math, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,UdbGenea,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts,system.DateUtils, FMX.Edit,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.Objects;

type
  TFArbre = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    btCreate: TButton;
    btQuit: TButton;
    edInd0: TEdit;
    sbArbre: TScrollBox;
    Label1: TLabel;
    lbNiv: TLabel;
    edNivo: TEdit;
    Memo1: TMemo;
    Line1: TLine;
    procedure btQuitClick(Sender: TObject);
    procedure btCreateClick(Sender: TObject);
    procedure edInd0Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FArbre: TFArbre;

implementation

{$R *.fmx}
  uses
    choix2;
  var
    IndPers,iP,iM : string;
    Indind:integer;
    datmaj:string;
    ed: tedit;
    memi:tmemo;
procedure TFArbre.btCreateClick(Sender: TObject);
   var
	individu :String;
     p:Integer;
begin
    edInd0.Text:='';
    edNivo.text:='';
     for p:=(Componentcount-1) downto 0 do
          	begin
                    //MessageDlg ('j : '+ Componentcount.ToString ,mtInformation,[mbOK],0);
            		if (Components[p] is TEdit)  and
                    	( TEdit(Components[p]).Name <> 'edInd0') and ( TEdit(Components[p]).Name <> 'edNivo') then
                     	begin
                          Components[p].free;
                      		//Components[p].DisposeOf;
                     	end
                         else
                     if (Components[p] is TLabel) and (components[p].Name <> 'LbNiv')  then
                      begin
                         Components[p].free;
                         //Components[p].DisposeOf;
                      end;
                     if (Components[p] is TMemo)   then
                      begin
                         //Components[p];
                         Components[p].Free;
                         //Components[p].DisposeOf;
                      end;
               end;

     Fchoix.Caption:='Arbre';
     Fchoix.lbchoix.Text:='Arbre';
     //fchoix.Layout1.Height:=249;
     //fchoix.Layout1.Width:=499;
     //fchoix.height:=250;
     //fchoix.Width:=500;
//      datamodule1.fdQuerChoix.Active:=False;
//      datamodule1.fdQuerChoix.SQL.clear;
//      datamodule1.fdQuerChoix.SQL.Text:= 'SELECT idperson,nom,prenom,datnaiss FROM personnes order by nom,prenom';
//      datamodule1.fdQuerChoix.Open;
//      datamodule1.fdQuerChoix.Active:=True;
//      fchoix.cbDebArbre.selected.Text:='';
//      fchoix.cbDebArbre.Items.Clear();
//          fchoix.cbDebArbre.ItemIndex := 0;
//          fchoix.cbDebArbre.Items.Add('');
//          datamodule1.fdQuerChoix.first;
//      	while not datamodule1.fdQuerChoix.Eof do
//          begin
//               IndPers := datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
//               individu :=  datamodule1.fdQuerChoix.FieldByName('nom').AsString + ' ' + datamodule1.fdQuerChoix.FieldByName('prenom').AsString + ' -'+datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
//               //fchoix.cbDebArbre.AddItem(individu,TObject(StrtoInt(IndPers)));
//               datamodule1.fdQuerChoix.Next;
//       	end;

 //       	fchoix.cbDebArbre.selected.Text:='';
//        	datamodule1.fdQuerChoix.Active:=False;
     	    //fchoix.cbDebArbre.Visible:=True;
          fchoix.lbNom.Visible:=false;
          fchoix.lbPren.visible:=false;
     	    fchoix.sgChoix.Visible:=False;
          fchoix.btNew.Visible:=False;
     	    Fchoix.LbMsg.Visible:=False;
          Fchoix.lbNiv.Visible:=True;
          Fchoix.edNiv.Visible:=True;
          Fchoix.RdChoix.Visible:=false;
          fchoix.cbDebArbre.Repaint;
          Fchoix.cbdebarbre.Visible:=True;
          //fchoix.Show;
     	    fchoix.ShowModal;
end;

procedure TFArbre.btQuitClick(Sender: TObject);
begin
  farbre.close;
end;

procedure TFArbre.edInd0Change(Sender: TObject);
  var a,b,i,j,n,m,r,t,w,v,l,tr,nbi,haut,interv,centre,largeEd,hautEd :Integer ;
	k :single;
  indiv: array  of array of integer;
begin
    t:= edNivo.text.ToInteger();
   interv:=10;
   largeEd:=150;
   hautEd:=40;
   w:= round(single(Power(2,t))) *(largeEd+interv);
    //sbArbre.Width :=w;
    sbArbre.Width :=FArbre.Width - 96;
    sbArbre.Height :=FArbre.Height - 210;
   nbi:=round((2*power(2,t))-1);

 setlength(indiv,nbi,4);


 if (edInd0.Text<>'') and (edInd0.Text<>'0') then
 	begin
       IndInd:= edInd0.Text.ToInteger();
        	datamodule1.fdQuerArbr.close;
      	  datamodule1.fdQuerArbr.SQL.clear;
      	  datamodule1.fdQuerArbr.SQL.Text:= 'SELECT idperson,idper,idmer,nom,prenom,datdec,datnaiss FROM personnes where idperson=:IndPers';
          datamodule1.fdQuerArbr.ParamByName('IndPers').AsInteger := Indind;
      	  datamodule1.fdQuerArbr.Open;
          l:=0;
          a:=0;
          b:=0;
       for i :=0  to (nbi-1) do
          begin
               if i=0 then
               begin
                  indiv[i,0]:=i ;
                  indiv[i,1]:=datamodule1.fdQuerArbr.FieldByName('idperson').AsInteger ;
                  indiv[i,2]:=datamodule1.fdQuerArbr.FieldByName('idPer').AsInteger ;
                  indiv[i,3]:=datamodule1.fdQuerArbr.FieldByName('idMer').AsInteger ;
               end
            else
            begin
                 if (i mod 2 =0) then
                  begin
                  datamodule1.fdQuerArbrPlus.close;
                  datamodule1.fdQuerArbrPlus.SQL.clear;
                  datamodule1.fdQuerArbrPlus.SQL.Text:= 'SELECT idperson,idper,idmer FROM personnes where idperson=:IndPers';
                  datamodule1.fdQuerArbrPlus.ParamByName('IndPers').AsInteger := indiv[i-2-b,3];
                  datamodule1.fdQuerArbrPlus.Open;
                  b:=b+1;
                  end
                  else
                  if (i mod 2 =1) then
                  begin
                   datamodule1.fdQuerArbrPlus.close;
                   datamodule1.fdQuerArbrPlus.SQL.clear;
                   datamodule1.fdQuerArbrPlus.SQL.Text:= 'SELECT idperson,idper,idmer FROM personnes where idperson=:IndPers';
                   datamodule1.fdQuerArbrPlus.ParamByName('IndPers').AsInteger := indiv[i-1-a,2];
                   datamodule1.fdQuerArbrPlus.Open;
                   a:=a+1;
                  end;
              indiv[i,0]:=i ;
              indiv[i,1]:=datamodule1.fdQuerArbrPlus.FieldByName('idperson').AsInteger ;
              indiv[i,2]:=datamodule1.fdQuerArbrPlus.FieldByName('idPer').AsInteger ;
              indiv[i,3]:=datamodule1.fdQuerArbrPlus.FieldByName('idMer').AsInteger ;

            end;

            //writeln(indiv[i,0]);
            //MessageDlg ('indiv : '+ indiv[i,0].ToString+ indiv[i,1].ToString+ indiv[i,2].ToString+ indiv[i,3].ToString ,mtInformation,[mbOK],0);
          end;
          haut:=8;
          centre:=round(w/2) ;

          for i:=0  to t-1 do
              begin
                  k:=single(Power(2,i));
                  r:= round(single((Power(2,i)/ 2)));

                  m:= round(k);
                  n:=0;

          	    for j := 1 to m do
                	begin
                	    v:= round(j /2);
                	  if (v<>0) then
                        begin
                		      with TLabel.Create(self) do
                             begin
                               Parent := sbArbre;
                               Name:= 'lbAscN'+IntToStr(i)+'_'+IntToStr(j);
                               Visible:=false;
                            end;
                         end ;
                          //with tedit.Create(self) do
                          with tmemo.Create(self) do

                            begin

                            Parent := sbArbre;
                            Width := largeEd;
                            Height:= hautEd;
                            position.y:=haut;
                            textsettings.HorzAlign := ttextalign.Center;
                            textsettings.Font.Size:=10;
                            textsettings.Font.style:=font.style + [tfontstyle.fsBold];
                            //margins.Bottom := 100 ;
                            //margins.Top:=100;
                              if i=0 then
                                begin
                                    position.X := centre-(largeEd div 2);
                                    Name:= 'edAscN'+IntToStr(i)+'_'+IntToStr(j);
                                    Text:= datamodule1.fdQuerArbr.FieldByName('nom').AsString + ' ' + datamodule1.fdQuerArbr.FieldByName('prenom').AsString;

                                    tag := datamodule1.fdQuerArbr.FieldByName('idPer').AsInteger ;
                                    iP:=datamodule1.fdQuerArbr.FieldByName('idPer').AsString;
                                    iM:='0';
                                end
                                else
                                if i=1 then
                                    begin
    //                                 // MessageDlg ('j : '+ j.ToString ,mtInformation,[mbOK],0);
    //
                                       case j of
                                         1:
                                         begin
                                            position.X := centre-( r* largeEd) - (interv div 2);
                                            n:=centre-( r* largeEd) - (interv div 2);

                                             datamodule1.fdQuerArbr.close;
                                             datamodule1.fdQuerArbr.SQL.clear;
                                             datamodule1.fdQuerArbr.SQL.Text:= 'SELECT idper,idmer,nom,prenom FROM personnes where idperson=:iP';
                                             datamodule1.fdQuerArbr.ParamByName('iP').AsInteger := iP.ToInteger;
                                             datamodule1.fdQuerArbr.Active:=True;
                                             datamodule1.fdQuerArbr.Open;
                                             Text:= datamodule1.fdQuerArbr.FieldByName('nom').AsString + ' ' + datamodule1.fdQuerArbr.FieldByName('prenom').AsString;
                                             Tag:=   l;
                                             IndPers:=datamodule1.fdQuerArbr.FieldByName('idPer').AsString ;
                                         end
                                         else
                                             begin
                                                position.X:= (n) + ((j-1)*(largeEd+interv))  ;
                                                Text:= 'test'+ IntToStr(j);
                                                Tag:=   l;
                                             end;
                                      end;
                                       Name:= 'edAscN'+IntToStr(i)+'_'+IntToStr(j);
    //
                                    end
                                     else
                                       if (i>1) and (i<=t) then
                                        begin
                                           case j of
                                             1:
                                               begin
                                                 position.X := centre- (r*(largeEd + interv ));
                                                 n :=centre- (r*(largeEd + interv ));
                                               end
                                                 else position.X := (n) + ((j-1)* (largeEd+interv) )+(interv div 2) ;
                                               end;
                                               Name:= 'edAscN'+IntToStr(i)+'_'+IntToStr(j);
                                               Text:= 'test'+ IntToStr(j);
                                               Tag:=   l;
                                        end;
                              for tr :=0  to (nbi-1) do
                                   begin
                                     if l=tr then
                                        begin
                                           datamodule1.fdQuerArbrPlus.close;
                                           datamodule1.fdQuerArbrPlus.SQL.clear;
                                           datamodule1.fdQuerArbrPlus.SQL.Text:= 'SELECT nom,prenom,datdec as Dec,datnaiss as Naiss FROM personnes where idperson=:IndPers';
                                           datamodule1.fdQuerArbrPlus.ParamByName('IndPers').AsInteger := indiv[tr,1];
                                           datamodule1.fdQuerArbrPlus.Open;
                                           if (datamodule1.fdQuerArbrPlus.FieldByName('nom').AsString<>'') and (datamodule1.fdQuerArbrPlus.FieldByName('prenom').AsString<>'') then

                                           Text:=datamodule1.fdQuerArbrPlus.FieldByName('nom').AsString + ' ' + datamodule1.fdQuerArbrPlus.FieldByName('prenom').AsString + ' (' + YearOf(datamodule1.fdQuerArbrPlus.FieldByName('Naiss').AsDateTime).ToString + '-'+YearOf(datamodule1.fdQuerArbrPlus.FieldByName('Dec').AsDateTime).ToString  + ')'
                                              else
                                              text:='';
                                         end;
                             end;
                              datamodule1.fdQuerArbrPlus.close;
                        end;
//                         //MessageDlg ('l : '+ l.ToString,mtInformation,[mbOK],0);
                           l:=l+1;
              end;
                      haut:=haut+40;

  end;

  end;


          datamodule1.fdQuerArbr.close;



end;

procedure TFArbre.FormShow(Sender: TObject);
  var
    p:integer;
begin
    edNivo.text:=fchoix.edNiv.text;
    for p:=(Componentcount-1) downto 0 do
          	begin
                    //MessageDlg ('j : '+ Componentcount.ToString ,mtInformation,[mbOK],0);
            		if (Components[p] is TEdit)  and
                    	( TEdit(Components[p]).Name <> 'edInd0') and ( TEdit(Components[p]).Name <> 'edNivo') then
                     	begin
                          Components[p].free;
                      		//Components[p].DisposeOf;
                     	end
                         else
                     if (Components[p] is TLabel) and (components[p].Name <> 'LbNiv')  then
                      begin
                          Components[p].free;
                         //Components[p].DisposeOf;
                      end;
                     if (Components[p] is TMemo)   then
                      begin
                          Components[p].free;
                         //Components[p].DisposeOf;
                      end;
               end;
end;

end.
