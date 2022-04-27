
unit EditENAccumulatorsHistory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAccumulatorsHistoryController ;

type
  TfrmENAccumulatorsHistoryEdit = class(TDialogForm)
  
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


  HTTPRIOENAccumulatorsHistory: THTTPRIO;

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
  frmENAccumulatorsHistoryEdit: TfrmENAccumulatorsHistoryEdit;
  ENAccumulatorsHistoryObj: ENAccumulatorsHistory;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAccumulatorsHistoryController  ;
}
{$R *.dfm}



procedure TfrmENAccumulatorsHistoryEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENAccumulatorsHistoryObj.code);
      if ENAccumulatorsHistoryObj.installDate <> nil then
      begin
        edtInstallDate.DateTime:=EncodeDate(ENAccumulatorsHistoryObj.installDate.Year,ENAccumulatorsHistoryObj.installDate.Month,ENAccumulatorsHistoryObj.installDate.Day);
        edtInstallDate.checked := true;
      end
      else
      begin
        edtInstallDate.DateTime:=SysUtils.Date;
        edtInstallDate.checked := false;
      end;
      if ENAccumulatorsHistoryObj.uninstallDate <> nil then
      begin
        edtUninstallDate.DateTime:=EncodeDate(ENAccumulatorsHistoryObj.uninstallDate.Year,ENAccumulatorsHistoryObj.uninstallDate.Month,ENAccumulatorsHistoryObj.uninstallDate.Day);
        edtUninstallDate.checked := true;
      end
      else
      begin
        edtUninstallDate.DateTime:=SysUtils.Date;
        edtUninstallDate.checked := false;
      end;
    if ( ENAccumulatorsHistoryObj.distance <> nil ) then
       edtDistance.Text := ENAccumulatorsHistoryObj.distance.decimalString
    else
       edtDistance.Text := ''; 
    edtReplacementReason.Text := ENAccumulatorsHistoryObj.replacementReason; 


  end;
end;



procedure TfrmENAccumulatorsHistoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAccumulatorsHistory: ENAccumulatorsHistoryControllerSoapPort;
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
    TempENAccumulatorsHistory := HTTPRIOENAccumulatorsHistory as ENAccumulatorsHistoryControllerSoapPort;


     if edtinstallDate.checked then
     begin 
       if ENAccumulatorsHistoryObj.installDate = nil then
          ENAccumulatorsHistoryObj.installDate := TXSDate.Create;
       ENAccumulatorsHistoryObj.installDate.XSToNative(GetXSDate(edtinstallDate.DateTime));
     end
     else
       ENAccumulatorsHistoryObj.installDate := nil;

     if edtuninstallDate.checked then
     begin 
       if ENAccumulatorsHistoryObj.uninstallDate = nil then
          ENAccumulatorsHistoryObj.uninstallDate := TXSDate.Create;
       ENAccumulatorsHistoryObj.uninstallDate.XSToNative(GetXSDate(edtuninstallDate.DateTime));
     end
     else
       ENAccumulatorsHistoryObj.uninstallDate := nil;

     if (ENAccumulatorsHistoryObj.distance = nil ) then
       ENAccumulatorsHistoryObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENAccumulatorsHistoryObj.distance.decimalString := edtDistance.Text 
     else
       ENAccumulatorsHistoryObj.distance := nil;

     ENAccumulatorsHistoryObj.replacementReason := edtReplacementReason.Text; 

    if DialogState = dsInsert then
    begin
      ENAccumulatorsHistoryObj.code:=low(Integer);
      TempENAccumulatorsHistory.add(ENAccumulatorsHistoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENAccumulatorsHistory.save(ENAccumulatorsHistoryObj);
    end;
  end;
end;


end.