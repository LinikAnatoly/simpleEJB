
unit EditENDamageRecovery2ENActFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDamageRecovery2ENActController ;

type
  TfrmENDamageRecovery2ENActFilterEdit = class(TDialogForm)

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENDamageRecovery2ENAct: THTTPRIO;

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
  frmENDamageRecovery2ENActFilterEdit: TfrmENDamageRecovery2ENActFilterEdit;
  ENDamageRecovery2ENActFilterObj: ENDamageRecovery2ENActFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDamageRecovery2ENActController  ;
}
{$R *.dfm}



procedure TfrmENDamageRecovery2ENActFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtUserGen.Text := ENDamageRecovery2ENActObj.userGen; 



      if ENDamageRecovery2ENActObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENDamageRecovery2ENActObj.dateEdit.Year,ENDamageRecovery2ENActObj.dateEdit.Month,ENDamageRecovery2ENActObj.dateEdit.Day);
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



procedure TfrmENDamageRecovery2ENActFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENDamageRecovery2ENAct: ENDamageRecovery2ENActControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENDamageRecovery2ENActFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENDamageRecovery2ENActFilterObj.dateEdit = nil then
          ENDamageRecovery2ENActFilterObj.dateEdit := TXSDateTime.Create;
       ENDamageRecovery2ENActFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENDamageRecovery2ENActFilterObj.dateEdit := nil;




  end;
end;




end.