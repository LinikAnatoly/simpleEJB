
unit EditRQStorageZone2TKMaterialsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQStorageZone2TKMaterialsController ;

type
  TfrmRQStorageZone2TKMaterialsFilterEdit = class(TDialogForm)

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIORQStorageZone2TKMaterials: THTTPRIO;

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
  frmRQStorageZone2TKMaterialsFilterEdit: TfrmRQStorageZone2TKMaterialsFilterEdit;
  RQStorageZone2TKMaterialsFilterObj: RQStorageZone2TKMaterialsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQStorageZone2TKMaterialsController  ;
}
{$R *.dfm}



procedure TfrmRQStorageZone2TKMaterialsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtUserGen.Text := RQStorageZone2TKMaterialsObj.userGen; 



      if RQStorageZone2TKMaterialsObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(RQStorageZone2TKMaterialsObj.dateEdit.Year,RQStorageZone2TKMaterialsObj.dateEdit.Month,RQStorageZone2TKMaterialsObj.dateEdit.Day);
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



procedure TfrmRQStorageZone2TKMaterialsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQStorageZone2TKMaterials: RQStorageZone2TKMaterialsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQStorageZone2TKMaterialsFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if RQStorageZone2TKMaterialsFilterObj.dateEdit = nil then
          RQStorageZone2TKMaterialsFilterObj.dateEdit := TXSDateTime.Create;
       RQStorageZone2TKMaterialsFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       RQStorageZone2TKMaterialsFilterObj.dateEdit := nil;




  end;
end;




end.