
unit EditENEstimateItemStatusHistory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENEstimateItemStatusHistoryController ;

type
  TfrmENEstimateItemStatusHistoryEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblIsLast : TLabel;
    edtIsLast: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;


  HTTPRIOENEstimateItemStatusHistory: THTTPRIO;

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
  frmENEstimateItemStatusHistoryEdit: TfrmENEstimateItemStatusHistoryEdit;
  ENEstimateItemStatusHistoryObj: ENEstimateItemStatusHistory;

implementation


{uses  
    EnergyproController, EnergyproController2, ENEstimateItemStatusHistoryController  ;
}
{$R *.dfm}



procedure TfrmENEstimateItemStatusHistoryEdit.FormShow(Sender: TObject);

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
      edtCode.Text := IntToStr(ENEstimateItemStatusHistoryObj.code);
    if ( ENEstimateItemStatusHistoryObj.isLast <> Low(Integer) ) then
       edtIsLast.Text := IntToStr(ENEstimateItemStatusHistoryObj.isLast)
    else
       edtIsLast.Text := '';
      if ENEstimateItemStatusHistoryObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENEstimateItemStatusHistoryObj.dateEdit.Year,ENEstimateItemStatusHistoryObj.dateEdit.Month,ENEstimateItemStatusHistoryObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;


  end;
end;



procedure TfrmENEstimateItemStatusHistoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENEstimateItemStatusHistory: ENEstimateItemStatusHistoryControllerSoapPort;
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
    TempENEstimateItemStatusHistory := HTTPRIOENEstimateItemStatusHistory as ENEstimateItemStatusHistoryControllerSoapPort;


     if ( edtIsLast.Text <> '' ) then
       ENEstimateItemStatusHistoryObj.isLast := StrToInt(edtIsLast.Text)
     else
       ENEstimateItemStatusHistoryObj.isLast := Low(Integer) ;

     if edtdateEdit.checked then
     begin 
       if ENEstimateItemStatusHistoryObj.dateEdit = nil then
          ENEstimateItemStatusHistoryObj.dateEdit := TXSDateTime.Create;
       ENEstimateItemStatusHistoryObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENEstimateItemStatusHistoryObj.dateEdit := nil;	   

    if DialogState = dsInsert then
    begin
      ENEstimateItemStatusHistoryObj.code:=low(Integer);
      TempENEstimateItemStatusHistory.add(ENEstimateItemStatusHistoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENEstimateItemStatusHistory.save(ENEstimateItemStatusHistoryObj);
    end;
  end;
end;


end.