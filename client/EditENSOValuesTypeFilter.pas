
unit EditENSOValuesTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSOValuesTypeController ;

type
  TfrmENSOValuesTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblSortField : TLabel;
    edtSortField: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENSOValuesType: THTTPRIO;

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
  frmENSOValuesTypeFilterEdit: TfrmENSOValuesTypeFilterEdit;
  ENSOValuesTypeFilterObj: ENSOValuesTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSOValuesTypeController  ;
}
{$R *.dfm}



procedure TfrmENSOValuesTypeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtSortField
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENSOValuesTypeObj.name; 



    if ( ENSOValuesTypeObj.sortField <> Low(Integer) ) then
       edtSortField.Text := IntToStr(ENSOValuesTypeObj.sortField)
    else
       edtSortField.Text := '';



    edtUserGen.Text := ENSOValuesTypeObj.userGen; 



      if ENSOValuesTypeObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSOValuesTypeObj.dateEdit.Year,ENSOValuesTypeObj.dateEdit.Month,ENSOValuesTypeObj.dateEdit.Day);
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



procedure TfrmENSOValuesTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSOValuesType: ENSOValuesTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSOValuesTypeFilterObj.name := edtName.Text; 



     if ( edtSortField.Text <> '' ) then
       ENSOValuesTypeFilterObj.sortField := StrToInt(edtSortField.Text)
     else
       ENSOValuesTypeFilterObj.sortField := Low(Integer) ;
	   



     ENSOValuesTypeFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSOValuesTypeFilterObj.dateEdit = nil then
          ENSOValuesTypeFilterObj.dateEdit := TXSDateTime.Create;
       ENSOValuesTypeFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSOValuesTypeFilterObj.dateEdit := nil;




  end;
end;




end.