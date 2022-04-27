
unit EditENSO2SecObjectRespFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSO2SecObjectRespController ;

type
  TfrmENSO2SecObjectRespFilterEdit = class(TDialogForm)

    lblResponsibleName : TLabel;
    edtResponsibleName: TEdit;

    lblResponsiblePosition : TLabel;
    edtResponsiblePosition: TEdit;

    lblResponsibleContactInfo : TLabel;
    edtResponsibleContactInfo: TMemo;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENSO2SecObjectResp: THTTPRIO;

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
  frmENSO2SecObjectRespFilterEdit: TfrmENSO2SecObjectRespFilterEdit;
  ENSO2SecObjectRespFilterObj: ENSO2SecObjectRespFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSO2SecObjectRespController  ;
}
{$R *.dfm}



procedure TfrmENSO2SecObjectRespFilterEdit.FormShow(Sender: TObject);

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

    edtResponsibleName.Text := ENSO2SecObjectRespObj.responsibleName; 



    edtResponsiblePosition.Text := ENSO2SecObjectRespObj.responsiblePosition; 



    MakeMultiline(edtResponsibleContactInfo.Lines, ENSO2SecObjectRespObj.responsibleContactInfo);



    edtUserGen.Text := ENSO2SecObjectRespObj.userGen; 



      if ENSO2SecObjectRespObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSO2SecObjectRespObj.dateEdit.Year,ENSO2SecObjectRespObj.dateEdit.Month,ENSO2SecObjectRespObj.dateEdit.Day);
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



procedure TfrmENSO2SecObjectRespFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSO2SecObjectResp: ENSO2SecObjectRespControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSO2SecObjectRespFilterObj.responsibleName := edtResponsibleName.Text; 



     ENSO2SecObjectRespFilterObj.responsiblePosition := edtResponsiblePosition.Text; 



     ENSO2SecObjectRespFilterObj.responsibleContactInfo := edtResponsibleContactInfo.Text; 



     ENSO2SecObjectRespFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSO2SecObjectRespFilterObj.dateEdit = nil then
          ENSO2SecObjectRespFilterObj.dateEdit := TXSDateTime.Create;
       ENSO2SecObjectRespFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSO2SecObjectRespFilterObj.dateEdit := nil;




  end;
end;




end.