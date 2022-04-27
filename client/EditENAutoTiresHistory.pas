
unit EditENAutoTiresHistory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAutoTiresHistoryController ;

type
  TfrmENAutoTiresHistoryEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblInstallDate : TLabel;
    edtInstallDate: TDateTimePicker;
    lblUninstallDate : TLabel;
    edtUninstallDate: TDateTimePicker;
    lblDistance : TLabel;
    edtDistance: TEdit;
    lblReplacementReason : TLabel;
    edtReplacementReason: TEdit;


  HTTPRIOENAutoTiresHistory: THTTPRIO;

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
  frmENAutoTiresHistoryEdit: TfrmENAutoTiresHistoryEdit;
  ENAutoTiresHistoryObj: ENAutoTiresHistory;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAutoTiresHistoryController  ;
}
{$R *.dfm}



procedure TfrmENAutoTiresHistoryEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENAutoTiresHistoryObj.code);
      if ENAutoTiresHistoryObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENAutoTiresHistoryObj.installDate.Year,ENAutoTiresHistoryObj.installDate.Month,ENAutoTiresHistoryObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;
      if ENAutoTiresHistoryObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENAutoTiresHistoryObj.uninstallDate.Year,ENAutoTiresHistoryObj.uninstallDate.Month,ENAutoTiresHistoryObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;
    if ( ENAutoTiresHistoryObj.distance <> nil ) then
       edtDistance.Text := ENAutoTiresHistoryObj.distance.decimalString
    else
       edtDistance.Text := ''; 
    edtReplacementReason.Text := ENAutoTiresHistoryObj.replacementReason; 


  end;
end;



procedure TfrmENAutoTiresHistoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAutoTiresHistory: ENAutoTiresHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENAutoTiresHistory := HTTPRIOENAutoTiresHistory as ENAutoTiresHistoryControllerSoapPort;


     if edtinstallDate.checked then
     begin 
       if ENAutoTiresHistoryObj.installDate = nil then
          ENAutoTiresHistoryObj.installDate := TXSDate.Create;
       ENAutoTiresHistoryObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENAutoTiresHistoryObj.installDate := nil;

     if edtuninstallDate.checked then
     begin 
       if ENAutoTiresHistoryObj.uninstallDate = nil then
          ENAutoTiresHistoryObj.uninstallDate := TXSDate.Create;
       ENAutoTiresHistoryObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENAutoTiresHistoryObj.uninstallDate := nil;

     if (ENAutoTiresHistoryObj.distance = nil ) then
       ENAutoTiresHistoryObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENAutoTiresHistoryObj.distance.decimalString := edtDistance.Text 
     else
       ENAutoTiresHistoryObj.distance := nil;

     ENAutoTiresHistoryObj.replacementReason := edtReplacementReason.Text; 

    if DialogState = dsInsert then
    begin
      ENAutoTiresHistoryObj.code:=low(Integer);
      TempENAutoTiresHistory.add(ENAutoTiresHistoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAutoTiresHistory.save(ENAutoTiresHistoryObj);
    end;
  end;
end;


end.