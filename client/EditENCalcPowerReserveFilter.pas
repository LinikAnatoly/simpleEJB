
unit EditENCalcPowerReserveFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCalcPowerReserveController ;

type
  TfrmENCalcPowerReserveFilterEdit = class(TDialogForm)

    lblUserAdd : TLabel;
    edtUserAdd: TEdit;

    lblDateAdd : TLabel;
    edtDateAdd: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENCalcPowerReserve: THTTPRIO;

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
  frmENCalcPowerReserveFilterEdit: TfrmENCalcPowerReserveFilterEdit;
  ENCalcPowerReserveFilterObj: ENCalcPowerReserveFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENCalcPowerReserveController  ;
}
{$R *.dfm}



procedure TfrmENCalcPowerReserveFilterEdit.FormShow(Sender: TObject);

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

    edtUserAdd.Text := ENCalcPowerReserveObj.userAdd; 



      if ENCalcPowerReserveObj.dateAdd <> nil then
      begin
        edtDateAdd.DateTime:=EncodeDate(ENCalcPowerReserveObj.dateAdd.Year,ENCalcPowerReserveObj.dateAdd.Month,ENCalcPowerReserveObj.dateAdd.Day);
        edtDateAdd.checked := true;
      end
      else
      begin
        edtDateAdd.DateTime:=SysUtils.Date;
        edtDateAdd.checked := false;
      end;	  



    edtUserGen.Text := ENCalcPowerReserveObj.userGen; 



      if ENCalcPowerReserveObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENCalcPowerReserveObj.dateEdit.Year,ENCalcPowerReserveObj.dateEdit.Month,ENCalcPowerReserveObj.dateEdit.Day);
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



procedure TfrmENCalcPowerReserveFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCalcPowerReserve: ENCalcPowerReserveControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENCalcPowerReserveFilterObj.userAdd := edtUserAdd.Text; 



     if edtdateAdd.checked then
     begin 
       if ENCalcPowerReserveFilterObj.dateAdd = nil then
          ENCalcPowerReserveFilterObj.dateAdd := TXSDateTime.Create;
       ENCalcPowerReserveFilterObj.dateAdd.XSToNative(GetXSDate(edtdateAdd.DateTime));
     end
     else
       ENCalcPowerReserveFilterObj.dateAdd := nil;



     ENCalcPowerReserveFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENCalcPowerReserveFilterObj.dateEdit = nil then
          ENCalcPowerReserveFilterObj.dateEdit := TXSDateTime.Create;
       ENCalcPowerReserveFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENCalcPowerReserveFilterObj.dateEdit := nil;




  end;
end;




end.