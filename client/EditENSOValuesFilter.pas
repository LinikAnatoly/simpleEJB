
unit EditENSOValuesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOValuesController ;

type
  TfrmENSOValuesFilterEdit = class(TDialogForm)

    lblDateVal : TLabel;
    edtDateVal: TDateTimePicker;
    lblStrVal : TLabel;
    edtStrVal: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENSOValues: THTTPRIO;

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
  frmENSOValuesFilterEdit: TfrmENSOValuesFilterEdit;
  ENSOValuesFilterObj: ENSOValuesFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSOValuesController  ;
}
{$R *.dfm}



procedure TfrmENSOValuesFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateVal
      ,edtStrVal
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      if ENSOValuesObj.dateVal <> nil then
      begin
        edtDateVal.DateTime:=EncodeDate(ENSOValuesObj.dateVal.Year,ENSOValuesObj.dateVal.Month,ENSOValuesObj.dateVal.Day);
        edtDateVal.checked := true;
      end
      else
      begin
        edtDateVal.DateTime:=SysUtils.Date;
        edtDateVal.checked := false;
      end;	  



    MakeMultiline(edtStrVal.Lines, ENSOValuesObj.strVal);



    edtUserGen.Text := ENSOValuesObj.userGen; 



      if ENSOValuesObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSOValuesObj.dateEdit.Year,ENSOValuesObj.dateEdit.Month,ENSOValuesObj.dateEdit.Day);
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



procedure TfrmENSOValuesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOValues: ENSOValuesControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if edtdateVal.checked then
     begin 
       if ENSOValuesFilterObj.dateVal = nil then
          ENSOValuesFilterObj.dateVal := TXSDateTime.Create;
       ENSOValuesFilterObj.dateVal.XSToNative(GetXSDate(edtdateVal.DateTime));
     end
     else
       ENSOValuesFilterObj.dateVal := nil;



     ENSOValuesFilterObj.strVal := edtStrVal.Text; 



     ENSOValuesFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSOValuesFilterObj.dateEdit = nil then
          ENSOValuesFilterObj.dateEdit := TXSDateTime.Create;
       ENSOValuesFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSOValuesFilterObj.dateEdit := nil;




  end;
end;




end.