
unit InsertENCheckpointPassListItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENCheckpointPassListItemController,
  ExtCtrls ;

type
  TfrmENCheckpointPassListItemInsert = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;


  HTTPRIOENCheckpointPassListItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    edtTKTransportReal: TEdit;
    lblTKTransportReal: TLabel;
    spbTKTransportReal: TSpeedButton;
    HTTPRIOTKTransportReal: THTTPRIO;
    rgEvent: TGroupBox;
    lblDateEventOut: TLabel;
    edtDateEventOut: TDateTimePicker;
    edtTimeOut: TDateTimePicker;
    lblDateEventIn: TLabel;
    edtDateEventIn: TDateTimePicker;
    edtTimeIn: TDateTimePicker;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTKTransportRealClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENCheckpointPassListItemInsert: TfrmENCheckpointPassListItemInsert;
  ENCheckpointPassListItemObjInsert: ENCheckpointPassListItem;

implementation


uses
  TKTransportRealController
  , ShowTKTransportReal
  , ENCheckpointEventTypeController, ENConsts;

{$R *.dfm}



procedure TfrmENCheckpointPassListItemInsert.FormShow(Sender: TObject);
var
  TempTKTransportReal : TKTransportRealControllerSoapPort;
  transportReal : TKTransportReal;
begin

  DisableControls([edtCode, edtTKTransportReal]);

  if DialogState = dsView then
  begin
     DisableControls([spbTKTransportReal]);
  end;

    if DialogState = dsInsert then
  begin
       // edtTime.Time := SysUtils.Time;
        edtDateEventOut.DateTime:=EncodeDate(ENCheckpointPassListItemObjInsert.dateEvent.Year,
                                          ENCheckpointPassListItemObjInsert.dateEvent.Month,
                                          ENCheckpointPassListItemObjInsert.dateEvent.Day);
        edtDateEventIn.DateTime:=EncodeDate(ENCheckpointPassListItemObjInsert.dateEvent.Year,
                                          ENCheckpointPassListItemObjInsert.dateEvent.Month,
                                          ENCheckpointPassListItemObjInsert.dateEvent.Day);
        edtDateEventOut.Checked := False;
        edtDateEventIn.Checked := False;

        //edtTime.Checked := True;
        //edtDateEvent.Checked := True;
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
//    DenyBlankValues([
//      edtDateEvent
//     ]);
   end;


end;



procedure TfrmENCheckpointPassListItemInsert.spbTKTransportRealClick(
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
          if ENCheckPointPassListItemObjInsert.transportRealRef = nil then ENCheckPointPassListItemObjInsert.transportRealRef := TKTransportRealRef.Create;
          ENCheckPointPassListItemObjInsert.transportRealRef.code := StrToInt(GetReturnValue(sgTKTransportReal,0));
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
procedure TfrmENCheckpointPassListItemInsert.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENCheckpointPassListItem: ENCheckpointPassListItemControllerSoapPort;
    checkpointPassListItemArr : ArrayOfENCheckpointPassListItemShort;
    checkpointPassListItemShort : ENCheckpointPassListItemShort;
    n: integer;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtTKTransportReal
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else if ((edtDateEventOut.checked = false) and (edtDateEventIn.checked = false ))then
   begin
      Application.MessageBox(PChar('Оберіть дату виїзду або в`їзду !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
   end
  else
  begin
    TempENCheckpointPassListItem := HTTPRIOENCheckpointPassListItem as ENCheckpointPassListItemControllerSoapPort;

    if ((edtDateEventOut.checked = true) and (edtDateEventIn.checked = true )) then
    SetLength(checkpointPassListItemArr, 2)
    else
    SetLength(checkpointPassListItemArr, 1);
    n:= -1;
     // тип события выезд
     if edtDateEventOut.checked then
     begin
       n:= 0;
       checkpointPassListItemShort := ENCheckpointPassListItemShort.Create;
       SetNullIntProps(checkpointPassListItemShort);
       SetNullXSProps(checkpointPassListItemShort);

       checkpointPassListItemShort.code := low(Integer);
       checkpointPassListItemShort.checkpointPassListRefCode:= ENCheckpointPassListItemObjInsert.checkpointPassListRef.code;
       checkpointPassListItemShort.transportRealRefCode :=  ENCheckpointPassListItemObjInsert.transportRealRef.code;

       if checkpointPassListItemShort.dateEvent = nil then
          checkpointPassListItemShort.dateEvent := TXSDateTime.Create;
          checkpointPassListItemShort.dateEvent.XSToNative(GetXSDate(edtDateEventOut.DateTime));

          checkpointPassListItemShort.eventTypeRefCode := ENConsts.ENCHECKPOINTEVENTTYPE_OUT;

          checkpointPassListItemShort.dateEvent.Hour := DateTimeToXSDateTime(edtTimeOut.DateTime).Hour;
          checkpointPassListItemShort.dateEvent.Minute := DateTimeToXSDateTime(edtTimeOut.DateTime).Minute;

          if edtTimeOut.checked = false then
          begin
            Application.MessageBox(PChar('Оберіть час виїзду !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
            Action:=caNone;
            exit;
           end;

           checkpointPassListItemArr[n] := checkpointPassListItemShort;
     end
     else
       ENCheckpointPassListItemObjInsert.dateEvent := nil;

    if edtDateEventIn.checked then
     begin
       checkpointPassListItemShort := ENCheckpointPassListItemShort.Create;
       SetNullIntProps(checkpointPassListItemShort);
       SetNullXSProps(checkpointPassListItemShort);

       checkpointPassListItemShort.code := low(Integer);
       checkpointPassListItemShort.checkpointPassListRefCode:= ENCheckpointPassListItemObjInsert.checkpointPassListRef.code;
       checkpointPassListItemShort.transportRealRefCode :=  ENCheckpointPassListItemObjInsert.transportRealRef.code;

       if checkpointPassListItemShort.dateEvent = nil then
          checkpointPassListItemShort.dateEvent := TXSDateTime.Create;
          checkpointPassListItemShort.dateEvent.XSToNative(GetXSDate(edtdateEventIn.DateTime));

          checkpointPassListItemShort.eventTypeRefCode := ENConsts.ENCHECKPOINTEVENTTYPE_IN;

          checkpointPassListItemShort.dateEvent.Hour := DateTimeToXSDateTime(edtTimeIn.DateTime).Hour;
          checkpointPassListItemShort.dateEvent.Minute := DateTimeToXSDateTime(edtTimeIn.DateTime).Minute;

          if edtTimeIn.checked = false then
          begin
            Application.MessageBox(PChar('Оберіть час в`їзду !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
            Action:=caNone;
            exit;
           end;

           checkpointPassListItemArr[n+1] := checkpointPassListItemShort;
     end
     else
          ENCheckpointPassListItemObjInsert.dateEvent := nil;


    if DialogState = dsInsert then
    begin

       if (High(checkpointPassListItemArr) >= 0) then
          TempENCheckpointPassListItem.add(checkpointPassListItemArr)
       else begin
          Application.MessageBox(PChar('Не вибрано жодної події!'), PChar('Увага!'), MB_ICONWARNING);
          Exit;
        end;
    end;


  end;
end;


end.