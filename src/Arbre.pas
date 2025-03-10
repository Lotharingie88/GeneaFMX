unit Arbre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,UdbGenea,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.Edit;

type
  TFArbre = class(TForm)
    Layout1: TLayout;
    ToolBar1: TToolBar;
    btCreate: TButton;
    btQuit: TButton;
    edInd0: TEdit;
    procedure btQuitClick(Sender: TObject);
    procedure btCreateClick(Sender: TObject);
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
    datmaj:string;
procedure TFArbre.btCreateClick(Sender: TObject);
   var
	individu :String;
     i:Integer;
begin
    edInd0.Text:='';
     for i:=(Componentcount-1) downto 0 do
          	begin
                    //MessageDlg ('j : '+ Componentcount.ToString ,mtInformation,[mbOK],0);
            		if (Components[i] is TEdit)  and
                    	( TEdit(Components[i]).Name <> 'edInd0') then
                     	begin
                      		TEdit(Components[i]).parent:=nil;
                      		TEdit(Components[i]).Free;
                     	end
                         else
                     if (Components[i] is TLabel)  then
                         TLabel(Components[i]).Free;
               end;

     Fchoix.Caption:='Arbre';
     Fchoix.lbchoix.Text:='Arbre';
     fchoix.height:=250;
     fchoix.Width:=500;
      datamodule1.fdQuerChoix.Active:=False;
      datamodule1.fdQuerChoix.SQL.clear;
      datamodule1.fdQuerChoix.SQL.Text:= 'SELECT idperson,nom,prenom,datnaiss FROM personnes order by nom,prenom';
      datamodule1.fdQuerChoix.Open;
      datamodule1.fdQuerChoix.Active:=True;
      fchoix.cbDebArbre.selected.Text:='';
      fchoix.cbDebArbre.Items.Clear();
          fchoix.cbDebArbre.ItemIndex := 0;
          fchoix.cbDebArbre.Items.Add('');
          datamodule1.fdQuerChoix.first;
      	while not datamodule1.fdQuerChoix.Eof do
          begin
               IndPers := datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
               individu :=  datamodule1.fdQuerChoix.FieldByName('nom').AsString + ' ' + datamodule1.fdQuerChoix.FieldByName('prenom').AsString + ' -'+datamodule1.fdQuerChoix.FieldByName('idperson').AsString;
               //fchoix.cbDebArbre.AddItem(individu,TObject(StrtoInt(IndPers)));
               datamodule1.fdQuerChoix.Next;
       	end;

        	fchoix.cbDebArbre.selected.Text:='';
        	datamodule1.fdQuerChoix.Active:=False;
     	    fchoix.cbDebArbre.Visible:=True;
     	    fchoix.sgChoix.Visible:=False;
          fchoix.btNew.Visible:=False;
     	    Fchoix.LbMsg.Visible:=False;
          Fchoix.lbNiv.Visible:=True;
          Fchoix.edNiv.Visible:=True;
          Fchoix.RdChoix.Visible:=false;
          fchoix.Show;
     	    //fchoix.ShowModal;
end;

procedure TFArbre.btQuitClick(Sender: TObject);
begin
  farbre.hide;
end;

end.
