(*Редактирование Истории замен Изолятора на Высоковольтной стороне
Трансформаторной Подстанции 10 - 6 / 0,4 кВ
и на Опоре Воздушной Линии 6 - 10 кВ*)
unit EditENInsulatorChange;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENInsulatorChangeController,
    ENInsulatorController, EditENInsulator, ShowENInsulator,
    TKMaterialsController;

type
  TfrmENInsulatorChangeEdit = class(TDialogForm)
  

  HTTPRIOENInsulatorChange: THTTPRIO;
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
    HTTPRIOENInsulator: THTTPRIO;
    HTTPRIOSpr_matherial: THTTPRIO;
    lblVoltage: TLabel;
    lblNumberGen: TLabel;
    lblENHighVoltageSellName: TLabel;
    lblMaterialsName: TLabel;
    lblDispName: TLabel;
    edtVoltage: TEdit;
    edtNumberGen: TEdit;
    edtENHighVoltageSellName: TEdit;
    edtMaterialsName: TEdit;
    edtDispName: TEdit;
    lblNewMaterialsName: TLabel;
    edtNewMaterialsName: TEdit;
    lblNewDispName: TLabel;
    edtNewDispName: TEdit;
    lblNewVoltage: TLabel;
    edtNewVoltage: TEdit;
    lblNewNumberGen: TLabel;
    edtNewNumberGen: TEdit;
    lblNewENHighVoltageSellName: TLabel;
    edtNewENHighVoltageSellName: TEdit;
    spbNewTkMaterials: TSpeedButton;
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
  frmENInsulatorChangeEdit: TfrmENInsulatorChangeEdit;
  ENInsulatorChangeObj, ENInsulatorChangeNewObj: ENInsulatorChange;
  ENInsulatorOldObj, ENInsulatorNewObj: ENInsulator;

implementation

uses ShowEquipChangeWorker, EquipChangeWorkerController,
  ENHighVoltageSellController, ENTransformerController;

{$R *.dfm}

procedure TfrmENInsulatorChangeEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  ENHighVoltageSellNewObj: ENHighVoltageSell;
begin
  //Отображение подлежащего замене изолятора
  DisableControls([(*Заменяемый изолятор*) edtENHighVoltageSellName,
    edtMaterialsName, edtDispName, edtVoltage, edtNumberGen,
    (*Новый изолятор*) edtNewENHighVoltageSellName,
    edtNewMaterialsName, edtNewDispName, edtNewVoltage, edtNewNumberGen]);
  SetFloatStyle([(*Заменяемый изолятор*) edtVoltage, edtNumberGen,
    (*Новый изолятор*) edtNewVoltage, edtNewNumberGen]);
  if ENInsulatorOldObj <> nil then
    begin
      //edtInsulatorCode.Text := IntToStr(ENInsulatorOldObj.code);
      edtDispName.Text := ENInsulatorOldObj.name;
      if (ENInsulatorOldObj.voltage <> nil ) then
         edtVoltage.Text := ENInsulatorOldObj.voltage.decimalString
      else
         edtVoltage.Text := '';
      if (ENInsulatorOldObj.numberGen <> nil ) then
         edtNumberGen.Text := ENInsulatorOldObj.numberGen.decimalString
      else
         edtNumberGen.Text := ''; 

      //edtENInsulatorTypeName.Text := ENInsulatorOldObj.insulatorType.name;

      edtENHighVoltageSellName.Text :=
        'Ячейка № ' + ENInsulatorOldObj.highvoltageSell.numberGen;

      if ENInsulatorOldObj.materialRef <> nil then
        if ENInsulatorOldObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENInsulatorOldObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
      //edtENElementName.Text := ENInsulatorOldObj.element.name;
    end; //if ENInsulatorOldObj <> nil then

  if ENInsulatorChangeNewObj <> nil then
    begin
      if ENInsulatorChangeNewObj.highVoltCellRef <> nil then
        if ENInsulatorChangeNewObj.highVoltCellRef.code <> Low(Integer) then
          begin
            TempENHighVoltageSell :=
              HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
            ENHighVoltageSellNewObj :=
              TempENHighVoltageSell.getObject(
                ENInsulatorChangeNewObj.highVoltCellRef.code);
            if ENHighVoltageSellNewObj <> nil then
              edtNewENHighVoltageSellName.Text := 'Ячейка № ' +
                ENHighVoltageSellNewObj.numberGen;
          end;
    end; //if ENInsulatorChangeNewObj <> nil then

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

  if ((DialogState = dsEdit) or (DialogState = dsView)) and (ENInsulatorChangeObj <> nil) then
  begin
      edtCode.Text := IntToStr(ENInsulatorChangeObj.code);
      if Length(ENInsulatorChangeObj.name) > 0 then
        memName.Text := ENInsulatorChangeObj.name;
      if ENInsulatorChangeObj.installDate <> nil then
      begin
        dtpInstallDate.DateTime := EncodeDate(
          ENInsulatorChangeObj.installDate.Year,
          ENInsulatorChangeObj.installDate.Month,
          ENInsulatorChangeObj.installDate.Day);
        dtpInstallDate.checked := true;
      end
      else
      begin
        dtpInstallDate.DateTime:=SysUtils.Date;
        dtpInstallDate.checked := false;
      end;
      if ENInsulatorChangeObj.uninstallDate <> nil then
      begin
        dtpUninstallDate.DateTime := EncodeDate(
          ENInsulatorChangeObj.uninstallDate.Year,
          ENInsulatorChangeObj.uninstallDate.Month,
          ENInsulatorChangeObj.uninstallDate.Day);
        dtpUninstallDate.checked := true;
      end
      else
      begin
        dtpUninstallDate.DateTime:=SysUtils.Date;
        dtpUninstallDate.checked := false;
      end;
    edtWorkOrderNumber.Text := ENInsulatorChangeObj.workOrderNumber;
      if ENInsulatorChangeObj.dateWorkOrder <> nil then
      begin
        dtpDateWorkOrder.DateTime := EncodeDate(
          ENInsulatorChangeObj.dateWorkOrder.Year,
          ENInsulatorChangeObj.dateWorkOrder.Month,
          ENInsulatorChangeObj.dateWorkOrder.Day);
        dtpDateWorkOrder.checked := true;
      end
      else
      begin
        dtpDateWorkOrder.DateTime:=SysUtils.Date;
        dtpDateWorkOrder.checked := false;
      end;
    edtActNumberGen.Text := ENInsulatorChangeObj.actNumberGen;
      if ENInsulatorChangeObj.actDateGen <> nil then
      begin
        dtpActDateGen.DateTime := EncodeDate(
          ENInsulatorChangeObj.actDateGen.Year,
          ENInsulatorChangeObj.actDateGen.Month,
          ENInsulatorChangeObj.actDateGen.Day);
        dtpActDateGen.checked := true;
      end
      else
      begin
        dtpActDateGen.DateTime:=SysUtils.Date;
        dtpActDateGen.checked := false;
      end;
    edtWorkerEquipChange.Text := ENInsulatorChangeObj.workerEquipChange;
    if ENInsulatorChangeObj.worker <> nil then
      edtEquipChangeWorkerName.Text := ENInsulatorChangeObj.worker.name;
  end;
end;



procedure TfrmENInsulatorChangeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENInsulatorChange: ENInsulatorChangeControllerSoapPort;
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
    //TempENInsulatorChange := HTTPRIOENInsulatorChange as ENInsulatorChangeControllerSoapPort;
     if ((ModalResult = mrOk) or (ModalResult = mrNo))
     and (ENInsulatorChangeObj <> nil) then
       begin
         if (ENInsulatorOldObj <> nil) then
           begin //Связь объекта истории со снимаемым оборудованием
             if ENInsulatorChangeObj.insulatorRef = nil then
               ENInsulatorChangeObj.insulatorRef := ENInsulatorRef.Create;
             ENInsulatorChangeObj.insulatorRef.code := ENInsulatorOldObj.code;

             if ENInsulatorOldObj.highvoltageSell <> nil then
               if ENInsulatorOldObj.highvoltageSell.code <> low(Integer) then
                 begin
                   if ENInsulatorChangeObj.highVoltCellRef = nil then
                     ENInsulatorChangeObj.highVoltCellRef :=
                       ENHighVoltageSellRef.Create;
                   ENInsulatorChangeObj.highVoltCellRef.code :=
                     ENInsulatorOldObj.highvoltageSell.code;

                   if ENInsulatorOldObj.highvoltageSell.transformerRef <> nil
                   then
                     if ENInsulatorOldObj.highvoltageSell.transformerRef.code
                     <> low(Integer) then
                       begin
                         if ENInsulatorChangeObj.transformerRef = nil then
                           ENInsulatorChangeObj.transformerRef :=
                             ENTransformerRef.Create;
                         ENInsulatorChangeObj.transformerRef.code :=
                           ENInsulatorOldObj.highvoltageSell.transformerRef.code;
                       end;
                 end;
           end;

         ENInsulatorChangeObj.name := memName.Text;

         if dtpInstallDate.checked then
         begin
           if ENInsulatorChangeObj.installDate = nil then
              ENInsulatorChangeObj.installDate := TXSDate.Create;
           ENInsulatorChangeObj.installDate.XSToNative(GetXSDate(dtpInstallDate.DateTime));
         end
         else
           ENInsulatorChangeObj.installDate := nil;

         if dtpUninstallDate.checked then
         begin
           if ENInsulatorChangeObj.uninstallDate = nil then
              ENInsulatorChangeObj.uninstallDate := TXSDate.Create;
           ENInsulatorChangeObj.uninstallDate.XSToNative(GetXSDate(dtpUninstallDate.DateTime));
         end
         else
           ENInsulatorChangeObj.uninstallDate := nil;

         ENInsulatorChangeObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENInsulatorChangeObj.dateWorkOrder = nil then
              ENInsulatorChangeObj.dateWorkOrder := TXSDate.Create;
           ENInsulatorChangeObj.dateWorkOrder.XSToNative(GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENInsulatorChangeObj.dateWorkOrder := nil;

         ENInsulatorChangeObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENInsulatorChangeObj.actDateGen = nil then
              ENInsulatorChangeObj.actDateGen := TXSDate.Create;
           ENInsulatorChangeObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENInsulatorChangeObj.actDateGen := nil;

         ENInsulatorChangeObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrNo)) and (ENInsulatorChangeObj <> nil) then
     if ((ModalResult = mrOk) or (ModalResult = mrYes))
     and (ENInsulatorChangeNewObj <> nil) then
       begin
         if (ENInsulatorNewObj <> nil) then
           begin //Связь объекта истории с устанавливаемым оборудованием
             if ENInsulatorChangeNewObj.insulatorRef = nil then
               ENInsulatorChangeNewObj.insulatorRef := ENInsulatorRef.Create;
             ENInsulatorChangeNewObj.insulatorRef.code := ENInsulatorNewObj.code;

             (*if ENInsulatorChangeNewObj.highVoltCellRef = nil then
               ENInsulatorChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
             if ENInsulatorOldNewObj.highvoltageSell <> nil then
               if ENInsulatorNewObj.highvoltageSell.code <> low(Integer) then
                 ENInsulatorChangeNewObj.highVoltCellRef.code :=
                   ENInsulatorNewObj.highvoltageSell.code;*)
           end;

         ENInsulatorChangeNewObj.name := memName.Text;

         if dtpInstallDate.checked then
           begin
             if ENInsulatorChangeNewObj.installDate = nil then
                ENInsulatorChangeNewObj.installDate := TXSDate.Create;
             ENInsulatorChangeNewObj.installDate.XSToNative(
               GetXSDate(dtpInstallDate.DateTime));
           end
         else
           ENInsulatorChangeNewObj.installDate := nil;

         ENInsulatorChangeNewObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENInsulatorChangeNewObj.dateWorkOrder = nil then
              ENInsulatorChangeNewObj.dateWorkOrder := TXSDate.Create;
           ENInsulatorChangeNewObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENInsulatorChangeNewObj.dateWorkOrder := nil;

         ENInsulatorChangeNewObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENInsulatorChangeNewObj.actDateGen = nil then
              ENInsulatorChangeNewObj.actDateGen := TXSDate.Create;
           ENInsulatorChangeNewObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENInsulatorChangeNewObj.actDateGen := nil;
         ENInsulatorChangeNewObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrYes)) and (ENInsulatorChangeNewObj <> nil) then
  end;
end;


procedure TfrmENInsulatorChangeEdit.spbEquipChangeWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENInsulatorChangeObj.worker = nil then ENInsulatorChangeObj.worker := EquipChangeWorker.Create();
               ENInsulatorChangeObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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
procedure TfrmENInsulatorChangeEdit.actChangeEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENInsulatorChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия изолятора должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  tsEquipInstall.TabVisible := True;
  actChooseNewEquip.Enabled := True;
  pcChangeEquipment.ActivePage := tsEquipInstall;
  btnOk.Action := ActnLstChangeEquip.Actions[2]
end;

procedure TfrmENInsulatorChangeEdit.actDemontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENInsulatorChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия изолятора должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
end;

procedure TfrmENInsulatorChangeEdit.actMontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpInstallDate.Checked) then
    begin
      frmENInsulatorChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата установки изолятора должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      dtpInstallDate.SetFocus;
      Exit;
    end;
  if ENInsulatorNewObj = nil then
    begin
      frmENInsulatorChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Необходимо указать новое оборудование.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      Exit;
    end;
  actChooseNewEquip.Enabled := True;
  btnOk.Action := ActnLstChangeEquip.Actions[3];
end;

procedure TfrmENInsulatorChangeEdit.actSaveChangesExecute(
  Sender: TObject);
begin
  frmENInsulatorChangeEdit.ModalResult := mrOk;
end;

procedure TfrmENInsulatorChangeEdit.actChooseNewEquipExecute(
  Sender: TObject);
Var TempENInsulator: ENInsulatorControllerSoapPort;
  ENInsulatorFilterObj: ENInsulatorFilter;
  fENInsulatorShow: TfrmENInsulatorShow;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
begin
  ENInsulatorFilterObj := ENInsulatorFilter.Create;
  SetNullIntProps(ENInsulatorFilterObj);
  SetNullXSProps(ENInsulatorFilterObj);
  ENInsulatorFilterObj.conditionSQL :=
    ' COALESCE(ENINSULATOR.HIGHVOLTAGESELLCODE, 0) = 0 AND ' +
    ' COALESCE(ENINSULATOR.LINE10REFCODE, 0) = 0 AND ' +
    ' COALESCE(ENINSULATOR.POSTREFCODE, 0) = 0';

  fENInsulatorShow := TfrmENInsulatorShow.Create(
    Application, fmNormal, ENInsulatorFilterObj);
  try
    fENInsulatorShow.actInsert.Enabled := False;
    fENInsulatorShow.actEdit.Enabled := False;
    fENInsulatorShow.actDelete.Enabled := False;
    if fENInsulatorShow.ShowModal = mrOk then
      begin
        TempENInsulator :=
          HTTPRIOENInsulator as ENInsulatorControllerSoapPort;
        try
          with fENInsulatorShow do
            ENInsulatorNewObj := TempENInsulator.getObject(StrToInt(
              sgENInsulator.Cells[0, sgENInsulator.Row]));

          if (ENInsulatorNewObj <> nil) then
            begin //Заполнение полей для устанавливаемого объекта
              //edtNewInsulatorCode.Text := IntToStr(ENInsulatorNewObj.code);
              edtNewDispName.Text := ENInsulatorNewObj.name;
              if ( ENInsulatorNewObj.voltage <> nil ) then
                 edtNewVoltage.Text := ENInsulatorNewObj.voltage.decimalString
              else
                 edtNewVoltage.Text := ''; 
              if ( ENInsulatorNewObj.numberGen <> nil ) then
                 edtNewNumberGen.Text := ENInsulatorNewObj.numberGen.decimalString
              else
                 edtNewNumberGen.Text := ''; 

              //edtNewENInsulatorTypeName.Text := ENInsulatorNewObj.insulatorType.name;

              edtNewENHighVoltageSellName.Text :=
                'Ячейка № ' + ENInsulatorNewObj.highvoltageSell.numberGen;

              if ENInsulatorNewObj.materialRef <> nil then
                if ENInsulatorNewObj.materialRef.code <> Low(Integer) then
                  begin
                    TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    Spr_matherialFilterObj := TKMaterialsFilter.Create;
                    SetNullIntProps(Spr_matherialFilterObj);
                    Spr_matherialFilterObj.code := ENInsulatorNewObj.materialRef.code;
                    Spr_matherialList :=
                      TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
                    if (Spr_matherialList.totalCount > 0) then
                      edtNewMaterialsName.Text := Spr_matherialList.list[0].name
                    else
                      edtNewMaterialsName.Text := '';
                  end;

              //edtNewENElementName.Text := ENInsulatorNewObj.element.name;
            end; //if (ENInsulatorNewObj <> nil) then
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    fENInsulatorShow.Free;
  end;
end;

end.