//Редактирование Истории замен Электрических Шин
unit EditENBusChange;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENBusChangeController,
    ENBusController, EditENBus, ShowENBus, TKMaterialsController;

type
  TfrmENBusChangeEdit = class(TDialogForm)
  

  HTTPRIOENBusChange: THTTPRIO;
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
    lblInsulatornumberGen: TLabel;
    lblLength: TLabel;
    lblLocationScheme: TLabel;
    lblENHighVoltageSellName: TLabel;
    lblMaterialsName: TLabel;
    lblMatInsulator: TLabel;
    lblDispName: TLabel;
    edtInsulatornumberGen: TEdit;
    edtLength: TEdit;
    edtLocationScheme: TEdit;
    edtENHighVoltageSellName: TEdit;
    edtMaterialsName: TEdit;
    edtMatInsulator: TEdit;
    edtDispName: TEdit;
    HTTPRIOSpr_matherial: THTTPRIO;
    HTTPRIOENBus: THTTPRIO;
    memName: TMemo;
    ActnLstChangeEquip: TActionList;
    actChangeEquip: TAction;
    actDemontageEquip: TAction;
    actMontageEquip: TAction;
    actSaveChanges: TAction;
    actChooseNewEquip: TAction;
    lblNewMaterialsName: TLabel;
    edtNewMaterialsName: TEdit;
    lblNewDispName: TLabel;
    edtNewDispName: TEdit;
    lblNewMatInsulator: TLabel;
    edtNewMatInsulator: TEdit;
    lblNewInsulatornumberGen: TLabel;
    edtNewInsulatornumberGen: TEdit;
    lblNewLength: TLabel;
    edtNewLength: TEdit;
    lblNewLocationScheme: TLabel;
    edtNewLocationScheme: TEdit;
    lblNewENHighVoltageSellName: TLabel;
    edtNewENHighVoltageSellName: TEdit;
    spbNewTkMaterials: TSpeedButton;
    spbNewMatInsulator: TSpeedButton;
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
  frmENBusChangeEdit: TfrmENBusChangeEdit;
  ENBusChangeObj, ENBusChangeNewObj: ENBusChange;
  ENBusOldObj, ENBusNewObj: ENBus;

implementation

uses ShowEquipChangeWorker, EquipChangeWorkerController,
  ENHighVoltageSellController, ENTransformerController;

{$R *.dfm}

procedure TfrmENBusChangeEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  (*Spr_matherialObj,*) matInsulatorObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  ENHighVoltageSellNewObj: ENHighVoltageSell;
begin
  //Отображение подлежащей замене электрической шины
  DisableControls([(*Заменяемая электрическая шина*) edtENHighVoltageSellName,
    edtMaterialsName, edtMatInsulator, edtInsulatornumberGen,
    edtLength, edtLocationScheme, edtDispName,
    (*Новая электрическая шина*) edtNewENHighVoltageSellName,
    edtNewMaterialsName, edtNewMatInsulator, edtNewInsulatornumberGen,
    edtNewLength, edtNewLocationScheme, edtNewDispName]);
  SetIntStyle([(*Заменяемая электрическая шина*)  edtInsulatornumberGen,
    (*Новая электрическая шина*) edtNewInsulatornumberGen]);
  SetFloatStyle([(*Заменяемая электрическая шина*) edtLength,
    (*Новая электрическая шина*) edtNewLength]);
  if ENBusOldObj <> nil then
    begin
      //edtBusCode.Text := IntToStr(ENBusOldObj.code);
      edtDispName.Text := ENBusOldObj.name;
      if (ENBusOldObj.insulatornumberGen <> nil ) then
         edtInsulatornumberGen.Text := ENBusOldObj.insulatornumberGen.decimalString
      else
         edtInsulatornumberGen.Text := '';
      if (ENBusOldObj.length <> nil ) then
         edtLength.Text := ENBusOldObj.length.decimalString
      else
         edtLength.Text := ''; 
      edtLocationScheme.Text := ENBusOldObj.locationScheme;

      //edtENInsulatorTypeName.Text := ENBusOldObj.insulatorType.name;
      //edtENElementName.Text := ENBusOldObj.element.name;

      edtENHighVoltageSellName.Text := 'Ячейка № ' +
        ENBusOldObj.highvoltageSell.numberGen;

      if ENBusOldObj.materialRef <> nil then
        if ENBusOldObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial :=
              HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENBusOldObj.materialRef.code;
            Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(
              Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

      if ENBusOldObj.matInsulatorRef <> nil then
        if ENBusOldObj.matInsulatorRef.code <> Low(Integer) then
          begin
            if TempSpr_matherial = nil then
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            matInsulatorObj :=
              TempSpr_matherial.getObject(ENBusOldObj.matInsulatorRef.code);
            edtMatInsulator.Text := matInsulatorObj.name;
          end;
    end;

  if ENBusChangeNewObj <> nil then
    begin
      if ENBusChangeNewObj.highVoltCellRef <> nil then
        if ENBusChangeNewObj.highVoltCellRef.code <> Low(Integer) then
          begin
            TempENHighVoltageSell :=
              HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
            ENHighVoltageSellNewObj :=
              TempENHighVoltageSell.getObject(
                ENBusChangeNewObj.highVoltCellRef.code);
            if ENHighVoltageSellNewObj <> nil then
              edtNewENHighVoltageSellName.Text := 'Ячейка № ' +
                ENHighVoltageSellNewObj.numberGen;
          end;
    end; //if ENBusChangeNewObj <> nil then

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

  if ((DialogState = dsEdit) or (DialogState = dsView)) and (ENBusChangeObj <> nil) then
  begin
      edtCode.Text := IntToStr(ENBusChangeObj.code);
      if Length(ENBusChangeObj.name) > 0 then
        memName.Text := ENBusChangeObj.name;
      if ENBusChangeObj.installDate <> nil then
      begin
        dtpInstallDate.DateTime := EncodeDate(
          ENBusChangeObj.installDate.Year,
          ENBusChangeObj.installDate.Month,
          ENBusChangeObj.installDate.Day);
        dtpInstallDate.checked := true;
      end
      else
      begin
        dtpInstallDate.DateTime:=SysUtils.Date;
        dtpInstallDate.checked := false;
      end;
      if ENBusChangeObj.uninstallDate <> nil then
      begin
        dtpUninstallDate.DateTime := EncodeDate(
          ENBusChangeObj.uninstallDate.Year,
          ENBusChangeObj.uninstallDate.Month,
          ENBusChangeObj.uninstallDate.Day);
        dtpUninstallDate.checked := true;
      end
      else
      begin
        dtpUninstallDate.DateTime:=SysUtils.Date;
        dtpUninstallDate.checked := false;
      end;
    edtWorkOrderNumber.Text := ENBusChangeObj.workOrderNumber;
      if ENBusChangeObj.dateWorkOrder <> nil then
      begin
        dtpDateWorkOrder.DateTime := EncodeDate(
          ENBusChangeObj.dateWorkOrder.Year,
          ENBusChangeObj.dateWorkOrder.Month,
          ENBusChangeObj.dateWorkOrder.Day);
        dtpDateWorkOrder.checked := true;
      end
      else
      begin
        dtpDateWorkOrder.DateTime:=SysUtils.Date;
        dtpDateWorkOrder.checked := false;
      end;
    edtActNumberGen.Text := ENBusChangeObj.actNumberGen; 
      if ENBusChangeObj.actDateGen <> nil then
      begin
        dtpActDateGen.DateTime:=EncodeDate(ENBusChangeObj.actDateGen.Year,ENBusChangeObj.actDateGen.Month,ENBusChangeObj.actDateGen.Day);
        dtpActDateGen.checked := true;
      end
      else
      begin
        dtpActDateGen.DateTime:=SysUtils.Date;
        dtpActDateGen.checked := false;
      end;
    edtWorkerEquipChange.Text := ENBusChangeObj.workerEquipChange; 
    if ENBusChangeObj.worker <> nil then
      edtEquipChangeWorkerName.Text := ENBusChangeObj.worker.name;
  end;
end;



procedure TfrmENBusChangeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENBusChange: ENBusChangeControllerSoapPort;
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
    //TempENBusChange := HTTPRIOENBusChange as ENBusChangeControllerSoapPort;
     if ((ModalResult = mrOk) or (ModalResult = mrNo))
     and (ENBusChangeObj <> nil) then
       begin
         if (ENBusOldObj <> nil) then
           begin //Связь объекта истории со снимаемым оборудованием
             if ENBusChangeObj.busRef = nil then
               ENBusChangeObj.busRef := ENBusRef.Create;
             ENBusChangeObj.busRef.code := ENBusOldObj.code;

             if ENBusOldObj.highvoltageSell <> nil then
               if ENBusOldObj.highvoltageSell.code <> low(Integer) then
                 begin
                   if ENBusChangeObj.highVoltCellRef = nil then
                     ENBusChangeObj.highVoltCellRef := ENHighVoltageSellRef.Create;
                   ENBusChangeObj.highVoltCellRef.code :=
                     ENBusOldObj.highvoltageSell.code;

                   if ENBusOldObj.highvoltageSell.transformerRef <> nil
                   then
                     if ENBusOldObj.highvoltageSell.transformerRef.code
                     <> low(Integer) then
                       begin
                         if ENBusChangeObj.transformerRef = nil then
                           ENBusChangeObj.transformerRef :=
                             ENTransformerRef.Create;
                         ENBusChangeObj.transformerRef.code :=
                           ENBusOldObj.highvoltageSell.transformerRef.code;
                       end;
                 end;
           end;

         ENBusChangeObj.name := memName.Text;

         if dtpInstallDate.checked then
         begin
           if ENBusChangeObj.installDate = nil then
              ENBusChangeObj.installDate := TXSDate.Create;
           ENBusChangeObj.installDate.XSToNative(GetXSDate(dtpInstallDate.DateTime));
         end
         else
           ENBusChangeObj.installDate := nil;

         if dtpUninstallDate.checked then
         begin
           if ENBusChangeObj.uninstallDate = nil then
              ENBusChangeObj.uninstallDate := TXSDate.Create;
           ENBusChangeObj.uninstallDate.XSToNative(GetXSDate(dtpUninstallDate.DateTime));
         end
         else
           ENBusChangeObj.uninstallDate := nil;

         ENBusChangeObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENBusChangeObj.dateWorkOrder = nil then
              ENBusChangeObj.dateWorkOrder := TXSDate.Create;
           ENBusChangeObj.dateWorkOrder.XSToNative(GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENBusChangeObj.dateWorkOrder := nil;

         ENBusChangeObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENBusChangeObj.actDateGen = nil then
              ENBusChangeObj.actDateGen := TXSDate.Create;
           ENBusChangeObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENBusChangeObj.actDateGen := nil;

         ENBusChangeObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrNo)) and (ENBusChangeObj <> nil) then
     if ((ModalResult = mrOk) or (ModalResult = mrYes))
     and (ENBusChangeNewObj <> nil) then
       begin
         if (ENBusNewObj <> nil) then
           begin //Связь объекта истории с устанавливаемым оборудованием
             if ENBusChangeNewObj.busRef = nil then
               ENBusChangeNewObj.busRef := ENBusRef.Create;
             ENBusChangeNewObj.busRef.code := ENBusNewObj.code;

             (*if ENBusChangeNewObj.highVoltCellRef = nil then
               ENBusChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
             if ENBusOldNewObj.highvoltageSell <> nil then
               if ENBusNewObj.highvoltageSell.code <> low(Integer) then
                 ENBusChangeNewObj.highVoltCellRef.code :=
                   ENBusNewObj.highvoltageSell.code;*)
           end;

         ENBusChangeNewObj.name := memName.Text;

         if dtpInstallDate.checked then
           begin
             if ENBusChangeNewObj.installDate = nil then
                ENBusChangeNewObj.installDate := TXSDate.Create;
             ENBusChangeNewObj.installDate.XSToNative(
               GetXSDate(dtpInstallDate.DateTime));
           end
         else
           ENBusChangeNewObj.installDate := nil;

         ENBusChangeNewObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENBusChangeNewObj.dateWorkOrder = nil then
              ENBusChangeNewObj.dateWorkOrder := TXSDate.Create;
           ENBusChangeNewObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENBusChangeNewObj.dateWorkOrder := nil;

         ENBusChangeNewObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENBusChangeNewObj.actDateGen = nil then
              ENBusChangeNewObj.actDateGen := TXSDate.Create;
           ENBusChangeNewObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENBusChangeNewObj.actDateGen := nil;
         ENBusChangeNewObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrYes)) and (ENBusChangeNewObj <> nil) then
  end;
end;


procedure TfrmENBusChangeEdit.spbEquipChangeWorkerClick(Sender : TObject);
var
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENBusChangeObj.worker = nil then ENBusChangeObj.worker := EquipChangeWorker.Create();
               ENBusChangeObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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
procedure TfrmENBusChangeEdit.actChangeEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENBusChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия электрической шины должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  tsEquipInstall.TabVisible := True;
  actChooseNewEquip.Enabled := True;
  pcChangeEquipment.ActivePage := tsEquipInstall;
  btnOk.Action := ActnLstChangeEquip.Actions[2]
end;

procedure TfrmENBusChangeEdit.actDemontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENBusChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия электрической шины должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
end;

procedure TfrmENBusChangeEdit.actMontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpInstallDate.Checked) then
    begin
      frmENBusChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата установки электрической шины должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      dtpInstallDate.SetFocus;
      Exit;
    end;
  if ENBusNewObj = nil then
    begin
      frmENBusChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Необходимо указать новое оборудование.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      Exit;
    end;
  actChooseNewEquip.Enabled := True;
  btnOk.Action := ActnLstChangeEquip.Actions[3];
end;

procedure TfrmENBusChangeEdit.actSaveChangesExecute(
  Sender: TObject);
begin
  frmENBusChangeEdit.ModalResult := mrOk;
end;

procedure TfrmENBusChangeEdit.actChooseNewEquipExecute(
  Sender: TObject);
Var TempENBus: ENBusControllerSoapPort;
  ENBusFilterObj: ENBusFilter;
  fENBusShow: TfrmENBusShow;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  (*Spr_matherialObj,*) matInsulatorObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
begin
  ENBusFilterObj := ENBusFilter.Create;
  SetNullIntProps(ENBusFilterObj);
  SetNullXSProps(ENBusFilterObj);
  ENBusFilterObj.conditionSQL :=
    ' COALESCE(ENBUS.HIGHVOLTAGESELLCODE, 0) = 0';

  fENBusShow := TfrmENBusShow.Create(
    Application, fmNormal, ENBusFilterObj);
  try
    if fENBusShow.ShowModal = mrOk then
      begin
        TempENBus :=
          HTTPRIOENBus as ENBusControllerSoapPort;
        try
          with fENBusShow do
            ENBusNewObj := TempENBus.getObject(StrToInt(
              sgENBus.Cells[0, sgENBus.Row]));

          if (ENBusNewObj <> nil) then
            begin //Заполнение полей для устанавливаемого объекта
              //edtNewBusCode.Text := IntToStr(ENBusNewObj.code);
              edtNewDispName.Text := ENBusNewObj.name;
              if ( ENBusNewObj.insulatornumberGen <> nil ) then
                 edtNewInsulatornumberGen.Text := ENBusNewObj.insulatornumberGen.decimalString
              else
                 edtNewInsulatornumberGen.Text := ''; 
              if ( ENBusNewObj.length <> nil ) then
                 edtNewLength.Text := ENBusNewObj.length.decimalString
              else
                 edtNewLength.Text := ''; 
              edtNewLocationScheme.Text := ENBusNewObj.locationScheme;

              edtNewENHighVoltageSellName.Text := 'Ячейка № ' +
                ENBusNewObj.highvoltageSell.numberGen;

              if ENBusNewObj.materialRef <> nil then
                if ENBusNewObj.materialRef.code <> Low(Integer) then
                  begin
                    TempSpr_matherial :=
                      HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    Spr_matherialFilterObj := TKMaterialsFilter.Create;
                    SetNullIntProps(Spr_matherialFilterObj);
                    Spr_matherialFilterObj.code := ENBusNewObj.materialRef.code;
                    Spr_matherialList := TempSpr_matherial.getScrollableFilteredList(
                      Spr_matherialFilterObj, 0, -1);
                    if (Spr_matherialList.totalCount > 0) then
                      edtNewMaterialsName.Text := Spr_matherialList.list[0].name
                    else
                      edtNewMaterialsName.Text := '';
                  end;

              if ENBusNewObj.matInsulatorRef <> nil then
                if ENBusNewObj.matInsulatorRef.code <> Low(Integer) then
                  begin
                    if TempSpr_matherial = nil then
                      TempSpr_matherial :=
                        HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    matInsulatorObj :=
                      TempSpr_matherial.getObject(ENBusNewObj.matInsulatorRef.code);
                    edtNewMatInsulator.Text := matInsulatorObj.name;
                  end;
              //edtNewENInsulatorTypeName.Text := ENBusNewObj.insulatorType.name;
              //edtNewENElementName.Text := ENBusNewObj.element.name;
            end; //if (ENBusNewObj <> nil) then
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    fENBusShow.Free;
  end;
end;

end.
