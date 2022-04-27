
unit EditENTransformerChange;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENTransformerChangeController,
    ENTransformerController, EditENTransformer, ShowENTransformer,
    TKMaterialsController;

type
  TfrmENTransformerChangeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblName : TLabel;
    lblWorkOrderNumber : TLabel;
    edtWorkOrderNumber: TEdit;
    lblDateWorkOrder : TLabel;
    dtpDateWorkOrder: TDateTimePicker;
    lblActNumberGen : TLabel;
    edtActNumberGen: TEdit;
    lblActDateGen : TLabel;
    dtpActDateGen: TDateTimePicker;
    lblWorkerEquipChange : TLabel;
    edtWorkerEquipChange: TEdit;
    lblEquipChangeWorkerName: TLabel;
    edtEquipChangeWorkerName: TEdit;
  

  HTTPRIOENTransformerChange: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcChangeEquipment: TPageControl;
    tsEquipUninstall: TTabSheet;
    tsEquipInstall: TTabSheet;
    dtpUninstallDate: TDateTimePicker;
    lblUninstallDate: TLabel;
    dtpInstallDate: TDateTimePicker;
    lblInstallDate: TLabel;
    spbEquipChangeWorker: TSpeedButton;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    lblDispName: TLabel;
    edtDispName: TEdit;
    lblENTransformerTypeName: TLabel;
    edtENTransformerTypeName: TEdit;
    lblNominalPower: TLabel;
    edtNominalPower: TEdit;
    lblBuhName: TLabel;
    edtBuhName: TEdit;
    lblInvNumber: TLabel;
    edtInvNumber: TEdit;
    lblUkz: TLabel;
    edtUkz: TEdit;
    lblHighVoltage: TLabel;
    edtHighVoltage: TEdit;
    lblHighCurrent: TLabel;
    edtHighCurrent: TEdit;
    lblLowVoltage: TLabel;
    edtLowVoltage: TEdit;
    lblLowCurrent: TLabel;
    edtLowCurrent: TEdit;
    lblManufacturingdPlant: TLabel;
    edtManufacturingdPlant: TEdit;
    lblSerialNumber: TLabel;
    edtSerialNumber: TEdit;
    lblManufactureYear: TLabel;
    dtpManufactureYear: TDateTimePicker;
    lblNewMaterialsName: TLabel;
    edtNewMaterialsName: TEdit;
    lblNewDispName: TLabel;
    edtNewDispName: TEdit;
    lblNewENTransformerTypeName: TLabel;
    edtNewENTransformerTypeName: TEdit;
    lblNewNominalPower: TLabel;
    edtNewNominalPower: TEdit;
    lblNewBuhName: TLabel;
    edtNewBuhName: TEdit;
    lblNewInvNumber: TLabel;
    edtNewInvNumber: TEdit;
    lblNewUkz: TLabel;
    edtNewUkz: TEdit;
    lblNewHighVoltage: TLabel;
    edtNewHighVoltage: TEdit;
    lblNewHighCurrent: TLabel;
    edtNewHighCurrent: TEdit;
    lblNewLowVoltage: TLabel;
    edtNewLowVoltage: TEdit;
    lblNewLowCurrent: TLabel;
    edtNewLowCurrent: TEdit;
    lblNewManufacturingdPlant: TLabel;
    edtNewManufacturingdPlant: TEdit;
    lblNewSerialNumber: TLabel;
    edtNewSerialNumber: TEdit;
    lblNewManufactureYear: TLabel;
    dtpNewManufactureYear: TDateTimePicker;
    memName: TMemo;
    HTTPRIOSpr_matherial: THTTPRIO;
    HTTPRIOENTransformer: THTTPRIO;
    lblConnectGroup: TLabel;
    edtConnectGroup: TEdit;
    lblNewConnectGroup: TLabel;
    edtNewConnectGroup: TEdit;
    ActnLstChangeEquip: TActionList;
    actChangeEquip: TAction;
    actDemontageEquip: TAction;
    actMontageEquip: TAction;
    actSaveChanges: TAction;
    actChooseNewEquip: TAction;
    spbChooseNewEquip: TSpeedButton;
    spbNewTkMaterials: TSpeedButton;
    spbNewENTransformerType: TSpeedButton;
    spbNewOSSelect: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure spbEquipChangeWorkerClick(Sender : TObject);
    procedure actChangeEquipExecute(Sender: TObject);
    procedure actDemontageEquipExecute(Sender: TObject);
    procedure actMontageEquipExecute(Sender: TObject);
    procedure actSaveChangesExecute(Sender: TObject);
    procedure actChooseNewEquipExecute(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransformerChangeEdit: TfrmENTransformerChangeEdit;
  ENTransformerChangeObj, ENTransformerChangeNewObj: ENTransformerChange;
  ENTransformerOldObj, ENTransformerNewObj: ENTransformer;

implementation

uses
  ShowEquipChangeWorker
  ,EquipChangeWorkerController
  ,ENSubstation04Controller
;
{uses
    EnergyproController, EnergyproController2, ENTransformerChangeController  ;
}

{$R *.dfm}



procedure TfrmENTransformerChangeEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
begin
  //Отображение подлежащего замене трансформатора
  DisableControls([(*Заменяемый трансформатор*) edtENTransformerTypeName,
    edtBuhName, edtENTransformerTypeName, edtMaterialsName,
    edtDispName, edtNominalPower, edtInvNumber, edtUkz, edtHighVoltage,
    edtLowVoltage, edtHighCurrent, edtLowCurrent, edtManufacturingdPlant,
    edtSerialNumber, dtpManufactureYear, edtConnectGroup,
    (*Новый трансформатор*) edtNewENTransformerTypeName,
    edtNewBuhName, edtNewENTransformerTypeName, edtNewMaterialsName]);
  SetFloatStyle([(*Заменяемый трансформатор*) edtNominalPower, edtUkz,
    edtHighVoltage, edtLowVoltage, edtHighCurrent, edtLowCurrent,
    (*Новый трансформатор*)  edtNewNominalPower, edtNewUkz, edtNewHighVoltage,
    edtNewLowVoltage, edtNewHighCurrent, edtNewLowCurrent]);

  if (ENTransformerOldObj <> nil) then
    begin
      edtInvNumber.Text := ENTransformerOldObj.invNumber;
      if (ENTransformerOldObj.NominalPower <> nil) then
         edtNominalPower.Text := ENTransformerOldObj.NominalPower.DecimalString
      else
         edtNominalPower.Text := '';

      if ENTransformerOldObj.materialRef <> nil then
        begin
          if ENTransformerOldObj.materialRef.code <> Low(Integer) then
            begin
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
              Spr_matherialFilterObj := TKMaterialsFilter.Create;
              SetNullIntProps(Spr_matherialFilterObj);
              Spr_matherialFilterObj.code := ENTransformerOldObj.materialRef.code;
              Spr_matherialList :=
                TempSpr_matherial.getScrollableFilteredList(
                  Spr_matherialFilterObj, 0, -1);
              if (Spr_matherialList.totalCount > 0) then
                edtMaterialsName.Text := Spr_matherialList.list[0].name
              else
                edtMaterialsName.Text := '';
            end
        end;
      edtDispName.Text := ENTransformerOldObj.name;
      edtBuhName.Text := ENTransformerOldObj.buhName;
      edtENTransformerTypeName.Text := ENTransformerOldObj.TransformerType.name;

      if ( ENTransformerOldObj.highVoltage <> nil ) then
        edtHighVoltage.Text := ENTransformerOldObj.highVoltage.decimalString
      else
        edtHighVoltage.Text := '';
      if ( ENTransformerOldObj.lowVoltage <> nil ) then
        edtLowVoltage.Text := ENTransformerOldObj.lowVoltage.decimalString
      else
        edtLowVoltage.Text := '';
      if ( ENTransformerOldObj.highCurrent <> nil ) then
        edtHighCurrent.Text := ENTransformerOldObj.highCurrent.decimalString
      else
        edtHighCurrent.Text := '';
      if ( ENTransformerOldObj.lowCurrent <> nil ) then
        edtLowCurrent.Text := ENTransformerOldObj.lowCurrent.decimalString
      else
        edtLowCurrent.Text := '';
      if ( ENTransformerOldObj.ukz <> nil ) then
        edtUkz.Text := ENTransformerOldObj.ukz.decimalString
      else
        edtUkz.Text := '';
      edtManufacturingdPlant.Text := ENTransformerOldObj.manufacturingdPlant;
      edtSerialNumber.Text := ENTransformerOldObj.serialNumber;
      if ENTransformerOldObj.manufactureYear <> nil then
        begin
          dtpManufactureYear.DateTime := EncodeDate(
            ENTransformerOldObj.manufactureYear.Year,
            ENTransformerOldObj.manufactureYear.Month,
            ENTransformerOldObj.manufactureYear.Day);
          dtpManufactureYear.checked := true;
        end
      else
        begin
          dtpManufactureYear.DateTime := SysUtils.Date;
          dtpManufactureYear.checked := false;
        end;
      (*if ENTransformerOldObj.installDate <> nil then
        begin
          dtpInstallDate.DateTime := EncodeDate(
            ENTransformerOldObj.installDate.Year,
            ENTransformerOldObj.installDate.Month,
            ENTransformerOldObj.installDate.Day);
          dtpInstallDate.checked := true;
        end
      else
        begin
          dtpInstallDate.DateTime := SysUtils.Date;
          dtpInstallDate.checked := false;
        end;
      if ENTransformerOldObj.removalDate <> nil then
        begin
          edtRemovalDate.DateTime := EncodeDate(
            ENTransformerOldObj.removalDate.Year,
            ENTransformerOldObj.removalDate.Month,
            ENTransformerOldObj.removalDate.Day);
          edtRemovalDate.checked := true;
        end
      else
        begin
          edtRemovalDate.DateTime := SysUtils.Date;
          edtRemovalDate.checked := false;
        end;*)
      edtConnectGroup.Text := ENTransformerOldObj.connectGroup;

      edtENTransformerTypeName.Text := ENTransformerOldObj.transformerType.name;
    end; //if (ENTransformerOldObj <> nil) then
  //Отображение атрибутов замены оборудования
  if DialogState = dsView then
  begin
    DisableControls([
      edtEquipChangeWorkerName
      ,spbEquipChangeWorker
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      memName
      ,edtActNumberGen
      ,dtpActDateGen
      ,edtWorkerEquipChange
     ]);
   end;

  if ((DialogState = dsEdit) or (DialogState = dsView)) and (ENTransformerChangeObj <> nil) then
  begin
      edtCode.Text := IntToStr(ENTransformerChangeObj.code);
      if Length(ENTransformerChangeObj.name) > 0 then
        memName.Text := ENTransformerChangeObj.name;
      if ENTransformerChangeObj.installDate <> nil then
        begin
          dtpInstallDate.DateTime := EncodeDate(
            ENTransformerChangeObj.installDate.Year,
            ENTransformerChangeObj.installDate.Month,
            ENTransformerChangeObj.installDate.Day);
          dtpInstallDate.checked := true;
        end
      else
        begin
          dtpInstallDate.DateTime:=SysUtils.Date;
          dtpInstallDate.checked := false;
        end;
      if ENTransformerChangeObj.uninstallDate <> nil then
      begin
        dtpUninstallDate.DateTime := EncodeDate(
          ENTransformerChangeObj.uninstallDate.Year,
          ENTransformerChangeObj.uninstallDate.Month,
          ENTransformerChangeObj.uninstallDate.Day);
        dtpUninstallDate.checked := true;
      end
      else
      begin
        dtpUninstallDate.DateTime:=SysUtils.Date;
        dtpUninstallDate.checked := false;
      end;
    edtWorkOrderNumber.Text := ENTransformerChangeObj.workOrderNumber;
      if ENTransformerChangeObj.dateWorkOrder <> nil then
      begin
        dtpDateWorkOrder.DateTime := EncodeDate(
          ENTransformerChangeObj.dateWorkOrder.Year,
          ENTransformerChangeObj.dateWorkOrder.Month,
          ENTransformerChangeObj.dateWorkOrder.Day);
        dtpDateWorkOrder.checked := true;
      end
      else
      begin
        dtpDateWorkOrder.DateTime:=SysUtils.Date;
        dtpDateWorkOrder.checked := false;
      end;
    edtActNumberGen.Text := ENTransformerChangeObj.actNumberGen;
      if ENTransformerChangeObj.actDateGen <> nil then
      begin
        dtpActDateGen.DateTime := EncodeDate(
          ENTransformerChangeObj.actDateGen.Year,
          ENTransformerChangeObj.actDateGen.Month,
          ENTransformerChangeObj.actDateGen.Day);
        dtpActDateGen.checked := true;
      end
      else
      begin
        dtpActDateGen.DateTime:=SysUtils.Date;
        dtpActDateGen.checked := false;
      end;
    edtWorkerEquipChange.Text := ENTransformerChangeObj.workerEquipChange;
    if ENTransformerChangeObj.worker <> nil then
      edtEquipChangeWorkerName.Text := ENTransformerChangeObj.worker.name;
  end; //if ((DialogState = dsEdit) or (DialogState = dsView)) and (ENTransformerChangeObj <> nil) then
end;



procedure TfrmENTransformerChangeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENTransformerChange: ENTransformerChangeControllerSoapPort;
begin
  if ((ModalResult = mrOk) or (ModalResult = mrYes) or (ModalResult = mrNo))
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      memName
      ,edtActNumberGen
      ,edtWorkerEquipChange
      ,dtpDateWorkOrder
      ,dtpActDateGen
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action := caNone;
  end
  else
  begin
     //TempENTransformerChange := HTTPRIOENTransformerChange as ENTransformerChangeControllerSoapPort;
     if (ModalResult = mrOk) or (ModalResult = mrNo) then
     begin
     if ENTRansformerChangeObj <> nil then
       begin
         if (ENTransformerOldObj <> nil) then
           begin
             if ENTransformerChangeObj.transformerRef = nil then
               ENTransformerChangeObj.transformerRef := ENTransformerRef.Create;
             ENTransformerChangeObj.transformerRef.code := ENTransformerOldObj.code;
             if ENTRansformerChangeObj.substation04Ref = nil then
               ENTRansformerChangeObj.substation04Ref := ENSubstation04Ref.Create;
             if ENTransformerOldObj.substation04Ref <> nil then
               if ENTransformerOldObj.substation04Ref.code <> low(Integer) then
                 ENTRansformerChangeObj.substation04Ref.code :=
                   ENTransformerOldObj.substation04Ref.code;
           end;

         ENTransformerChangeObj.name := memName.Text;

         if dtpUninstallDate.checked then
         begin
           if ENTransformerChangeObj.uninstallDate = nil then
              ENTransformerChangeObj.uninstallDate := TXSDate.Create;
           ENTransformerChangeObj.uninstallDate.XSToNative(
             GetXSDate(dtpUninstallDate.DateTime));
         end
         else
           ENTransformerChangeObj.uninstallDate := nil;

         ENTransformerChangeObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENTransformerChangeObj.dateWorkOrder = nil then
              ENTransformerChangeObj.dateWorkOrder := TXSDate.Create;
           ENTransformerChangeObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENTransformerChangeObj.dateWorkOrder := nil;

         ENTransformerChangeObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENTransformerChangeObj.actDateGen = nil then
              ENTransformerChangeObj.actDateGen := TXSDate.Create;
           ENTransformerChangeObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENTransformerChangeObj.actDateGen := nil;

         ENTransformerChangeObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ENTRansformerChangeObj <> nil then
     end; //if (ModalResult = mrOk) or (ModalResult = mrNo) then

     if (ModalResult = mrOk) or (ModalResult = mrYes) then
     begin
     if ENTRansformerChangeNewObj <> nil then
       begin
         if (ENTransformerNewObj <> nil) then
           begin
             if ENTransformerChangeNewObj.transformerRef = nil then
               ENTransformerChangeNewObj.transformerRef := ENTransformerRef.Create;
             ENTransformerChangeNewObj.transformerRef.code := ENTransformerNewObj.code;
             (*if ENTRansformerChangeNewObj.substation04Ref = nil then
               ENTRansformerChangeNewObj.substation04Ref := ENSubstation04Ref.Create;
             if ENTransformerNewObj.substation04Ref <> nil then
               if ENTransformerNewObj.substation04Ref.code <> low(Integer) then
                 ENTRansformerChangeNewObj.substation04Ref.code :=
                   ENTransformerNewObj.substation04Ref.code;*)
           end;

         ENTransformerChangeNewObj.name := memName.Text;

         if dtpInstallDate.checked then
           begin
             if ENTransformerChangeNewObj.installDate = nil then
                ENTransformerChangeNewObj.installDate := TXSDate.Create;
             ENTransformerChangeNewObj.installDate.XSToNative(
               GetXSDate(dtpInstallDate.DateTime));
           end
         else
           ENTransformerChangeNewObj.installDate := nil;

         ENTransformerChangeNewObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENTransformerChangeNewObj.dateWorkOrder = nil then
              ENTransformerChangeNewObj.dateWorkOrder := TXSDate.Create;
           ENTransformerChangeNewObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENTransformerChangeNewObj.dateWorkOrder := nil;

         ENTransformerChangeNewObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENTransformerChangeNewObj.actDateGen = nil then
              ENTransformerChangeNewObj.actDateGen := TXSDate.Create;
           ENTransformerChangeNewObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENTransformerChangeNewObj.actDateGen := nil;

         ENTransformerChangeNewObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ENTRansformerChangeNewObj <> nil then
     end; //if (ModalResult = mrOk) or (ModalResult = mrYes) then
  end;
end;

procedure TfrmENTransformerChangeEdit.spbEquipChangeWorkerClick(
  Sender: TObject);
var frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
  frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
  try
    with frmEquipChangeWorkerShow do
      if ShowModal = mrOk then
        begin
          try
            if ENTransformerChangeObj.worker = nil then
              ENTransformerChangeObj.worker := EquipChangeWorker.Create();
            ENTransformerChangeObj.worker.code :=
              StrToInt(GetReturnValue(sgEquipChangeWorker,0));
            edtEquipChangeWorkerName.Text :=
              GetReturnValue(sgEquipChangeWorker,1);
          except
            on EConvertError do Exit;
          end;
        end;
  finally
    frmEquipChangeWorkerShow.Free;
  end;
end;

//Процедуры замены оборудования
procedure TfrmENTransformerChangeEdit.actChangeEquipExecute(
  Sender: TObject);
begin
  //pcChangeEquipment.Pages[0].Visible := False;
  //tsEquipUninstall.Visible := False;
  //pcChangeEquipment.Pages[0].Enabled := False;
  //tsEquipUninstall.Enabled := False;
  if not(dtpUninstallDate.Checked) then
    begin
      frmENTransformerChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия трансформатора должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  //ShowMessage('Замена трансформатора');
  tsEquipInstall.TabVisible := True;
  actChooseNewEquip.Enabled := True;
  pcChangeEquipment.ActivePage := tsEquipInstall;
  btnOk.Action := ActnLstChangeEquip.Actions[2]
end;

procedure TfrmENTransformerChangeEdit.actDemontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENTransformerChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия трансформатора должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  //ShowMessage('Демонтаж трансформатора');
end;

procedure TfrmENTransformerChangeEdit.actMontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpInstallDate.Checked) then
    begin
      frmENTransformerChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата установки трансформатора должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      dtpInstallDate.SetFocus;
      Exit;
    end;
  if ENTransformerNewObj = nil then
    begin
      frmENTransformerChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Необходимо указать новое оборудование.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      Exit;
    end;
  actChooseNewEquip.Enabled := True;
  //ShowMessage('Установка трансформатора');
  btnOk.Action := ActnLstChangeEquip.Actions[3];
end;

procedure TfrmENTransformerChangeEdit.actSaveChangesExecute(
  Sender: TObject);
begin
  frmENTransformerChangeEdit.ModalResult := mrOk;
end;

procedure TfrmENTransformerChangeEdit.actChooseNewEquipExecute(
  Sender: TObject);
Var TempENTransformer: ENTransformerControllerSoapPort;
  ENTransformerFilterObj: ENTransformerFilter;
  fENTransformerShow: TfrmENTransformerShow;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
begin
  ENTransformerFilterObj := ENTransformerFilter.Create;
  SetNullIntProps(ENTransformerFilterObj);
  SetNullXSProps(ENTransformerFilterObj);
  ENTransformerFilterObj.conditionSQL :=
    ' COALESCE(ENTRANSFORMER.SUBSTATION04REFCODE, 0) = 0';

  fENTransformerShow := TfrmENTransformerShow.Create(
    Application, fmNormal, ENTransformerFilterObj);
  try
    fENTransformerShow.actInsert.Enabled := False;
    fENTransformerShow.actEdit.Enabled := False;
    fENTransformerShow.actDelete.Enabled := False;
    if fENTransformerShow.ShowModal = mrOk then
      begin
        TempENTransformer :=
          HTTPRIOENTransformer as ENTransformerControllerSoapPort;
        try
          with fENTransformerShow do
            ENTransformerNewObj := TempENTransformer.getObject(StrToInt(
              sgENTransformer.Cells[0, sgENTransformer.Row]));

          if (ENTransformerNewObj <> nil) then
            begin //Заполнение полей для устанавливаемого объекта
              edtNewInvNumber.Text := ENTransformerNewObj.invNumber;
              if (ENTransformerNewObj.NominalPower <> nil) then
                 edtNewNominalPower.Text := ENTransformerNewObj.NominalPower.DecimalString
              else
                 edtNewNominalPower.Text := '';

              if ENTransformerNewObj.materialRef <> nil then
                begin
                  if ENTransformerNewObj.materialRef.code <> Low(Integer) then
                    begin
                      TempSpr_matherial :=
                        HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                      Spr_matherialFilterObj := TKMaterialsFilter.Create;
                      SetNullIntProps(Spr_matherialFilterObj);
                      Spr_matherialFilterObj.code := ENTransformerNewObj.materialRef.code;
                      Spr_matherialList :=
                        TempSpr_matherial.getScrollableFilteredList(
                          Spr_matherialFilterObj, 0, -1);
                      if (Spr_matherialList.totalCount > 0) then
                        edtNewMaterialsName.Text := Spr_matherialList.list[0].name
                      else
                        edtNewMaterialsName.Text := '';
                    end
                end;
              edtNewDispName.Text := ENTransformerNewObj.name;
              edtNewBuhName.Text := ENTransformerNewObj.buhName;
              edtNewENTransformerTypeName.Text := ENTransformerNewObj.TransformerType.name;

              if ( ENTransformerNewObj.highVoltage <> nil ) then
                edtNewHighVoltage.Text := ENTransformerNewObj.highVoltage.decimalString
              else
                edtNewHighVoltage.Text := '';
              if ( ENTransformerNewObj.lowVoltage <> nil ) then
                edtNewLowVoltage.Text := ENTransformerNewObj.lowVoltage.decimalString
              else
                edtNewLowVoltage.Text := '';
              if ( ENTransformerNewObj.highCurrent <> nil ) then
                edtNewHighCurrent.Text := ENTransformerNewObj.highCurrent.decimalString
              else
                edtNewHighCurrent.Text := '';
              if ( ENTransformerNewObj.lowCurrent <> nil ) then
                edtNewLowCurrent.Text := ENTransformerNewObj.lowCurrent.decimalString
              else
                edtNewLowCurrent.Text := '';
              if ( ENTransformerNewObj.ukz <> nil ) then
                edtNewUkz.Text := ENTransformerNewObj.ukz.decimalString
              else
                edtNewUkz.Text := '';
              edtNewManufacturingdPlant.Text := ENTransformerNewObj.manufacturingdPlant;
              edtNewSerialNumber.Text := ENTransformerNewObj.serialNumber;
              if ENTransformerNewObj.manufactureYear <> nil then
                begin
                  dtpNewManufactureYear.DateTime := EncodeDate(
                    ENTransformerNewObj.manufactureYear.Year,
                    ENTransformerNewObj.manufactureYear.Month,
                    ENTransformerNewObj.manufactureYear.Day);
                  dtpNewManufactureYear.checked := true;
                end
              else
                begin
                  dtpNewManufactureYear.DateTime := SysUtils.Date;
                  dtpNewManufactureYear.checked := false;
                end;
              (*if ENTransformerNewObj.installDate <> nil then
                begin
                  dtpInstallDate.DateTime := EncodeDate(
                    ENTransformerNewObj.installDate.Year,
                    ENTransformerNewObj.installDate.Month,
                    ENTransformerNewObj.installDate.Day);
                  dtpInstallDate.checked := true;
                end
              else
                begin
                  dtpInstallDate.DateTime := SysUtils.Date;
                  dtpInstallDate.checked := false;
                end;
              if ENTransformerNewObj.removalDate <> nil then
                begin
                  edtRemovalDate.DateTime := EncodeDate(
                    ENTransformerNewObj.removalDate.Year,
                    ENTransformerNewObj.removalDate.Month,
                    ENTransformerNewObj.removalDate.Day);
                  edtRemovalDate.checked := true;
                end
              else
                begin
                  edtRemovalDate.DateTime := SysUtils.Date;
                  edtRemovalDate.checked := false;
                end;*)
              edtNewConnectGroup.Text := ENTransformerNewObj.connectGroup;

              edtNewENTransformerTypeName.Text :=
                ENTransformerNewObj.transformerType.name;
            end; //if (ENTransformerNewObj <> nil) then
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    fENTransformerShow.Free;
  end;
end;

end.
