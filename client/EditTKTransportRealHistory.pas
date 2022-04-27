
unit EditTKTransportRealHistory;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, TKTransportRealHistoryController ;

type
  TfrmTKTransportRealHistoryEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblFinMolCode : TLabel;
    edtFinMolCode: TEdit;
    lblFinMolName : TLabel;
    edtFinMolName: TEdit;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;


  HTTPRIOTKTransportRealHistory: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  TKTransportRealHistoryObj: TKTransportRealHistory;
  
end;

var
  frmTKTransportRealHistoryEdit: TfrmTKTransportRealHistoryEdit;


implementation


{uses  
    EnergyproController, EnergyproController2, TKTransportRealHistoryController  ;
}
{$R *.dfm}



procedure TfrmTKTransportRealHistoryEdit.FormShow(Sender: TObject);

begin
  // 04.03.2012 -
  HideControls([edtFinMolCode, edtFinMolName, lblFinMolCode, lblFinMolName]);

  DisableControls([edtFinMolCode, edtFinMolName, edtCode]);

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFinMolCode
      ,edtFinMolName
      ,edtDateStart
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(TKTransportRealHistoryObj.code);
    edtFinMolCode.Text := TKTransportRealHistoryObj.finMolCode; 
    edtFinMolName.Text := TKTransportRealHistoryObj.finMolName; 
      if TKTransportRealHistoryObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(TKTransportRealHistoryObj.dateStart.Year,TKTransportRealHistoryObj.dateStart.Month,TKTransportRealHistoryObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;
      if TKTransportRealHistoryObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(TKTransportRealHistoryObj.dateFinal.Year,TKTransportRealHistoryObj.dateFinal.Month,TKTransportRealHistoryObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;


  end;
end;



procedure TfrmTKTransportRealHistoryEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempTKTransportRealHistory: TKTransportRealHistoryControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtDateStart
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempTKTransportRealHistory := HTTPRIOTKTransportRealHistory as TKTransportRealHistoryControllerSoapPort;


     //TKTransportRealHistoryObj.finMolCode := edtFinMolCode.Text;

     //TKTransportRealHistoryObj.finMolName := edtFinMolName.Text; 

     if edtdateStart.checked then
     begin 
       if TKTransportRealHistoryObj.dateStart = nil then
          TKTransportRealHistoryObj.dateStart := TXSDate.Create;
       TKTransportRealHistoryObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       TKTransportRealHistoryObj.dateStart := nil;

     if edtdateFinal.checked then
     begin 
       if TKTransportRealHistoryObj.dateFinal = nil then
          TKTransportRealHistoryObj.dateFinal := TXSDate.Create;
       TKTransportRealHistoryObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       TKTransportRealHistoryObj.dateFinal := nil;

    if DialogState = dsInsert then
    begin
      TKTransportRealHistoryObj.code:=low(Integer);
      TempTKTransportRealHistory.add(TKTransportRealHistoryObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempTKTransportRealHistory.save(TKTransportRealHistoryObj);
    end;
  end;
end;


end.