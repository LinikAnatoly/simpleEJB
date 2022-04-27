//Замена Рубильника на Высоковольтной и Низковольтной сторонах
unit EditENContBreakChange; //Трансформаторной Подстанции 10 - 6 / 0,4 кВ

interface

uses Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList, Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns,
  GridHeadersUnit, DialogFormUnit, AdvGrid, Buttons,
  EnergyproController, EnergyproController2, ENContBreakChangeController,
  ENContactBreakerController, EditENContactBreaker, ShowENContactBreaker,
  TKMaterialsController;

type
  TfrmENContBreakChangeEdit = class(TDialogForm)
  

  HTTPRIOENContBreakChange: THTTPRIO;
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
    HTTPRIOENBranch: THTTPRIO;
    HTTPRIOENContactBreaker: THTTPRIO;
    lblMaterialsName: TLabel;
    edtMaterialsName: TEdit;
    lblDispName: TLabel;
    edtDispName: TEdit;
    lblCurrent: TLabel;
    edtCurrent: TEdit;
    lblENContactBreakerType: TLabel;
    edtENContactBreakerType: TEdit;
    lblBranch: TLabel;
    edtENBranchName: TEdit;
    edtNewMaterialsName: TEdit;
    edtNewDispName: TEdit;
    edtNewCurrent: TEdit;
    edtNewENBranchName: TEdit;
    lblNewENContactBreakerType: TLabel;
    edtNewENContactBreakerType: TEdit;
    lblNewMaterialsName: TLabel;
    lblNewDispName: TLabel;
    lblNewCurrent: TLabel;
    lblNewENBranchName: TLabel;
    spbNewTkMaterials: TSpeedButton;
    spbNewENContactBreakerType: TSpeedButton;
    spbNewENBranch: TSpeedButton;
    spbChooseNewEquip: TSpeedButton;
    lblENLowVoltBoardName: TLabel;
    lblNewENLowVoltBoardName: TLabel;
    HTTPRIOENLowVoltBoard: THTTPRIO;
    HTTPRIOENPanel: THTTPRIO;
    memENLowVoltBoardName: TMemo;
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

var frmENContBreakChangeEdit: TfrmENContBreakChangeEdit;
  ENContBreakChangeObj, ENContBreakChangeNewObj: ENContBreakChange;
  ENContactBreakerOldObj, ENContactBreakerNewObj: ENContactBreaker;

implementation

uses ShowEquipChangeWorker, EquipChangeWorkerController, ENBranchController,
  ENLowVoltBoardController, ENPanelController, ENTransformerController;

{$R *.dfm}

procedure TfrmENContBreakChangeEdit.FormShow(Sender: TObject);
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
  //Отображение подлежащего замене рубильника
  DisableControls([(*Заменяемый рубильник*) edtENBranchName, edtMaterialsName,
    edtDispName, edtCurrent,
    (*Новый рубильник*) edtNewENBranchName, edtNewMaterialsName,
    edtNewDispName, edtNewCurrent]);
  SetFloatStyle([(*Заменяемый рубильник*) edtCurrent,
    (*Новый рубильник*) edtNewCurrent]);
  if ENContactBreakerOldObj <> nil then
    begin
      //edtContactBreakerCode.Text := IntToStr(ENContactBreakerOldObj.code);
      edtDispName.Text := ENContactBreakerOldObj.name;
      if (ENContactBreakerOldObj.current <> nil ) then
         edtCurrent.Text := ENContactBreakerOldObj.current.decimalString
      else
         edtCurrent.Text := '';

      if ENContactBreakerOldObj.lvbRef <> nil then
        if ENContactBreakerOldObj.lvbRef.code <> low(Integer) then
          begin
            TempENLowVoltBoard :=
              HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
            ENLowVoltBoardObj :=
              TempENLowVoltBoard.getObject(ENContactBreakerOldObj.lvbRef.code);
            try
              memENLowVoltBoardName.Text := ENLowVoltBoardObj.name;
            finally
              ENLowVoltBoardObj.Free;
              ENLowVoltBoardObj := nil;
            end;
          end;

      if ENContactBreakerOldObj.panel <> nil then
        if ENContactBreakerOldObj.panel.code <> low(Integer) then
          begin
            TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
            ENPanelObj :=
              TempENPanel.getObject(ENContactBreakerOldObj.panel.code);
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

      if ENContactBreakerOldObj.branch <> nil then
        if ENContactBreakerOldObj.branch.code <> low(Integer) then
          begin
            TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
            ENBranchObj := TempENBranch.getObject(ENContactBreakerOldObj.branch.code);
            try
              edtENBranchName.Text := ENBranchObj.name;
            finally
              ENBranchObj.Free;
              ENBranchObj := nil;
            end;
          end;

      //edtENContactBreakerTypeName.Text := ENContactBreakerOldObj.contactBreakerType.name;

      if ENContactBreakerOldObj.materialRef <> nil then
        if ENContactBreakerOldObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENContactBreakerOldObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
    end; //if ENContactBreakerOldObj <> nil then

  if ENContBreakChangeNewObj <> nil then
    begin
      if ENContBreakChangeNewObj.lvbRef <> nil then
        if ENContBreakChangeNewObj.lvbRef.code <> Low(Integer) then
          begin
            TempENLowVoltBoard :=
              HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
            ENLowVoltBoardNewObj :=
              TempENLowVoltBoard.getObject(ENContBreakChangeNewObj.lvbRef.code);
            try
              memNewENLowVoltBoardName.Text := ENLowVoltBoardNewObj.name;
            finally
              ENLowVoltBoardNewObj.Free;
              ENLowVoltBoardNewObj := nil;
            end;
          end;

      if ENContBreakChangeNewObj.pnlRef <> nil then
        if ENContBreakChangeNewObj.pnlRef.code <> low(Integer) then
          begin
            TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
            ENPanelNewObj :=
              TempENPanel.getObject(ENContBreakChangeNewObj.pnlRef.code);
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

      if ENContBreakChangeNewObj.branchRef <> nil then
        if ENContBreakChangeNewObj.branchRef.code <> Low(Integer) then
          begin
            TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
            ENBranchNewObj :=
              TempENBranch.getObject(ENContBreakChangeNewObj.branchRef.code);
            try
              edtNewENBranchName.Text := ENBranchNewObj.name;
            finally
              ENBranchNewObj.Free;
              ENBranchNewObj := nil;
            end;
          end;
    end; //if ENContBreakChangeNewObj <> nil then

  //Отображение атрибутов замены оборудования
  if DialogState = dsView then
    DisableControls([edtEquipChangeWorkerName, spbEquipChangeWorker]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
    DenyBlankValues([memName, edtActNumberGen, dtpActDateGen,
      edtWorkerEquipChange]);

  if ((DialogState = dsEdit) or (DialogState = dsView))
  and (ENContBreakChangeObj <> nil) then
    begin
        edtCode.Text := IntToStr(ENContBreakChangeObj.code);
        if Length(ENContBreakChangeObj.name) > 0 then
          memName.Text := ENContBreakChangeObj.name;
        if ENContBreakChangeObj.installDate <> nil then
        begin
          dtpInstallDate.DateTime := EncodeDate(
            ENContBreakChangeObj.installDate.Year,
            ENContBreakChangeObj.installDate.Month,
            ENContBreakChangeObj.installDate.Day);
          dtpInstallDate.checked := true;
        end
        else
        begin
          dtpInstallDate.DateTime:=SysUtils.Date;
          dtpInstallDate.checked := false;
        end;
        if ENContBreakChangeObj.uninstallDate <> nil then
        begin
          dtpUninstallDate.DateTime := EncodeDate(
            ENContBreakChangeObj.uninstallDate.Year,
            ENContBreakChangeObj.uninstallDate.Month,
            ENContBreakChangeObj.uninstallDate.Day);
          dtpUninstallDate.checked := true;
        end
        else
        begin
          dtpUninstallDate.DateTime:=SysUtils.Date;
          dtpUninstallDate.checked := false;
        end;
      edtWorkOrderNumber.Text := ENContBreakChangeObj.workOrderNumber;
        if ENContBreakChangeObj.dateWorkOrder <> nil then
        begin
          dtpDateWorkOrder.DateTime := EncodeDate(
            ENContBreakChangeObj.dateWorkOrder.Year,
            ENContBreakChangeObj.dateWorkOrder.Month,
            ENContBreakChangeObj.dateWorkOrder.Day);
          dtpDateWorkOrder.checked := true;
        end
        else
        begin
          dtpDateWorkOrder.DateTime:=SysUtils.Date;
          dtpDateWorkOrder.checked := false;
        end;
      edtActNumberGen.Text := ENContBreakChangeObj.actNumberGen;
        if ENContBreakChangeObj.actDateGen <> nil then
        begin
          dtpActDateGen.DateTime := EncodeDate(
            ENContBreakChangeObj.actDateGen.Year,
            ENContBreakChangeObj.actDateGen.Month,
            ENContBreakChangeObj.actDateGen.Day);
          dtpActDateGen.checked := true;
        end
        else
        begin
          dtpActDateGen.DateTime:=SysUtils.Date;
          dtpActDateGen.checked := false;
        end;
      edtWorkerEquipChange.Text := ENContBreakChangeObj.workerEquipChange;
      if ENContBreakChangeObj.worker <> nil then
        edtEquipChangeWorkerName.Text := ENContBreakChangeObj.worker.name;
    end;
end;



procedure TfrmENContBreakChangeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var //TempENContBreakChange: ENContBreakChangeControllerSoapPort;
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
     //TempENContBreakChange := HTTPRIOENContBreakChange as ENContBreakChangeControllerSoapPort;
     if ((ModalResult = mrOk) or (ModalResult = mrNo))
     and (ENContBreakChangeObj <> nil) then
       begin
         if (ENContactBreakerOldObj <> nil) then
           begin //Связь объекта истории со снимаемым оборудованием
             if ENContBreakChangeObj.contactBreakerRef = nil then
               ENContBreakChangeObj.contactBreakerRef := ENContactBreakerRef.Create;
             ENContBreakChangeObj.contactBreakerRef.code := ENContactBreakerOldObj.code;

             if ENContactBreakerOldObj.branch <> nil then
               if ENContactBreakerOldObj.branch.code <> low(Integer) then
                 begin
                   if ENContBreakChangeObj.branchRef = nil then
                     ENContBreakChangeObj.branchRef := ENBranchRef.Create;
                   ENContBreakChangeObj.branchRef.code :=
                     ENContactBreakerOldObj.branch.code;
                 end;

             if ENContactBreakerOldObj.lvbRef <> nil then
               if ENContactBreakerOldObj.lvbRef.code <> low(Integer) then
                 begin
                   if ENContBreakChangeObj.lvbRef = nil then
                     ENContBreakChangeObj.lvbRef := ENLowVoltBoardRef.Create;
                   ENContBreakChangeObj.lvbRef.code :=
                     ENContactBreakerOldObj.lvbRef.code;

                   TempENLowVoltBoard :=
                     HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
                   lvbObj := TempENLowVoltBoard.getObject(
                     ENContactBreakerOldObj.lvbRef.code);
                   try
                     if lvbObj.transformerRef <> nil then
                       if lvbObj.transformerRef.code <> low(Integer) then
                         begin
                           if ENContBreakChangeObj.transformerRef = nil then
                             ENContBreakChangeObj.transformerRef :=
                               ENTransformerRef.Create;
                           ENContBreakChangeObj.transformerRef.code :=
                             lvbObj.transformerRef.code;
                         end;
                   finally
                     lvbObj.Free;
                     lvbObj := nil;
                   end;
                 end;

             if ENContactBreakerOldObj.panel <> nil then
               if ENContactBreakerOldObj.panel.code <> low(Integer) then
                 begin
                   if ENContBreakChangeObj.pnlRef = nil then
                     ENContBreakChangeObj.pnlRef := ENPanelRef.Create;
                   ENContBreakChangeObj.pnlRef.code :=
                     ENContactBreakerOldObj.panel.code;

                   TempENPanel := HTTPRIOENPanel as ENPanelControllerSoapPort;
                   pnlObj :=
                     TempENPanel.getObject(ENContactBreakerOldObj.panel.code);
                   try
                     if pnlObj.transformer <> nil then
                       if pnlObj.transformer.code <> low(Integer) then
                         begin
                           if ENContBreakChangeObj.transformerRef = nil then
                             ENContBreakChangeObj.transformerRef :=
                               ENTransformerRef.Create;
                           ENContBreakChangeObj.transformerRef.code :=
                             pnlObj.transformer.code;
                         end;
                   finally
                     pnlObj.Free;
                     pnlObj := nil;
                   end;
                 end;

           end;

         ENContBreakChangeObj.name := memName.Text;

         if dtpInstallDate.checked then
         begin
           if ENContBreakChangeObj.installDate = nil then
              ENContBreakChangeObj.installDate := TXSDate.Create;
           ENContBreakChangeObj.installDate.XSToNative(GetXSDate(dtpInstallDate.DateTime));
         end
         else
           ENContBreakChangeObj.installDate := nil;

         if dtpUninstallDate.checked then
         begin
           if ENContBreakChangeObj.uninstallDate = nil then
              ENContBreakChangeObj.uninstallDate := TXSDate.Create;
           ENContBreakChangeObj.uninstallDate.XSToNative(GetXSDate(dtpUninstallDate.DateTime));
         end
         else
           ENContBreakChangeObj.uninstallDate := nil;

         ENContBreakChangeObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENContBreakChangeObj.dateWorkOrder = nil then
              ENContBreakChangeObj.dateWorkOrder := TXSDate.Create;
           ENContBreakChangeObj.dateWorkOrder.XSToNative(GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENContBreakChangeObj.dateWorkOrder := nil;

         ENContBreakChangeObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENContBreakChangeObj.actDateGen = nil then
              ENContBreakChangeObj.actDateGen := TXSDate.Create;
           ENContBreakChangeObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENContBreakChangeObj.actDateGen := nil;

         ENContBreakChangeObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrNo)) and (ENContBreakChangeObj <> nil) then
     if ((ModalResult = mrOk) or (ModalResult = mrYes))
     and (ENContBreakChangeNewObj <> nil) then
       begin
         if (ENContactBreakerNewObj <> nil) then
           begin //Связь объекта истории с устанавливаемым оборудованием
             if ENContBreakChangeNewObj.contactBreakerRef = nil then
               ENContBreakChangeNewObj.contactBreakerRef := ENContactBreakerRef.Create;
             ENContBreakChangeNewObj.contactBreakerRef.code := ENContactBreakerNewObj.code;
           end;

         ENContBreakChangeNewObj.name := memName.Text;

         if dtpInstallDate.checked then
           begin
             if ENContBreakChangeNewObj.installDate = nil then
                ENContBreakChangeNewObj.installDate := TXSDate.Create;
             ENContBreakChangeNewObj.installDate.XSToNative(
               GetXSDate(dtpInstallDate.DateTime));
           end
         else
           ENContBreakChangeNewObj.installDate := nil;

         ENContBreakChangeNewObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENContBreakChangeNewObj.dateWorkOrder = nil then
              ENContBreakChangeNewObj.dateWorkOrder := TXSDate.Create;
           ENContBreakChangeNewObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENContBreakChangeNewObj.dateWorkOrder := nil;

         ENContBreakChangeNewObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENContBreakChangeNewObj.actDateGen = nil then
              ENContBreakChangeNewObj.actDateGen := TXSDate.Create;
           ENContBreakChangeNewObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENContBreakChangeNewObj.actDateGen := nil;
         ENContBreakChangeNewObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrYes)) and (ENContBreakChangeNewObj <> nil) then
  end;
end;


procedure TfrmENContBreakChangeEdit.spbEquipChangeWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContBreakChangeObj.worker = nil then ENContBreakChangeObj.worker := EquipChangeWorker.Create();
               ENContBreakChangeObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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
procedure TfrmENContBreakChangeEdit.actChangeEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENContBreakChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия рубильника должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  tsEquipInstall.TabVisible := True;
  actChooseNewEquip.Enabled := True;
  pcChangeEquipment.ActivePage := tsEquipInstall;
  btnOk.Action := ActnLstChangeEquip.Actions[2]
end;

procedure TfrmENContBreakChangeEdit.actDemontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENContBreakChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия рубильника должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
end;

procedure TfrmENContBreakChangeEdit.actMontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpInstallDate.Checked) then
    begin
      frmENContBreakChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата установки рубильника должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      dtpInstallDate.SetFocus;
      Exit;
    end;
  if ENContactBreakerNewObj = nil then
    begin
      frmENContBreakChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Необходимо указать новое оборудование.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      Exit;
    end;
  actChooseNewEquip.Enabled := True;
  btnOk.Action := ActnLstChangeEquip.Actions[3];
end;

procedure TfrmENContBreakChangeEdit.actSaveChangesExecute(
  Sender: TObject);
begin
  frmENContBreakChangeEdit.ModalResult := mrOk;
end;

procedure TfrmENContBreakChangeEdit.actChooseNewEquipExecute(
  Sender: TObject);
Var TempENContactBreaker: ENContactBreakerControllerSoapPort;
  ENContactBreakerFilterObj: ENContactBreakerFilter;
  fENContactBreakerShow: TfrmENContactBreakerShow;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
  TempENBranch: ENBranchControllerSoapPort;
  ENBranchObj: ENBranch;
begin
  ENContactBreakerFilterObj := ENContactBreakerFilter.Create;
  SetNullIntProps(ENContactBreakerFilterObj);
  SetNullXSProps(ENContactBreakerFilterObj);
  ENContactBreakerFilterObj.conditionSQL :=
    ' COALESCE(ENCONTACTBREAKER.BRANCHCODE, 0) = 0 AND ' +
    ' COALESCE(ENCONTACTBREAKER.LVBREFCODE, 0) = 0 AND ' +
    ' COALESCE(ENCONTACTBREAKER.PANELCODE, 0) = 0';

  fENContactBreakerShow := TfrmENContactBreakerShow.Create(
    Application, fmNormal, ENContactBreakerFilterObj);
  try
    fENContactBreakerShow.actInsert.Enabled := False;
    fENContactBreakerShow.actEdit.Enabled := False;
    fENContactBreakerShow.actDelete.Enabled := False;
    if fENContactBreakerShow.ShowModal = mrOk then
      begin
        TempENContactBreaker :=
          HTTPRIOENContactBreaker as ENContactBreakerControllerSoapPort;
        try
          with fENContactBreakerShow do
            ENContactBreakerNewObj := TempENContactBreaker.getObject(StrToInt(
              sgENContactBreaker.Cells[0, sgENContactBreaker.Row]));

          if (ENContactBreakerNewObj <> nil) then
            begin //Заполнение полей для устанавливаемого объекта
              //edtNewContactBreakerCode.Text := IntToStr(ENContactBreakerNewObj.code);
              edtNewDispName.Text := ENContactBreakerNewObj.name;
              if ( ENContactBreakerNewObj.current <> nil ) then
                 edtNewCurrent.Text := ENContactBreakerNewObj.current.decimalString
              else
                 edtNewCurrent.Text := '';

              if ENContactBreakerNewObj.branch <> nil then
                begin
                  TempENBranch := HTTPRIOENBranch as ENBranchControllerSoapPort;
                  ENBranchObj := TempENBranch.getObject(ENContactBreakerNewObj.branch.code);
                  if ENBranchObj <> nil then
                    edtNewENBranchName.Text := ENBranchObj.name;
                end;

              if ENContactBreakerNewObj.materialRef <> nil then
                if ENContactBreakerNewObj.materialRef.code <> Low(Integer) then
                  begin
                    TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    Spr_matherialFilterObj := TKMaterialsFilter.Create;
                    SetNullIntProps(Spr_matherialFilterObj);
                    Spr_matherialFilterObj.code := ENContactBreakerNewObj.materialRef.code;
                    Spr_matherialList :=
                      TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
                    if (Spr_matherialList.totalCount > 0) then
                      edtNewMaterialsName.Text := Spr_matherialList.list[0].name
                    else
                      edtNewMaterialsName.Text := '';
                  end;
              //edtNewENContactBreakerTypeName.Text := ENContactBreakerNewObj.contactBreakerType.name;
            end; //if (ENContactBreakerNewObj <> nil) then
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    fENContactBreakerShow.Free;
  end;
end;

end.
