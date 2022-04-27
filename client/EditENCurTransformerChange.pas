//Редактирование Истории замен Трансформаторов Тока
unit EditENCurTransformerChange;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENCurTransformerChangeController,
    ENCurrentTransformerController, EditENCurrentTransformer,
    ShowENCurrentTransformer, TKMaterialsController;

type
  TfrmENCurTransformerChangeEdit = class(TDialogForm)
  

  HTTPRIOENCurTransformerChange: THTTPRIO;
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
    HTTPRIOSpr_matherial: THTTPRIO;
    HTTPRIOENCurrentTransformer: THTTPRIO;
    lblAccruracyClass: TLabel;
    lblNumberGen: TLabel;
    lblCoefTransformation: TLabel;
    lblSecondaryWindingsNumber: TLabel;
    lblENCurrentTransformerTypeName: TLabel;
    lblENHighVoltageSellName: TLabel;
    lblMaterialsName: TLabel;
    lblDispName: TLabel;
    edtAccruracyClass: TEdit;
    edtNumberGen: TEdit;
    edtCoefTransformation: TEdit;
    edtSecondaryWindingsNumber: TEdit;
    edtENCurrentTransformerTypeName: TEdit;
    edtENHighVoltageSellName: TEdit;
    edtMaterialsName: TEdit;
    edtDispName: TEdit;
    lblNewMaterialsName: TLabel;
    edtNewMaterialsName: TEdit;
    lblNewDispName: TLabel;
    edtNewDispName: TEdit;
    lblNewAccruracyClass: TLabel;
    edtNewAccruracyClass: TEdit;
    lblNewNumberGen: TLabel;
    edtNewNumberGen: TEdit;
    lblNewCoefTransformation: TLabel;
    edtNewCoefTransformation: TEdit;
    lblNewENCurrentTransformerTypeName: TLabel;
    edtNewENCurrentTransformerTypeName: TEdit;
    lblNewSecondaryWindingsNumber: TLabel;
    edtNewSecondaryWindingsNumber: TEdit;
    lblNewENHighVoltageSellName: TLabel;
    edtNewENHighVoltageSellName: TEdit;
    spbNewENCurrentTransformerType: TSpeedButton;
    spbNewENHighVoltageSell: TSpeedButton;
    spbNewTkMaterials: TSpeedButton;
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
  frmENCurTransformerChangeEdit: TfrmENCurTransformerChangeEdit;
  ENCurTransformerChangeObj, ENCurTransformerChangeNewObj: ENCurTransformerChange;
  ENCurrentTransformerOldObj, ENCurrentTransformerNewObj: ENCurrentTransformer;

implementation

uses ShowEquipChangeWorker, EquipChangeWorkerController,
  ENHighVoltageSellController, ENTransformerController;

{$R *.dfm}

procedure TfrmENCurTransformerChangeEdit.FormShow(Sender: TObject);
var TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList : TKMaterialsShortList;
  TempENHighVoltageSell: ENHighVoltageSellControllerSoapPort;
  ENHighVoltageSellNewObj: ENHighVoltageSell;
begin
  //Отображение подлежащего замене трансформатора тока
  DisableControls([(*Заменяемый трансформатор тока*) edtENHighVoltageSellName,
    edtMaterialsName, edtAccruracyClass, edtCoefTransformation,
    edtSecondaryWindingsNumber, edtDispName,
    (*Новый трансформатор тока*) edtNewENHighVoltageSellName,
    edtNewMaterialsName, edtNewAccruracyClass, edtNewCoefTransformation,
    edtNewSecondaryWindingsNumber, edtNewDispName]);
  SetFloatStyle([(*Заменяемый трансформатор тока*) edtAccruracyClass, edtCoefTransformation,
    (*Новый трансформатор тока*) edtNewAccruracyClass, edtNewCoefTransformation]);
  SetIntStyle([(*Заменяемый трансформатор тока*) edtSecondaryWindingsNumber,
    (*Новый трансформатор тока*) edtNewSecondaryWindingsNumber]);
  if ENCurrentTransformerOldObj <> nil then
    begin
      //edtCurrentTransformerCode.Text := IntToStr(ENCurrentTransformerOldObj.code);
      edtDispName.Text := ENCurrentTransformerOldObj.name;
      if ( ENCurrentTransformerOldObj.accruracyClass <> nil ) then
         edtAccruracyClass.Text := ENCurrentTransformerOldObj.accruracyClass.decimalString
      else
         edtAccruracyClass.Text := ''; 
      if ( ENCurrentTransformerOldObj.numberGen <> nil ) then
         edtNumberGen.Text := ENCurrentTransformerOldObj.numberGen.decimalString
      else
         edtNumberGen.Text := ''; 
      if ( ENCurrentTransformerOldObj.coefTransformation <> nil ) then
         edtCoefTransformation.Text := ENCurrentTransformerOldObj.coefTransformation.decimalString
      else
         edtCoefTransformation.Text := ''; 
      if ( ENCurrentTransformerOldObj.secondaryWindingsNumber <> nil ) then
         edtSecondaryWindingsNumber.Text := ENCurrentTransformerOldObj.secondaryWindingsNumber.decimalString
      else
         edtSecondaryWindingsNumber.Text := ''; 

      //edtENCurrentTransformerTypeName.Text := ENCurrentTransformerOldObj.currentTransformerType.name;
      //edtENElementName.Text := ENCurrentTransformerOldObj.element.name;
      
      edtENHighVoltageSellName.Text := 'Ячейка № ' +
        ENCurrentTransformerOldObj.highvoltageSell.numberGen;

      if ENCurrentTransformerOldObj.materialRef <> nil then
        if ENCurrentTransformerOldObj.materialRef.code <> Low(Integer) then
          begin
            TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
            Spr_matherialFilterObj := TKMaterialsFilter.Create;
            SetNullIntProps(Spr_matherialFilterObj);
            Spr_matherialFilterObj.code := ENCurrentTransformerOldObj.materialRef.code;
            Spr_matherialList :=
              TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
            if (Spr_matherialList.totalCount > 0) then
              edtMaterialsName.Text := Spr_matherialList.list[0].name
            else
              edtMaterialsName.Text := '';
          end;
    end; //if ENCurrentTransformerOldObj <> nil then

  if ENCurTransformerChangeNewObj <> nil then
    begin
      if ENCurTransformerChangeNewObj.highVoltCellRef <> nil then
        if ENCurTransformerChangeNewObj.highVoltCellRef.code <> Low(Integer) then
          begin
            TempENHighVoltageSell :=
              HTTPRIOENHighVoltageSell as ENHighVoltageSellControllerSoapPort;
            ENHighVoltageSellNewObj :=
              TempENHighVoltageSell.getObject(
                ENCurTransformerChangeNewObj.highVoltCellRef.code);
            if ENHighVoltageSellNewObj <> nil then
              edtNewENHighVoltageSellName.Text := 'Ячейка № ' +
                ENHighVoltageSellNewObj.numberGen;
          end;
    end; //if ENCurTransformerChangeNewObj <> nil then

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

  if  ((DialogState = dsEdit) or (DialogState = dsView)) and (ENCurTransformerChangeObj <> nil) then
  begin
      edtCode.Text := IntToStr(ENCurTransformerChangeObj.code);
      if Length(ENCurTransformerChangeObj.name) > 0 then
        memName.Text := ENCurTransformerChangeObj.name;
      if ENCurTransformerChangeObj.installDate <> nil then
      begin
        dtpInstallDate.DateTime:=EncodeDate(
          ENCurTransformerChangeObj.installDate.Year,
          ENCurTransformerChangeObj.installDate.Month,
          ENCurTransformerChangeObj.installDate.Day);
        dtpInstallDate.checked := true;
      end
      else
      begin
        dtpInstallDate.DateTime:=SysUtils.Date;
        dtpInstallDate.checked := false;
      end;
      if ENCurTransformerChangeObj.uninstallDate <> nil then
      begin
        dtpUninstallDate.DateTime := EncodeDate(
          ENCurTransformerChangeObj.uninstallDate.Year,
          ENCurTransformerChangeObj.uninstallDate.Month,
          ENCurTransformerChangeObj.uninstallDate.Day);
        dtpUninstallDate.checked := true;
      end
      else
      begin
        dtpUninstallDate.DateTime:=SysUtils.Date;
        dtpUninstallDate.checked := false;
      end;
    edtWorkOrderNumber.Text := ENCurTransformerChangeObj.workOrderNumber; 
      if ENCurTransformerChangeObj.dateWorkOrder <> nil then
      begin
        dtpDateWorkOrder.DateTime := EncodeDate(
          ENCurTransformerChangeObj.dateWorkOrder.Year,
          ENCurTransformerChangeObj.dateWorkOrder.Month,
          ENCurTransformerChangeObj.dateWorkOrder.Day);
        dtpDateWorkOrder.checked := true;
      end
      else
      begin
        dtpDateWorkOrder.DateTime:=SysUtils.Date;
        dtpDateWorkOrder.checked := false;
      end;
    edtActNumberGen.Text := ENCurTransformerChangeObj.actNumberGen; 
      if ENCurTransformerChangeObj.actDateGen <> nil then
      begin
        dtpActDateGen.DateTime := EncodeDate(
          ENCurTransformerChangeObj.actDateGen.Year,
          ENCurTransformerChangeObj.actDateGen.Month,
          ENCurTransformerChangeObj.actDateGen.Day);
        dtpActDateGen.checked := true;
      end
      else
      begin
        dtpActDateGen.DateTime:=SysUtils.Date;
        dtpActDateGen.checked := false;
      end;
    edtWorkerEquipChange.Text := ENCurTransformerChangeObj.workerEquipChange; 
    if ENCurTransformerChangeObj.worker <> nil then
      edtEquipChangeWorkerName.Text := ENCurTransformerChangeObj.worker.name;
  end;
end;



procedure TfrmENCurTransformerChangeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENCurTransformerChange: ENCurTransformerChangeControllerSoapPort;
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
     //TempENCurTransformerChange := HTTPRIOENCurTransformerChange as ENCurTransformerChangeControllerSoapPort;
     if ((ModalResult = mrOk) or (ModalResult = mrNo))
     and (ENCurTransformerChangeObj <> nil) then
       begin
         if (ENCurrentTransformerOldObj <> nil) then
           begin //Связь объекта истории со снимаемым оборудованием
             if ENCurTransformerChangeObj.curTransformerRef = nil then
               ENCurTransformerChangeObj.curTransformerRef := ENCurrentTransformerRef.Create;
             ENCurTransformerChangeObj.curTransformerRef.code := ENCurrentTransformerOldObj.code;
             if ENCurrentTransformerOldObj.highvoltageSell <> nil then
               if ENCurrentTransformerOldObj.highvoltageSell.code <> low(Integer) then
                 begin
                   if ENCurTransformerChangeObj.highVoltCellRef = nil then
                     ENCurTransformerChangeObj.highVoltCellRef :=
                       ENHighVoltageSellRef.Create;
                   ENCurTransformerChangeObj.highVoltCellRef.code :=
                     ENCurrentTransformerOldObj.highvoltageSell.code;

                   if ENCurrentTransformerOldObj.highvoltageSell.transformerRef <> nil
                   then
                     if ENCurrentTransformerOldObj.highvoltageSell.transformerRef.code
                     <> low(Integer) then
                       begin
                         if ENCurTransformerChangeObj.transformerRef = nil then
                           ENCurTransformerChangeObj.transformerRef :=
                             ENTransformerRef.Create;
                         ENCurTransformerChangeObj.transformerRef.code :=
                           ENCurrentTransformerOldObj.highvoltageSell.transformerRef.code;
                       end;
                 end;
           end;

         ENCurTransformerChangeObj.name := memName.Text;

         if dtpInstallDate.checked then
         begin
           if ENCurTransformerChangeObj.installDate = nil then
              ENCurTransformerChangeObj.installDate := TXSDate.Create;
           ENCurTransformerChangeObj.installDate.XSToNative(GetXSDate(dtpInstallDate.DateTime));
         end
         else
           ENCurTransformerChangeObj.installDate := nil;

         if dtpUninstallDate.checked then
         begin
           if ENCurTransformerChangeObj.uninstallDate = nil then
              ENCurTransformerChangeObj.uninstallDate := TXSDate.Create;
           ENCurTransformerChangeObj.uninstallDate.XSToNative(GetXSDate(dtpUninstallDate.DateTime));
         end
         else
           ENCurTransformerChangeObj.uninstallDate := nil;

         ENCurTransformerChangeObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENCurTransformerChangeObj.dateWorkOrder = nil then
              ENCurTransformerChangeObj.dateWorkOrder := TXSDate.Create;
           ENCurTransformerChangeObj.dateWorkOrder.XSToNative(GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENCurTransformerChangeObj.dateWorkOrder := nil;

         ENCurTransformerChangeObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENCurTransformerChangeObj.actDateGen = nil then
              ENCurTransformerChangeObj.actDateGen := TXSDate.Create;
           ENCurTransformerChangeObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENCurTransformerChangeObj.actDateGen := nil;

         ENCurTransformerChangeObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrNo)) and (ENCurTransformerChangeObj <> nil) then
     if ((ModalResult = mrOk) or (ModalResult = mrYes))
     and (ENCurTransformerChangeNewObj <> nil) then
       begin
         if (ENCurrentTransformerNewObj <> nil) then
           begin //Связь объекта истории с устанавливаемым оборудованием
             if ENCurTransformerChangeNewObj.curTransformerRef = nil then
               ENCurTransformerChangeNewObj.curTransformerRef := ENCurrentTransformerRef.Create;
             ENCurTransformerChangeNewObj.curTransformerRef.code := ENCurrentTransformerNewObj.code;

             (*if ENCurTransformerChangeNewObj.highVoltCellRef = nil then
               ENCurTransformerChangeNewObj.highVoltCellRef := ENHighVoltageSellRef.Create;
             if ENCurrentTransformerOldNewObj.highvoltageSell <> nil then
               if ENCurrentTransformerNewObj.highvoltageSell.code <> low(Integer) then
                 ENCurTransformerChangeNewObj.highVoltCellRef.code :=
                   ENCurrentTransformerNewObj.highvoltageSell.code;*)
           end;

         ENCurTransformerChangeNewObj.name := memName.Text;

         if dtpInstallDate.checked then
           begin
             if ENCurTransformerChangeNewObj.installDate = nil then
                ENCurTransformerChangeNewObj.installDate := TXSDate.Create;
             ENCurTransformerChangeNewObj.installDate.XSToNative(
               GetXSDate(dtpInstallDate.DateTime));
           end
         else
           ENCurTransformerChangeNewObj.installDate := nil;

         ENCurTransformerChangeNewObj.workOrderNumber := edtWorkOrderNumber.Text;

         if dtpDateWorkOrder.checked then
         begin
           if ENCurTransformerChangeNewObj.dateWorkOrder = nil then
              ENCurTransformerChangeNewObj.dateWorkOrder := TXSDate.Create;
           ENCurTransformerChangeNewObj.dateWorkOrder.XSToNative(
             GetXSDate(dtpDateWorkOrder.DateTime));
         end
         else
           ENCurTransformerChangeNewObj.dateWorkOrder := nil;

         ENCurTransformerChangeNewObj.actNumberGen := edtActNumberGen.Text;

         if dtpActDateGen.checked then
         begin
           if ENCurTransformerChangeNewObj.actDateGen = nil then
              ENCurTransformerChangeNewObj.actDateGen := TXSDate.Create;
           ENCurTransformerChangeNewObj.actDateGen.XSToNative(GetXSDate(dtpActDateGen.DateTime));
         end
         else
           ENCurTransformerChangeNewObj.actDateGen := nil;
         ENCurTransformerChangeNewObj.workerEquipChange := edtWorkerEquipChange.Text;
       end; //if ((ModalResult = mrOk) or (ModalResult = mrYes)) and (ENCurTransformerChangeNewObj <> nil) then
  end;
end;


procedure TfrmENCurTransformerChangeEdit.spbEquipChangeWorkerClick(Sender : TObject);
var 
   frmEquipChangeWorkerShow: TfrmEquipChangeWorkerShow;
begin
   frmEquipChangeWorkerShow:=TfrmEquipChangeWorkerShow.Create(Application,fmNormal);
   try
      with frmEquipChangeWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENCurTransformerChangeObj.worker = nil then ENCurTransformerChangeObj.worker := EquipChangeWorker.Create();
               ENCurTransformerChangeObj.worker.code := StrToInt(GetReturnValue(sgEquipChangeWorker,0));
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
procedure TfrmENCurTransformerChangeEdit.actChangeEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENCurTransformerChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия трансформатора тока должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
  tsEquipInstall.TabVisible := True;
  actChooseNewEquip.Enabled := True;
  pcChangeEquipment.ActivePage := tsEquipInstall;
  btnOk.Action := ActnLstChangeEquip.Actions[2]
end;

procedure TfrmENCurTransformerChangeEdit.actDemontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpUninstallDate.Checked) then
    begin
      frmENCurTransformerChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата снятия трансформатора тока должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      Exit;
    end;
end;

procedure TfrmENCurTransformerChangeEdit.actMontageEquipExecute(
  Sender: TObject);
begin
  if not(dtpInstallDate.Checked) then
    begin
      frmENCurTransformerChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Дата установки трансформатора тока должна быть заполнена.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      dtpInstallDate.SetFocus;
      Exit;
    end;
  if ENCurrentTransformerNewObj = nil then
    begin
      frmENCurTransformerChangeEdit.ModalResult := mrNone;
      Application.MessageBox(
        PChar('Необходимо указать новое оборудование.'),
        PChar('Внимание!'), MB_ICONWARNING + MB_OK);
      pcChangeEquipment.ActivePage := tsEquipInstall;
      Exit;
    end;
  actChooseNewEquip.Enabled := True;
  btnOk.Action := ActnLstChangeEquip.Actions[3];
end;

procedure TfrmENCurTransformerChangeEdit.actSaveChangesExecute(
  Sender: TObject);
begin
  frmENCurTransformerChangeEdit.ModalResult := mrOk;
end;

procedure TfrmENCurTransformerChangeEdit.actChooseNewEquipExecute(
  Sender: TObject);
Var TempENCurrentTransformer: ENCurrentTransformerControllerSoapPort;
  ENCurrentTransformerFilterObj: ENCurrentTransformerFilter;
  fENCurrentTransformerShow: TfrmENCurrentTransformerShow;
  TempSpr_matherial: TKMaterialsControllerSoapPort;
  //Spr_matherialObj: TKMaterials;
  Spr_matherialFilterObj: TKMaterialsFilter;
  Spr_matherialList: TKMaterialsShortList;
begin
  ENCurrentTransformerFilterObj := ENCurrentTransformerFilter.Create;
  SetNullIntProps(ENCurrentTransformerFilterObj);
  SetNullXSProps(ENCurrentTransformerFilterObj);
  ENCurrentTransformerFilterObj.conditionSQL :=
    ' COALESCE(ENCURRENTTRANSFORMER.HIGHVOLTAGESELLCODE, 0) = 0';

  fENCurrentTransformerShow := TfrmENCurrentTransformerShow.Create(
    Application, fmNormal, ENCurrentTransformerFilterObj);
  try
    fENCurrentTransformerShow.actInsert.Enabled := False;
    fENCurrentTransformerShow.actEdit.Enabled := False;
    fENCurrentTransformerShow.actDelete.Enabled := False;
    if fENCurrentTransformerShow.ShowModal = mrOk then
      begin
        TempENCurrentTransformer :=
          HTTPRIOENCurrentTransformer as ENCurrentTransformerControllerSoapPort;
        try
          with fENCurrentTransformerShow do
            ENCurrentTransformerNewObj := TempENCurrentTransformer.getObject(StrToInt(
              sgENCurrentTransformer.Cells[0, sgENCurrentTransformer.Row]));

          if (ENCurrentTransformerNewObj <> nil) then
            begin //Заполнение полей для устанавливаемого объекта
              //edtNewCurrentTransformerCode.Text := IntToStr(ENCurrentTransformerNewObj.code);
              edtNewDispName.Text := ENCurrentTransformerNewObj.name;
              if ( ENCurrentTransformerNewObj.accruracyClass <> nil ) then
                 edtNewAccruracyClass.Text := ENCurrentTransformerNewObj.accruracyClass.decimalString
              else
                 edtNewAccruracyClass.Text := ''; 
              if ( ENCurrentTransformerNewObj.numberGen <> nil ) then
                 edtNewNumberGen.Text := ENCurrentTransformerNewObj.numberGen.decimalString
              else
                 edtNewNumberGen.Text := ''; 
              if ( ENCurrentTransformerNewObj.coefTransformation <> nil ) then
                 edtNewCoefTransformation.Text := ENCurrentTransformerNewObj.coefTransformation.decimalString
              else
                 edtNewCoefTransformation.Text := ''; 
              if ( ENCurrentTransformerNewObj.secondaryWindingsNumber <> nil ) then
                 edtNewSecondaryWindingsNumber.Text := ENCurrentTransformerNewObj.secondaryWindingsNumber.decimalString
              else
                 edtNewSecondaryWindingsNumber.Text := '';

              edtNewENHighVoltageSellName.Text := 'Ячейка № ' +
                ENCurrentTransformerNewObj.highvoltageSell.numberGen;

              if ENCurrentTransformerNewObj.materialRef <> nil then
                if ENCurrentTransformerNewObj.materialRef.code <> Low(Integer) then
                  begin
                    TempSpr_matherial := HTTPRIOSpr_matherial as TKMaterialsControllerSoapPort;
                    Spr_matherialFilterObj := TKMaterialsFilter.Create;
                    SetNullIntProps(Spr_matherialFilterObj);
                    Spr_matherialFilterObj.code := ENCurrentTransformerNewObj.materialRef.code;
                    Spr_matherialList :=
                      TempSpr_matherial.getScrollableFilteredList(Spr_matherialFilterObj, 0, -1);
                    if (Spr_matherialList.totalCount > 0) then
                      edtNewMaterialsName.Text := Spr_matherialList.list[0].name
                    else
                      edtNewMaterialsName.Text := '';
                  end;
              //edtNewENCurrentTransformerTypeName.Text := ENCurrentTransformerNewObj.currentTransformerType.name;
              //edtNewENElementName.Text := ENCurrentTransformerNewObj.element.name;
            end; //if (ENCurrentTransformerNewObj <> nil) then
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    fENCurrentTransformerShow.Free;
  end;
end;

end.