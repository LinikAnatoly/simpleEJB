
unit EditENConnectionTariffEntry;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENConnectionTariffEntryController ;

type
  TfrmENConnectionTariffEntryEdit = class(TDialogForm)
  
    lblCode : TLabel;
    edtCode : TEdit;
    lblValue : TLabel;
    edtValue: TEdit;
    lblStartDate : TLabel;
    edtStartDate: TDateTimePicker;

  lblENConnectionTariffTariffRefName : TLabel;
  edtENConnectionTariffTariffRefName : TEdit;
  spbENConnectionTariffTariffRef : TSpeedButton;
  

  HTTPRIOENConnectionTariffEntry: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOENConnectionTariff: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENConnectionTariffTariffRefClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENConnectionTariffEntryEdit: TfrmENConnectionTariffEntryEdit;
  ENConnectionTariffEntryObj: ENConnectionTariffEntry;

implementation

uses
  ShowENConnectionTariff
  ,ENConnectionTariffController
;

{uses  
    EnergyproController, EnergyproController2, ENConnectionTariffEntryController  ;
}
{$R *.dfm}



procedure TfrmENConnectionTariffEntryEdit.FormShow(Sender: TObject);
var
  TempENConnectionTariff : ENConnectionTariffControllerSoapPort;
begin

  DisableControls([edtCode]);
  SetFloatStyle([edtValue]);

  if DialogState = dsView then
  begin
    DisableControls([edtENConnectionTariffTariffRefName, spbENConnectionTariffTariffRef]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtValue, edtStartDate]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ENConnectionTariffEntryObj.tariffRef <> nil then
      if ENConnectionTariffEntryObj.tariffRef.code <> low(Integer) then
      begin
        TempENConnectionTariff := HTTPRIOENConnectionTariff as ENConnectionTariffControllerSoapPort;
        edtENConnectionTariffTariffRefName.Text := TempENConnectionTariff.getObject(ENConnectionTariffEntryObj.tariffRef.code).name;
      end;

      edtCode.Text := IntToStr(ENConnectionTariffEntryObj.code);
    if ( ENConnectionTariffEntryObj.value <> nil ) then
       edtValue.Text := ENConnectionTariffEntryObj.value.decimalString
    else
       edtValue.Text := ''; 
      if ENConnectionTariffEntryObj.startDate <> nil then
      begin
        edtStartDate.DateTime:=EncodeDate(ENConnectionTariffEntryObj.startDate.Year,ENConnectionTariffEntryObj.startDate.Month,ENConnectionTariffEntryObj.startDate.Day);
        edtStartDate.checked := true;
      end
      else
      begin
        edtStartDate.DateTime:=SysUtils.Date;
        edtStartDate.checked := false;
      end;

    // edtENConnectionTariffTariffRefName.Text := ENConnectionTariffEntryObj.tariffRef.name;

  end;
end;



procedure TfrmENConnectionTariffEntryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionTariffEntry: ENConnectionTariffEntryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtValue
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENConnectionTariffEntry := HTTPRIOENConnectionTariffEntry as ENConnectionTariffEntryControllerSoapPort;


     if (ENConnectionTariffEntryObj.value = nil ) then
       ENConnectionTariffEntryObj.value := TXSDecimal.Create;
     if edtValue.Text <> '' then
       ENConnectionTariffEntryObj.value.decimalString := edtValue.Text 
     else
       ENConnectionTariffEntryObj.value := nil;

     if edtstartDate.checked then
     begin 
       if ENConnectionTariffEntryObj.startDate = nil then
          ENConnectionTariffEntryObj.startDate := TXSDate.Create;
       ENConnectionTariffEntryObj.startDate.XSToNative(GetXSDate(edtstartDate.DateTime));
     end
     else
       ENConnectionTariffEntryObj.startDate := nil;


    if DialogState = dsInsert then
    begin
      ENConnectionTariffEntryObj.code:=low(Integer);
      TempENConnectionTariffEntry.add(ENConnectionTariffEntryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENConnectionTariffEntry.save(ENConnectionTariffEntryObj);
    end;
  end;
end;


procedure TfrmENConnectionTariffEntryEdit.spbENConnectionTariffTariffRefClick(Sender : TObject);
var 
   frmENConnectionTariffShow: TfrmENConnectionTariffShow;
begin
   frmENConnectionTariffShow:=TfrmENConnectionTariffShow.Create(Application,fmNormal);
   try
      with frmENConnectionTariffShow do
        if ShowModal = mrOk then
        begin
            try
               if ENConnectionTariffEntryObj.tariffRef = nil then ENConnectionTariffEntryObj.tariffRef := ENConnectionTariffRef.Create();
               ENConnectionTariffEntryObj.tariffRef.code := StrToInt(GetReturnValue(sgENConnectionTariff,0));
               edtENConnectionTariffTariffRefName.Text:=GetReturnValue(sgENConnectionTariff,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENConnectionTariffShow.Free;
   end;
end;



end.