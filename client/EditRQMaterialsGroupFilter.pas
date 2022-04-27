
unit EditRQMaterialsGroupFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQMaterialsGroupController ;

type
  TfrmRQMaterialsGroupFilterEdit = class(TDialogForm)

    lblOutCode : TLabel;
    edtOutCode: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblDateDelete : TLabel;
    edtDateDelete: TDateTimePicker;


  HTTPRIORQMaterialsGroup: THTTPRIO;

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
  frmRQMaterialsGroupFilterEdit: TfrmRQMaterialsGroupFilterEdit;
  RQMaterialsGroupFilterObj: RQMaterialsGroupFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQMaterialsGroupController  ;
}
{$R *.dfm}



procedure TfrmRQMaterialsGroupFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQMaterialsGroupObj.outCode <> Low(Integer) ) then
       edtOutCode.Text := IntToStr(RQMaterialsGroupObj.outCode)
    else
       edtOutCode.Text := '';



    edtName.Text := RQMaterialsGroupObj.name; 



      if RQMaterialsGroupObj.dateDelete <> nil then
      begin
        edtDateDelete.DateTime:=EncodeDate(RQMaterialsGroupObj.dateDelete.Year,RQMaterialsGroupObj.dateDelete.Month,RQMaterialsGroupObj.dateDelete.Day);
        edtDateDelete.checked := true;
      end
      else
      begin
        edtDateDelete.DateTime:=SysUtils.Date;
        edtDateDelete.checked := false;
      end;


  end;

}

end;



procedure TfrmRQMaterialsGroupFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQMaterialsGroup: RQMaterialsGroupControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtOutCode.Text <> '' ) then
       RQMaterialsGroupFilterObj.outCode := StrToInt(edtOutCode.Text)
     else
       RQMaterialsGroupFilterObj.outCode := Low(Integer) ;




     RQMaterialsGroupFilterObj.name := edtName.Text; 



     if RQMaterialsGroupFilterObj.dateDelete = nil then
        RQMaterialsGroupFilterObj.dateDelete := TXSDate.Create;
      RQMaterialsGroupFilterObj.dateDelete.XSToNative(GetXSDate(edtdateDelete.DateTime));





  end;
end;




end.