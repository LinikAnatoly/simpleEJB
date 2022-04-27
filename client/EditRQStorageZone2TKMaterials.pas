
unit EditRQStorageZone2TKMaterials;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, RQStorageZone2TKMaterialsController,
    TKMaterialsController;

type
  TfrmRQStorageZone2TKMaterialsEdit = class(TDialogForm)
  
  lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIORQStorageZone2TKMaterials: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblRQStorageZone: TLabel;
    edtRQStorageZone: TEdit;
    spbRQStorageZone: TSpeedButton;
    lblRQStorage: TLabel;
    edtRQStorage: TEdit;
    cbRecursive: TCheckBox;
    HTTPRIORQStorage: THTTPRIO;
    HTTPRIORQStorageZone: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbRQStorageZoneClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQStorageZone2TKMaterialsEdit: TfrmRQStorageZone2TKMaterialsEdit;
  RQStorageZone2TKMaterialsObj: RQStorageZone2TKMaterials;

implementation


uses ShowRQStorageZone, RQStorageZoneController, RQStorageController;

{uses  
    EnergyproController, EnergyproController2, RQStorageZone2TKMaterialsController  ;
}
{$R *.dfm}



procedure TfrmRQStorageZone2TKMaterialsEdit.FormShow(Sender: TObject);
var
  TempRQStorageZone : RQStorageZoneControllerSoapPort;
  TempRQStorage : RQStorageControllerSoapPort;
  zone : RQStorageZone;
begin

  DisableControls([edtCode, edtRQStorage]);

  if DialogState = dsView then
  begin
    DisableControls([spbRQStorageZone]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtRQStorageZone]);
    DenyBlankValues([edtRQStorageZone]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RQStorageZone2TKMaterialsObj.code);
  end;

  // TempRQStorageZone :=  HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;
  // TempRQStorage :=  HTTPRIORQStorage as RQStorageControllerSoapPort;

  if RQStorageZone2TKMaterialsObj.zoneRef <> nil then
  if RQStorageZone2TKMaterialsObj.zoneRef.code <> low(Integer) then
    begin
      TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;
      zone := TempRQStorageZone.getObject(RQStorageZone2TKMaterialsObj.zoneRef.code);

      edtRQStorageZone.Text := zone.name;

      TempRQStorage := HTTPRIORQStorage as RQStorageControllerSoapPort;
      edtRQStorage.Text := TempRQStorage.getObject(zone.storage.code).name;
    end;

end;



procedure TfrmRQStorageZone2TKMaterialsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQStorageZone2TKMaterials: RQStorageZone2TKMaterialsControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtRQStorageZone])  then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempRQStorageZone2TKMaterials := HTTPRIORQStorageZone2TKMaterials as RQStorageZone2TKMaterialsControllerSoapPort;

    if DialogState = dsInsert then
    begin
      RQStorageZone2TKMaterialsObj.code:=low(Integer);

      if (cbRecursive.Checked) then
        TempRQStorageZone2TKMaterials.addRecursive(RQStorageZone2TKMaterialsObj)
      else
        TempRQStorageZone2TKMaterials.add(RQStorageZone2TKMaterialsObj);
    end
    else
    if DialogState = dsEdit then
    begin

      if (cbRecursive.Checked) then
        TempRQStorageZone2TKMaterials.addRecursive(RQStorageZone2TKMaterialsObj)
      else
        TempRQStorageZone2TKMaterials.save(RQStorageZone2TKMaterialsObj);
    end;
  end;
end;


procedure TfrmRQStorageZone2TKMaterialsEdit.spbRQStorageZoneClick(
  Sender: TObject);
var
  frmRQStorageZoneShow : TfrmRQStorageZoneShow;
  zoneFilter : RQStorageZoneFilter;
  TempRQStorageZone : RQStorageZoneControllerSoapPort;
  zone : RQStorageZone;

begin
  if (DialogState = dsEdit) then
  begin
    TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;
    zone := TempRQStorageZone.getObject(RQStorageZone2TKMaterialsObj.zoneRef.code);

    zoneFilter := RQStorageZoneFilter.Create;
    SetNullIntProps(zoneFilter);
    SetNullXSProps(zoneFilter);
    zoneFilter.storage := RQStorage.Create;
    zoneFilter.storage.code := zone.storage.code;

    frmRQStorageZoneShow := TfrmRQStorageZoneShow.Create(Application, fmNormal, zoneFilter);
    DisableActions([frmRQStorageZoneShow.actFilter, frmRQStorageZoneShow.actNoFilter]);

  end
  else
    frmRQStorageZoneShow := TfrmRQStorageZoneShow.Create(Application, fmNormal);

  try
    with frmRQStorageZoneShow do
      if ShowModal = mrOk then
      begin
        try
          if RQStorageZone2TKMaterialsObj.zoneRef = nil then RQStorageZone2TKMaterialsObj.zoneRef := RQStorageZoneRef.Create;
          RQStorageZone2TKMaterialsObj.zoneRef.code := StrToInt(GetReturnValue(sgRQStorageZone, 0));

          edtRQStorage.Text := GetReturnValue(sgRQStorageZone, 1);
          edtRQStorageZone.Text := GetReturnValue(sgRQStorageZone,2);

        except
           on EConvertError do Exit;
        end;
      end;
  finally
    frmRQStorageZoneShow.Free;
  end;
end;


end.