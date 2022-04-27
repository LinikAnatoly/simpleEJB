//Редактирование Истории замен Разрядников
unit EditENArresterChange;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENArresterChangeController,
    ENArresterController, EditENArrester, ShowENArrester,
    TKMaterialsController;

type
  TfrmENArresterChangeEdit = class(TDialogForm)
  

  HTTPRIOENArresterChange: THTTPRIO;
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
    HTTPRIOENArrester: THTTPRIO;
    lblDispName: TLabel;
    lblENHighVoltageSell: TLabel;
    lblENArresterSiteName: TLabel;
    lblENLowVoltBoardName: TLabel;
    lblMaterialsName: TLabel;
    edtDispName: TEdit;
    edtENHighVoltageSellName: TEdit;
    edtENArresterSiteName: TEdit;
    edtENLowVoltBoardName: TEdit;
    edtMaterialsName: TEdit;
    lblNewMaterialsName: TLabel;
    edtNewMaterialsName: TEdit;
    lblNewDispName: TLabel;
    edtNewDispName: TEdit;
    lblNewENArresterSiteName: TLabel;
    edtNewENArresterSiteName: TEdit;
    lblNewENHighVoltageSell: TLabel;
    edtNewENHighVoltageSellName: TEdit;
    Label1: TLabel;
    edtNewENLowVoltBoardName: TEdit;
    spbNewTkMaterials: TSpeedButton;
    spbNewENArresterSite: TSpeedButton;
    spbNewENHighVoltageSell: TSpeedButton;
    spbNewENLowVoltBoard: TSpeedButton;
    spbChooseNewEquip: TSpeedButton;
    HTTPRIOENHighVoltageSell: THTTPRIO;

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
  frmENArresterChangeEdit: TfrmENArresterChangeEdit;
  ENArresterChangeObj, ENArresterChangeNewObj: ENArresterChange;
  ENArresterOldObj, ENArresterNewObj: ENArrester;

implementation

uses ShowEquipChangeWorker, EquipChangeWorkerController,
  ENHighVoltageSellController, ENTransformerController;

{$R *.dfm}

procedure TfrmENArresterChangeEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  ENHighVoltageSellNewObj: ENHighVoltageSell;
begin
  //Отображение подлежащего замене разрядника
  DisableControls([(*Заменяемый разрядник*) edtENHighVoltageSellName,
    edtENArresterSiteName, edtENLowVoltBoardName, edtMaterialsName, edtDispName,
    (*Новый разрядник*) edtNewENHighVoltageSellName, edtNewENArresterSiteName,
    edtNewENLowVoltBoardName, edtNewMaterialsName, edtNewDispName]);
  if ENArresterOldObj <> nil then
    begin
      //edtArresterCode.Text := IntToStr(ENArresterOldObj.code);
      edtDispName.Text := ENArresterOldObj.name;
      //edtENArresterTypeName.Text := ENArresterOldObj.arresterType.name;
      edtENArresterSiteName.Text := ENArresterOldObj.arresterSite.name;
      edtENHighVoltageSellName.Text :=
        'Ячейка № ' + ENArresterOldObj.highvoltageSell.numberGen;

      if ENArresterOldObj.materialRef <> nil then
        if ENArresterOldObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENArresterOldObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
      //edtENElementName.Text := ENArresterOldObj.element.name;
    end;

  if ENArresterChangeNewObj <> nil then
    begin
      if ENArresterChangeNewObj.highVoltCellRef <> nil then
        if ENArresterChangeNewObj.highVoltCellRef.code <> Low(Integer) then
          begin
            TempENHighVoltageSell :=
              HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
            ENHighVoltageSellNewObj :=
              TempENHighVoltageSell.getObject(
                ENArresterChangeNewObj.highVoltCellRef.code);
            if ENHighVoltageSellNewObj <> nil then
              edtNewENHighVoltageSellName.Text := 'Ячейка № ' +
                ENHighVoltageSellNewObj.numberGen;
          end;
    end; //if ENArresterChangeNewObj <> nil then

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

  if ((DialogState = dsEdit) or (DialogState = dsView)) and (ENArresterChangeObj <> nil) then
  begin
      edtCode.Text := IntToStr(ENArresterChangeObj.code);
      if Length(ENArresterChangeObj.name) > 0 then
        memName.Text := ENArresterChangeObj.name;
      if ENArresterChangeObj.installDate <> nil then
      begin
        dtpInstallDate.DateTime := EncodeDate(
          ENArresterChangeObj.installDate.Year,
          ENArresterChangeObj.installDate.Month,
          ENArresterChangeObj.installDate.Day);
        dtpInstallDate.checked := true;
      end
      else
      begin
        dtpInstallDate.DateTime:=SysUtils.Date;
        dtpInstallDate.checked := false;
      end;
      if ENArresterChangeObj.uninstallDate <> nil then
      begin
        dtpUninstallDate.DateTime := EncodeDate(
          ENArresterChangeObj.uninstallDate.Year,
          ENArresterChangeObj.uninstallDate.Month,
          ENArresterChangeObj.uninstallDate.Day);
        dtpUninstallDate.checked := true;
      end
      else
      begin
        dtpUninstallDate.DateTime:=SysUtils.Date;
        dtpUninstallDate.checked := false;
      end;
    edtWorkOrderNumber.Text := ENArresterChangeObj.workOrderNumber; 
      if ENArresterChangeObj.dateWorkOrder <> nil then
      begin
        dtpDateWorkOrder.DateTime := EncodeDate(
          ENArresterChangeObj.dateWorkOrder.Year,
          ENArresterChangeObj.dateWorkOrder.Month,
          ENArresterChangeObj.dateWorkOrder.Day);
        dtpDateWorkOrder.checked := true;
      end
      else
      begin
        dtpDateWorkOrder.DateTime:=SysUtils.Date;
        dtpDateWorkOrder.checked := false;
      end;
    edtActNumberGen.Text := ENArresterChangeObj.actNumberGen; 
      if ENArresterChangeObj.actDateGen <> nil then
      begin
        dtpActDateGen.DateTime := EncodeDate(
          ENArresterChangeObj.actDateGen.Year,
          ENArresterChangeObj.actDateGen.Month,
          ENArresterChangeObj.actDateGen.Day);
        dtpActDateGen.checked := true;
      end
      else
      begin
        dtpActDateGen.DateTime:=SysUtils.Date;
        dtpActDateGen.checked := false;
      end;
    edtWorkerEquipChange.Text := ENArresterChangeObj.workerEquipChange; 
    if ENArresterChangeObj.worker <> nil then
      edtEquipChangeWorkerName.Text := ENArresterChangeObj.worker.name;
  end;
end;



procedure TfrmENArresterChangeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENArresterChange: ENArresterChangeControllerSoapPort;
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
     //TempENArresterChange := HTTPRIOENArresterChange as ENArresterChangeControllerSoapPort;
     if ((ModalResult = mrOk) or (ModalResult = mrNo))
     and (ENArresterChangeObj <> nil) then
       begin
         if (ENArresterOldObj <> nil) then
           begin //Связь объекта истории со снимаемым оборудованием
             if ENArresterChangeObj.arresterRef = nil then
               ENArresterChangeObj.arresterRef := ENArresterRef.Create;
             ENArresterChangeObj.arresterRef.code := ENArresterOldObj.code;
             if ENArresterOldObj.highvoltageSell <> nil then
               if ENArresterOldObj.highvoltageSell.code <> low(Integer) then
                 begin
                   ENArresterChangeObj.highVoltCellRef.code :=
                     ENArresterOldObj.highvoltageSell.code;
                   if ENArresterChangeObj.highVoltCellRef = nil then
                     ENArresterChangeObj.highVoltCellRef :=
                       ENHighVoltageSellRef.Create;

                   if ENArresterOldObj.highvoltageSell.transformerRef <> nil
                   then
                     if ENArresterOldObj.highvoltageSell.transformerRef.code
                     <> low(Integer) then
                       begin
                         if ENArresterChangeObj.transformerRef = nil then
                           ENArresterChangeObj.transformerRef :=
                             ENTransformerRef.Create;
                         ENArresterChangeObj.transformerRef.code :=
                           ENArresterOldObj.highvoltageSell.transformerRef.code;
                       end;
                 end;
           end;

         ENArresterChangeObj.name := memName.Text;

         if dtpInstallDate.checked then
         begin
           if ENArresterChangeObj.installDate = nil then
              ENArresterChangeObj.installDate := TXSDate.Create;
           ENArresterChangeObj.installDate.XSToNative(GetXSDate(dtpInstallDate.DateTime));
         end
         else
           ENArresterChangeObj.installDate := nil;

         if dtpUninstallDate.checked then
         begin
           if ENArresterChangeObj.uninstallDate = nil then
              ENArresterChangeObj.uninstallDate := TXSDate.Create;
           ENArresterChangeObj.uninstallDate.XSToNative(GetXSDate(dtpUninstallDate.DateTime));
         end
         else
           ENArresterChangeObj.uninstallDate := nil;

         ENArresterChangeObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENArresterChangeObj.dateWorkOrder = nil then
              ENArresterChangeObj.dateWorkOrder := TXSDate.Create;
           ENArresterChangeObj.dateWorkOrder.XSToNative(GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENArresterChangeObj.dateWorkOrder := nil;

         ENArresterChangeObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENArresterChangeObj.actDateGen = nil then
              ENArresterChangeObj.actDateGen := TXSDate.Create;
           ENArresterChangeObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENArresterChangeObj.actDateGen := nil;

         ENArresterChangeObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrNo)) and (ENArresterChangeObj <> nil) then
     if ((ModalResult = mrOk) or (ModalResult = mrYes))
     and (ENArresterChangeNewObj <> nil) then
       begin
         if (ENArresterNewObj <> nil) then
           begin //Связь объекта истории с устанавливаемым оборудованием
             if ENArresterChangeNewObj.arresterRef = nil then
               ENArresterChangeNewObj.arresterRef := ENArresterRef.Create;
             ENArresterChangeNewObj.arresterRef.code := ENArresterNewObj.code;

             (*if ENArresterChangeNewObj.highVoltCellRef = nil then
               ENArresterChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
             if ENArresterOldNewObj.highvoltageSell <> nil then
               if ENArresterNewObj.highvoltageSell.code <> low(Integer) then
                 ENArresterChangeNewObj.highVoltCellRef.code :=
                   ENArresterNewObj.highvoltageSell.code;*)
           end;

         ENArresterChangeNewObj.name := memName.Text;

         if dtpInstallDate.checked then
           begin
             if ENArresterChangeNewObj.installDate = nil then
                ENArresterChangeNewObj.installDate := TXSDate.Create;
             ENArresterChangeNewObj.installDate.XSToNative(
               GetXSDate(dtpInstallDate.DateTime));
           end
         else
           ENArresterChangeNewObj.installDate := nil;

         ENArresterChangeNewObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENArresterChangeNewObj.dateWorkOrder = nil then
              ENArresterChangeNewObj.dateWorkOrder := TXSDate.Create;
           ENArresterChangeNewObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENArresterChangeNewObj.dateWorkOrder := nil;

         ENArresterChangeNewObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENArresterChangeNewObj.actDateGen = nil then
              ENArresterChangeNewObj.actDateGen := TXSDate.Create;
           ENArresterChangeNewObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENArresterChangeNewObj.actDateGen := nil;
         ENArresterChangeNewObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrYes)) and (ENArresterChangeNewObj <> nil) then
  end;
end;


procedure TfrmENArresterChangeEdit.spbEquipChangeWorkerClick(Sender : TObject);
var
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENArresterChangeObj.worker = nil then ENArresterChangeObj.worker := EquipChangeWorker.Create();
               ENArresterChangeObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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
procedure TfrmENArresterChangeEdit.actChangeEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENArresterChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия разрядника должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  tsEquipInstall.TabVisible := True;
  actChooseNewEquip.Enabled := True;
  pcChangeEquipment.ActivePage := tsEquipInstall;
  btnOk.Action := ActnLstChangeEquip.Actions[2]
end;

procedure TfrmENArresterChangeEdit.actDemontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENArresterChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия разрядника должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
end;

procedure TfrmENArresterChangeEdit.actMontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpInstallDate.Checked) then
    begin
      frmENArresterChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата установки разрядника должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      dtpInstallDate.SetFocus;
      Exit;
    end;
  if ENArresterNewObj = nil then
    begin
      frmENArresterChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Необходимо указать новое оборудование.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      Exit;
    end;
  actChooseNewEquip.Enabled := True;
  btnOk.Action := ActnLstChangeEquip.Actions[3];
end;

procedure TfrmENArresterChangeEdit.actSaveChangesExecute(
  Sender: TObject);
begin
  frmENArresterChangeEdit.ModalResult := mrOk;
end;

procedure TfrmENArresterChangeEdit.actChooseNewEquipExecute(
  Sender: TObject);
Var TempENArrester: ENArresterControllerSoapPort;
  ENArresterFilterObj: ENArresterFilter;
  fENArresterShow: TfrmENArresterShow;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
begin
  ENArresterFilterObj := ENArresterFilter.Create;
  SetNullIntProps(ENArresterFilterObj);
  SetNullXSProps(ENArresterFilterObj);
  ENArresterFilterObj.conditionSQL :=
    ' COALESCE(ENARRESTER.HIGHVOLTAGESELLCODE, 0) = 0';

  fENArresterShow := TfrmENArresterShow.Create(
    Application, fmNormal, ENArresterFilterObj);
  try
    fENArresterShow.actInsert.Enabled := False;
    fENArresterShow.actEdit.Enabled := False;
    fENArresterShow.actDelete.Enabled := False;
    if fENArresterShow.ShowModal = mrOk then
      begin
        TempENArrester :=
          HTTPRIOENArrester as ENArresterControllerSoapPort;
        try
          with fENArresterShow do
            ENArresterNewObj := TempENArrester.getObject(StrToInt(
              sgENArrester.Cells[0, sgENArrester.Row]));

          if (ENArresterNewObj <> nil) then
            begin //Заполнение полей для устанавливаемого объекта
              //edtArresterNewCode.Text := IntToStr(ENArresterNewObj.code);
              edtNewDispName.Text := ENArresterNewObj.name;
              //edtNewENArresterTypeName.Text := ENArresterNewObj.arresterType.name;
              edtNewENArresterSiteName.Text := ENArresterNewObj.arresterSite.name;
              edtNewENHighVoltageSellName.Text :=
                'Ячейка № ' + ENArresterNewObj.highvoltageSell.numberGen;

              if ENArresterNewObj.materialRef <> nil then
                if ENArresterNewObj.materialRef.code <> Low(Integer) then
                  begin
                    TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    Spr_matherialFilterObj := TKMaterialsFilter.Create;
                    SetNullIntProps(Spr_matherialFilterObj);
                    Spr_matherialFilterObj.code := ENArresterNewObj.materialRef.code;
                    Spr_matherialList :=
                      TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
                    if (Spr_matherialList.totalCount > 0) then
                      edtNewMaterialsName.Text := Spr_matherialList.list[0].name
                    else
                      edtNewMaterialsName.Text := '';
                  end;

              //edtNewENElementName.Text := ENArresterNewObj.element.name;
            end; //if (ENArresterNewObj <> nil) then
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    fENArresterShow.Free;
  end;
end;

end.