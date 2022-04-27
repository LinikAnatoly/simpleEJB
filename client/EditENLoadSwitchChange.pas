//Редактирование Истории замен Выключателей нагрузки
unit EditENLoadSwitchChange;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENLoadSwitchChangeController,
    ENLoadSwitchController, EditENLoadSwitch, ShowENLoadSwitch,
    TKMaterialsController;

type
  TfrmENLoadSwitchChangeEdit = class(TDialogForm)
  

  HTTPRIOENLoadSwitchChange: THTTPRIO;
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
    HTTPRIOENLoadSwitch: THTTPRIO;
    lblRatedVoltage: TLabel;
    lblRatedCurrent: TLabel;
    lblENHighVoltageSell: TLabel;
    lblMaterialsName: TLabel;
    lblMatDrive: TLabel;
    lblDispName: TLabel;
    edtRatedVoltage: TEdit;
    edtRatedCurrent: TEdit;
    edtENHighVoltageSellName: TEdit;
    edtMaterialsName: TEdit;
    edtMatDrive: TEdit;
    edtDispName: TEdit;
    lblNewMaterialsName: TLabel;
    edtNewMaterialsName: TEdit;
    lblNewDispName: TLabel;
    edtNewDispName: TEdit;
    lblNewMatDrive: TLabel;
    edtNewMatDrive: TEdit;
    lblNewRatedVoltage: TLabel;
    edtNewRatedVoltage: TEdit;
    lblNewRatedCurrent: TLabel;
    edtNewRatedCurrent: TEdit;
    lblNewENHighVoltageSell: TLabel;
    edtNewENHighVoltageSellName: TEdit;
    spbNewTkMaterials: TSpeedButton;
    spbNewMatDrive: TSpeedButton;
    spbNewENHighVoltageSell: TSpeedButton;
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
  frmENLoadSwitchChangeEdit: TfrmENLoadSwitchChangeEdit;
  ENLoadSwitchChangeObj, ENLoadSwitchChangeNewObj: ENLoadSwitchChange;
  ENLoadSwitchOldObj, ENLoadSwitchNewObj: ENLoadSwitch;

implementation

uses ShowEquipChangeWorker, EquipChangeWorkerController,
  ENHighVoltageSellController, ENTransformerController;

{$R *.dfm}

procedure TfrmENLoadSwitchChangeEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  matDriveObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  ENHighVoltageSellNewObj: ENHighVoltageSell;
begin
  //Отображение подлежащего замене выключаетеля нагрузки
  DisableControls([(*Заменяемый выключатель нагрузки*) edtENHighVoltageSellName,
    edtMaterialsName, edtMatDrive, edtDispName, edtRatedVoltage, edtRatedCurrent,
    (*Новый выключатель нагрузки*) edtNewENHighVoltageSellName, edtNewMaterialsName,
    edtNewMatDrive, edtNewDispName, edtNewRatedVoltage, edtNewRatedCurrent]);
  SetFloatStyle([(*Заменяемый выключатель нагрузки*) edtRatedVoltage, edtRatedCurrent,
    (*Новый выключатель нагрузки*) edtNewRatedVoltage, edtNewRatedCurrent]);

  if (ENLoadSwitchOldObj <> nil) then
    begin
      //edtLoadSwitchCode.Text := IntToStr(ENLoadSwitchObj.code);
      edtDispName.Text := ENLoadSwitchOldObj.name;
      if (ENLoadSwitchOldObj.ratedVoltage <> nil ) then
         edtRatedVoltage.Text := ENLoadSwitchOldObj.ratedVoltage.decimalString
      else
         edtRatedVoltage.Text := '';
      if (ENLoadSwitchOldObj.ratedCurrent <> nil ) then
         edtRatedCurrent.Text := ENLoadSwitchOldObj.ratedCurrent.decimalString
      else
         edtRatedCurrent.Text := '';

      (*edtENLoadSwitchTypeName.Text := ENLoadSwitchOldObj.loadswitchType.name;
      edtENLoadSwitchDriveType.Text :=
          ENLoadSwitchOldObj.loadswitchdriveType.name;*)

      edtENHighVoltageSellName.Text :=
          'Ячейка № ' + ENLoadSwitchOldObj.highvoltageSell.numberGen;

      if ENLoadSwitchOldObj.materialRef <> nil then
        if ENLoadSwitchOldObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENLoadSwitchOldObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

      if ENLoadSwitchOldObj.matDriveRef <> nil then
        if ENLoadSwitchOldObj.matDriveRef.code <> Low(Integer) then
          begin
            if TempSpr_matherial = nil then
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            matDriveObj :=
              TempSpr_matherial.getObject(ENLoadSwitchOldObj.matDriveRef.code);
            edtMatDrive.Text := matDriveObj.name;
          end;
      //edtENElementName.Text := ENLoadSwitchObj.element.name;
    end; //if (ENLoadSwitchOldObj <> nil) then

  if ENLoadSwitchChangeNewObj <> nil then
    begin
      if ENLoadSwitchChangeNewObj.highVoltCellRef <> nil then
        if ENLoadSwitchChangeNewObj.highVoltCellRef.code <> Low(Integer) then
          begin
            TempENHighVoltageSell :=
              HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
            ENHighVoltageSellNewObj :=
              TempENHighVoltageSell.getObject(
                ENLoadSwitchChangeNewObj.highVoltCellRef.code);
            if ENHighVoltageSellNewObj <> nil then
              edtNewENHighVoltageSellName.Text := 'Ячейка № ' +
                ENHighVoltageSellNewObj.numberGen;
          end;
    end; //if ENLoadSwitchChangeNewObj <> nil then

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

  if ((DialogState = dsEdit) or (DialogState = dsView)) and (ENLoadSwitchChangeObj <> nil) then
  begin
      edtCode.Text := IntToStr(ENLoadSwitchChangeObj.code);
      if Length(ENLoadSwitchChangeObj.name) > 0 then
        memName.Text := ENLoadSwitchChangeObj.name;
      if ENLoadSwitchChangeObj.installDate <> nil then
      begin
        dtpInstallDate.DateTime := EncodeDate(
          ENLoadSwitchChangeObj.installDate.Year,
          ENLoadSwitchChangeObj.installDate.Month,
          ENLoadSwitchChangeObj.installDate.Day);
        dtpInstallDate.checked := true;
      end
      else
      begin
        dtpInstallDate.DateTime:=SysUtils.Date;
        dtpInstallDate.checked := false;
      end;
      if ENLoadSwitchChangeObj.uninstallDate <> nil then
      begin
        dtpUninstallDate.DateTime := EncodeDate(
          ENLoadSwitchChangeObj.uninstallDate.Year,
          ENLoadSwitchChangeObj.uninstallDate.Month,
          ENLoadSwitchChangeObj.uninstallDate.Day);
        dtpUninstallDate.checked := true;
      end
      else
      begin
        dtpUninstallDate.DateTime:=SysUtils.Date;
        dtpUninstallDate.checked := false;
      end;
    edtWorkOrderNumber.Text := ENLoadSwitchChangeObj.workOrderNumber;
      if ENLoadSwitchChangeObj.dateWorkOrder <> nil then
      begin
        dtpDateWorkOrder.DateTime := EncodeDate(
          ENLoadSwitchChangeObj.dateWorkOrder.Year,
          ENLoadSwitchChangeObj.dateWorkOrder.Month,
          ENLoadSwitchChangeObj.dateWorkOrder.Day);
        dtpDateWorkOrder.checked := true;
      end
      else
      begin
        dtpDateWorkOrder.DateTime:=SysUtils.Date;
        dtpDateWorkOrder.checked := false;
      end;
    edtActNumberGen.Text := ENLoadSwitchChangeObj.actNumberGen;
      if ENLoadSwitchChangeObj.actDateGen <> nil then
      begin
        dtpActDateGen.DateTime := EncodeDate(
          ENLoadSwitchChangeObj.actDateGen.Year,
          ENLoadSwitchChangeObj.actDateGen.Month,
          ENLoadSwitchChangeObj.actDateGen.Day);
        dtpActDateGen.checked := true;
      end
      else
      begin
        dtpActDateGen.DateTime:=SysUtils.Date;
        dtpActDateGen.checked := false;
      end;
    edtWorkerEquipChange.Text := ENLoadSwitchChangeObj.workerEquipChange;
    if ENLoadSwitchChangeObj.worker <> nil then
      edtEquipChangeWorkerName.Text := ENLoadSwitchChangeObj.worker.name;

  end;
end;

procedure TfrmENLoadSwitchChangeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENLoadSwitchChange: ENLoadSwitchChangeControllerSoapPort;
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
     //TempENLoadSwitchChange := HTTPRIOENLoadSwitchChange as ENLoadSwitchChangeControllerSoapPort;
     if ((ModalResult = mrOk) or (ModalResult = mrNo))
     and (ENLoadSwitchChangeObj <> nil) then
       begin
         if (ENLoadSwitchOldObj <> nil) then
           begin //Связь объекта истории со снимаемым оборудованием
             if ENLoadSwitchChangeObj.loadSwitchRef = nil then
               ENLoadSwitchChangeObj.loadSwitchRef := ENLoadSwitchRef.Create;
             ENLoadSwitchChangeObj.loadSwitchRef.code := ENLoadSwitchOldObj.code;
             if ENLoadSwitchOldObj.highvoltageSell <> nil then
               if ENLoadSwitchOldObj.highvoltageSell.code <> low(Integer) then
                 begin
                   if ENLoadSwitchChangeObj.highVoltCellRef = nil then
                     ENLoadSwitchChangeObj.highVoltCellRef :=
                       ENHighVoltageSellRef.Create;
                   ENLoadSwitchChangeObj.highVoltCellRef.code :=
                     ENLoadSwitchOldObj.highvoltageSell.code;

                   if ENLoadSwitchOldObj.highvoltageSell.transformerRef <> nil
                   then
                     if ENLoadSwitchOldObj.highvoltageSell.transformerRef.code
                     <> low(Integer) then
                       begin
                         if ENLoadSwitchChangeObj.transformerRef = nil then
                           ENLoadSwitchChangeObj.transformerRef :=
                             ENTransformerRef.Create;
                         ENLoadSwitchChangeObj.transformerRef.code :=
                           ENLoadSwitchOldObj.highvoltageSell.transformerRef.code;
                       end;
                 end;
           end;

         ENLoadSwitchChangeObj.name := memName.Text;

         if dtpInstallDate.checked then
         begin
           if ENLoadSwitchChangeObj.installDate = nil then
              ENLoadSwitchChangeObj.installDate := TXSDate.Create;
           ENLoadSwitchChangeObj.installDate.XSToNative(GetXSDate(dtpInstallDate.DateTime));
         end
         else
           ENLoadSwitchChangeObj.installDate := nil;

         if dtpUninstallDate.checked then
         begin
           if ENLoadSwitchChangeObj.uninstallDate = nil then
              ENLoadSwitchChangeObj.uninstallDate := TXSDate.Create;
           ENLoadSwitchChangeObj.uninstallDate.XSToNative(GetXSDate(dtpUninstallDate.DateTime));
         end
         else
           ENLoadSwitchChangeObj.uninstallDate := nil;

         ENLoadSwitchChangeObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENLoadSwitchChangeObj.dateWorkOrder = nil then
              ENLoadSwitchChangeObj.dateWorkOrder := TXSDate.Create;
           ENLoadSwitchChangeObj.dateWorkOrder.XSToNative(GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENLoadSwitchChangeObj.dateWorkOrder := nil;

         ENLoadSwitchChangeObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENLoadSwitchChangeObj.actDateGen = nil then
              ENLoadSwitchChangeObj.actDateGen := TXSDate.Create;
           ENLoadSwitchChangeObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENLoadSwitchChangeObj.actDateGen := nil;

         ENLoadSwitchChangeObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrNo)) and (ENLoadSwitchChangeObj <> nil) then
     if ((ModalResult = mrOk) or (ModalResult = mrYes))
     and (ENLoadSwitchChangeNewObj <> nil) then
       begin
         if (ENLoadSwitchNewObj <> nil) then
           begin //Связь объекта истории с устанавливаемым оборудованием
             if ENLoadSwitchChangeNewObj.loadSwitchRef = nil then
               ENLoadSwitchChangeNewObj.loadSwitchRef := ENLoadSwitchRef.Create;
             ENLoadSwitchChangeNewObj.loadSwitchRef.code := ENLoadSwitchNewObj.code;

             (*if ENLoadSwitchChangeNewObj.highVoltCellRef = nil then
               ENLoadSwitchChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
             if ENLoadSwitchOldNewObj.highvoltageSell <> nil then
               if ENLoadSwitchNewObj.highvoltageSell.code <> low(Integer) then
                 ENLoadSwitchChangeNewObj.highVoltCellRef.code :=
                   ENLoadSwitchNewObj.highvoltageSell.code;*)
           end;

         ENLoadSwitchChangeNewObj.name := memName.Text;

         if dtpInstallDate.checked then
           begin
             if ENLoadSwitchChangeNewObj.installDate = nil then
                ENLoadSwitchChangeNewObj.installDate := TXSDate.Create;
             ENLoadSwitchChangeNewObj.installDate.XSToNative(
               GetXSDate(dtpInstallDate.DateTime));
           end
         else
           ENLoadSwitchChangeNewObj.installDate := nil;

         ENLoadSwitchChangeNewObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENLoadSwitchChangeNewObj.dateWorkOrder = nil then
              ENLoadSwitchChangeNewObj.dateWorkOrder := TXSDate.Create;
           ENLoadSwitchChangeNewObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENLoadSwitchChangeNewObj.dateWorkOrder := nil;

         ENLoadSwitchChangeNewObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENLoadSwitchChangeNewObj.actDateGen = nil then
              ENLoadSwitchChangeNewObj.actDateGen := TXSDate.Create;
           ENLoadSwitchChangeNewObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENLoadSwitchChangeNewObj.actDateGen := nil;
         ENLoadSwitchChangeNewObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrYes)) and (ENLoadSwitchChangeNewObj <> nil) then
  end;
end;


procedure TfrmENLoadSwitchChangeEdit.spbEquipChangeWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENLoadSwitchChangeObj.worker = nil then ENLoadSwitchChangeObj.worker := EquipChangeWorker.Create();
               ENLoadSwitchChangeObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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
procedure TfrmENLoadSwitchChangeEdit.actChangeEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENLoadSwitchChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия выключателя нагрузки должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  tsEquipInstall.TabVisible := True;
  actChooseNewEquip.Enabled := True;
  pcChangeEquipment.ActivePage := tsEquipInstall;
  btnOk.Action := ActnLstChangeEquip.Actions[2]
end;

procedure TfrmENLoadSwitchChangeEdit.actDemontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENLoadSwitchChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия выключателя нагрузки должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
end;

procedure TfrmENLoadSwitchChangeEdit.actMontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpInstallDate.Checked) then
    begin
      frmENLoadSwitchChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата установки выключателя нагрузки должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      dtpInstallDate.SetFocus;
      Exit;
    end;
  if ENLoadSwitchNewObj = nil then
    begin
      frmENLoadSwitchChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Необходимо указать новое оборудование.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      Exit;
    end;
  actChooseNewEquip.Enabled := True;
  btnOk.Action := ActnLstChangeEquip.Actions[3];
end;

procedure TfrmENLoadSwitchChangeEdit.actSaveChangesExecute(
  Sender: TObject);
begin
  frmENLoadSwitchChangeEdit.ModalResult := mrOk;
end;

procedure TfrmENLoadSwitchChangeEdit.actChooseNewEquipExecute(
  Sender: TObject);
Var TempENLoadSwitch: ENLoadSwitchControllerSoapPort;
  ENLoadSwitchFilterObj: ENLoadSwitchFilter;
  fENLoadSwitchShow: TfrmENLoadSwitchShow;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  (*Spr_matherialObj,*) matDriveObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
begin
  ENLoadSwitchFilterObj := ENLoadSwitchFilter.Create;
  SetNullIntProps(ENLoadSwitchFilterObj);
  SetNullXSProps(ENLoadSwitchFilterObj);
  ENLoadSwitchFilterObj.conditionSQL :=
    ' COALESCE(ENLOADSWITCH.HIGHVOLTAGESELLCODE, 0) = 0';

  fENLoadSwitchShow := TfrmENLoadSwitchShow.Create(
    Application, fmNormal, ENLoadSwitchFilterObj);
  try
    fENLoadSwitchShow.actInsert.Enabled := False;
    fENLoadSwitchShow.actEdit.Enabled := False;
    fENLoadSwitchShow.actDelete.Enabled := False;
    if fENLoadSwitchShow.ShowModal = mrOk then
      begin
        TempENLoadSwitch :=
          HTTPRIOENLoadSwitch as ENLoadSwitchControllerSoapPort;
        try
          with fENLoadSwitchShow do
            ENLoadSwitchNewObj := TempENLoadSwitch.getObject(StrToInt(
              sgENLoadSwitch.Cells[0, sgENLoadSwitch.Row]));

          if (ENLoadSwitchNewObj <> nil) then
            begin //Заполнение полей для устанавливаемого объекта
              //edtNewLoadSwitchCode.Text := IntToStr(ENLoadSwitchNewObj.code);
              edtNewDispName.Text := ENLoadSwitchNewObj.name;
              if ( ENLoadSwitchNewObj.ratedVoltage <> nil ) then
                 edtNewRatedVoltage.Text := ENLoadSwitchNewObj.ratedVoltage.decimalString
              else
                 edtNewRatedVoltage.Text := ''; 
              if ( ENLoadSwitchNewObj.ratedCurrent <> nil ) then
                 edtNewRatedCurrent.Text := ENLoadSwitchNewObj.ratedCurrent.decimalString
              else
                 edtNewRatedCurrent.Text := '';

              (*edtNewENLoadSwitchTypeName.Text := ENLoadSwitchNewObj.loadswitchType.name;
              edtNewENLoadSwitchDriveType.Text :=
                  ENLoadSwitchNewObj.loadswitchdriveType.name;*)

              edtNewENHighVoltageSellName.Text :=
                  'Ячейка № ' + ENLoadSwitchNewObj.highvoltageSell.numberGen;

              if ENLoadSwitchNewObj.materialRef <> nil then
                if ENLoadSwitchNewObj.materialRef.code <> Low(Integer) then
                  begin
                    TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    Spr_matherialFilterObj := TKMaterialsFilter.Create;
                    SetNullIntProps(Spr_matherialFilterObj);
                    Spr_matherialFilterObj.code := ENLoadSwitchNewObj.materialRef.code;
                    Spr_matherialList :=
                      TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
                    if (Spr_matherialList.totalCount > 0) then
                      edtNewMaterialsName.Text := Spr_matherialList.list[0].name
                    else
                      edtNewMaterialsName.Text := '';
                  end;

              if ENLoadSwitchNewObj.matDriveRef <> nil then
                if ENLoadSwitchNewObj.matDriveRef.code <> Low(Integer) then
                  begin
                    if TempSpr_matherial = nil then
                      TempSpr_matherial :=
                        HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    matDriveObj :=
                      TempSpr_matherial.getObject(ENLoadSwitchNewObj.matDriveRef.code);
                    edtNewMatDrive.Text := matDriveObj.name;
                  end;

              //edtNewENElementName.Text := ENLoadSwitchNewObj.element.name;
            end; //if (ENLoadSwitchNewObj <> nil) then
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    fENLoadSwitchShow.Free;
  end;
end;

end.
