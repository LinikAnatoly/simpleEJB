//Замена Автоматического Выключателя на Высоковольтной и Низковольтной сторонах
unit EditENAutomatChange; //Трансформаторной Подстанции 10 - 6 / 0,4 кВ

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENAutomatChangeController,
  ENAutomatController, EditENAutomat, ShowENAutomat, TKMaterialsController;

type
  TfrmENAutomatChangeEdit = class(TDialogForm)
  

  HTTPRIOENAutomatChange: THTTPRIO;
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
    ActnLstChangeEquip: TActionList;
    actChangeEquip: TAction;
    actDemontageEquip: TAction;
    actMontageEquip: TAction;
    actSaveChanges: TAction;
    actChooseNewEquip: TAction;
    memName: TMemo;
    spbChooseNewEquip: TSpeedButton;
    HTTPRIOENAutomat: THTTPRIO;
    HTTPRIOENBranch: THTTPRIO;
    HTTPRIOSpr_matherial: THTTPRIO;
    lblDispName: TLabel;
    lblMarkCurrent: TLabel;
    lblThermalSplitterCurrent: TLabel;
    lblBranch: TLabel;
    lblMaterialsName: TLabel;
    edtDispName: TEdit;
    edtMarkCurrent: TEdit;
    edtThermalSplitterCurrent: TEdit;
    edtENBranchName: TEdit;
    edtMaterialsName: TEdit;
    lblElemntName: TLabel;
    edtENElementName: TEdit;
    lblENAutomatTypeName: TLabel;
    edtENAutomatTypeName: TEdit;
    lblNewMaterialsName: TLabel;
    edtNewMaterialsName: TEdit;
    lblNewDispName: TLabel;
    edtNewDispName: TEdit;
    lblNewMarkCurrent: TLabel;
    edtNewMarkCurrent: TEdit;
    lblNewElemntName: TLabel;
    edtNewENElementName: TEdit;
    lblNewThermalSplitterCurrent: TLabel;
    edtNewThermalSplitterCurrent: TEdit;
    lblNewENAutomatTypeName: TLabel;
    edtNewENAutomatTypeName: TEdit;
    lblNewBranch: TLabel;
    edtNewENBranchName: TEdit;
    spbNewTkMaterials: TSpeedButton;
    spbNewENElement: TSpeedButton;
    spbNewENAutomatType: TSpeedButton;
    spbNewENBranch: TSpeedButton;
    lblENLowVoltBoardName: TLabel;
    lblNewENLowVoltBoardName: TLabel;
    HTTPRIOENLowVoltBoard: THTTPRIO;
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

var frmENAutomatChangeEdit: TfrmENAutomatChangeEdit;
  ENAutomatChangeObj, ENAutomatChangeNewObj: ENAutomatChange;
  ENAutomatOldObj, ENAutomatNewObj: ENAutomat;

implementation

uses ShowEquipChangeWorker, EquipChangeWorkerController, ENBranchController,
  ENLowVoltBoardController, ENPanelController, ENTransformerController;

{$R *.dfm}

procedure TfrmENAutomatChangeEdit.FormShow(Sender: TObject);
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
begin
  //Отображение подлежащего замене автоматического выключателя
  DisableControls([(*Заменяемый автоматический выключатель*) edtENBranchName,
    edtMaterialsName, edtMarkCurrent, edtThermalSplitterCurrent, edtDispName,
    memENLowVoltBoardName,
    (*Новый автоматический выключатель*) edtNewENBranchName,
    edtNewMaterialsName, edtNewMarkCurrent, edtNewThermalSplitterCurrent,
    edtNewDispName, memNewENLowVoltBoardName]);
  SetFloatStyle([
    (*Заменяемый автоматический выключатель*) edtMarkCurrent, edtThermalSplitterCurrent,
    (*Новый автоматический выключатель*) edtNewMarkCurrent, edtNewThermalSplitterCurrent]);
  if ENAutomatOldObj <> nil then
    begin
      //edtAutomatCode.Text := IntToStr(ENAutomatOldObj.code);

      if ENAutomatOldObj.lvbRef.code > 0 then
        begin
          TempENLowVoltBoard :=
            HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
          ENLowVoltBoardObj :=
            TempENLowVoltBoard.getObject(ENAutomatOldObj.lvbRef.code);
          try
            memENLowVoltBoardName.Text := ENLowVoltBoardObj.name;
          finally
            ENLowVoltBoardObj.Free;
            ENLowVoltBoardObj := nil;
          end;
        end;

      if ENAutomatOldObj.panel <> nil then
        if ENAutomatOldObj.panel.code <> low(Integer) then
          begin
            TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
            ENPanelObj :=
              TempENPanel.getObject(ENAutomatOldObj.panel.code);
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

      if ENAutomatOldObj.branch <> nil then
        begin
          TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
          ENBranchObj := TempENBranch.getObject(ENAutomatOldObj.branch.code);
          try
            edtENBranchName.Text := ENBranchObj.name;
          finally
            ENBranchObj.Free;
            ENBranchObj := nil;
          end;
        end;

      edtDispName.Text := ENAutomatOldObj.name;
      if (ENAutomatOldObj.markCurrent <> nil ) then
         edtMarkCurrent.Text := ENAutomatOldObj.markCurrent.decimalString
      else
         edtMarkCurrent.Text := ''; 
      if ( ENAutomatOldObj.thermalSplitterCurrent <> nil ) then
         edtThermalSplitterCurrent.Text := ENAutomatOldObj.thermalSplitterCurrent.decimalString
      else
         edtThermalSplitterCurrent.Text := ''; 

      //edtENAutomatTypeName.Text := ENAutomatOldObj.automatType.name;

      if ENAutomatOldObj.materialRef <> nil then
        if ENAutomatOldObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENAutomatOldObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
    end; //if ENAutomatOldObj <> nil then

  if ENAutomatChangeNewObj <> nil then
    begin
      if ENAutomatChangeNewObj.lvbRef <> nil then
        if ENAutomatChangeNewObj.lvbRef.code <> Low(Integer) then
          begin
            TempENLowVoltBoard :=
              HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
            ENLowVoltBoardNewObj :=
              TempENLowVoltBoard.getObject(ENAutomatChangeNewObj.lvbRef.code);
            try
              memNewENLowVoltBoardName.Text := ENLowVoltBoardNewObj.name;
            finally
              ENLowVoltBoardNewObj.Free;
              ENLowVoltBoardNewObj := nil;
            end;
          end;

      if ENAutomatChangeNewObj.pnlRef <> nil then
        if ENAutomatChangeNewObj.pnlRef.code <> low(Integer) then
          begin
            TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
            ENPanelNewObj :=
              TempENPanel.getObject(ENAutomatChangeNewObj.pnlRef.code);
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

      if ENAutomatChangeNewObj.branchRef <> nil then
        if ENAutomatChangeNewObj.branchRef.code <> Low(Integer) then
          begin
            TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
            ENBranchNewObj :=
              TempENBranch.getObject(ENAutomatChangeNewObj.branchRef.code);
            try
              edtNewENBranchName.Text := ENBranchNewObj.name;
            finally
              ENBranchNewObj.Free;
              ENBranchNewObj := nil;
            end;
          end;
    end; //if ENAutomatChangeNewObj <> nil then

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

  if  ((DialogState = dsEdit) or (DialogState = dsView)) and (ENAutomatChangeObj <> nil) then
  begin
      edtCode.Text := IntToStr(ENAutomatChangeObj.code);
      if Length(ENAutomatChangeObj.name) > 0 then
        memName.Text := ENAutomatChangeObj.name;
      if ENAutomatChangeObj.installDate <> nil then
      begin
        dtpInstallDate.DateTime := EncodeDate(
          ENAutomatChangeObj.installDate.Year,
          ENAutomatChangeObj.installDate.Month,
          ENAutomatChangeObj.installDate.Day);
        dtpInstallDate.checked := true;
      end
      else
      begin
        dtpInstallDate.DateTime:=SysUtils.Date;
        dtpInstallDate.checked := false;
      end;
      if ENAutomatChangeObj.uninstallDate <> nil then
      begin
        dtpUninstallDate.DateTime := EncodeDate(
          ENAutomatChangeObj.uninstallDate.Year,
          ENAutomatChangeObj.uninstallDate.Month,
          ENAutomatChangeObj.uninstallDate.Day);
        dtpUninstallDate.checked := true;
      end
      else
      begin
        dtpUninstallDate.DateTime:=SysUtils.Date;
        dtpUninstallDate.checked := false;
      end;
    edtWorkOrderNumber.Text := ENAutomatChangeObj.workOrderNumber;
      if ENAutomatChangeObj.dateWorkOrder <> nil then
      begin
        dtpDateWorkOrder.DateTime := EncodeDate(
          ENAutomatChangeObj.dateWorkOrder.Year,
          ENAutomatChangeObj.dateWorkOrder.Month,
          ENAutomatChangeObj.dateWorkOrder.Day);
        dtpDateWorkOrder.checked := true;
      end
      else
      begin
        dtpDateWorkOrder.DateTime:=SysUtils.Date;
        dtpDateWorkOrder.checked := false;
      end;
    edtActNumberGen.Text := ENAutomatChangeObj.actNumberGen;
      if ENAutomatChangeObj.actDateGen <> nil then
      begin
        dtpActDateGen.DateTime := EncodeDate(
          ENAutomatChangeObj.actDateGen.Year,
          ENAutomatChangeObj.actDateGen.Month,
          ENAutomatChangeObj.actDateGen.Day);
        dtpActDateGen.checked := true;
      end
      else
      begin
        dtpActDateGen.DateTime:=SysUtils.Date;
        dtpActDateGen.checked := false;
      end;
    edtWorkerEquipChange.Text := ENAutomatChangeObj.workerEquipChange; 
    if ENAutomatChangeObj.worker <> nil then
      edtEquipChangeWorkerName.Text := ENAutomatChangeObj.worker.name;
  end;
end;



procedure TfrmENAutomatChangeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var //TempENAutomatChange: ENAutomatChangeControllerSoapPort;
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
    //TempENAutomatChange := HTTPRIOENAutomatChange as ENAutomatChangeControllerSoapPort;
     if ((ModalResult = mrOk) or (ModalResult = mrNo))
     and (ENAutomatChangeObj <> nil) then
       begin
         if (ENAutomatOldObj <> nil) then
           begin //Связь объекта истории со снимаемым оборудованием
             if ENAutomatChangeObj.automatRef = nil then
               ENAutomatChangeObj.automatRef := ENAutomatRef.Create;
             ENAutomatChangeObj.automatRef.code := ENAutomatOldObj.code;

             if ENAutomatOldObj.lvbRef <> nil then
               if ENAutomatOldObj.lvbRef.code <> low(Integer) then
                 begin
                   if ENAutomatChangeObj.lvbRef = nil then
                     ENAutomatChangeObj.lvbRef := ENLowVoltBoardRef.Create;
                   ENAutomatChangeObj.lvbRef.code :=
                     ENAutomatOldObj.lvbRef.code;

                   TempENLowVoltBoard :=
                     HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
                   lvbObj := TempENLowVoltBoard.getObject(
                     ENAutomatOldObj.lvbRef.code);
                   try
                     if lvbObj.transformerRef <> nil then
                       if lvbObj.transformerRef.code <> low(Integer) then
                         begin
                           if ENAutomatChangeObj.transformerRef = nil then
                             ENAutomatChangeObj.transformerRef :=
                               ENTransformerRef.Create;
                           ENAutomatChangeObj.transformerRef.code :=
                             lvbObj.transformerRef.code;
                         end;
                   finally
                     lvbObj.Free;
                     lvbObj := nil;
                   end;
                 end;

             if ENAutomatOldObj.panel <> nil then
               if ENAutomatOldObj.panel.code <> low(Integer) then
                 begin
                   if ENAutomatChangeObj.pnlRef = nil then
                     ENAutomatChangeObj.pnlRef := ENPanelRef.Create;
                   ENAutomatChangeObj.pnlRef.code :=
                     ENAutomatOldObj.panel.code;

                   TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
                   pnlObj :=
                     TempENPanel.getObject(ENAutomatOldObj.panel.code);
                   try
                     if pnlObj.transformer <> nil then
                       if pnlObj.transformer.code <> low(Integer) then
                         begin
                           if ENAutomatChangeObj.transformerRef = nil then
                             ENAutomatChangeObj.transformerRef :=
                               ENTransformerRef.Create;
                           ENAutomatChangeObj.transformerRef.code :=
                             pnlObj.transformer.code;
                         end;
                   finally
                     pnlObj.Free;
                     pnlObj := nil;
                   end;
                 end;

             if ENAutomatOldObj.branch <> nil then
               if ENAutomatOldObj.branch.code <> low(Integer) then
                 begin
                   if ENAutomatChangeObj.branchRef = nil then
                     ENAutomatChangeObj.branchRef := ENBranchRef.Create;
                   ENAutomatChangeObj.branchRef.code :=
                     ENAutomatOldObj.branch.code;
                 end;
           end;

         ENAutomatChangeObj.name := memName.Text;

         if dtpInstallDate.checked then
         begin
           if ENAutomatChangeObj.installDate = nil then
              ENAutomatChangeObj.installDate := TXSDate.Create;
           ENAutomatChangeObj.installDate.XSToNative(GetXSDate(dtpInstallDate.DateTime));
         end
         else
           ENAutomatChangeObj.installDate := nil;

         if dtpUninstallDate.checked then
         begin
           if ENAutomatChangeObj.uninstallDate = nil then
              ENAutomatChangeObj.uninstallDate := TXSDate.Create;
           ENAutomatChangeObj.uninstallDate.XSToNative(GetXSDate(dtpUninstallDate.DateTime));
         end
         else
           ENAutomatChangeObj.uninstallDate := nil;

         ENAutomatChangeObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENAutomatChangeObj.dateWorkOrder = nil then
              ENAutomatChangeObj.dateWorkOrder := TXSDate.Create;
           ENAutomatChangeObj.dateWorkOrder.XSToNative(GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENAutomatChangeObj.dateWorkOrder := nil;

         ENAutomatChangeObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENAutomatChangeObj.actDateGen = nil then
              ENAutomatChangeObj.actDateGen := TXSDate.Create;
           ENAutomatChangeObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENAutomatChangeObj.actDateGen := nil;

         ENAutomatChangeObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrNo)) and (ENAutomatChangeObj <> nil) then
     if ((ModalResult = mrOk) or (ModalResult = mrYes))
     and (ENAutomatChangeNewObj <> nil) then
       begin
         if (ENAutomatNewObj <> nil) then
           begin //Связь объекта истории с устанавливаемым оборудованием
             if ENAutomatChangeNewObj.automatRef = nil then
               ENAutomatChangeNewObj.automatRef := ENAutomatRef.Create;
             ENAutomatChangeNewObj.automatRef.code := ENAutomatNewObj.code;
             (*if ENAutomatChangeNewObj.branchRef = nil then
               ENAutomatChangeNewObj.branchRef := ENBranchRef.Create;
             if ENAutomatNewObj.branch <> nil then
               if ENAutomatNewObj.branch.code <> low(Integer) then
                 ENAutomatChangeNewObj.branchRef.code :=
                   ENAutomatNewObj.branch.code;*)
           end;

         ENAutomatChangeNewObj.name := memName.Text;

         if dtpInstallDate.checked then
           begin
             if ENAutomatChangeNewObj.installDate = nil then
                ENAutomatChangeNewObj.installDate := TXSDate.Create;
             ENAutomatChangeNewObj.installDate.XSToNative(
               GetXSDate(dtpInstallDate.DateTime));
           end
         else
           ENAutomatChangeNewObj.installDate := nil;

         ENAutomatChangeNewObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENAutomatChangeNewObj.dateWorkOrder = nil then
              ENAutomatChangeNewObj.dateWorkOrder := TXSDate.Create;
           ENAutomatChangeNewObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENAutomatChangeNewObj.dateWorkOrder := nil;

         ENAutomatChangeNewObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENAutomatChangeNewObj.actDateGen = nil then
              ENAutomatChangeNewObj.actDateGen := TXSDate.Create;
           ENAutomatChangeNewObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENAutomatChangeNewObj.actDateGen := nil;
         ENAutomatChangeNewObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrYes)) and (ENAutomatChangeNewObj <> nil) then
  end;
end;


procedure TfrmENAutomatChangeEdit.spbEquipChangeWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENAutomatChangeObj.worker = nil then ENAutomatChangeObj.worker := EquipChangeWorker.Create();
               ENAutomatChangeObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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
procedure TfrmENAutomatChangeEdit.actChangeEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENAutomatChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия автоматического выключателя должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  tsEquipInstall.TabVisible := True;
  actChooseNewEquip.Enabled := True;
  pcChangeEquipment.ActivePage := tsEquipInstall;
  btnOk.Action := ActnLstChangeEquip.Actions[2]
end;

procedure TfrmENAutomatChangeEdit.actDemontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENAutomatChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия автоматического выключателя должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
end;

procedure TfrmENAutomatChangeEdit.actMontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpInstallDate.Checked) then
    begin
      frmENAutomatChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата установки автоматического выключателя должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      dtpInstallDate.SetFocus;
      Exit;
    end;
  if ENAutomatNewObj = nil then
    begin
      frmENAutomatChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Необходимо указать новое оборудование.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      Exit;
    end;
  actChooseNewEquip.Enabled := True;
  btnOk.Action := ActnLstChangeEquip.Actions[3];
end;

procedure TfrmENAutomatChangeEdit.actSaveChangesExecute(
  Sender: TObject);
begin
  frmENAutomatChangeEdit.ModalResult := mrOk;
end;

procedure TfrmENAutomatChangeEdit.actChooseNewEquipExecute(
  Sender: TObject);
Var TempENAutomat: ENAutomatControllerSoapPort;
  ENAutomatFilterObj: ENAutomatFilter;
  fENAutomatShow: TfrmENAutomatShow;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
  TempENBranch: ENBranchControllerSoapPort;
  ENBranchObj: ENBranch;
begin
  ENAutomatFilterObj := ENAutomatFilter.Create;
  SetNullIntProps(ENAutomatFilterObj);
  SetNullXSProps(ENAutomatFilterObj);
  ENAutomatFilterObj.conditionSQL :=
    ' COALESCE(ENAUTOMAT.BRANCHCODE, 0) = 0 AND ' +
    ' COALESCE(ENAUTOMAT.LVBREFCODE, 0) = 0 AND ' +
    ' COALESCE(ENAUTOMAT.PANELCODE, 0) = 0';

  fENAutomatShow := TfrmENAutomatShow.Create(
    Application, fmNormal, ENAutomatFilterObj);
  try
    fENAutomatShow.actInsert.Enabled := False;
    fENAutomatShow.actEdit.Enabled := False;
    fENAutomatShow.actDelete.Enabled := False;
    if fENAutomatShow.ShowModal = mrOk then
      begin
        TempENAutomat :=
          HTTPRIOENAutomat as ENAutomatControllerSoapPort;
        try
          with fENAutomatShow do
            ENAutomatNewObj := TempENAutomat.getObject(StrToInt(
              sgENAutomat.Cells[0, sgENAutomat.Row]));

          if (ENAutomatNewObj <> nil) then
            begin //Заполнение полей для устанавливаемого объекта
              //edtNewAutomatCode.Text := IntToStr(ENAutomatNewObj.code);

              if ENAutomatNewObj.branch <> nil then
                begin
                  TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
                  ENBranchObj := TempENBranch.getObject(ENAutomatNewObj.branch.code);
                  if ENBranchObj <> nil then
                    edtNewENBranchName.Text := ENBranchObj.name;
                end;

              edtNewDispName.Text := ENAutomatNewObj.name;
              if (ENAutomatNewObj.markCurrent <> nil ) then
                 edtNewMarkCurrent.Text := ENAutomatNewObj.markCurrent.decimalString
              else
                 edtNewMarkCurrent.Text := ''; 
              if ( ENAutomatNewObj.thermalSplitterCurrent <> nil ) then
                 edtNewThermalSplitterCurrent.Text := ENAutomatNewObj.thermalSplitterCurrent.decimalString
              else
                 edtNewThermalSplitterCurrent.Text := '';

              if ENAutomatNewObj.materialRef <> nil then
                if ENAutomatNewObj.materialRef.code <> Low(Integer) then
                  begin
                    TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    Spr_matherialFilterObj := TKMaterialsFilter.Create;
                    SetNullIntProps(Spr_matherialFilterObj);
                    Spr_matherialFilterObj.code := ENAutomatNewObj.materialRef.code;
                    Spr_matherialList :=
                      TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
                    if (Spr_matherialList.totalCount > 0) then
                      edtNewMaterialsName.Text := Spr_matherialList.list[0].name
                    else
                      edtNewMaterialsName.Text := '';
                  end;
              //edtNewENAutomatTypeName.Text := ENAutomatNewObj.automatType.name;
            end; //if (ENAutomatNewObj <> nil) then
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    fENAutomatShow.Free;
  end;
end;

end.