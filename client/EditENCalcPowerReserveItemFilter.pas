
unit EditENCalcPowerReserveItemFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCalcPowerReserveItemController ;

type
  TfrmENCalcPowerReserveItemFilterEdit = class(TDialogForm)

    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENCalcPowerReserveItem: THTTPRIO;

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
  frmENCalcPowerReserveItemFilterEdit: TfrmENCalcPowerReserveItemFilterEdit;
  ENCalcPowerReserveItemFilterObj: ENCalcPowerReserveItemFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCalcPowerReserveItemController  ;
}
{$R *.dfm}



procedure TfrmENCalcPowerReserveItemFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtUserAdd
      ,edtDateAdd
      ,edtUserGen
      ,edtDateEdit
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtUserAdd.Text := ENCalcPowerReserveItemObj.userAdd; 



      if ENCalcPowerReserveItemObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENCalcPowerReserveItemObj.dateAdd.Year,ENCalcPowerReserveItemObj.dateAdd.Month,ENCalcPowerReserveItemObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENCalcPowerReserveItemObj.userGen; 



      if ENCalcPowerReserveItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENCalcPowerReserveItemObj.dateEdit.Year,ENCalcPowerReserveItemObj.dateEdit.Month,ENCalcPowerReserveItemObj.dateEdit.Day);
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



procedure TfrmENCalcPowerReserveItemFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCalcPowerReserveItem: ENCalcPowerReserveItemControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENCalcPowerReserveItemFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENCalcPowerReserveItemFilterObj.dateAdd = nil then
          ENCalcPowerReserveItemFilterObj.dateAdd := TXSDateTime.Create;
       ENCalcPowerReserveItemFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENCalcPowerReserveItemFilterObj.dateAdd := nil;



     ENCalcPowerReserveItemFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENCalcPowerReserveItemFilterObj.dateEdit = nil then
          ENCalcPowerReserveItemFilterObj.dateEdit := TXSDateTime.Create;
       ENCalcPowerReserveItemFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENCalcPowerReserveItemFilterObj.dateEdit := nil;




  end;
end;




end.