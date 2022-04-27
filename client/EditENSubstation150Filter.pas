

unit EditENSubstation150Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, ENSubstation150Controller ;

type
    TfrmENSubstation150FilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;
    lblProjectPower : TLabel;
    edtProjectPower: TEdit;
    lblBuhName : TLabel;
    edtBuhName: TEdit;
    lblInvNumber : TLabel;
    edtInvNumber: TEdit;

    lblEPVoltageNominalName : TLabel;
    edtEPVoltageNominalName: TEdit;
    spbEPVoltageNominal: TSpeedButton;


    HTTPRIOENSubstation150: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;
    edtEPRenName: TEdit;
    lblSizCode: TLabel;
    edtSizCode: TEdit;
    chbParticipateInCalculation: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure spbEPVoltageNominalClick(Sender : TObject);
    procedure spbEPRenClick(Sender: TObject);

  private
    { Private declarations }
    renCondition : string;
  public
    { Public declarations }

end;

var
  frmENSubstation150FilterEdit: TfrmENSubstation150FilterEdit;
  ENSubstation150FilterObj: ENSubstation150Filter;

implementation

uses
  ShowEPVoltageNominal
  //,EPVoltageNominalController
  ,ShowENElement
  ,ENElementController
, ShowENEPRen;

{uses  
    EnergyproController, EnergyproController2, ENSubstation150Controller  ;
}
{$R *.dfm}



procedure TfrmENSubstation150FilterEdit.FormShow(Sender: TObject);
begin
  SetFloatStyle(edtProjectPower);

  renCondition := '';
  //elementInCondition := '';

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENSubstation150Obj.name; 

    if ( ENSubstation150Obj.projectPower <> nil ) then
       edtProjectPower.Text := ENSubstation150Obj.projectPower.decimalString
    else
       edtProjectPower.Text := '';

    edtOperativeService.Text := ENSubstation150Obj.operativeService;
    edtRepairService.Text := ENSubstation150Obj.repairService;
    edtBuhName.Text := ENSubstation150Obj.buhName;
    edtInvNumber.Text := ENSubstation150Obj.invNumber;
    edtKruSerial.Text := ENSubstation150Obj.kruSerial;

    if ( ENSubstation150Obj.operativeIConst <> nil ) then
       edtOperativeIConst.Text := ENSubstation150Obj.operativeIConst.decimalString
    else
       edtOperativeIConst.Text := '';

    if ( ENSubstation150Obj.operativeIVar <> nil ) then
       edtOperativeIVar.Text := ENSubstation150Obj.operativeIVar.decimalString
    else
       edtOperativeIVar.Text := '';


    edtBattery.Text := ENSubstation150Obj.battery;
    edtORU.Text := ENSubstation150Obj.ORU;
    edtOPUType.Text := ENSubstation150Obj.OPUType;
    edtOPUMaterial.Text := ENSubstation150Obj.OPUMaterial;

    if ( ENSubstation150Obj.OPUCount <> nil ) then
       edtOPUCount.Text := ENSubstation150Obj.OPUCount.decimalString
    else
       edtOPUCount.Text := '';


    edtZRUBuildingType.Text := ENSubstation150Obj.ZRUBuildingType;
    edtZRUBuildingMaterial.Text := ENSubstation150Obj.ZRUBuildingMaterial;
    edtZRUBasementType.Text := ENSubstation150Obj.ZRUBasementType;
    edtZRUBasementMaterial.Text := ENSubstation150Obj.ZRUBasementMaterial;


    if ( ENSubstation150Obj.ZRUCount <> nil ) then
       edtZRUCount.Text := ENSubstation150Obj.ZRUCount.decimalString
    else
       edtZRUCount.Text := '';

    edtBasementTransformersType.Text := ENSubstation150Obj.basementTransformersType;
    edtBasementTransformersMaterial.Text := ENSubstation150Obj.basementTransformersMaterial;

    if ( ENSubstation150Obj.basementTransformersCount <> nil ) then
       edtBasementTransformersCount.Text := ENSubstation150Obj.basementTransformersCount.decimalString
    else
       edtBasementTransformersCount.Text := ''; 

    if ( ENSubstation150Obj.squareInFence <> nil ) then
       edtSquareInFence.Text := ENSubstation150Obj.squareInFence.decimalString
    else
       edtSquareInFence.Text := '';

    if ( ENSubstation150Obj.waterHole <> nil ) then
       edtWaterHole.Text := ENSubstation150Obj.waterHole.decimalString
    else
       edtWaterHole.Text := '';

    if ( ENSubstation150Obj.waterNet <> nil ) then
       edtWaterNet.Text := ENSubstation150Obj.waterNet.decimalString
    else
       edtWaterNet.Text := '';

    if ( ENSubstation150Obj.canalizationSink <> nil ) then
       edtCanalizationSink.Text := ENSubstation150Obj.canalizationSink.decimalString
    else
       edtCanalizationSink.Text := '';

    if ( ENSubstation150Obj.canalizationLocal <> nil ) then
       edtCanalizationLocal.Text := ENSubstation150Obj.canalizationLocal.decimalString
    else
       edtCanalizationLocal.Text := '';

    edtOilStoreData.Text := ENSubstation150Obj.oilStoreData;
    edtOilChannelData.Text := ENSubstation150Obj.oilChannelData;
    edtOilCatcherData.Text := ENSubstation150Obj.oilCatcherData;
    edtRevisionDeviceData.Text := ENSubstation150Obj.revisionDeviceData;
    edtPlumbingData.Text := ENSubstation150Obj.plumbingData;
    edtCanalizationData.Text := ENSubstation150Obj.canalizationData;
    edtHeatingData.Text := ENSubstation150Obj.heatingData;
    edtFencingData.Text := ENSubstation150Obj.fencingData;
    edtConnectionData.Text := ENSubstation150Obj.connectionData;
    edtSeparatorData.Text := ENSubstation150Obj.separatorData;
    edtShorCircuitData.Text := ENSubstation150Obj.shorCircuitData;
    edtLoadingData.Text := ENSubstation150Obj.loadingData;
    edtArchCoilData.Text := ENSubstation150Obj.archCoilData;

  end;

}

end;


procedure TfrmENSubstation150FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENSubstation150: ENSubstation150ControllerSoapPort;
  condition: String;
begin
  if (ModalResult = mrOk) then
  begin
    ENSubstation150FilterObj.name := edtName.Text;
    ENSubstation150FilterObj.buhName := edtBuhName.Text;
    ENSubstation150FilterObj.invNumber := edtInvNumber.Text;

    /////
    if edtProjectPower.Text <> '' then
    begin
     if (ENSubstation150FilterObj.projectPower = nil) then
        ENSubstation150FilterObj.projectPower := TXSDecimal.Create;
      ENSubstation150FilterObj.projectPower.DecimalString := edtProjectPower.Text;
    end
    else
      ENSubstation150FilterObj.projectPower := nil;
    //////

    condition := '';

    if chbParticipateInCalculation.Checked then begin
      AddCondition(condition, 'exists (select 1 from ad4subst150 as d where d.subs150code = ensubstation150.code)');
    end;

    if renCondition <> '' then
      AddCondition(condition, renCondition);

    if ENSubstation150FilterObj.conditionSQL <> '' then begin
      ENSubstation150FilterObj.conditionSQL := ENSubstation150FilterObj.conditionSQL + ' and ' + condition;
    end else begin
      ENSubstation150FilterObj.conditionSQL := condition;
    end;

    if edtSizCode.text <> '' then
      ENSubstation150FilterObj.sizCode := StrToInt(edtSizCode.text);
  end;
end;


procedure TfrmENSubstation150FilterEdit.spbEPVoltageNominalClick(Sender : TObject);
var 
   frmEPVoltageNominalShow: TfrmEPVoltageNominalShow;
begin
   frmEPVoltageNominalShow:=TfrmEPVoltageNominalShow.Create(Application,fmNormal);
   try
      with frmEPVoltageNominalShow do
        if ShowModal = mrOk then
        begin
            try
               if ENSubstation150FilterObj.voltage = nil then ENSubstation150FilterObj.voltage := EPVoltageNominal.Create();
               ENSubstation150FilterObj.voltage.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPVoltageNominalName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPVoltageNominalShow.Free;
   end;
end;


procedure TfrmENSubstation150FilterEdit.spbEPRenClick(Sender: TObject);
var frmEPRenShow: TfrmENEPRenShow;
begin
  frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
  try
    with frmEPRenShow do
      if ShowModal = mrOk then
      begin
        try
          edtEPRenName.Text := GetReturnValue(sgEPRen,1);
          renCondition := ' elementcode in (select e.code from enelement e where e.renrefcode = '+  GetReturnValue(sgEPRen,0) +')';
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmEPRenShow.Free;
  end;
end;

end.
