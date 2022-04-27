
unit EditENDelayServices;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENDelayServicesController ;

type
  TfrmENDelayServicesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;


  HTTPRIOENDelayServices: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENDelayServicesEdit: TfrmENDelayServicesEdit;
  ENDelayServicesObj: ENDelayServices;

implementation


{uses  
    EnergyproController, EnergyproController2, ENDelayServicesController  ;
}
{$R *.dfm}



procedure TfrmENDelayServicesEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  // SetIntStyle(edtWorkDaysCount);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDateStart
      ,edtDateFinal
      //,edtWorkDaysCount
     ]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENDelayServicesObj.code);

    if ENDelayServicesObj.dateStart <> nil then
    begin
      edtDateStart.DateTime := EncodeDate(ENDelayServicesObj.dateStart.Year, ENDelayServicesObj.dateStart.Month, ENDelayServicesObj.dateStart.Day);
      edtDateStart.Checked := true;
    end
    else begin
      edtDateStart.DateTime := SysUtils.Date;
      edtDateStart.Checked := false;
    end;

    if ENDelayServicesObj.dateFinal <> nil then
    begin
      edtDateFinal.DateTime := EncodeDate(ENDelayServicesObj.dateFinal.Year, ENDelayServicesObj.dateFinal.Month, ENDelayServicesObj.dateFinal.Day);
      edtDateFinal.Checked := true;
    end
    else
    begin
      edtDateFinal.DateTime := SysUtils.Date;
      edtDateFinal.Checked := false;
    end;

    MakeMultiline(edtCommentGen.Lines, ENDelayServicesObj.commentGen);

    {
    if ( ENDelayServicesObj.workDaysCount <> Low(Integer) ) then
       edtWorkDaysCount.Text := IntToStr(ENDelayServicesObj.workDaysCount)
    else
       edtWorkDaysCount.Text := '';
    }
  end;
end;



procedure TfrmENDelayServicesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENDelayServices: ENDelayServicesControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  {if (not NoBlankValues([
      edtWorkDaysCount
     ]) and (edtDateStart.Checked = false) and (edtDateFinal.Checked = false))  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end}
  begin
    if not edtDateStart.Checked then
    begin
      Application.MessageBox(PChar('Введите дату начала задержки!'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      edtDateStart.SetFocus;
      Action := caNone;
      Exit;
    end;

    if not edtDateFinal.Checked then
    begin
      Application.MessageBox(PChar('Введите дату окончания задержки!'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      edtDateFinal.SetFocus;
      Action := caNone;
      Exit;
    end;

    if (edtdateStart.DateTime > edtdateFinal.DateTime) then
    begin
      Application.MessageBox(PChar('Дата начала задержки не может быть больше даты окончания!'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    {
    if ((edtdateFinal.DateTime - edtdateStart.DateTime) < StrToInt(edtWorkDaysCount.Text) ) then
    begin
        Application.MessageBox(PChar('Введенное количество рабочих дней больше количества календарных в выбранном периоде!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
        Exit;
    end;
    }

     if edtDateStart.Checked then
     begin
       if ENDelayServicesObj.dateStart = nil then
          ENDelayServicesObj.dateStart := TXSDate.Create;
       ENDelayServicesObj.dateStart.XSToNative(GetXSDate(edtDateStart.DateTime));
     end
     else
       ENDelayServicesObj.dateStart := nil;

     if edtDateFinal.Checked then
     begin
       if ENDelayServicesObj.dateFinal = nil then
          ENDelayServicesObj.dateFinal := TXSDate.Create;
       ENDelayServicesObj.dateFinal.XSToNative(GetXSDate(edtDateFinal.DateTime));
     end
     else
       ENDelayServicesObj.dateFinal := nil;

     ENDelayServicesObj.commentGen := edtCommentGen.Text;

     {
     if ( edtWorkDaysCount.Text <> '' ) then
       ENDelayServicesObj.workDaysCount := StrToInt(edtWorkDaysCount.Text)
     else
       ENDelayServicesObj.workDaysCount := Low(Integer) ;
     }

    TempENDelayServices := HTTPRIOENDelayServices as ENDelayServicesControllerSoapPort;

    if DialogState = dsInsert then
    begin
      ENDelayServicesObj.code := Low(Integer);
      TempENDelayServices.add(ENDelayServicesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENDelayServices.save(ENDelayServicesObj);
    end;

  end;
end;


end.