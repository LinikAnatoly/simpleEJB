//Замена Предохранителя на Высоковольтной и Низковольтной сторонах
unit EditENFuseChange; //Трансформаторной Подстанции 10 - 6 / 0,4 кВ

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENFuseChangeController,
  ENFuseController, EditENFuse, ShowENFuse, TKMaterialsController;

type
  TfrmENFuseChangeEdit = class(TDialogForm)
  

  HTTPRIOENFuseChange: THTTPRIO;
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
    HTTPRIOSpr_matherial: THTTPRIO;
    HTTPRIOENFuse: THTTPRIO;
    lblCurrentFuse: TLabel;
    lblENHighVoltageSellName: TLabel;
    lblENBranchName: TLabel;
    lblMaterialsName: TLabel;
    lblDispName: TLabel;
    edtCurrentFuse: TEdit;
    edtENHighVoltageSellName: TEdit;
    edtENBranchName: TEdit;
    edtMaterialsName: TEdit;
    edtDispName: TEdit;
    lblNewMaterialsName: TLabel;
    edtNewMaterialsName: TEdit;
    lblNewDispName: TLabel;
    edtNewDispName: TEdit;
    lblNewCurrentFuse: TLabel;
    edtNewCurrentFuse: TEdit;
    lblNewENHighVoltageSellName: TLabel;
    edtNewENHighVoltageSellName: TEdit;
    lblNewENBranchName: TLabel;
    edtNewENBranchName: TEdit;
    spbNewTkMaterials: TSpeedButton;
    spbNewENHighVoltageSell: TSpeedButton;
    spbNewENBranch: TSpeedButton;
    spbChooseNewEquip: TSpeedButton;
    lblENLowVoltBoardName: TLabel;
    lblNewENLowVoltBoardName: TLabel;
    HTTPRIOENLowVoltBoard: THTTPRIO;
    HTTPRIOENBranch: THTTPRIO;
    HTTPRIOENHighVoltageSell: THTTPRIO;
    memENLowVoltBoardName: TMemo;
    HTTPRIOENPanel: THTTPRIO;
    memNewENLowVoltBoardName: TMemo;
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

var frmENFuseChangeEdit: TfrmENFuseChangeEdit;
  ENFuseChangeObj, ENFuseChangeNewObj: ENFuseChange;
  ENFuseOldObj, ENFuseNewObj: ENFuse;

implementation

uses ShowEquipChangeWorker, EquipChangeWorkerController,
  ENHighVoltageSellController, ENBranchController, ENLowVoltBoardController,
  ENPanelController, ENTransformerController;

{$R *.dfm}

procedure TfrmENFuseChangeEdit.FormShow(Sender: TObject);
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
  //Отображение подлежащего замене предохранителя
  DisableControls([(*Заменяемый предохранитель*) edtENHighVoltageSellName,
    edtENBranchName, edtMaterialsName, edtDispName, edtCurrentFuse,
    memENLowVoltBoardName,
    (*Новый предохранитель*) edtNewENHighVoltageSellName, edtNewENBranchName,
    edtNewMaterialsName, edtNewDispName, edtNewCurrentFuse,
    memNewENLowVoltBoardName]);
  SetFloatStyle([(*Заменяемый предохранитель*) edtCurrentFuse,
    (*Новый предохранитель*) edtNewCurrentFuse]);
  if ENFuseOldObj <> nil then
    begin
      //edtFuseCode.Text := IntToStr(ENFuseObj.code);
      edtDispName.Text := ENFuseOldObj.name;
      if ENFuseOldObj.highVoltageSell <> nil then
        if ENFuseOldObj.highVoltageSell.code <> Low(Integer) then
          edtENHighVoltageSellName.Text :=
            'Ячейка № ' + ENFuseOldObj.highVoltageSell.numberGen;

      if ENFuseOldObj.lvbRef <> nil then
        begin
          TempENLowVoltBoard :=
            HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
          ENLowVoltBoardObj :=
            TempENLowVoltBoard.getObject(ENFuseOldObj.lvbRef.code);
          try
            memENLowVoltBoardName.Text := ENLowVoltBoardObj.name;
          finally
            ENLowVoltBoardObj.Free;
            ENLowVoltBoardObj := nil;
          end;
        end;

      if ENFuseOldObj.panel <> nil then
        if ENFuseOldObj.panel.code <> low(Integer) then
          begin
            TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
            ENPanelObj :=
              TempENPanel.getObject(ENFuseOldObj.panel.code);
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

      if ENFuseOldObj.branch <> nil then
        edtENBranchName.Text := ENFuseOldObj.branch.name;
      if (ENFuseOldObj.currentFuse <> nil ) then
         edtCurrentFuse.Text := ENFuseOldObj.currentFuse.decimalString
      else
         edtCurrentFuse.Text := '';
      //edtENFuseTypeName.Text := ENFuseOldObj.fuseType.name;

      if ENFuseOldObj.materialRef <> nil then
        if ENFuseOldObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENFuseOldObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
      //edtENElementName.Text := ENFuseOldObj.element.name;
    end; //if ENFuseOldObj <> nil then

  if ENFuseChangeNewObj <> nil then
    begin
      if ENFuseChangeNewObj.highVoltCellRef <> nil then
        if ENFuseChangeNewObj.highVoltCellRef.code <> Low(Integer) then
          begin
            TempENHighVoltageSell :=
              HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
            ENHighVoltageSellNewObj :=
              TempENHighVoltageSell.getObject(
                ENFuseChangeNewObj.highVoltCellRef.code);
            try
              edtNewENHighVoltageSellName.Text := 'Ячейка № ' +
                ENHighVoltageSellNewObj.numberGen;
            finally
              ENHighVoltageSellNewObj.Free;
              ENHighVoltageSellNewObj := nil;
            end;
          end;
      
      if ENFuseChangeNewObj.lvbRef <> nil then
        if ENFuseChangeNewObj.lvbRef.code <> Low(Integer) then
          begin
            TempENLowVoltBoard :=
              HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
            ENLowVoltBoardNewObj :=
              TempENLowVoltBoard.getObject(ENFuseChangeNewObj.lvbRef.code);
            try
              memNewENLowVoltBoardName.Text := ENLowVoltBoardNewObj.name;
            finally
              ENLowVoltBoardNewObj.Free;
              ENLowVoltBoardNewObj := nil;
            end;
          end;

      if ENFuseChangeNewObj.pnlRef <> nil then
        if ENFuseChangeNewObj.pnlRef.code <> low(Integer) then
          begin
            TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
            ENPanelNewObj :=
              TempENPanel.getObject(ENFuseChangeNewObj.pnlRef.code);
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

      if ENFuseChangeNewObj.branchRef <> nil then
        if ENFuseChangeNewObj.branchRef.code <> Low(Integer) then
          begin
            TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
            ENBranchNewObj :=
              TempENBranch.getObject(ENFuseChangeNewObj.branchRef.code);
            try
              edtNewENBranchName.Text := ENBranchNewObj.name;
            finally
              ENBranchNewObj.Free;
              ENBranchNewObj := nil;
            end;
          end;
    end; //if ENFuseChangeNewObj <> nil then

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

  if ((DialogState = dsEdit) or (DialogState = dsView)) and (ENFuseChangeObj <> nil) then
  begin
      edtCode.Text := IntToStr(ENFuseChangeObj.code);
      if Length(ENFuseChangeObj.name) > 0 then
        memName.Text := ENFuseChangeObj.name;
      if ENFuseChangeObj.installDate <> nil then
      begin
        dtpInstallDate.DateTime := EncodeDate(
          ENFuseChangeObj.installDate.Year,
          ENFuseChangeObj.installDate.Month,
          ENFuseChangeObj.installDate.Day);
        dtpInstallDate.checked := true;
      end
      else
      begin
        dtpInstallDate.DateTime:=SysUtils.Date;
        dtpInstallDate.checked := false;
      end;
      if ENFuseChangeObj.uninstallDate <> nil then
      begin
        dtpUninstallDate.DateTime := EncodeDate(
          ENFuseChangeObj.uninstallDate.Year,
          ENFuseChangeObj.uninstallDate.Month,
          ENFuseChangeObj.uninstallDate.Day);
        dtpUninstallDate.checked := true;
      end
      else
      begin
        dtpUninstallDate.DateTime:=SysUtils.Date;
        dtpUninstallDate.checked := false;
      end;
    edtWorkOrderNumber.Text := ENFuseChangeObj.workOrderNumber; 
      if ENFuseChangeObj.dateWorkOrder <> nil then
      begin
        dtpDateWorkOrder.DateTime := EncodeDate(
          ENFuseChangeObj.dateWorkOrder.Year,
          ENFuseChangeObj.dateWorkOrder.Month,
          ENFuseChangeObj.dateWorkOrder.Day);
        dtpDateWorkOrder.checked := true;
      end
      else
      begin
        dtpDateWorkOrder.DateTime:=SysUtils.Date;
        dtpDateWorkOrder.checked := false;
      end;
    edtActNumberGen.Text := ENFuseChangeObj.actNumberGen; 
      if ENFuseChangeObj.actDateGen <> nil then
      begin
        dtpActDateGen.DateTime := EncodeDate(
          ENFuseChangeObj.actDateGen.Year,
          ENFuseChangeObj.actDateGen.Month,
          ENFuseChangeObj.actDateGen.Day);
        dtpActDateGen.checked := true;
      end
      else
      begin
        dtpActDateGen.DateTime := SysUtils.Date;
        dtpActDateGen.checked := false;
      end;
    edtWorkerEquipChange.Text := ENFuseChangeObj.workerEquipChange; 
    if ENFuseChangeObj.worker <> nil then
      edtEquipChangeWorkerName.Text := ENFuseChangeObj.worker.name;
  end;
end;



procedure TfrmENFuseChangeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var //TempENFuseChange: ENFuseChangeControllerSoapPort;
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
     //TempENFuseChange := HTTPRIOENFuseChange as ENFuseChangeControllerSoapPort;
     if ((ModalResult = mrOk) or (ModalResult = mrNo))
     and (ENFuseChangeObj <> nil) then
       begin
         if (ENFuseOldObj <> nil) then
           begin //Связь объекта истории со снимаемым оборудованием
             if ENFuseChangeObj.fuseRef = nil then
               ENFuseChangeObj.fuseRef := ENFuseRef.Create;
             ENFuseChangeObj.fuseRef.code := ENFuseOldObj.code;

             if ENFuseOldObj.highvoltageSell <> nil then
               if ENFuseOldObj.highvoltageSell.code <> low(Integer) then
                 begin
                   if ENFuseChangeObj.highVoltCellRef = nil then
                     ENFuseChangeObj.highVoltCellRef := ENHighVoltageSellRef.Create;
                   ENFuseChangeObj.highVoltCellRef.code :=
                     ENFuseOldObj.highvoltageSell.code;

                   if ENFuseOldObj.highvoltageSell.transformerRef <> nil
                   then
                     if ENFuseOldObj.highvoltageSell.transformerRef.code
                     <> low(Integer) then
                       begin
                         if ENFuseChangeObj.transformerRef = nil then
                           ENFuseChangeObj.transformerRef :=
                             ENTransformerRef.Create;
                         ENFuseChangeObj.transformerRef.code :=
                           ENFuseOldObj.highvoltageSell.transformerRef.code;
                       end;
                 end;

             if ENFuseOldObj.lvbRef <> nil then
               if ENFuseOldObj.lvbRef.code <> low(Integer) then
                 begin
                   if ENFuseChangeObj.lvbRef = nil then
                     ENFuseChangeObj.lvbRef := ENLowVoltBoardRef.Create;
                   ENFuseChangeObj.lvbRef.code :=
                     ENFuseOldObj.lvbRef.code;

                   TempENLowVoltBoard :=
                     HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
                   lvbObj := TempENLowVoltBoard.getObject(
                     ENFuseOldObj.lvbRef.code);
                   try
                     if lvbObj.transformerRef <> nil then
                       if lvbObj.transformerRef.code <> low(Integer) then
                         begin
                           if ENFuseChangeObj.transformerRef = nil then
                             ENFuseChangeObj.transformerRef :=
                               ENTransformerRef.Create;
                           ENFuseChangeObj.transformerRef.code :=
                             lvbObj.transformerRef.code;
                         end;
                   finally
                     lvbObj.Free;
                     lvbObj := nil;
                   end;
                 end;

             if ENFuseOldObj.panel <> nil then
               if ENFuseOldObj.panel.code <> low(Integer) then
                 begin
                   if ENFuseChangeObj.pnlRef = nil then
                     ENFuseChangeObj.pnlRef := ENPanelRef.Create;
                   ENFuseChangeObj.pnlRef.code :=
                     ENFuseOldObj.panel.code;

                   TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
                   pnlObj :=
                     TempENPanel.getObject(ENFuseOldObj.panel.code);
                   try
                     if pnlObj.transformer <> nil then
                       if pnlObj.transformer.code <> low(Integer) then
                         begin
                           if ENFuseChangeObj.transformerRef = nil then
                             ENFuseChangeObj.transformerRef :=
                               ENTransformerRef.Create;
                           ENFuseChangeObj.transformerRef.code :=
                             pnlObj.transformer.code;
                         end;
                   finally
                     pnlObj.Free;
                     pnlObj := nil;
                   end;
                 end;

             if ENFuseOldObj.branch <> nil then
               if ENFuseOldObj.branch.code <> low(Integer) then
                 begin
                   if ENFuseChangeObj.branchRef = nil then
                     ENFuseChangeObj.branchRef := ENBranchRef.Create;
                   ENFuseChangeObj.branchRef.code :=
                     ENFuseOldObj.branch.code;
                 end;
           end;

         ENFuseChangeObj.name := memName.Text;

         if dtpInstallDate.checked then
         begin
           if ENFuseChangeObj.installDate = nil then
              ENFuseChangeObj.installDate := TXSDate.Create;
           ENFuseChangeObj.installDate.XSToNative(GetXSDate(dtpInstallDate.DateTime));
         end
         else
           ENFuseChangeObj.installDate := nil;

         if dtpUninstallDate.checked then
         begin
           if ENFuseChangeObj.uninstallDate = nil then
              ENFuseChangeObj.uninstallDate := TXSDate.Create;
           ENFuseChangeObj.uninstallDate.XSToNative(GetXSDate(dtpUninstallDate.DateTime));
         end
         else
           ENFuseChangeObj.uninstallDate := nil;

         ENFuseChangeObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENFuseChangeObj.dateWorkOrder = nil then
              ENFuseChangeObj.dateWorkOrder := TXSDate.Create;
           ENFuseChangeObj.dateWorkOrder.XSToNative(GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENFuseChangeObj.dateWorkOrder := nil;

         ENFuseChangeObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENFuseChangeObj.actDateGen = nil then
              ENFuseChangeObj.actDateGen := TXSDate.Create;
           ENFuseChangeObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENFuseChangeObj.actDateGen := nil;

         ENFuseChangeObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrNo)) and (ENFuseChangeObj <> nil) then
     if ((ModalResult = mrOk) or (ModalResult = mrYes))
     and (ENFuseChangeNewObj <> nil) then
       begin
         if (ENFuseNewObj <> nil) then
           begin //Связь объекта истории с устанавливаемым оборудованием
             if ENFuseChangeNewObj.fuseRef = nil then
               ENFuseChangeNewObj.fuseRef := ENFuseRef.Create;
             ENFuseChangeNewObj.fuseRef.code := ENFuseNewObj.code;

             (*if ENFuseChangeNewObj.highVoltCellRef = nil then
               ENFuseChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
             if ENFuseOldNewObj.highvoltageSell <> nil then
               if ENFuseNewObj.highvoltageSell.code <> low(Integer) then
                 ENFuseChangeNewObj.highVoltCellRef.code :=
                   ENFuseNewObj.highvoltageSell.code;
             if ENFuseChangeNewObj.branchRef = nil then
               ENFuseChangeNewObj.branchRef := ENBranchRef.Create;
             if ENFuseNewObj.branch <> nil then
               if ENFuseNewObj.branch.code <> low(Integer) then
                 ENFuseChangeNewObj.branchRef.code :=
                   ENFuseNewObj.branch.code;*)
           end;

         ENFuseChangeNewObj.name := memName.Text;

         if dtpInstallDate.checked then
           begin
             if ENFuseChangeNewObj.installDate = nil then
                ENFuseChangeNewObj.installDate := TXSDate.Create;
             ENFuseChangeNewObj.installDate.XSToNative(
               GetXSDate(dtpInstallDate.DateTime));
           end
         else
           ENFuseChangeNewObj.installDate := nil;

         ENFuseChangeNewObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENFuseChangeNewObj.dateWorkOrder = nil then
              ENFuseChangeNewObj.dateWorkOrder := TXSDate.Create;
           ENFuseChangeNewObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENFuseChangeNewObj.dateWorkOrder := nil;

         ENFuseChangeNewObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENFuseChangeNewObj.actDateGen = nil then
              ENFuseChangeNewObj.actDateGen := TXSDate.Create;
           ENFuseChangeNewObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENFuseChangeNewObj.actDateGen := nil;
         ENFuseChangeNewObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrYes)) and (ENFuseChangeNewObj <> nil) then
  end;
end;


procedure TfrmENFuseChangeEdit.spbEquipChangeWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFuseChangeObj.worker = nil then ENFuseChangeObj.worker := EquipChangeWorker.Create();
               ENFuseChangeObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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
procedure TfrmENFuseChangeEdit.actChangeEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENFuseChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия предохранителя должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  tsEquipInstall.TabVisible := True;
  actChooseNewEquip.Enabled := True;
  pcChangeEquipment.ActivePage := tsEquipInstall;
  btnOk.Action := ActnLstChangeEquip.Actions[2]
end;

procedure TfrmENFuseChangeEdit.actDemontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENFuseChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия предохранителя должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
end;

procedure TfrmENFuseChangeEdit.actMontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpInstallDate.Checked) then
    begin
      frmENFuseChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата установки предохранителя должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      dtpInstallDate.SetFocus;
      Exit;
    end;
  if ENFuseNewObj = nil then
    begin
      frmENFuseChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Необходимо указать новое оборудование.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      Exit;
    end;
  actChooseNewEquip.Enabled := True;
  btnOk.Action := ActnLstChangeEquip.Actions[3];
end;

procedure TfrmENFuseChangeEdit.actSaveChangesExecute(
  Sender: TObject);
begin
  frmENFuseChangeEdit.ModalResult := mrOk;
end;

procedure TfrmENFuseChangeEdit.actChooseNewEquipExecute(
  Sender: TObject);
Var TempENFuse: ENFuseControllerSoapPort;
  ENFuseFilterObj: ENFuseFilter;
  fENFuseShow: TfrmENFuseShow;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
  //TempENBranch: ENBranchControllerSoapPort;
  //ENBranchObj: ENBranch;
begin
  ENFuseFilterObj := ENFuseFilter.Create;
  SetNullIntProps(ENFuseFilterObj);
  SetNullXSProps(ENFuseFilterObj);
  ENFuseFilterObj.conditionSQL :=
    ' COALESCE(ENFUSE.HIGHVOLTAGESELLCODE, 0) = 0 AND ' +
    ' COALESCE(ENFUSE.BRANCHCODE, 0) = 0 AND ' +
    ' COALESCE(ENFUSE.LVBREFCODE, 0) = 0 AND ' +
    ' COALESCE(ENFUSE.PANELCODE, 0) = 0';

  fENFuseShow := TfrmENFuseShow.Create(
    Application, fmNormal, ENFuseFilterObj);
  try
    fENFuseShow.actInsert.Enabled := False;
    fENFuseShow.actEdit.Enabled := False;
    fENFuseShow.actDelete.Enabled := False;
    if fENFuseShow.ShowModal = mrOk then
      begin
        TempENFuse :=
          HTTPRIOENFuse as ENFuseControllerSoapPort;
        try
          with fENFuseShow do
            ENFuseNewObj := TempENFuse.getObject(StrToInt(
              sgENFuse.Cells[0, sgENFuse.Row]));

          if (ENFuseNewObj <> nil) then
            begin //Заполнение полей для устанавливаемого объекта
              //edtNewFuseCode.Text := IntToStr(ENFuseNewObj.code);
              edtNewDispName.Text := ENFuseNewObj.name;
              if ENFuseNewObj.branch <> nil then
                edtNewENBranchName.Text := ENFuseNewObj.branch.name;

              if ( ENFuseNewObj.currentFuse <> nil ) then
                 edtNewCurrentFuse.Text := ENFuseNewObj.currentFuse.decimalString
              else
                 edtNewCurrentFuse.Text := '';
              //edtNewENFuseTypeName.Text := ENFuseNewObj.fuseType.name;
              edtNewENHighVoltageSellName.Text :=
                'Ячейка № ' + ENFuseNewObj.highVoltageSell.numberGen;

              if ENFuseNewObj.materialRef <> nil then
                if ENFuseNewObj.materialRef.code <> Low(Integer) then
                  begin
                    TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    Spr_matherialFilterObj := TKMaterialsFilter.Create;
                    SetNullIntProps(Spr_matherialFilterObj);
                    Spr_matherialFilterObj.code := ENFuseNewObj.materialRef.code;
                    Spr_matherialList :=
                      TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
                    if (Spr_matherialList.totalCount > 0) then
                      edtNewMaterialsName.Text := Spr_matherialList.list[0].name
                    else
                      edtNewMaterialsName.Text := '';
                  end;

              //edtNewENElementName.Text := ENFuseNewObj.element.name;
            end; //if (ENFuseNewObj <> nil) then
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    fENFuseShow.Free;
  end;
end;

end.
