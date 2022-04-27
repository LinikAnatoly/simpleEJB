
unit EditENCheckpointPassListItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCheckpointPassListItemController,
  ExtCtrls ;

type
  TfrmENCheckpointPassListItemEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDateEvent : TLabel;
    edtDateEvent: TDateTimePicker;


  HTTPRIOENCheckpointPassListItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtTKTransportReal: TEdit;
    lblTKTransportReal: TLabel;
    spbTKTransportReal: TSpeedButton;
    HTTPRIOTKTransportReal: THTTPRIO;
    rgEventType: TRadioGroup;
    edtTime: TDateTimePicker;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTKTransportRealClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCheckpointPassListItemEdit: TfrmENCheckpointPassListItemEdit;
  ENCheckpointPassListItemObj: ENCheckpointPassListItem;

implementation


uses
  TKTransportRealController
  , ShowTKTransportReal
  , ENCheckpointEventTypeController;

{$R *.dfm}



procedure TfrmENCheckpointPassListItemEdit.FormShow(Sender: TObject);
var
  TempTKTransportReal : TKTransportRealControllerSoapPort;
  transportReal : TKTransportReal;
begin

  DisableControls([edtCode, edtTKTransportReal]);

  if DialogState = dsView then
  begin
     DisableControls([spbTKTransportReal, rgEventType]);
  end;

    if DialogState = dsInsert then
  begin
       // edtTime.Time := SysUtils.Time;
        edtDateEvent.DateTime:=EncodeDate(ENCheckpointPassListItemObj.dateEvent.Year,
                                          ENCheckpointPassListItemObj.dateEvent.Month,
                                          ENCheckpointPassListItemObj.dateEvent.Day);
        edtTime.Checked := True;
        edtDateEvent.Checked := True;
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateEvent
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENCheckpointPassListItemObj.code);
      if ENCheckpointPassListItemObj.dateEvent <> nil then
      begin
        edtDateEvent.DateTime:=EncodeDate(ENCheckpointPassListItemObj.dateEvent.Year,ENCheckpointPassListItemObj.dateEvent.Month,ENCheckpointPassListItemObj.dateEvent.Day);
        edtDateEvent.checked := true;
      end
      else
      begin
        edtDateEvent.DateTime:=SysUtils.Date;
        edtDateEvent.checked := false;
      end;

      rgEventType.ItemIndex := ENCheckpointPassListItemObj.eventTypeRef.code - 1;

      TempTKTransportReal := HTTPRIOTKTransportReal as TKTransportRealControllerSoapPort;

      transportReal := TempTKTransportReal.getObject(ENCheckpointPassListItemObj.transportRealRef.code);
      edtTKTransportReal.Text := transportReal.gosNumber + ' ' + transportReal.name;

      edtTime.DateTime:= EncodeTime(ENCheckpointPassListItemObj.dateEvent.Hour,ENCheckpointPassListItemObj.dateEvent.Minute, 0, 0);
  end;
end;



procedure TfrmENCheckpointPassListItemEdit.spbTKTransportRealClick(
  Sender: TObject);
var
  frmTKTransportRealShow : TfrmTKTransportRealShow;
begin
  inherited;
  frmTKTransportRealShow := TfrmTKTransportRealShow.Create(Application,fmNormal);
  try
    with frmTKTransportRealShow do
    begin
      DisableActions([actEdit, actDelete, actInsert]);
      if ShowModal = mrOk then
      begin
        try
          if ENCheckPointPassListItemObj.transportRealRef = nil then ENCheckPointPassListItemObj.transportRealRef := TKTransportRealRef.Create;
          ENCheckPointPassListItemObj.transportRealRef.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
          edtTKTransportReal.Text := GetReturnValue(sgTKTransportReal,1);
        except
          on EConvertError do Exit;
        end;
      end;
    end
  finally
    frmTKTransportRealShow.Free;
  end;
end;
procedure TfrmENCheckpointPassListItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCheckpointPassListItem: ENCheckpointPassListItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtTKTransportReal
      , edtDateEvent
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENCheckpointPassListItem := HTTPRIOENCheckpointPassListItem as ENCheckpointPassListItemControllerSoapPort;


     if edtdateEvent.checked then
     begin 
       if ENCheckpointPassListItemObj.dateEvent = nil then
          ENCheckpointPassListItemObj.dateEvent := TXSDateTime.Create;
       ENCheckpointPassListItemObj.dateEvent.XSToNative(GetXSDate(edtdateEvent.DateTime));
     end
     else
       ENCheckpointPassListItemObj.dateEvent := nil;

     if ENCheckpointPassListItemObj.eventTypeRef = nil then ENCheckpointPassListItemObj.eventTypeRef := ENCheckpointEventTypeRef.Create;
     ENCheckpointPassListItemObj.eventTypeRef.code := rgEventType.ItemIndex + 1;

     ENCheckpointPassListItemObj.dateEvent.Hour := DateTimeToXSDateTime(edtTime.DateTime).Hour;
     ENCheckpointPassListItemObj.dateEvent.Minute := DateTimeToXSDateTime(edtTime.DateTime).Minute;


    if DialogState = dsInsert then
    begin
      ENCheckpointPassListItemObj.code:=low(Integer);
      // SUPP-25511 - инсерт вынес на отдельную форму(InsertENCheckpointPassListItem)  TempENCheckpointPassListItem.add(ENCheckpointPassListItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENCheckpointPassListItem.save(ENCheckpointPassListItemObj);
    end;
  end;
end;


end.