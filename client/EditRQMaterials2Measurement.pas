
unit EditRQMaterials2Measurement;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQMaterials2MeasurementController ;

type
  TfrmRQMaterials2MeasurementEdit = class(TDialogForm)

    lblCoef : TLabel;
    edtCoef: TEdit;

  lblRQMeasurementMeasurementUnitName : TLabel;
  edtRQMeasurementMeasurementUnitName : TEdit;
  spbRQMeasurementMeasurementUnit : TSpeedButton;
  

  HTTPRIORQMaterials2Measurement: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQMeasurementMeasurementUnitClick(Sender : TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmRQMaterials2MeasurementEdit: TfrmRQMaterials2MeasurementEdit;
  RQMaterials2MeasurementObj: RQMaterials2Measurement;

implementation

uses
  ShowRQMeasurement
  ,RQMeasurementController
;

{uses  
    EnergyproController, EnergyproController2, RQMaterials2MeasurementController  ;
}
{$R *.dfm}



procedure TfrmRQMaterials2MeasurementEdit.FormShow(Sender: TObject);

begin
  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCoef
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    if ( RQMaterials2MeasurementObj.coef <> nil ) then
       edtCoef.Text := RQMaterials2MeasurementObj.coef.decimalString
    else
       edtCoef.Text := ''; 

    edtRQMeasurementMeasurementUnitName.Text := RQMaterials2MeasurementObj.measurementUnit.name;

  end;
end;



procedure TfrmRQMaterials2MeasurementEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQMaterials2Measurement: RQMaterials2MeasurementControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCoef
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQMaterials2Measurement := HTTPRIORQMaterials2Measurement as RQMaterials2MeasurementControllerSoapPort;


     if (RQMaterials2MeasurementObj.coef = nil ) then
       RQMaterials2MeasurementObj.coef := TXSDecimal.Create;
     if edtCoef.Text <> '' then
       RQMaterials2MeasurementObj.coef.decimalString := edtCoef.Text 
     else
       RQMaterials2MeasurementObj.coef := nil;

    if DialogState = dsInsert then
    begin
      RQMaterials2MeasurementObj.code:=low(Integer);
      TempRQMaterials2Measurement.add(RQMaterials2MeasurementObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQMaterials2Measurement.save(RQMaterials2MeasurementObj);
    end;
  end;
end;


procedure TfrmRQMaterials2MeasurementEdit.spbRQMeasurementMeasurementUnitClick(Sender : TObject);
var 
   frmRQMeasurementShow: TfrmRQMeasurementShow;
begin
   frmRQMeasurementShow:=TfrmRQMeasurementShow.Create(Application,fmNormal);
   try
      with frmRQMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterials2MeasurementObj.measurementUnit = nil then RQMaterials2MeasurementObj.measurementUnit := RQMeasurement.Create();
               RQMaterials2MeasurementObj.measurementUnit.code := StrToInt(GetReturnValue(sgRQMeasurement,0));
               edtRQMeasurementMeasurementUnitName.Text:=GetReturnValue(sgRQMeasurement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQMeasurementShow.Free;
   end;
end;



end.