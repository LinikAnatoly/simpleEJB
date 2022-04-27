
unit EditRQMaterialsGroup;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQMaterialsGroupController ;

type
  TfrmRQMaterialsGroupEdit = class(TDialogForm)

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
  frmRQMaterialsGroupEdit: TfrmRQMaterialsGroupEdit;
  RQMaterialsGroupObj: RQMaterialsGroup;

implementation


{uses  
    EnergyproController, EnergyproController2, RQMaterialsGroupController  ;
}
{$R *.dfm}



procedure TfrmRQMaterialsGroupEdit.FormShow(Sender: TObject);

begin
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
end;



procedure TfrmRQMaterialsGroupEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQMaterialsGroup: RQMaterialsGroupControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQMaterialsGroup := HTTPRIORQMaterialsGroup as RQMaterialsGroupControllerSoapPort;


     if ( edtOutCode.Text <> '' ) then
       RQMaterialsGroupObj.outCode := StrToInt(edtOutCode.Text)
     else
       RQMaterialsGroupObj.outCode := Low(Integer) ;

     RQMaterialsGroupObj.name := edtName.Text; 

     if edtdateDelete.checked then
     begin 
       if RQMaterialsGroupObj.dateDelete = nil then
          RQMaterialsGroupObj.dateDelete := TXSDate.Create;
       RQMaterialsGroupObj.dateDelete.XSToNative(GetXSDate(edtdateDelete.DateTime));
     end
     else
       RQMaterialsGroupObj.dateDelete := nil;

    if DialogState = dsInsert then
    begin
      RQMaterialsGroupObj.code:=low(Integer);
      TempRQMaterialsGroup.add(RQMaterialsGroupObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQMaterialsGroup.save(RQMaterialsGroupObj);
    end;
  end;
end;


end.