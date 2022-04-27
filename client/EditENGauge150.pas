//Редактирование Режимнх замеров Подстанции 150 / 35 - 27 / 10 - 6 кВ
unit EditENGauge150;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
  Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENGauge150Controller, ExtCtrls,
  ShowENSubst150PowerTrans, ENSubst150PowerTransController,
  ENSubstation150Controller ;

type
  TfrmENGauge150Edit = class(TDialogForm)
  
  lblCode : TLabel;
  edtCode : TEdit;

  HTTPRIOENGauge150: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
  pnGeneral: TPanel;
  lblDateGauge: TLabel;
  edtConsOwnTrans: TEdit;
  lblConsOwnTrans: TLabel;
  edtCurrent: TEdit;
  lblCurrent: TLabel;
  edtTension: TEdit;
  lblTension: TLabel;
  dtpDateGauge: TDateTimePicker;
  edtName: TEdit;
  lblName: TLabel;
  lblENSubst150PowerTrans: TLabel;
  edtENSubst150PowerTrans: TEdit;
  spbENSubst150PowerTrans: TSpeedButton;
  dtpTimeGauge: TDateTimePicker;
    chkIsGenSwitchDev: TCheckBox;
    HTTPRIOENSubst150PowerTrans: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbENSubst150PowerTransClick(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENGauge150Edit: TfrmENGauge150Edit;
  ENGauge150Obj: ENGauge150;

implementation


uses Globals, ENConsts; //EnergyproController, EnergyproController2, ENGauge150Controller

{$R *.dfm}

procedure TfrmENGauge150Edit.FormShow(Sender: TObject);
var ENSubst150PowerTransObj: ENSubst150PowerTrans;
  TempENSubst150PowerTrans: ENSubst150PowerTransControllerSoapPort;
begin
  SetCurrentDate;
  SetCurrentTime;
  SetFloatStyle([edtTension, edtCurrent, edtConsOwnTrans]);
  DisableControls([edtCode]);

  if ENGauge150Obj.powerTransRef <> nil then
    if ENGauge150Obj.powerTransRef.code <> Low(Integer) then
      begin
        if Application.Tag = ENConsts.CONFIG_ENERGYWORKFLOW_CLIENT_VERSION then
          DisableControls([spbENSubst150PowerTrans]);
        TempENSubst150PowerTrans := HTTPRIOENSubst150PowerTrans as
          ENSubst150PowerTransControllerSoapPort;
        ENSubst150PowerTransObj := TempENSubst150PowerTrans.getObject(
          ENGauge150Obj.powerTransRef.code);
        edtENSubst150PowerTrans.Text := ENSubst150PowerTransObj.name;
      end; //if ENGauge150Obj.substation150Ref.code <> Low(Integer) then

  if DialogState = dsView then
  begin
    DisableControls([spbENSubst150PowerTrans]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtENSubst150PowerTrans]);
    DenyBlankValues([edtENSubst150PowerTrans, edtName, dtpDateGauge, dtpTimeGauge, edtTension, edtCurrent]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENGauge150Obj.code);
    edtName.Text := ENGauge150Obj.name;

    if ENGauge150Obj.dateGauge <> nil then
    begin
      dtpDateGauge.DateTime:=EncodeDate(ENGauge150Obj.dateGauge.Year,ENGauge150Obj.dateGauge.Month,ENGauge150Obj.dateGauge.Day);
      dtpDateGauge.checked := true;
    end
    else
    begin
      dtpDateGauge.DateTime:=SysUtils.Date;
      dtpDateGauge.checked := false;
    end;

    if ( ENGauge150Obj.tension <> nil ) then
       edtTension.Text := ENGauge150Obj.tension.decimalString
    else
       edtTension.Text := ''; 
    if ( ENGauge150Obj.current <> nil ) then
       edtCurrent.Text := ENGauge150Obj.current.decimalString
    else
       edtCurrent.Text := ''; 
    if ( ENGauge150Obj.consOwnTrans <> nil ) then
       edtConsOwnTrans.Text := ENGauge150Obj.consOwnTrans.decimalString
    else
       edtConsOwnTrans.Text := ''; 
    if ( ENGauge150Obj.isGenSwitchDev <> Low(Integer) ) then
      chkIsGenSwitchDev.Checked := (ENGauge150Obj.isGenSwitchDev = 1)
    else
      chkIsGenSwitchDev.Checked := False;
  end;
end;

procedure TfrmENGauge150Edit.spbENSubst150PowerTransClick(Sender: TObject);
var
  frmENSubst150PowerTransShow : TfrmENSubst150PowerTransShow;
  powerTransFilter : ENSubst150PowerTransFilter;
begin
  inherited;

  if (ENGauge150Obj.substation150Ref = nil) then Exit;

  powerTransFilter := ENSubst150PowerTransFilter.Create;
  SetNullIntProps(powerTransFilter);
  SetNullXSProps(powerTransFilter);
  powerTransFilter.substationRef := ENSubstation150Ref.Create;
  powerTransFilter.substationRef.code := ENGauge150Obj.substation150Ref.code;

  frmENSubst150PowerTransShow := TfrmENSubst150PowerTransShow.Create(Application,fmNormal,powerTransFilter);
  DisableActions([frmENSubst150PowerTransShow.actInsert, frmENSubst150PowerTransShow.actDelete,
      frmENSubst150PowerTransShow.actFilter, frmENSubst150PowerTransShow.actNoFilter]);

  try
    with frmENSubst150PowerTransShow do
    if ShowModal = mrOk then
    begin
      try
        if ENGauge150Obj.powerTransRef = nil then ENGauge150Obj.powerTransRef := ENSubst150PowerTransRef.Create;
        ENGauge150Obj.powerTransRef.code := StrToInt(GetReturnValue(sgENSubst150PowerTrans,0));
        edtENSubst150PowerTrans.Text := GetReturnValue(sgENSubst150PowerTrans,1)
          + ' / ' + GetReturnValue(sgENSubst150PowerTrans,2) + ' / ' + GetReturnValue(sgENSubst150PowerTrans,3);
      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENSubst150PowerTransShow.Free;
  end;
end;


procedure TfrmENGauge150Edit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENGauge150: ENGauge150ControllerSoapPort; isExistZeroFields: Boolean;
begin
  if (ModalResult = mrOk)
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
    begin
      isExistZeroFields := False;
      if not NoBlankValues([edtENSubst150PowerTrans]) then
        begin
          Application.MessageBox(
            PChar('Свяжите, пожалуйста, замер с силовым трансформатором.'),
            PChar('Внимание! Пустые поля недопустимы...'),
              MB_ICONWARNING + MB_OK);
          isExistZeroFields := True;
        end;
      if not NoBlankValues([edtName]) then
        begin
          Application.MessageBox(
            PChar('Назовите, пожалуйста, режимный замер.'),
            PChar('Внимание! Пустые поля недопустимы...'),
              MB_ICONWARNING + MB_OK);
          isExistZeroFields := True;
        end;
      if not NoBlankValues([dtpDateGauge]) then
        begin
          Application.MessageBox(
            PChar('Укажите, пожалуйста, дату режимного замера.'),
            PChar('Внимание! Пустые поля недопустимы...'),
              MB_ICONWARNING + MB_OK);
          isExistZeroFields := True;
        end;
      if not NoBlankValues([dtpTimeGauge]) then
        begin
          Application.MessageBox(
            PChar('Укажите, пожалуйста, время режимного замера.'),
            PChar('Внимание! Пустые поля недопустимы...'),
              MB_ICONWARNING + MB_OK);
          isExistZeroFields := True;
        end;
      if not NoBlankValues([edtTension]) then
        begin
          Application.MessageBox(
            PChar('Введите, пожалуйста, режимный замер напряжения.'),
            PChar('Внимание! Пустые поля недопустимы...'),
              MB_ICONWARNING + MB_OK);
          isExistZeroFields := True;
        end;
      if not NoBlankValues([edtCurrent]) then
        begin
          Application.MessageBox(
            PChar('Введите, пожалуйста, режимный замер силы тока.'),
            PChar('Внимание! Пустые поля недопустимы...'),
              MB_ICONWARNING + MB_OK);
          isExistZeroFields := True;
        end;

      if isExistZeroFields then
        Action := caNone
      else
        begin
          TempENGauge150 := HTTPRIOENGauge150 as ENGauge150ControllerSoapPort;

          ENGauge150Obj.name := edtName.Text;

          if dtpDateGauge.checked then
            begin
              dtpDateGauge.Time := 0;
              if dtpTimeGauge.Checked then dtpDateGauge.Time := dtpTimeGauge.Time;
              if ENGauge150Obj.dateGauge = nil then ENGauge150Obj.dateGauge := TXSDateTime.Create;
              ENGauge150Obj.dateGauge.XSToNative(GetXSDateTime(dtpDateGauge.DateTime));
            end
          else
            ENGauge150Obj.dateGauge := nil;

          if (ENGauge150Obj.tension = nil ) then
           ENGauge150Obj.tension := TXSDecimal.Create;
          if edtTension.Text <> '' then
           ENGauge150Obj.tension.decimalString := edtTension.Text
          else
           ENGauge150Obj.tension := nil;

          if (ENGauge150Obj.current = nil ) then
           ENGauge150Obj.current := TXSDecimal.Create;
          if edtCurrent.Text <> '' then
           ENGauge150Obj.current.decimalString := edtCurrent.Text
          else
           ENGauge150Obj.current := nil;

          if (ENGauge150Obj.consOwnTrans = nil ) then
           ENGauge150Obj.consOwnTrans := TXSDecimal.Create;
          if edtConsOwnTrans.Text <> '' then
           ENGauge150Obj.consOwnTrans.decimalString := edtConsOwnTrans.Text
          else
           ENGauge150Obj.consOwnTrans := nil;

          if chkIsGenSwitchDev.Checked then
            ENGauge150Obj.isGenSwitchDev := 1
          else
            ENGauge150Obj.isGenSwitchDev := Low(Integer) ;

          if DialogState = dsInsert then
          begin
            ENGauge150Obj.code:=low(Integer);
            TempENGauge150.add(ENGauge150Obj);
          end
          else
          if DialogState = dsEdit then
          begin
            TempENGauge150.save(ENGauge150Obj);
          end;
        end;
    end;
end;

end.