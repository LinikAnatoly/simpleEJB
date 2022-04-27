
unit EditSCUsageInputItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCUsageInputItemController ;

type
  TfrmSCUsageInputItemFilterEdit = class(TDialogForm)

    lblNumberDoc : TLabel;
    edtNumberDoc: TEdit;

    lblNumberInt : TLabel;
    edtNumberInt: TEdit;

    lblCountGen : TLabel;
    edtCountGen: TEdit;

    lblScCode : TLabel;
    edtScCode: TEdit;



  HTTPRIOSCUsageInputItem: THTTPRIO;

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
  frmSCUsageInputItemFilterEdit: TfrmSCUsageInputItemFilterEdit;
  SCUsageInputItemFilterObj: SCUsageInputItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, SCUsageInputItemController  ;
}
{$R *.dfm}



procedure TfrmSCUsageInputItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberDoc
      ,edtNumberInt
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtNumberDoc.Text := SCUsageInputItemObj.numberDoc; 



    if ( SCUsageInputItemObj.numberInt <> Low(Integer) ) then
       edtNumberInt.Text := IntToStr(SCUsageInputItemObj.numberInt)
    else
       edtNumberInt.Text := '';



    if ( SCUsageInputItemObj.countGen <> Low(Integer) ) then
       edtCountGen.Text := IntToStr(SCUsageInputItemObj.countGen)
    else
       edtCountGen.Text := '';



    if ( SCUsageInputItemObj.scCode <> Low(Integer) ) then
       edtScCode.Text := IntToStr(SCUsageInputItemObj.scCode)
    else
       edtScCode.Text := '';


  end;

}

end;



procedure TfrmSCUsageInputItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     SCUsageInputItemFilterObj.numberDoc := edtNumberDoc.Text; 



     if ( edtNumberInt.Text <> '' ) then
       SCUsageInputItemFilterObj.numberInt := StrToInt(edtNumberInt.Text)
     else
       SCUsageInputItemFilterObj.numberInt := Low(Integer) ;




     if ( edtCountGen.Text <> '' ) then
       SCUsageInputItemFilterObj.countGen := StrToInt(edtCountGen.Text)
     else
       SCUsageInputItemFilterObj.countGen := Low(Integer) ;




     if ( edtScCode.Text <> '' ) then
       SCUsageInputItemFilterObj.scCode := StrToInt(edtScCode.Text)
     else
       SCUsageInputItemFilterObj.scCode := Low(Integer) ;





  end;
end;




end.