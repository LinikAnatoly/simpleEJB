
unit EditENAutoTiresFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENAutoTiresController ;

type
  TfrmENAutoTiresFilterEdit = class(TDialogForm)

    lblTypeName : TLabel;
    edtTypeName: TEdit;

    lblGarageNumber : TLabel;
    edtGarageNumber: TEdit;

    lblSerialNumber : TLabel;
    edtSerialNumber: TEdit;

    lblFactory : TLabel;
    edtFactory: TEdit;

    lblPotencial : TLabel;
    edtPotencial: TEdit;

    lblDistanceAll : TLabel;
    edtDistanceAll: TEdit;

    lblNominal : TLabel;
    edtNominal: TEdit;



  HTTPRIOENAutoTires: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
  grTKTransportReal: TGroupBox;
  edtInvNumber: TEdit;
  spbTKTransportReal: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbTKTransportRealClick(Sender: TObject);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENAutoTiresFilterEdit: TfrmENAutoTiresFilterEdit;
  ENAutoTiresFilterObj: ENAutoTiresFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAutoTiresController  ;
}
{$R *.dfm}


uses ShowTKTransportReal, TKTransportRealController;

var trantsportCode : Integer;


procedure TfrmENAutoTiresFilterEdit.FormShow(Sender: TObject);
begin

 DisableControls([edtInvNumber]);
 trantsportCode := Low(Integer);

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtTypeName
      ,edtGarageNumber
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtTypeName.Text := ENAutoTiresObj.typeName; 
    edtGarageNumber.Text := ENAutoTiresObj.garageNumber;
    edtSerialNumber.Text := ENAutoTiresObj.serialNumber;
    edtFactory.Text := ENAutoTiresObj.factory;

    if ( ENAutoTiresObj.potencial <> nil ) then
       edtPotencial.Text := ENAutoTiresObj.potencial.decimalString
    else
       edtPotencial.Text := '';

    if ( ENAutoTiresObj.distanceAll <> nil ) then
       edtDistanceAll.Text := ENAutoTiresObj.distanceAll.decimalString
    else
       edtDistanceAll.Text := '';

    edtNominal.Text := ENAutoTiresObj.nominal;
  end;
}

end;



procedure TfrmENAutoTiresFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAutoTires: ENAutoTiresControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAutoTiresFilterObj.typeName := edtTypeName.Text; 
     ENAutoTiresFilterObj.garageNumber := edtGarageNumber.Text;
     ENAutoTiresFilterObj.serialNumber := edtSerialNumber.Text;
     ENAutoTiresFilterObj.factory := edtFactory.Text;

     if (ENAutoTiresFilterObj.potencial = nil ) then
       ENAutoTiresFilterObj.potencial := TXSDecimal.Create;
     if edtPotencial.Text <> '' then
       ENAutoTiresFilterObj.potencial.decimalString := edtPotencial.Text
     else
       ENAutoTiresFilterObj.potencial := nil;

     if (ENAutoTiresFilterObj.distanceAll = nil ) then
       ENAutoTiresFilterObj.distanceAll := TXSDecimal.Create;
     if edtDistanceAll.Text <> '' then
       ENAutoTiresFilterObj.distanceAll.decimalString := edtDistanceAll.Text 
     else
       ENAutoTiresFilterObj.distanceAll := nil;

     ENAutoTiresFilterObj.nominal := edtNominal.Text;

     if trantsportCode <> Low(Integer) then
       ENAutoTiresFilterObj.conditionSQL := 'code in (select th.tiresrefcode from enautotireshistory th '+
           ' where th.uninstalldate is null and th.transportrealrefcode = '+ IntToStr(trantsportCode) + ')';

  end;
end;


procedure TfrmENAutoTiresFilterEdit.spbTKTransportRealClick(
  Sender: TObject);
var
   frmTKTransportRealShow : TfrmTKTransportRealShow;
   f : TKTransportRealFilter;
begin
   f := TKTransportRealFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   frmTKTransportRealShow := TfrmTKTransportRealShow.Create(Application, fmNormal, f);

   try
      with frmTKTransportRealShow do
        if ShowModal = mrOk then
        begin
            try
               trantsportCode := StrToInt(GetReturnValue(sgTKTransportReal,0));
               edtInvNumber.Text := GetReturnValue(sgTKTransportReal,1) + ' : гос.номер ' + GetReturnValue(sgTKTransportReal,3);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKTransportRealShow.Free;
   end;
end;

end.