
unit EditRQStorageZone;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQStorageZoneController ;

type
  TfrmRQStorageZoneEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    edtName: TEdit;
    lblDescription : TLabel;
    edtDescription: TMemo;

  lblRQStorageStorageName : TLabel;
  edtRQStorageStorageName : TEdit;
  spbRQStorageStorage : TSpeedButton;
  

  HTTPRIORQStorageZone: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQStorageStorageClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQStorageZoneEdit: TfrmRQStorageZoneEdit;
  RQStorageZoneObj: RQStorageZone;

implementation

uses
  ShowRQStorage
  ,RQStorageController
;

{uses  
    EnergyproController, EnergyproController2, RQStorageZoneController  ;
}
{$R *.dfm}



procedure TfrmRQStorageZoneEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtCode]);

  if (DialogState = dsView) or (DialogState = dsEdit) then
  begin
    DisableControls([edtRQStorageStorageName, spbRQStorageStorage]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtRQStorageStorageName]);
    DenyBlankValues([edtName, edtRQStorageStorageName]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(RQStorageZoneObj.code);
    edtName.Text := RQStorageZoneObj.name;
    MakeMultiline(edtDescription.Lines, RQStorageZoneObj.description);
    edtRQStorageStorageName.Text := RQStorageZoneObj.storage.name;
  end;
end;



procedure TfrmRQStorageZoneEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQStorageZone: RQStorageZoneControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([edtName, edtRQStorageStorageName])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;

    RQStorageZoneObj.name := edtName.Text;
    RQStorageZoneObj.description := edtDescription.Text;

    if DialogState = dsInsert then
    begin
      RQStorageZoneObj.code:=low(Integer);
      TempRQStorageZone.add(RQStorageZoneObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQStorageZone.save(RQStorageZoneObj);
    end;
  end;
end;


procedure TfrmRQStorageZoneEdit.spbRQStorageStorageClick(Sender : TObject);
var
   frmRQStorageShow: TfrmRQStorageShow;
begin
   frmRQStorageShow:=TfrmRQStorageShow.Create(Application,fmNormal);
   try
      with frmRQStorageShow do
        if ShowModal = mrOk then
        begin
            try
               if RQStorageZoneObj.storage = nil then RQStorageZoneObj.storage := RQStorage.Create();
               RQStorageZoneObj.storage.code := StrToInt(GetReturnValue(sgRQStorage,0));
               edtRQStorageStorageName.Text:=GetReturnValue(sgRQStorage,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQStorageShow.Free;
   end;
end;



end.