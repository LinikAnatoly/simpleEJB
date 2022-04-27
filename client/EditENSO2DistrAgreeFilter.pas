
unit EditENSO2DistrAgreeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSO2DistrAgreeController ;

type
  TfrmENSO2DistrAgreeFilterEdit = class(TDialogForm)

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENSO2DistrAgree: THTTPRIO;

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
  frmENSO2DistrAgreeFilterEdit: TfrmENSO2DistrAgreeFilterEdit;
  ENSO2DistrAgreeFilterObj: ENSO2DistrAgreeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSO2DistrAgreeController  ;
}
{$R *.dfm}



procedure TfrmENSO2DistrAgreeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtUserGen.Text := ENSO2DistrAgreeObj.userGen; 



      if ENSO2DistrAgreeObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSO2DistrAgreeObj.dateEdit.Year,ENSO2DistrAgreeObj.dateEdit.Month,ENSO2DistrAgreeObj.dateEdit.Day);
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



procedure TfrmENSO2DistrAgreeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSO2DistrAgree: ENSO2DistrAgreeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSO2DistrAgreeFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSO2DistrAgreeFilterObj.dateEdit = nil then
          ENSO2DistrAgreeFilterObj.dateEdit := TXSDateTime.Create;
       ENSO2DistrAgreeFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSO2DistrAgreeFilterObj.dateEdit := nil;




  end;
end;




end.