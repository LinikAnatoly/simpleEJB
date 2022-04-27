
unit EditRQStorageZone2RestPurposeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQStorageZone2RestPurposeController ;

type
  TfrmRQStorageZone2RestPurposeFilterEdit = class(TDialogForm)

    lblRest_purpose_base_id : TLabel;
    edtRest_purpose_base_id: TEdit;

    lblRest_purpose_id : TLabel;
    edtRest_purpose_id: TEdit;

    lblRest_purpose_type_id : TLabel;
    edtRest_purpose_type_id: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQStorageZone2RestPurpose: THTTPRIO;

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
  frmRQStorageZone2RestPurposeFilterEdit: TfrmRQStorageZone2RestPurposeFilterEdit;
  RQStorageZone2RestPurposeFilterObj: RQStorageZone2RestPurposeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQStorageZone2RestPurposeController  ;
}
{$R *.dfm}



procedure TfrmRQStorageZone2RestPurposeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtRest_purpose_base_id
      ,edtRest_purpose_id
      ,edtRest_purpose_type_id
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQStorageZone2RestPurposeObj.rest_purpose_base_id <> Low(Integer) ) then
       edtRest_purpose_base_id.Text := IntToStr(RQStorageZone2RestPurposeObj.rest_purpose_base_id)
    else
       edtRest_purpose_base_id.Text := '';



    if ( RQStorageZone2RestPurposeObj.rest_purpose_id <> Low(Integer) ) then
       edtRest_purpose_id.Text := IntToStr(RQStorageZone2RestPurposeObj.rest_purpose_id)
    else
       edtRest_purpose_id.Text := '';



    if ( RQStorageZone2RestPurposeObj.rest_purpose_type_id <> Low(Integer) ) then
       edtRest_purpose_type_id.Text := IntToStr(RQStorageZone2RestPurposeObj.rest_purpose_type_id)
    else
       edtRest_purpose_type_id.Text := '';



    edtUserGen.Text := RQStorageZone2RestPurposeObj.userGen; 



      if RQStorageZone2RestPurposeObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQStorageZone2RestPurposeObj.dateEdit.Year,RQStorageZone2RestPurposeObj.dateEdit.Month,RQStorageZone2RestPurposeObj.dateEdit.Day);
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



procedure TfrmRQStorageZone2RestPurposeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQStorageZone2RestPurpose: RQStorageZone2RestPurposeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtRest_purpose_base_id.Text <> '' ) then
       RQStorageZone2RestPurposeFilterObj.rest_purpose_base_id := StrToInt(edtRest_purpose_base_id.Text)
     else
       RQStorageZone2RestPurposeFilterObj.rest_purpose_base_id := Low(Integer) ;




     if ( edtRest_purpose_id.Text <> '' ) then
       RQStorageZone2RestPurposeFilterObj.rest_purpose_id := StrToInt(edtRest_purpose_id.Text)
     else
       RQStorageZone2RestPurposeFilterObj.rest_purpose_id := Low(Integer) ;




     if ( edtRest_purpose_type_id.Text <> '' ) then
       RQStorageZone2RestPurposeFilterObj.rest_purpose_type_id := StrToInt(edtRest_purpose_type_id.Text)
     else
       RQStorageZone2RestPurposeFilterObj.rest_purpose_type_id := Low(Integer) ;




     RQStorageZone2RestPurposeFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQStorageZone2RestPurposeFilterObj.dateEdit = nil then
          RQStorageZone2RestPurposeFilterObj.dateEdit := TXSDateTime.Create;
       RQStorageZone2RestPurposeFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQStorageZone2RestPurposeFilterObj.dateEdit := nil;




  end;
end;




end.