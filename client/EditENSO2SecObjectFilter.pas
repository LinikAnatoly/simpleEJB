
unit EditENSO2SecObjectFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSO2SecObjectController ;

type
  TfrmENSO2SecObjectFilterEdit = class(TDialogForm)

    lblSecurityObj : TLabel;
    edtSecurityObj: TEdit;

    lblSecurityObjAddress : TLabel;
    edtSecurityObjAddress: TEdit;

    lblSecurityPeriod : TLabel;
    edtSecurityPeriod: TEdit;

    lblGuardPost : TLabel;
    edtGuardPost: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENSO2SecObject: THTTPRIO;

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
  frmENSO2SecObjectFilterEdit: TfrmENSO2SecObjectFilterEdit;
  ENSO2SecObjectFilterObj: ENSO2SecObjectFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSO2SecObjectController  ;
}
{$R *.dfm}



procedure TfrmENSO2SecObjectFilterEdit.FormShow(Sender: TObject);

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

    edtSecurityObj.Text := ENSO2SecObjectObj.securityObj; 



    edtSecurityObjAddress.Text := ENSO2SecObjectObj.securityObjAddress; 



    if ( ENSO2SecObjectObj.securityPeriod <> Low(Integer) ) then
       edtSecurityPeriod.Text := IntToStr(ENSO2SecObjectObj.securityPeriod)
    else
       edtSecurityPeriod.Text := '';



    if ( ENSO2SecObjectObj.guardPost <> Low(Integer) ) then
       edtGuardPost.Text := IntToStr(ENSO2SecObjectObj.guardPost)
    else
       edtGuardPost.Text := '';



    edtUserGen.Text := ENSO2SecObjectObj.userGen; 



      if ENSO2SecObjectObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENSO2SecObjectObj.dateEdit.Year,ENSO2SecObjectObj.dateEdit.Month,ENSO2SecObjectObj.dateEdit.Day);
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



procedure TfrmENSO2SecObjectFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSO2SecObject: ENSO2SecObjectControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSO2SecObjectFilterObj.securityObj := edtSecurityObj.Text; 



     ENSO2SecObjectFilterObj.securityObjAddress := edtSecurityObjAddress.Text; 



     if ( edtSecurityPeriod.Text <> '' ) then
       ENSO2SecObjectFilterObj.securityPeriod := StrToInt(edtSecurityPeriod.Text)
     else
       ENSO2SecObjectFilterObj.securityPeriod := Low(Integer) ;




     if ( edtGuardPost.Text <> '' ) then
       ENSO2SecObjectFilterObj.guardPost := StrToInt(edtGuardPost.Text)
     else
       ENSO2SecObjectFilterObj.guardPost := Low(Integer) ;




     ENSO2SecObjectFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENSO2SecObjectFilterObj.dateEdit = nil then
          ENSO2SecObjectFilterObj.dateEdit := TXSDateTime.Create;
       ENSO2SecObjectFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENSO2SecObjectFilterObj.dateEdit := nil;




  end;
end;




end.