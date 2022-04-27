//Замена Измерительного Устройства на Высоковольтной и Низковольтной сторонах
unit EditENMeasurDevChange; //Трансформаторной Подстанции 10 - 6 / 0,4 кВ

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENMeasurDevChangeController,
  ENMeasurDeviceController, EditENMeasurDevice, ShowENMeasurDevice,
  TKMaterialsController;

type
  TfrmENMeasurDevChangeEdit = class(TDialogForm)


  HTTPRIOENMeasurDevChange: THTTPRIO;
    lblName: TLabel;
    lblWorkOrderNumber: TLabel;
    lblDateWorkOrder: TLabel;
    lblActNumberGen: TLabel;
    lblActDateGen: TLabel;
    lblWorkerEquipChange: TLabel;
    spbEquipChangeWorker: TSpeedButton;
    lblEquipChangeWorkerName: TLabel;
    lblCode: TLabel;
    edtWorkOrderNumber: TEdit;
    dtpDateWorkOrder: TDateTimePicker;
    edtActNumberGen: TEdit;
    dtpActDateGen: TDateTimePicker;
    edtWorkerEquipChange: TEdit;
    edtEquipChangeWorkerName: TEdit;
    edtCode: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    pcChangeEquipment: TPageControl;
    tsEquipUninstall: TTabSheet;
    lblUninstallDate: TLabel;
    dtpUninstallDate: TDateTimePicker;
    tsEquipInstall: TTabSheet;
    lblInstallDate: TLabel;
    dtpInstallDate: TDateTimePicker;
    memName: TMemo;
    ActnLstChangeEquip: TActionList;
    actChangeEquip: TAction;
    actDemontageEquip: TAction;
    actMontageEquip: TAction;
    actSaveChanges: TAction;
    actChooseNewEquip: TAction;
    lblDispName: TLabel;
    lblWorkNumber: TLabel;
    lblENScaleName: TLabel;
    lblENHighVoltageSellName: TLabel;
    lblENBranchName: TLabel;
    lblENMeasurDeviceType: TLabel;
    lblMaterialsName: TLabel;
    edtDispName: TEdit;
    edtWorkNumber: TEdit;
    edtENScaleName: TEdit;
    edtENBranchName: TEdit;
    edtENHighVoltageSellName: TEdit;
    edtENMeasurDeviceType: TEdit;
    edtMaterialsName: TEdit;
    HTTPRIOSpr_matherial: THTTPRIO;
    HTTPRIOENMeasurDevice: THTTPRIO;
    lblNewMaterialsName: TLabel;
    edtNewMaterialsName: TEdit;
    lblNewDispName: TLabel;
    edtNewDispName: TEdit;
    lblNewENMeasurDeviceType: TLabel;
    edtNewENMeasurDeviceType: TEdit;
    lblNewWorkNumber: TLabel;
    edtNewWorkNumber: TEdit;
    lblNewENScaleName: TLabel;
    edtNewENScaleName: TEdit;
    lblNewENHighVoltageSellName: TLabel;
    edtNewENHighVoltageSellName: TEdit;
    lblNewENBranchName: TLabel;
    edtNewENBranchName: TEdit;
    spbNewTkMaterials: TSpeedButton;
    spbNewENMeasurDeviceType: TSpeedButton;
    spbNewENScale: TSpeedButton;
    spbNewENHighVoltageSell: TSpeedButton;
    spbNewENBranch: TSpeedButton;
    spbChooseNewEquip: TSpeedButton;
    lblENLowVoltBoardName: TLabel;
    lblNewENLowVoltBoardName: TLabel;
    HTTPRIOENLowVoltBoard: THTTPRIO;
    HTTPRIOENBranch: THTTPRIO;
    HTTPRIOENHighVoltageSell: THTTPRIO;
    memENLowVoltBoardName: TMemo;
    memNewENLowVoltBoardName: TMemo;
    HTTPRIOENPanel: THTTPRIO;
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

var frmENMeasurDevChangeEdit: TfrmENMeasurDevChangeEdit;
  ENMeasurDevChangeObj, ENMeasurDevChangeNewObj: ENMeasurDevChange;
  ENMeasurDeviceOldObj, ENMeasurDeviceNewObj: ENMeasurDevice;

implementation

uses ShowEquipChangeWorker, EquipChangeWorkerController,
  ENHighVoltageSellController, ENBranchController, ENLowVoltBoardController,
  ENPanelController, ENTransformerController;

{$R *.dfm}

procedure TfrmENMeasurDevChangeEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENBranch: ENBranchControllerSoapPort;
  ENBranchObj, ENBranchNewObj: ENBranch;
  TempENPanel: ENPanelControllerSoapPort;
  ENPanelObj, ENPanelNewObj: ENPanel;
  TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  ENLowVoltBoardObj, ENLowVoltBoardNewObj: ENLowVoltBoard;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  ENHighVoltageSellNewObj: ENHighVoltageSell;
begin
  //Отображение подлежащего замене измерительного прибора
  DisableControls( [(*Заменяемый измерительный прибор*) edtENHighVoltageSellName,
    edtENBranchName, edtENScaleName, edtMaterialsName,
    edtENMeasurDeviceType, edtDispName, edtWorkNumber, memENLowVoltBoardName,
    (*Новый измерительный прибор*) edtNewENHighVoltageSellName,
    edtNewENBranchName, edtNewENScaleName, edtNewMaterialsName,
    edtNewENMeasurDeviceType, edtNewDispName, edtNewWorkNumber,
    memNewENLowVoltBoardName]);
  if ENMeasurDeviceOldObj <> nil then
    begin
      //edtMeasurDeviceCode.Text := IntToStr(ENMeasurDeviceOldObj.code);

      edtDispName.Text := ENMeasurDeviceOldObj.name;

      if ENMeasurDeviceOldObj.measurDeviceType <> nil then
        edtENMeasurDeviceType.Text := ENMeasurDeviceOldObj.measurDeviceType.name
      else
        edtENMeasurDeviceType.Text := '';

      edtWorkNumber.Text := ENMeasurDeviceOldObj.workNumber;

      if ENMeasurDeviceOldObj.scale <> nil then
        edtENScaleName.Text := ENMeasurDeviceOldObj.scale.name;

      if ENMeasurDeviceOldObj.highvoltageSell <> nil then
        if ENMeasurDeviceOldObj.highvoltageSell.code <> Low(Integer) then
          edtENHighVoltageSellName.Text := 'Ячейка № ' +
            ENMeasurDeviceOldObj.highvoltageSell.numberGen;

      if ENMeasurDeviceOldObj.lvbRef <> nil then
        begin
          TempENLowVoltBoard :=
            HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
          ENLowVoltBoardObj :=
            TempENLowVoltBoard.getObject(ENMeasurDeviceOldObj.lvbRef.code);
          try
            memENLowVoltBoardName.Text := ENLowVoltBoardObj.name;
          finally
            ENLowVoltBoardObj.Free;
            ENLowVoltBoardObj := nil;
          end;
        end;

      if ENMeasurDeviceOldObj.panel <> nil then
        if ENMeasurDeviceOldObj.panel.code <> low(Integer) then
          begin
            TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
            ENPanelObj :=
              TempENPanel.getObject(ENMeasurDeviceOldObj.panel.code);
            try
              if memENLowVoltBoardName.Text <> '' then
                memENLowVoltBoardName.Text := memENLowVoltBoardName.Text +
                  '. ';
              memENLowVoltBoardName.Text := memENLowVoltBoardName.Text +
                ENPanelObj.name;
            finally
              ENPanelObj.Free;
              ENPanelObj := nil;
            end;
          end;

      if ENMeasurDeviceOldObj.branch <> nil then
        edtENBranchName.Text := ENMeasurDeviceOldObj.branch.name;

      if ENMeasurDeviceOldObj.materialRef <> nil then
        if ENMeasurDeviceOldObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENMeasurDeviceOldObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
    end; //if ENMeasurDeviceOldObj <> nil then

  if ENMeasurDevChangeNewObj <> nil then
    begin
      if ENMeasurDevChangeNewObj.highVoltCellRef <> nil then
        if ENMeasurDevChangeNewObj.highVoltCellRef.code <> Low(Integer) then
          begin
            TempENHighVoltageSell :=
              HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
            ENHighVoltageSellNewObj :=
              TempENHighVoltageSell.getObject(
                ENMeasurDevChangeNewObj.highVoltCellRef.code);
            if ENHighVoltageSellNewObj <> nil then
              edtNewENHighVoltageSellName.Text := 'Ячейка № ' +
                ENHighVoltageSellNewObj.numberGen;
          end;

      if ENMeasurDevChangeNewObj.lvbRef <> nil then
        if ENMeasurDevChangeNewObj.lvbRef.code <> Low(Integer) then
          begin
            TempENLowVoltBoard :=
              HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
            ENLowVoltBoardNewObj :=
              TempENLowVoltBoard.getObject(ENMeasurDevChangeNewObj.lvbRef.code);
            try
              memNewENLowVoltBoardName.Text := ENLowVoltBoardNewObj.name;
            finally
              ENLowVoltBoardNewObj.Free;
              ENLowVoltBoardNewObj := nil;
            end;
          end;

      if ENMeasurDevChangeNewObj.pnlRef <> nil then
        if ENMeasurDevChangeNewObj.pnlRef.code <> low(Integer) then
          begin
            TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
            ENPanelNewObj :=
              TempENPanel.getObject(ENMeasurDevChangeNewObj.pnlRef.code);
            try
              if memNewENLowVoltBoardName.Text <> '' then
                memNewENLowVoltBoardName.Text :=
                  memNewENLowVoltBoardName.Text + '. ';
                memNewENLowVoltBoardName.Text :=
                  memNewENLowVoltBoardName.Text + ENPanelNewObj.name;
            finally
              ENPanelNewObj.Free;
              ENPanelNewObj := nil;
            end;
          end;

      if ENMeasurDevChangeNewObj.branchRef <> nil then
        if ENMeasurDevChangeNewObj.branchRef.code <> Low(Integer) then
          begin
            TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
            ENBranchNewObj :=
              TempENBranch.getObject(ENMeasurDevChangeNewObj.branchRef.code);
            try
              edtNewENBranchName.Text := ENBranchNewObj.name;
            finally
              ENBranchNewObj.Free;
              ENBranchNewObj := nil;
            end;
          end;
    end; //if ENMeasurDevChangeNewObj <> nil then

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

  if ((DialogState = dsEdit) or (DialogState = dsView)) and (ENMeasurDevChangeObj <> nil) then
  begin
      edtCode.Text := IntToStr(ENMeasurDevChangeObj.code);
      if Length(ENMeasurDevChangeObj.name) > 0 then
        memName.Text := ENMeasurDevChangeObj.name;
      if ENMeasurDevChangeObj.installDate <> nil then
      begin
        dtpInstallDate.DateTime := EncodeDate(
          ENMeasurDevChangeObj.installDate.Year,
          ENMeasurDevChangeObj.installDate.Month,
          ENMeasurDevChangeObj.installDate.Day);
        dtpInstallDate.checked := true;
      end
      else
      begin
        dtpInstallDate.DateTime:=SysUtils.Date;
        dtpInstallDate.checked := false;
      end;
      if ENMeasurDevChangeObj.uninstallDate <> nil then
      begin
        dtpUninstallDate.DateTime := EncodeDate(
          ENMeasurDevChangeObj.uninstallDate.Year,
          ENMeasurDevChangeObj.uninstallDate.Month,
          ENMeasurDevChangeObj.uninstallDate.Day);
        dtpUninstallDate.checked := true;
      end
      else
      begin
        dtpUninstallDate.DateTime:=SysUtils.Date;
        dtpUninstallDate.checked := false;
      end;
    edtWorkOrderNumber.Text := ENMeasurDevChangeObj.workOrderNumber;
      if ENMeasurDevChangeObj.dateWorkOrder <> nil then
      begin
        dtpDateWorkOrder.DateTime := EncodeDate(
          ENMeasurDevChangeObj.dateWorkOrder.Year,
          ENMeasurDevChangeObj.dateWorkOrder.Month,
          ENMeasurDevChangeObj.dateWorkOrder.Day);
        dtpDateWorkOrder.checked := true;
      end
      else
      begin
        dtpDateWorkOrder.DateTime:=SysUtils.Date;
        dtpDateWorkOrder.checked := false;
      end;
    edtActNumberGen.Text := ENMeasurDevChangeObj.actNumberGen;
      if ENMeasurDevChangeObj.actDateGen <> nil then
      begin
        dtpActDateGen.DateTime := EncodeDate(
          ENMeasurDevChangeObj.actDateGen.Year,
          ENMeasurDevChangeObj.actDateGen.Month,
          ENMeasurDevChangeObj.actDateGen.Day);
        dtpActDateGen.checked := true;
      end
      else
      begin
        dtpActDateGen.DateTime:=SysUtils.Date;
        dtpActDateGen.checked := false;
      end;
    edtWorkerEquipChange.Text := ENMeasurDevChangeObj.workerEquipChange; 
    if ENMeasurDevChangeObj.worker <> nil then
      edtEquipChangeWorkerName.Text := ENMeasurDevChangeObj.worker.name;
  end;
end;

procedure TfrmENMeasurDevChangeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var //TempENMeasurDevChange: ENMeasurDevChangeControllerSoapPort;
  TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort; lvbObj: ENLowVoltBoard;
  TempENPanel: ENPanelControllerSoapPort; pnlObj: ENPanel;
begin
  if ((ModalResult = mrOk) or (ModalResult = mrYes) or (ModalResult = mrNo))
  and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      memName
      ,edtActNumberGen
      ,edtWorkerEquipChange
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
     //TempENMeasurDevChange := HTTPRIOENMeasurDevChange as ENMeasurDevChangeControllerSoapPort;

     if ((ModalResult = mrOk) or (ModalResult = mrNo))
     and (ENMeasurDevChangeObj <> nil) then
       begin
         if (ENMeasurDeviceOldObj <> nil) then
           begin //Связь объекта истории со снимаемым оборудованием
             if ENMeasurDevChangeObj.measurDeviceRef = nil then
               ENMeasurDevChangeObj.measurDeviceRef := ENMeasurDeviceRef.Create;
             ENMeasurDevChangeObj.measurDeviceRef.code := ENMeasurDeviceOldObj.code;

             if ENMeasurDeviceOldObj.highvoltageSell <> nil then
               if ENMeasurDeviceOldObj.highvoltageSell.code <> low(Integer) then
                 begin
                   if ENMeasurDevChangeObj.highVoltCellRef = nil then
                     ENMeasurDevChangeObj.highVoltCellRef :=
                       ENHighVoltageSellRef.Create;
                   ENMeasurDevChangeObj.highVoltCellRef.code :=
                     ENMeasurDeviceOldObj.highvoltageSell.code;
                   if ENMeasurDeviceOldObj.highvoltageSell.transformerRef <> nil
                   then
                     if ENMeasurDeviceOldObj.highvoltageSell.transformerRef.code
                     <> low(Integer) then
                       begin
                         if ENMeasurDevChangeObj.transformerRef = nil then
                           ENMeasurDevChangeObj.transformerRef :=
                             ENTransformerRef.Create;
                         ENMeasurDevChangeObj.transformerRef.code :=
                           ENMeasurDeviceOldObj.highvoltageSell.transformerRef.code;
                       end;
                 end;

             if ENMeasurDeviceOldObj.lvbRef <> nil then
               if ENMeasurDeviceOldObj.lvbRef.code <> low(Integer) then
                 begin
                   if ENMeasurDevChangeObj.lvbRef = nil then
                     ENMeasurDevChangeObj.lvbRef := ENLowVoltBoardRef.Create;
                   ENMeasurDevChangeObj.lvbRef.code :=
                     ENMeasurDeviceOldObj.lvbRef.code;

                   TempENLowVoltBoard :=
                     HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
                   lvbObj := TempENLowVoltBoard.getObject(
                     ENMeasurDeviceOldObj.lvbRef.code);
                   try
                     if lvbObj.transformerRef <> nil then
                       if lvbObj.transformerRef.code <> low(Integer) then
                         begin
                           if ENMeasurDevChangeObj.transformerRef = nil then
                             ENMeasurDevChangeObj.transformerRef :=
                               ENTransformerRef.Create;
                           ENMeasurDevChangeObj.transformerRef.code :=
                             lvbObj.transformerRef.code;
                         end;
                   finally
                     lvbObj.Free;
                     lvbObj := nil;
                   end;
                 end;

             if ENMeasurDeviceOldObj.panel <> nil then
               if ENMeasurDeviceOldObj.panel.code <> low(Integer) then
                 begin
                   if ENMeasurDevChangeObj.pnlRef = nil then
                     ENMeasurDevChangeObj.pnlRef := ENPanelRef.Create;
                   ENMeasurDevChangeObj.pnlRef.code :=
                     ENMeasurDeviceOldObj.panel.code;

                   TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
                   pnlObj :=
                     TempENPanel.getObject(ENMeasurDeviceOldObj.panel.code);
                   try
                     if pnlObj.transformer <> nil then
                       if pnlObj.transformer.code <> low(Integer) then
                         begin
                           if ENMeasurDevChangeObj.transformerRef = nil then
                             ENMeasurDevChangeObj.transformerRef :=
                               ENTransformerRef.Create;
                           ENMeasurDevChangeObj.transformerRef.code :=
                             pnlObj.transformer.code;
                         end;
                   finally
                     pnlObj.Free;
                     pnlObj := nil;
                   end;
                 end;

             if ENMeasurDeviceOldObj.branch <> nil then
               if ENMeasurDeviceOldObj.branch.code <> low(Integer) then
                 begin
                   if ENMeasurDevChangeObj.branchRef = nil then
                     ENMeasurDevChangeObj.branchRef := ENBranchRef.Create;
                   ENMeasurDevChangeObj.branchRef.code :=
                     ENMeasurDeviceOldObj.branch.code;
                 end;
           end;

         ENMeasurDevChangeObj.name := memName.Text;

         if dtpInstallDate.checked then
         begin
           if ENMeasurDevChangeObj.installDate = nil then
              ENMeasurDevChangeObj.installDate := TXSDate.Create;
           ENMeasurDevChangeObj.installDate.XSToNative(GetXSDate(dtpInstallDate.DateTime));
         end
         else
           ENMeasurDevChangeObj.installDate := nil;

         if dtpUninstallDate.checked then
         begin
           if ENMeasurDevChangeObj.uninstallDate = nil then
              ENMeasurDevChangeObj.uninstallDate := TXSDate.Create;
           ENMeasurDevChangeObj.uninstallDate.XSToNative(GetXSDate(dtpUninstallDate.DateTime));
         end
         else
           ENMeasurDevChangeObj.uninstallDate := nil;

         ENMeasurDevChangeObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENMeasurDevChangeObj.dateWorkOrder = nil then
              ENMeasurDevChangeObj.dateWorkOrder := TXSDate.Create;
           ENMeasurDevChangeObj.dateWorkOrder.XSToNative(GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENMeasurDevChangeObj.dateWorkOrder := nil;

         ENMeasurDevChangeObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENMeasurDevChangeObj.actDateGen = nil then
              ENMeasurDevChangeObj.actDateGen := TXSDate.Create;
           ENMeasurDevChangeObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENMeasurDevChangeObj.actDateGen := nil;

         ENMeasurDevChangeObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrNo)) and (ENMeasurDevChangeObj <> nil) then
     if ((ModalResult = mrOk) or (ModalResult = mrYes))
     and (ENMeasurDevChangeNewObj <> nil) then
       begin
         if (ENMeasurDeviceNewObj <> nil) then
           begin //Связь объекта истории с устанавливаемым оборудованием
             if ENMeasurDevChangeNewObj.measurDeviceRef = nil then
               ENMeasurDevChangeNewObj.measurDeviceRef := ENMeasurDeviceRef.Create;
             ENMeasurDevChangeNewObj.measurDeviceRef.code := ENMeasurDeviceNewObj.code;

             (*if ENMeasurDevChangeNewObj.highVoltCellRef = nil then
               ENMeasurDevChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
             if ENMeasurDeviceOldNewObj.highvoltageSell <> nil then
               if ENMeasurDeviceNewObj.highvoltageSell.code <> low(Integer) then
                 ENMeasurDevChangeNewObj.highVoltCellRef.code :=
                   ENMeasurDeviceNewObj.highvoltageSell.code;
             if ENMeasurDevChangeNewObj.branchRef = nil then
               ENMeasurDevChangeNewObj.branchRef := ENBranchRef.Create;
             if ENMeasurDeviceNewObj.branch <> nil then
               if ENMeasurDeviceNewObj.branch.code <> low(Integer) then
                 ENMeasurDevChangeNewObj.branchRef.code :=
                   ENMeasurDeviceNewObj.branch.code;*)
           end;

         ENMeasurDevChangeNewObj.name := memName.Text;

         if dtpInstallDate.checked then
           begin
             if ENMeasurDevChangeNewObj.installDate = nil then
                ENMeasurDevChangeNewObj.installDate := TXSDate.Create;
             ENMeasurDevChangeNewObj.installDate.XSToNative(
               GetXSDate(dtpInstallDate.DateTime));
           end
         else
           ENMeasurDevChangeNewObj.installDate := nil;

         ENMeasurDevChangeNewObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENMeasurDevChangeNewObj.dateWorkOrder = nil then
              ENMeasurDevChangeNewObj.dateWorkOrder := TXSDate.Create;
           ENMeasurDevChangeNewObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENMeasurDevChangeNewObj.dateWorkOrder := nil;

         ENMeasurDevChangeNewObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENMeasurDevChangeNewObj.actDateGen = nil then
              ENMeasurDevChangeNewObj.actDateGen := TXSDate.Create;
           ENMeasurDevChangeNewObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENMeasurDevChangeNewObj.actDateGen := nil;
         ENMeasurDevChangeNewObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrYes)) and (ENMeasurDevChangeNewObj <> nil) then
  end;
end;


procedure TfrmENMeasurDevChangeEdit.spbEquipChangeWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENMeasurDevChangeObj.worker = nil then ENMeasurDevChangeObj.worker := EquipChangeWorker.Create();
               ENMeasurDevChangeObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
               edtEquipChangeWorkerName.Text:=GetReturnValue(sgEquipChangeWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEquipChangeWorkerShow.Free;
   end;
end;

//Процедуры замены оборудования
procedure TfrmENMeasurDevChangeEdit.actChangeEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENMeasurDevChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия измерительного прибора должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  tsEquipInstall.TabVisible := True;
  actChooseNewEquip.Enabled := True;
  pcChangeEquipment.ActivePage := tsEquipInstall;
  btnOk.Action := ActnLstChangeEquip.Actions[2]
end;

procedure TfrmENMeasurDevChangeEdit.actDemontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENMeasurDevChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия измерительного прибора должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
end;

procedure TfrmENMeasurDevChangeEdit.actMontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpInstallDate.Checked) then
    begin
      frmENMeasurDevChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата установки измерительного прибора должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      dtpInstallDate.SetFocus;
      Exit;
    end;
  if ENMeasurDeviceNewObj = nil then
    begin
      frmENMeasurDevChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Необходимо указать новое оборудование.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      Exit;
    end;
  actChooseNewEquip.Enabled := True;
  btnOk.Action := ActnLstChangeEquip.Actions[3];
end;

procedure TfrmENMeasurDevChangeEdit.actSaveChangesExecute(
  Sender: TObject);
begin
  frmENMeasurDevChangeEdit.ModalResult := mrOk;
end;

procedure TfrmENMeasurDevChangeEdit.actChooseNewEquipExecute(
  Sender: TObject);
Var TempENMeasurDevice: ENMeasurDeviceControllerSoapPort;
  ENMeasurDeviceFilterObj: ENMeasurDeviceFilter;
  fENMeasurDeviceShow: TfrmENMeasurDeviceShow;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
  //TempENBranch: ENBranchControllerSoapPort;
  //ENBranchObj: ENBranch;
begin
  ENMeasurDeviceFilterObj := ENMeasurDeviceFilter.Create;
  SetNullIntProps(ENMeasurDeviceFilterObj);
  SetNullXSProps(ENMeasurDeviceFilterObj);
  ENMeasurDeviceFilterObj.conditionSQL :=
    ' COALESCE(ENMEASURDEVICE.HIGHVOLTAGESELLCODE, 0) = 0 AND ' +
    ' COALESCE(ENMEASURDEVICE.BRANCHCODE, 0) = 0 AND ' +
    ' COALESCE(ENMEASURDEVICE.LVBREFCODE, 0) = 0 AND ' +
    ' COALESCE(ENMEASURDEVICE.PANELCODE, 0) = 0';

  fENMeasurDeviceShow := TfrmENMeasurDeviceShow.Create(
    Application, fmNormal, ENMeasurDeviceFilterObj);
  try
    fENMeasurDeviceShow.actInsert.Enabled := False;
    fENMeasurDeviceShow.actEdit.Enabled := False;
    fENMeasurDeviceShow.actDelete.Enabled := False;
    if fENMeasurDeviceShow.ShowModal = mrOk then
      begin
        TempENMeasurDevice :=
          HTTPRIOENMeasurDevice as ENMeasurDeviceControllerSoapPort;
        try
          with fENMeasurDeviceShow do
            ENMeasurDeviceNewObj := TempENMeasurDevice.getObject(StrToInt(
              sgENMeasurDevice.Cells[0, sgENMeasurDevice.Row]));

          if (ENMeasurDeviceNewObj <> nil) then
            begin //Заполнение полей для устанавливаемого объекта
              //edtNewMeasurDeviceCode.Text := IntToStr(ENMeasurDeviceNewObj.code);

              edtNewDispName.Text := ENMeasurDeviceNewObj.name;

              if ENMeasurDeviceNewObj.measurDeviceType <> nil then
                edtNewENMeasurDeviceType.Text := ENMeasurDeviceNewObj.measurDeviceType.name
              else
                edtNewENMeasurDeviceType.Text := '';

              edtNewWorkNumber.Text := ENMeasurDeviceNewObj.workNumber;

              if ENMeasurDeviceNewObj.scale <> nil then
                edtNewENScaleName.Text := ENMeasurDeviceNewObj.scale.name;

              if ENMeasurDeviceNewObj.branch <> nil then
                edtNewENBranchName.Text := ENMeasurDeviceNewObj.branch.name;

              if ENMeasurDeviceNewObj.highvoltageSell <> nil then
                if ENMeasurDeviceNewObj.highvoltageSell.code <> Low(Integer) then
                  edtNewENHighVoltageSellName.Text := 'Ячейка № ' +
                    ENMeasurDeviceNewObj.highvoltageSell.numberGen;

              if ENMeasurDeviceNewObj.materialRef <> nil then
                if ENMeasurDeviceNewObj.materialRef.code <> Low(Integer) then
                  begin
                    TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    Spr_matherialFilterObj := TKMaterialsFilter.Create;
                    SetNullIntProps(Spr_matherialFilterObj);
                    Spr_matherialFilterObj.code := ENMeasurDeviceNewObj.materialRef.code;
                    Spr_matherialList :=
                      TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
                    if (Spr_matherialList.totalCount > 0) then
                      edtNewMaterialsName.Text := Spr_matherialList.list[0].name
                    else
                      edtNewMaterialsName.Text := '';
                  end;
            end; //if (ENMeasurDeviceNewObj <> nil) then
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    fENMeasurDeviceShow.Free;
  end;
end;

end.
