
unit EditSCOrderFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCOrderController ;

type
  TfrmSCOrderFilterEdit = class(TDialogForm)

    lblMolCode : TLabel;
    edtMolCode: TEdit;

    lblPodrCode : TLabel;
    edtPodrCode: TEdit;

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblScCode : TLabel;
    edtScCode: TEdit;



  HTTPRIOSCOrder: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmSCOrderFilterEdit: TfrmSCOrderFilterEdit;
  SCOrderFilterObj: SCOrderFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, SCOrderController  ;
}
{$R *.dfm}



procedure TfrmSCOrderFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMolCode
      ,edtPodrCode
      ,edtCountGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtMolCode.Text := SCOrderObj.molCode; 



    edtPodrCode.Text := SCOrderObj.podrCode; 



    if ( SCOrderObj.countGen <> Low(Integer) ) then
       edtCountGen.Text := IntToStr(SCOrderObj.countGen)
    else
       edtCountGen.Text := '';



    if ( SCOrderObj.scCode <> Low(Integer) ) then
       edtScCode.Text := IntToStr(SCOrderObj.scCode)
    else
       edtScCode.Text := '';


  end;

}

end;



procedure TfrmSCOrderFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCOrder: SCOrderControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     SCOrderFilterObj.molCode := edtMolCode.Text; 



     SCOrderFilterObj.podrCode := edtPodrCode.Text; 



     if ( edtCountGen.Text <> '' ) then
       SCOrderFilterObj.countGen := StrToInt(edtCountGen.Text)
     else
       SCOrderFilterObj.countGen := Low(Integer) ;




     if ( edtScCode.Text <> '' ) then
       SCOrderFilterObj.scCode := StrToInt(edtScCode.Text)
     else
       SCOrderFilterObj.scCode := Low(Integer) ;





  end;
end;




end.