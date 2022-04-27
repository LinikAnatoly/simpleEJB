
unit EditENFuelInvResultFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuelInvResultController ;

type
  TfrmENFuelInvResultFilterEdit = class(TDialogForm)

    lblDeltaCount : TLabel;
    edtDeltaCount: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENFuelInvResult: THTTPRIO;

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
  frmENFuelInvResultFilterEdit: TfrmENFuelInvResultFilterEdit;
  ENFuelInvResultFilterObj: ENFuelInvResultFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuelInvResultController  ;
}
{$R *.dfm}



procedure TfrmENFuelInvResultFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDeltaCount
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENFuelInvResultObj.deltaCount <> nil ) then
       edtDeltaCount.Text := ENFuelInvResultObj.deltaCount.decimalString
    else
       edtDeltaCount.Text := ''; 



    edtUserGen.Text := ENFuelInvResultObj.userGen; 



      if ENFuelInvResultObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENFuelInvResultObj.dateEdit.Year,ENFuelInvResultObj.dateEdit.Month,ENFuelInvResultObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENFuelInvResultFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuelInvResult: ENFuelInvResultControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENFuelInvResultFilterObj.deltaCount = nil ) then
       ENFuelInvResultFilterObj.deltaCount := TXSDecimal.Create;
     if edtDeltaCount.Text <> '' then
       ENFuelInvResultFilterObj.deltaCount.decimalString := edtDeltaCount.Text 
     else
       ENFuelInvResultFilterObj.deltaCount := nil;




     ENFuelInvResultFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENFuelInvResultFilterObj.dateEdit = nil then
          ENFuelInvResultFilterObj.dateEdit := TXSDateTime.Create;
       ENFuelInvResultFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENFuelInvResultFilterObj.dateEdit := nil;




  end;
end;




end.