
unit EditRQMaterials2MeasurementFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQMaterials2MeasurementController ;

type
  TfrmRQMaterials2MeasurementFilterEdit = class(TDialogForm)

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
  frmRQMaterials2MeasurementFilterEdit: TfrmRQMaterials2MeasurementFilterEdit;
  RQMaterials2MeasurementFilterObj: RQMaterials2MeasurementFilter;

implementation

uses
  ShowRQMeasurement
  ,RQMeasurementController
;

{uses  
    EnergyproController, EnergyproController2, RQMaterials2MeasurementController  ;
}
{$R *.dfm}



procedure TfrmRQMaterials2MeasurementFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

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


  end;

}

end;



procedure TfrmRQMaterials2MeasurementFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempRQMaterials2Measurement: RQMaterials2MeasurementControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin

     if (RQMaterials2MeasurementFilterObj.coef = nil ) then
       RQMaterials2MeasurementFilterObj.coef := TXSDecimal.Create;
     RQMaterials2MeasurementFilterObj.coef.decimalString := edtCoef.Text ;




  end;
end;

procedure TfrmRQMaterials2MeasurementFilterEdit.spbRQMeasurementMeasurementUnitClick(Sender : TObject);
var 
   frmRQMeasurementShow: TfrmRQMeasurementShow;
begin
   frmRQMeasurementShow:=TfrmRQMeasurementShow.Create(Application,fmNormal);
   try
      with frmRQMeasurementShow do
        if ShowModal = mrOk then
        begin
            try
               if RQMaterials2MeasurementFilterObj.measurementUnit = nil then RQMaterials2MeasurementFilterObj.measurementUnit := RQMeasurement.Create();
               RQMaterials2MeasurementFilterObj.measurementUnit.code := StrToInt(GetReturnValue(sgRQMeasurement,0));
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