(*Замена Разъединителя на Высоковольтной стороне Трансформаторной
Подстанции 10 - 6 / 0,4 кВ и на Опоре Воздушной Линии 6 - 10 кВ*)
unit EditENDisconnectorChange;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENDisconnectorChangeController,
    ENDisconnectorController, EditENDisconnector, ShowENDisconnector,
    TKMaterialsController;

type
  TfrmENDisconnectorChangeEdit = class(TDialogForm)
  

  HTTPRIOENDisconnectorChange: THTTPRIO;
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
    HTTPRIOSpr_matherial: THTTPRIO;
    HTTPRIOENDisconnector: THTTPRIO;
    memName: TMemo;
    ActnLstChangeEquip: TActionList;
    actChangeEquip: TAction;
    actDemontageEquip: TAction;
    actMontageEquip: TAction;
    actSaveChanges: TAction;
    actChooseNewEquip: TAction;
    lblRatedVoltage: TLabel;
    lblRatedCurrent: TLabel;
    lblENHighVoltageSellName: TLabel;
    lblMaterialsName: TLabel;
    lblMatDrive: TLabel;
    lblDispName: TLabel;
    edtRatedVoltage: TEdit;
    edtRatedCurrent: TEdit;
    edtENHighVoltageSellName: TEdit;
    edtMaterialsName: TEdit;
    edtMatDrive: TEdit;
    edtDispName: TEdit;
    lblNewRatedVoltage: TLabel;
    lblNewRatedCurrent: TLabel;
    lblNewENHighVoltageSellName: TLabel;
    lblNewMaterialsName: TLabel;
    lblNewMatDrive: TLabel;
    lblNewDispName: TLabel;
    edtNewRatedVoltage: TEdit;
    edtNewRatedCurrent: TEdit;
    edtNewENHighVoltageSellName: TEdit;
    edtNewMaterialsName: TEdit;
    edtNewMatDrive: TEdit;
    edtNewDispName: TEdit;
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
  frmENDisconnectorChangeEdit: TfrmENDisconnectorChangeEdit;
  ENDisconnectorChangeObj, ENDisconnectorChangeNewObj: ENDisconnectorChange;
  ENDisconnectorOldObj, ENDisconnectorNewObj: ENDisconnector;

implementation

uses ShowEquipChangeWorker, EquipChangeWorkerController,
  ENHighVoltageSellController, ENTransformerController;

{$R *.dfm}

procedure TfrmENDisconnectorChangeEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  matDriveObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  ENHighVoltageSellNewObj: ENHighVoltageSell;
begin
  //Отображение подлежащего замене разъединителя
  DisableControls([(*Заменяемый разъединитель*) edtENHighVoltageSellName,
    edtMaterialsName, edtDispName, edtRatedVoltage, edtRatedCurrent, edtMatDrive,
    (*Новый разъединитель*) edtNewENHighVoltageSellName, edtNewMaterialsName,
    edtNewDispName, edtNewRatedVoltage, edtNewRatedCurrent, edtNewMatDrive]);
  SetFloatStyle([(*Заменяемый разъединитель*) edtRatedVoltage, edtRatedCurrent,
    (*Новый разъединитель*) edtNewRatedVoltage, edtNewRatedCurrent]);

  if (ENDisconnectorOldObj <> nil) then
    begin
      //edtDisconnectorCode.Text := IntToStr(ENDisconnectorOldObj.code);
      edtDispName.Text := ENDisconnectorOldObj.name;
      if ( ENDisconnectorOldObj.ratedVoltage <> nil) then
         edtRatedVoltage.Text := ENDisconnectorOldObj.ratedVoltage.decimalString
      else
         edtRatedVoltage.Text := '';
      if ( ENDisconnectorOldObj.ratedCurrent <> nil) then
         edtRatedCurrent.Text := ENDisconnectorOldObj.ratedCurrent.decimalString
      else
         edtRatedCurrent.Text := '';

      (*edtENDisconnectorTypeName.Text := ENDisconnectorOldObj.disconnectorType.name;
      edtENDisconnectorDriveTypeName.Text :=
        ENDisconnectorOldObj.disconnectordriveType.name;*)

      edtENHighVoltageSellName.Text :=
        'Ячейка № ' + ENDisconnectorOldObj.highvoltageSell.numberGen;

      if ENDisconnectorOldObj.materialRef <> nil then
        if ENDisconnectorOldObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENDisconnectorOldObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;

      if ENDisconnectorOldObj.matDriveRef <> nil then
        if ENDisconnectorOldObj.matDriveRef.code <> Low(Integer) then
          begin
            if TempSpr_matherial = nil then
              TempSpr_matherial :=
                HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            matDriveObj :=
              TempSpr_matherial.getObject(ENDisconnectorOldObj.matDriveRef.code);
            edtMatDrive.Text := matDriveObj.name;
          end;
    end; //if (ENDisconnectorOldObj <> nil) then

  if ENDisconnectorChangeNewObj <> nil then
    begin
      if ENDisconnectorChangeNewObj.highVoltCellRef <> nil then
        if ENDisconnectorChangeNewObj.highVoltCellRef.code <> Low(Integer) then
          begin
            TempENHighVoltageSell :=
              HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
            ENHighVoltageSellNewObj :=
              TempENHighVoltageSell.getObject(
                ENDisconnectorChangeNewObj.highVoltCellRef.code);
            if ENHighVoltageSellNewObj <> nil then
              edtNewENHighVoltageSellName.Text := 'Ячейка № ' +
                ENHighVoltageSellNewObj.numberGen;
          end;
    end; //if ENDisconnectorChangeNewObj <> nil then

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
  if ((DialogState = dsEdit) or (DialogState = dsView)) and (ENDisconnectorChangeObj <> nil) then
  begin
      edtCode.Text := IntToStr(ENDisconnectorChangeObj.code);
      if Length(ENDisconnectorChangeObj.name) > 0 then
        memName.Text := ENDisconnectorChangeObj.name;
      if ENDisconnectorChangeObj.installDate <> nil then
      begin
        dtpInstallDate.DateTime := EncodeDate(
          ENDisconnectorChangeObj.installDate.Year,
          ENDisconnectorChangeObj.installDate.Month,
          ENDisconnectorChangeObj.installDate.Day);
        dtpInstallDate.checked := true;
      end
      else
      begin
        dtpInstallDate.DateTime := SysUtils.Date;
        dtpInstallDate.checked := false;
      end;
      if ENDisconnectorChangeObj.uninstallDate <> nil then
      begin
        dtpUninstallDate.DateTime := EncodeDate(
          ENDisconnectorChangeObj.uninstallDate.Year,
          ENDisconnectorChangeObj.uninstallDate.Month,
          ENDisconnectorChangeObj.uninstallDate.Day);
        dtpUninstallDate.checked := true;
      end
      else
      begin
        dtpUninstallDate.DateTime:=SysUtils.Date;
        dtpUninstallDate.checked := false;
      end;
    edtWorkOrderNumber.Text := ENDisconnectorChangeObj.workOrderNumber;
      if ENDisconnectorChangeObj.dateWorkOrder <> nil then
      begin
        dtpDateWorkOrder.DateTime := EncodeDate(
          ENDisconnectorChangeObj.dateWorkOrder.Year,
          ENDisconnectorChangeObj.dateWorkOrder.Month,
          ENDisconnectorChangeObj.dateWorkOrder.Day);
        dtpDateWorkOrder.checked := true;
      end
      else
      begin
        dtpDateWorkOrder.DateTime:=SysUtils.Date;
        dtpDateWorkOrder.checked := false;
      end;
    edtActNumberGen.Text := ENDisconnectorChangeObj.actNumberGen;
      if ENDisconnectorChangeObj.actDateGen <> nil then
      begin
        dtpActDateGen.DateTime := EncodeDate(
          ENDisconnectorChangeObj.actDateGen.Year,
          ENDisconnectorChangeObj.actDateGen.Month,
          ENDisconnectorChangeObj.actDateGen.Day);
        dtpActDateGen.checked := true;
      end
      else
      begin
        dtpActDateGen.DateTime:=SysUtils.Date;
        dtpActDateGen.checked := false;
      end;
    edtWorkerEquipChange.Text := ENDisconnectorChangeObj.workerEquipChange;
    if ENDisconnectorChangeObj.worker <> nil then
      edtEquipChangeWorkerName.Text := ENDisconnectorChangeObj.worker.name;
  end;
end;



procedure TfrmENDisconnectorChangeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENDisconnectorChange: ENDisconnectorChangeControllerSoapPort;
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
     //TempENDisconnectorChange := HTTPRIOENDisconnectorChange as ENDisconnectorChangeControllerSoapPort;
     if ((ModalResult = mrOk) or (ModalResult = mrNo))
     and (ENDisconnectorChangeObj <> nil) then
       begin
         if (ENDisconnectorOldObj <> nil) then
           begin //Связь объекта истории со снимаемым оборудованием
             if ENDisconnectorChangeObj.DisconnectorRef = nil then
               ENDisconnectorChangeObj.disconnectorRef := ENDisconnectorRef.Create;
             ENDisconnectorChangeObj.disconnectorRef.code := ENDisconnectorOldObj.code;
             if ENDisconnectorOldObj.highvoltageSell <> nil then
               if ENDisconnectorOldObj.highvoltageSell.code <> low(Integer) then
                 begin
                   if ENDisconnectorChangeObj.highVoltCellRef = nil then
                     ENDisconnectorChangeObj.highVoltCellRef :=
                       ENHighVoltageSellRef.Create;
                   ENDisconnectorChangeObj.highVoltCellRef.code :=
                     ENDisconnectorOldObj.highvoltageSell.code;

                   if ENDisconnectorOldObj.highvoltageSell.transformerRef <> nil
                   then
                     if ENDisconnectorOldObj.highvoltageSell.transformerRef.code
                     <> low(Integer) then
                       begin
                         if ENDisconnectorChangeObj.transformerRef = nil then
                           ENDisconnectorChangeObj.transformerRef :=
                             ENTransformerRef.Create;
                         ENDisconnectorChangeObj.transformerRef.code :=
                           ENDisconnectorOldObj.highvoltageSell.transformerRef.code;
                       end;
                 end;
           end;

         ENDisconnectorChangeObj.name := memName.Text;

         if dtpInstallDate.checked then
         begin
           if ENDisconnectorChangeObj.installDate = nil then
              ENDisconnectorChangeObj.installDate := TXSDate.Create;
           ENDisconnectorChangeObj.installDate.XSToNative(GetXSDate(dtpInstallDate.DateTime));
         end
         else
           ENDisconnectorChangeObj.installDate := nil;

         if dtpUninstallDate.checked then
         begin
           if ENDisconnectorChangeObj.uninstallDate = nil then
              ENDisconnectorChangeObj.uninstallDate := TXSDate.Create;
           ENDisconnectorChangeObj.uninstallDate.XSToNative(GetXSDate(dtpUninstallDate.DateTime));
         end
         else
           ENDisconnectorChangeObj.uninstallDate := nil;

         ENDisconnectorChangeObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENDisconnectorChangeObj.dateWorkOrder = nil then
              ENDisconnectorChangeObj.dateWorkOrder := TXSDate.Create;
           ENDisconnectorChangeObj.dateWorkOrder.XSToNative(GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENDisconnectorChangeObj.dateWorkOrder := nil;

         ENDisconnectorChangeObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENDisconnectorChangeObj.actDateGen = nil then
              ENDisconnectorChangeObj.actDateGen := TXSDate.Create;
           ENDisconnectorChangeObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENDisconnectorChangeObj.actDateGen := nil;

         ENDisconnectorChangeObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrNo)) and (ENDisconnectorChangeObj <> nil) then
     if ((ModalResult = mrOk) or (ModalResult = mrYes))
     and (ENDisconnectorChangeNewObj <> nil) then
       begin
         if (ENDisconnectorNewObj <> nil) then
           begin //Связь объекта истории с устанавливаемым оборудованием
             if ENDisconnectorChangeNewObj.disconnectorRef = nil then
               ENDisconnectorChangeNewObj.disconnectorRef := ENDisconnectorRef.Create;
             ENDisconnectorChangeNewObj.disconnectorRef.code := ENDisconnectorNewObj.code;

             (*if ENDisconnectorChangeNewObj.highVoltCellRef = nil then
               ENDisconnectorChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
             if ENDisconnectorOldNewObj.highvoltageSell <> nil then
               if ENDisconnectorNewObj.highvoltageSell.code <> low(Integer) then
                 ENDisconnectorChangeNewObj.highVoltCellRef.code :=
                   ENDisconnectorNewObj.highvoltageSell.code;*)
           end;

         ENDisconnectorChangeNewObj.name := memName.Text;

         if dtpInstallDate.checked then
           begin
             if ENDisconnectorChangeNewObj.installDate = nil then
                ENDisconnectorChangeNewObj.installDate := TXSDate.Create;
             ENDisconnectorChangeNewObj.installDate.XSToNative(
               GetXSDate(dtpInstallDate.DateTime));
           end
         else
           ENDisconnectorChangeNewObj.installDate := nil;

         ENDisconnectorChangeNewObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENDisconnectorChangeNewObj.dateWorkOrder = nil then
              ENDisconnectorChangeNewObj.dateWorkOrder := TXSDate.Create;
           ENDisconnectorChangeNewObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENDisconnectorChangeNewObj.dateWorkOrder := nil;

         ENDisconnectorChangeNewObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENDisconnectorChangeNewObj.actDateGen = nil then
              ENDisconnectorChangeNewObj.actDateGen := TXSDate.Create;
           ENDisconnectorChangeNewObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENDisconnectorChangeNewObj.actDateGen := nil;
         ENDisconnectorChangeNewObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrYes)) and (ENDisconnectorChangeNewObj <> nil) then
  end;
end;


procedure TfrmENDisconnectorChangeEdit.spbEquipChangeWorkerClick(Sender : TObject);
var
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENDisconnectorChangeObj.worker = nil then ENDisconnectorChangeObj.worker := EquipChangeWorker.Create();
               ENDisconnectorChangeObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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
procedure TfrmENDisconnectorChangeEdit.actChangeEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENDisconnectorChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия разъединителя должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  tsEquipInstall.TabVisible := True;
  actChooseNewEquip.Enabled := True;
  pcChangeEquipment.ActivePage := tsEquipInstall;
  btnOk.Action := ActnLstChangeEquip.Actions[2]
end;

procedure TfrmENDisconnectorChangeEdit.actDemontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENDisconnectorChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия разъединителя должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
end;

procedure TfrmENDisconnectorChangeEdit.actMontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpInstallDate.Checked) then
    begin
      frmENDisconnectorChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата установки разъединителя должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      dtpInstallDate.SetFocus;
      Exit;
    end;
  if ENDisconnectorNewObj = nil then
    begin
      frmENDisconnectorChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Необходимо указать новое оборудование.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      Exit;
    end;
  actChooseNewEquip.Enabled := True;
  btnOk.Action := ActnLstChangeEquip.Actions[3];
end;

procedure TfrmENDisconnectorChangeEdit.actSaveChangesExecute(
  Sender: TObject);
begin
  frmENDisconnectorChangeEdit.ModalResult := mrOk;
end;

procedure TfrmENDisconnectorChangeEdit.actChooseNewEquipExecute(
  Sender: TObject);
Var TempENDisconnector: ENDisconnectorControllerSoapPort;
  ENDisconnectorFilterObj: ENDisconnectorFilter;
  fENDisconnectorShow: TfrmENDisconnectorShow;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  (*Spr_matherialObj,*) matDriveObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
begin
  ENDisconnectorFilterObj := ENDisconnectorFilter.Create;
  SetNullIntProps(ENDisconnectorFilterObj);
  SetNullXSProps(ENDisconnectorFilterObj);
  ENDisconnectorFilterObj.conditionSQL :=
    ' COALESCE(ENDISCONNECTOR.HIGHVOLTAGESELLCODE, 0) = 0 AND ' +
    ' COALESCE(ENDISCONNECTOR.LINE10REFCODE, 0) = 0 AND ' +
    ' COALESCE(ENDISCONNECTOR.POSTREFCODE, 0) = 0';

  fENDisconnectorShow := TfrmENDisconnectorShow.Create(
    Application, fmNormal, ENDisconnectorFilterObj);
  try
    fENDisconnectorShow.actInsert.Enabled := False;
    fENDisconnectorShow.actEdit.Enabled := False;
    fENDisconnectorShow.actDelete.Enabled := False;
    if fENDisconnectorShow.ShowModal = mrOk then
      begin
        TempENDisconnector :=
          HTTPRIOENDisconnector as ENDisconnectorControllerSoapPort;
        try
          with fENDisconnectorShow do
            ENDisconnectorNewObj := TempENDisconnector.getObject(StrToInt(
              sgENDisconnector.Cells[0, sgENDisconnector.Row]));

          if (ENDisconnectorNewObj <> nil) then
            begin //Заполнение полей для устанавливаемого объекта
              //edtNewDisconnectorCode.Text := IntToStr(ENDisconnectorNewObj.code);
              edtNewDispName.Text := ENDisconnectorNewObj.name;
              if ( ENDisconnectorNewObj.ratedVoltage <> nil) then
                 edtNewRatedVoltage.Text := ENDisconnectorNewObj.ratedVoltage.decimalString
              else
                 edtNewRatedVoltage.Text := '';
              if ( ENDisconnectorNewObj.ratedCurrent <> nil) then
                 edtNewRatedCurrent.Text := ENDisconnectorNewObj.ratedCurrent.decimalString
              else
                 edtNewRatedCurrent.Text := '';

              (*edtNewENDisconnectorTypeName.Text := ENDisconnectorNewObj.disconnectorType.name;
              edtNewENDisconnectorDriveTypeName.Text :=
                ENDisconnectorNewObj.disconnectordriveType.name;*)

              edtNewENHighVoltageSellName.Text :=
                'Ячейка № ' + ENDisconnectorNewObj.highvoltageSell.numberGen;

              if ENDisconnectorNewObj.materialRef <> nil then
                if ENDisconnectorNewObj.materialRef.code <> Low(Integer) then
                  begin
                    TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    Spr_matherialFilterObj := TKMaterialsFilter.Create;
                    SetNullIntProps(Spr_matherialFilterObj);
                    Spr_matherialFilterObj.code := ENDisconnectorNewObj.materialRef.code;
                    Spr_matherialList :=
                      TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
                    if (Spr_matherialList.totalCount > 0) then
                      edtNewMaterialsName.Text := Spr_matherialList.list[0].name
                    else
                      edtNewMaterialsName.Text := '';
                  end;

              if ENDisconnectorNewObj.matDriveRef <> nil then
                if ENDisconnectorNewObj.matDriveRef.code <> Low(Integer) then
                  begin
                    if TempSpr_matherial = nil then
                      TempSpr_matherial :=
                        HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    matDriveObj :=
                      TempSpr_matherial.getObject(ENDisconnectorNewObj.matDriveRef.code);
                    edtNewMatDrive.Text := matDriveObj.name;
                  end;

              //edtNewENElementName.Text := ENDisconnectorNewObj.element.name;
            end; //if (ENDisconnectorNewObj <> nil) then
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    fENDisconnectorShow.Free;
  end;
end;

end.
