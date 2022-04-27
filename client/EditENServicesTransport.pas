
unit EditENServicesTransport;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENServicesTransportController, TKCalcTransportController
  ,TKClassificationTypeController;

type
  TfrmENServicesTransportEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblMachineHoursCount : TLabel;
    edtMachineHoursCount: TEdit;
    lblDistance : TLabel;
    edtDistance: TEdit;
    lblCostMachineHours : TLabel;
    edtCostMachineHours: TEdit;
    lblCostDistance : TLabel;
    edtCostDistance: TEdit;
    lblCostTotal : TLabel;
    edtCostTotal: TEdit;


  HTTPRIOENServicesTransport: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOTKCalcTransport: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  
  private
    classification : TKClassificationType;
	calc : TKCalcTransport;
    { Private declarations }
  public
    procedure SetTKClassificationType(value : TKClassificationType);
    { Public declarations }

end;

var
  frmENServicesTransportEdit: TfrmENServicesTransportEdit;
  ENServicesTransportObj: ENServicesTransport;

implementation


uses EditTKCalcTransport, ENConsts;
{$R *.dfm}


procedure TfrmENServicesTransportEdit.SetTKClassificationType(value : TKClassificationType);
begin
  Self.classification := value;
end;

procedure TfrmENServicesTransportEdit.FormShow(Sender: TObject);
var
  TempTKCalcTransport : TKCalcTransportControllerSoapPort;
begin

  TempTKCalcTransport := HTTPRIOTKCalcTransport as TKCalcTransportControllerSoapPort;
  
  DisableControls([edtCode]);
  
  if DialogState = dsView then
  begin
//     DisableControls([
  end;
  
  if(DialogState = dsEdit) then begin
    DisableControlChildren(Self);
	DisableControls([edtDistance, btnOk, btnCancel], false);
	if Assigned(classification) then begin
	  DisableControls([edtMachineHoursCount]
	    , (not (classification.isnotlicensedactivity = ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT)));
  if classification.isnotlicensedactivity <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT then
    edtDistance.SetFocus;
    edtDistance.SelectAll;
	end;
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      calc := TempTKCalcTransport.getObject(ENServicesTransportObj.calcTransportRef.code);  
      edtCode.Text := IntToStr(ENServicesTransportObj.code);
    if ( ENServicesTransportObj.machineHoursCount <> nil ) then
       edtMachineHoursCount.Text := ENServicesTransportObj.machineHoursCount.decimalString
    else
       edtMachineHoursCount.Text := '';
    if ( ENServicesTransportObj.distance <> nil ) then
       edtDistance.Text := ENServicesTransportObj.distance.decimalString
    else
       edtDistance.Text := '';
    if ( ENServicesTransportObj.costMachineHours <> nil ) then
       edtCostMachineHours.Text := ENServicesTransportObj.costMachineHours.decimalString
    else
       edtCostMachineHours.Text := '';
    if ( ENServicesTransportObj.costDistance <> nil ) then
       edtCostDistance.Text := ENServicesTransportObj.costDistance.decimalString
    else
       edtCostDistance.Text := '';
    if ( ENServicesTransportObj.costTotal <> nil ) then
       edtCostTotal.Text := ENServicesTransportObj.costTotal.decimalString
    else
       edtCostTotal.Text := '';

   	if Assigned(classification) then begin
  if classification.isnotlicensedactivity <> ISNOTLICENSEDACTIVITY_SERVICE_TRANSPORT then
    edtDistance.SetFocus;
    edtDistance.SelectAll;
	end;
  end;
end;



procedure TfrmENServicesTransportEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENServicesTransport: ENServicesTransportControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENServicesTransport := HTTPRIOENServicesTransport as ENServicesTransportControllerSoapPort;


     if (ENServicesTransportObj.machineHoursCount = nil ) then
       ENServicesTransportObj.machineHoursCount := TXSDecimal.Create;
     if edtMachineHoursCount.Text <> '' then
       ENServicesTransportObj.machineHoursCount.decimalString := edtMachineHoursCount.Text 
     else
       ENServicesTransportObj.machineHoursCount := nil;

     if (ENServicesTransportObj.distance = nil ) then
       ENServicesTransportObj.distance := TXSDecimal.Create;
     if edtDistance.Text <> '' then
       ENServicesTransportObj.distance.decimalString := edtDistance.Text 
     else
       ENServicesTransportObj.distance := nil;

     if (ENServicesTransportObj.costMachineHours = nil ) then
       ENServicesTransportObj.costMachineHours := TXSDecimal.Create;
     if edtCostMachineHours.Text <> '' then
       ENServicesTransportObj.costMachineHours.decimalString := edtCostMachineHours.Text 
     else
       ENServicesTransportObj.costMachineHours := nil;

     if (ENServicesTransportObj.costDistance = nil ) then
       ENServicesTransportObj.costDistance := TXSDecimal.Create;
     if edtCostDistance.Text <> '' then
       ENServicesTransportObj.costDistance.decimalString := edtCostDistance.Text 
     else
       ENServicesTransportObj.costDistance := nil;

     if (ENServicesTransportObj.costTotal = nil ) then
       ENServicesTransportObj.costTotal := TXSDecimal.Create;
     if edtCostTotal.Text <> '' then
       ENServicesTransportObj.costTotal.decimalString := edtCostTotal.Text 
     else
       ENServicesTransportObj.costTotal := nil;

    if DialogState = dsInsert then
    begin
      ENServicesTransportObj.code:=low(Integer);
      TempENServicesTransport.add(ENServicesTransportObj);
    end
    else
    if DialogState = dsEdit then
    begin
      //TempENServicesTransport.save(ENServicesTransportObj);
    end;
  end;
end;


end.