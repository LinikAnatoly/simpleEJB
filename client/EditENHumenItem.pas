
unit EditENHumenItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENHumenItemController, TB2Item,
  TB2Dock, TB2Toolbar, AdvObj, ExtCtrls ;

type
  TfrmENHumenItemEdit = class(TDialogForm)
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
  

  HTTPRIOENHumenItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    lblPK: TLabel;
    edtCode: TEdit;
    pcHumens: TPageControl;
    tsHumen: TTabSheet;
    tsDeliveryTime: TTabSheet;
    lblCountGen: TLabel;
    lblCountFact: TLabel;
    lblPrice: TLabel;
    lblCost: TLabel;
    lblCommentGen: TLabel;
    spbTKPositionPositionGen: TSpeedButton;
    lblTKPositionPositionGenName: TLabel;
    spbENManningTableManningTable: TSpeedButton;
    lblENManningTableManningTableName: TLabel;
    spbENWorkerWorkerFact: TSpeedButton;
    lblENWorkerWorkerFactName: TLabel;
    lblEnPlan: TLabel;
    lblPlanItem: TLabel;
    spbPlan: TSpeedButton;
    spbPlanItem: TSpeedButton;
    spbFINWorkerClear: TSpeedButton;
    edtCountGen: TEdit;
    edtCountFact: TEdit;
    edtPrice: TEdit;
    edtCost: TEdit;
    edtCommentGen: TEdit;
    edtTKPositionPositionGenName: TEdit;
    edtENManningTableManningTableName: TEdit;
    edtENWorkerWorkerFactName: TEdit;
    edtPlan: TEdit;
    edtPlanItem: TEdit;
    sgENDeliveryTime: TAdvStringGrid;
    HTTPRIOENDeliveryTime: THTTPRIO;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    ImageList1: TImageList;
    tbActions: TTBToolbar;
    btnView: TTBItem;
    btnAdd: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    isSentAssignment: TCheckBox;
    lblisSentAssignment: TLabel;
    tsWorkOrderByt: TTabSheet;
    spl1: TSplitter;
    gbENWorkOrderBytItem: TGroupBox;
    gbENWorkOrderByt: TGroupBox;
    sgENWorkOrderByt: TAdvStringGrid;
    sgENWorkOrderBytItem: TAdvStringGrid;
    HTTPRIOENWorkOrderByt: THTTPRIO;
    HTTPRIOENWorkOrderBytItem: THTTPRIO;
    actViewWorkOrderByt: TAction;
    actViewWorkOrderBytItem: TAction;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbTKPositionPositionGenClick(Sender : TObject);
  procedure spbENManningTableManningTableClick(Sender : TObject);
  procedure spbENWorkerWorkerFactClick(Sender : TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbFINWorkerClearClick(Sender: TObject);
    procedure pcHumensChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actViewWorkOrderBytExecute(Sender: TObject);
    procedure actViewWorkOrderBytItemExecute(Sender: TObject);
    procedure sgENWorkOrderBytClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateENWorkOrderBytList;
    procedure UpdateENWorkOrderBytItemsList;
  public
    { Public declarations }
    departmentCode : Integer ;
    workerCount : Integer;
  end;

var
  frmENHumenItemEdit: TfrmENHumenItemEdit;
  ENHumenItemObj: ENHumenItem;

  ENDeliveryTimeHeaders: array [1..4] of String =
        ( 'Код'
          ,'Час на доставку нормативний (год)'
          ,'Час на доставку фактичний(год)'
          ,'Транспорт'
        );

  ENWorkOrderBytHeaders: array [1..8] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата'
          ,'Підрозділ'
          ,'Користувач, який створив запис'
          ,'Дата створення'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

  ENWorkOrderBytItemHeaders: array [1..13] of String =
        ( 'Код'
          ,'Виконавець'
          ,'Код роботи'
          ,'Робота'
          ,'№ дог. з послуг'
          ,'Особ. рахунок'
          ,'ПІБ абонента/замовника'
          ,'Адреса абонента'
          ,'Номер тел. абонента'
          ,'Інв. № лічильника'
          ,'Сер. № лічильника'
          ,'Номери пломб'
          ,'Норм. посада'
        );

implementation

uses
  ShowTKPosition
  ,TKPositionController
  ,ShowENManningTable
  ,ENManningTableController
  ,ShowENWorker
  ,ENWorkerController
  ,ENPlanWorkController
, DMReportsUnit

, ENDepartmentController, ENPlanWorkItemController, FINWorkerController,
  ShowFINWorker, ENConsts, ENDeliveryTimeController, EditENDeliveryTime,
  ENDeliveryKindController, FINWorkerKindController, ENWorkOrderBytController,
  ENWorkOrderBytItemController, EditENWorkOrderByt, EditENWorkOrderBytItem;

{uses  
    EnergyproController, EnergyproController2, ENHumenItemController  ;
}
{$R *.dfm}



procedure TfrmENHumenItemEdit.FormShow(Sender: TObject);
var
    TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    //ENPlanWorkItemObj: ENPlanWorkItem;
    ENPlanWorkItemFilterObj: ENPlanWorkItemFilter;
    ENPlanWorkItemList: ENPlanWorkItemShortList;

    TempENPlanWork: ENPlanWorkControllerSoapPort;
    //ENPlanWorkObj: ENPlanWork;
    ENPlanWorkFilterObj: ENPlanWorkFilter;
    ENPlanWorkList: ENPlanWorkShortList;

    TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
begin
  tsWorkOrderByt.TabVisible := false;

  pcHumens.ActivePage := tsHumen;

  SetGridHeaders(ENWorkOrderBytHeaders, sgENWorkOrderByt.ColumnHeaders);
  SetGridHeaders(ENWorkOrderBytItemHeaders, sgENWorkOrderBytItem.ColumnHeaders);

  if (ENHumenItemObj <> nil) then
  begin
      if (ENHumenItemObj.finWorker = nil) then
      begin
          HideControls([ lblisSentAssignment, isSentAssignment ]);
          //tsDeliveryTime.TabVisible := false;
          DisableActions([actInsert, actEdit, actDelete]);
      end
      else
      begin
          if (ENHumenItemObj.finWorker.code = LOW_INT) then
          begin
              HideControls([lblisSentAssignment, isSentAssignment]);
              //tsDeliveryTime.TabVisible := false;
              DisableActions([actInsert, actEdit, actDelete]);
          end;
      end;
  end;

  DisableControls([
                    edtENManningTableManningTableName, edtENWorkerWorkerFactName, edtTKPositionPositionGenName,
                    spbTKPositionPositionGen
                    ,edtPlan, spbPlan
                    ,edtPlanItem, spbPlanItem
                    , edtCountGen
                  ]);

  SetFloatStyle([edtPrice,  edtCost, edtCountFact ]);

  if (DialogState = dsInsert) then
  begin
     DisableControls([spbTKPositionPositionGen], false);
     tsDeliveryTime.TabVisible := false;
  end;

  if (DialogState = dsView) then
  begin
      DisableControls([spbENManningTableManningTable, spbENWorkerWorkerFact, spbTKPositionPositionGen, spbFINWorkerClear]);
      DisableActions([actInsert, actEdit, actDelete]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtTKPositionPositionGenName, edtCountGen]);
    DenyBlankValues([
      //edtCountGen
      //,
      edtCountFact
      , edtTKPositionPositionGenName
     ]);

  end;

    if ENHumenItemObj.planRef <> nil then
      if ENHumenItemObj.planRef.code <> Low(Integer) then
      begin

        //HideControls([  lblEnPlan, edtPlan, spbPlan ], false);

        TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
        //ENPlanWorkObj := TempENPlanWork.getObject(ENEstimateItemObj.planRef.code);

        ENPlanWorkFilterObj := ENPlanWorkFilter.Create;
        try
          SetNullIntProps(ENPlanWorkFilterObj);
          SetNullXSProps(ENPlanWorkFilterObj);

          ENPlanWorkFilterObj.code := ENHumenItemObj.planRef.code;

          //ENPlanWorkList := TempENPlanWork.getFilteredList(ENPlanWorkFilterObj);
          ENPlanWorkList := TempENPlanWork.getScrollableFilteredList(ENPlanWorkFilterObj, 0, -1);

          if ENPlanWorkList <> nil then
            if ENPlanWorkList.list <> nil then
              if High(ENPlanWorkList.list) >= 0 then
                edtPlan.Text := ENPlanWorkList.list[0].objectName;
        finally
          ENPlanWorkFilterObj.Free;
        end;
      end;

    if ENHumenItemObj.planItemRef <> nil then
      if ENHumenItemObj.planItemRef.code <> Low(Integer) then
      begin

       HideControls([  lblPlanItem , edtPlanItem, spbPlanItem ], false );
       //edtPlanItem.Text := ENPlanWorkItemName;

        TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
        //ENPlanWorkItemObj := TempENPlanWorkItem.getObject(ENEstimateItemObj.planItemRef.code);

        ENPlanWorkItemFilterObj := ENPlanWorkItemFilter.Create;
        try
          SetNullIntProps(ENPlanWorkItemFilterObj);
          SetNullXSProps(ENPlanWorkItemFilterObj);

          ENPlanWorkItemFilterObj.code := ENHumenItemObj.planItemRef.code;

          //ENPlanWorkItemList := TempENPlanWorkItem.getFilteredList(ENPlanWorkItemFilterObj);
          ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(ENPlanWorkItemFilterObj, 0, -1);

          if ENPlanWorkItemList <> nil then
            if ENPlanWorkItemList.list <> nil then
              if High(ENPlanWorkItemList.list) >= 0 then
                edtPlanItem.Text := ENPlanWorkItemList.list[0].kartaRefName;
        finally
          ENPlanWorkItemFilterObj.Free;
        end;
      end;


  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENHumenItemObj.code);
    if ( ENHumenItemObj.countGen <> nil ) then
       edtCountGen.Text := ENHumenItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';
       
   // это поле МОЖЕТ поменяться из вызывающей ПланВоркИТЕМ !!!
   if edtCountFact.Text = '' then
   begin
      if ( ENHumenItemObj.countFact <> nil ) then
         edtCountFact.Text := ENHumenItemObj.countFact.decimalString
      else
         edtCountFact.Text := '';
   end;

    if ( ENHumenItemObj.price <> nil ) then
       edtPrice.Text := ENHumenItemObj.price.decimalString
    else
       edtPrice.Text := ''; 
    if ( ENHumenItemObj.cost <> nil ) then
       edtCost.Text := ENHumenItemObj.cost.decimalString
    else
       edtCost.Text := ''; 
    edtCommentGen.Text := ENHumenItemObj.commentGen; 
    edtUserGen.Text := ENHumenItemObj.userGen; 
      if ENHumenItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENHumenItemObj.dateEdit.Year,ENHumenItemObj.dateEdit.Month,ENHumenItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    if ENHumenItemObj.positionGen <> nil then
        edtTKPositionPositionGenName.Text := ENHumenItemObj.positionGen.name + ' ' + ENHumenItemObj.positionGen.rank + ' розряду';
{
    if ENHumenItemObj.manningTable <> nil then
        edtENManningTableManningTableName.Text := ENHumenItemObj.manningTable.position.name + ' ' +ENHumenItemObj.manningTable.department.shortName ;//ENHumenItemObj.manningTable.name;

    if ENHumenItemObj.workerFact <> nil then
       edtENWorkerWorkerFactName.Text := ENHumenItemObj.workerFact.name;
}

    if ENHumenItemObj.finWorker <> nil then
    begin
        edtENManningTableManningTableName.Text := ENHumenItemObj.finWorker.positionName + ' ' + ENHumenItemObj.finWorker.departmentName ;
        edtENWorkerWorkerFactName.Text := ENHumenItemObj.finWorker.name;

        isSentAssignment.Checked := (ENHumenItemObj.finWorker.isSentAssignment = 1);
    end;

    if ENPlanWorkList <> nil then
      if ENPlanWorkList.list <> nil then
        if High(ENPlanWorkList.list) >= 0 then
          if ENPlanWorkList.list[0].kindCode = ENPLANWORKKIND_NPZ then
          begin
            tsWorkOrderByt.TabVisible := false;

            if ENPlanWorkList.list[0].typeRefCode = ENPLANWORKTYPE_ESBYT_PO_113 then
            begin
              // Дернем метод для проверки прав на просмотр сменных заданий по рейдовым бригадам
              TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
              try
                TempENWorkOrderByt.getObjectForRaid(-1);
              except
                on ERemotableException do Exit;
              end;
            end;

            // Если права есть, показываем сменные задания и их строки
            UpdateENWorkOrderBytList;
          end;

  end;
end;



procedure TfrmENHumenItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENHumenItem: ENHumenItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtCountGen
      ,edtCountFact
      ,edtTKPositionPositionGenName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;


     if (ENHumenItemObj.countGen = nil ) then
       ENHumenItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENHumenItemObj.countGen.decimalString := edtCountGen.Text 
     else
       ENHumenItemObj.countGen := nil;

     if (ENHumenItemObj.countFact = nil ) then
       ENHumenItemObj.countFact := TXSDecimal.Create;
     if edtCountFact.Text <> '' then
       ENHumenItemObj.countFact.decimalString := edtCountFact.Text 
     else
       ENHumenItemObj.countFact := nil;

     if (ENHumenItemObj.price = nil ) then
       ENHumenItemObj.price := TXSDecimal.Create;
     if edtPrice.Text <> '' then
       ENHumenItemObj.price.decimalString := edtPrice.Text 
     else
       ENHumenItemObj.price := nil;

     if (ENHumenItemObj.cost = nil ) then
       ENHumenItemObj.cost := TXSDecimal.Create;
     if edtCost.Text <> '' then
       ENHumenItemObj.cost.decimalString := edtCost.Text 
     else
       ENHumenItemObj.cost := nil;

     ENHumenItemObj.commentGen := edtCommentGen.Text; 

     ENHumenItemObj.userGen := edtUserGen.Text;

     if edtdateEdit.checked then
     begin 
       if ENHumenItemObj.dateEdit = nil then
          ENHumenItemObj.dateEdit := TXSDate.Create;
       ENHumenItemObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENHumenItemObj.dateEdit := nil;


    if ENHumenItemObj.finWorker <> nil then
    begin
      if (isSentAssignment.Checked) then
        ENHumenItemObj.finWorker.isSentAssignment := 1
      else
        ENHumenItemObj.finWorker.isSentAssignment := 0;
    end;
       
    if DialogState = dsInsert then
    begin
      ENHumenItemObj.code:=low(Integer);
      TempENHumenItem.add(ENHumenItemObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENHumenItem.save(ENHumenItemObj);
    end;
  end;
end;


procedure TfrmENHumenItemEdit.spbTKPositionPositionGenClick(Sender : TObject);
var 
   frmTKPositionShow: TfrmTKPositionShow;
begin
   frmTKPositionShow:=TfrmTKPositionShow.Create(Application,fmNormal);
   try
      with frmTKPositionShow do
        if ShowModal = mrOk then
        begin
            try
               if ENHumenItemObj.positionGen = nil then ENHumenItemObj.positionGen := TKPosition.Create();
               ENHumenItemObj.positionGen.code := StrToInt(GetReturnValue(sgTKPosition,0));
               edtTKPositionPositionGenName.Text:=GetReturnValue(sgTKPosition,1) + ' ' + GetReturnValue(sgTKPosition,3);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmTKPositionShow.Free;
   end;
end;



procedure TfrmENHumenItemEdit.sgENWorkOrderBytClick(Sender: TObject);
begin
  UpdateENWorkOrderBytItemsList;
end;

procedure TfrmENHumenItemEdit.spbENManningTableManningTableClick(Sender : TObject);
var
   frmENManningTableShow: TfrmENManningTableShow;
   plan : ENPlanWork;
   f : ENManningTableFilter;
begin

//      plan := DMReports.getPlanByCode(ENHumenItemObj.planRef.code);
      {
      f := ENManningTableFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);
      f.department := ENDepartment.Create;
      f.department.code := plan.departmentRef.code;
      }
{
   frmENManningTableShow:=TfrmENManningTableShow.Create(Application,fmNormal);
   try
       frmENManningTableShow.departmentFilter := ENDepartmentFilter.Create;
       SetNullIntProps(frmENManningTableShow.departmentFilter);
       SetNullXSProps(frmENManningTableShow.departmentFilter);
       frmENManningTableShow.departmentFilter.code := plan.departmentRef.code;

      //frmENManningTableShow.dep
      with frmENManningTableShow do
        if ShowModal = mrOk then
        begin
            try
               if ENHumenItemObj.manningTable = nil then ENHumenItemObj.manningTable := ENManningTable.Create();
               ENHumenItemObj.manningTable.code := StrToInt(GetReturnValue(sgENManningTable,0));
               edtENManningTableManningTableName.Text:=GetReturnValue(sgENManningTable,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENManningTableShow.Free;
   end;
}
end;



procedure TfrmENHumenItemEdit.spbENWorkerWorkerFactClick(Sender : TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   plan : ENPlanWork;
   w : FINWorker;
   TempFINWorker: FINWorkerControllerSoapPort;
   eType : Integer;
   NVZType: String;
   IsNVZ: Boolean;
   departmentNameString: string;
   departmentCode : string;
   isODS: boolean;
begin
      plan := DMReports.getPlanByCode(ENHumenItemObj.planRef.code);
      //eType :=  DMReports.getElementTypeByPlan(plan.code);
      eType := DMReports.getElementByCode(plan.elementRef.code).typeRef.code;

      f :=FINWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);

    // это для ЗП ... уехало в Штатное
   //f.conditionSQL := 'kdv.date_uvol is null '; // только работающие ...
   //f.conditionSQL := f.conditionSQL + ' and p.podrcod = '+chr(39) + '0' + DMReports.getFinRenByDepartmentCode(plan.departmentRef.code) + chr(39) ;

   f.departmentCode :=  IntToStr(plan.departmentRef.code);

   if plan.finExecutor <> nil then
   begin
     if plan.finExecutor.code > LOW_INT then
     begin
       // MDAX-441
       if DMReports.UsesMDAXData then
         f.departmentCode := plan.finExecutor.axOrgId
       else
         f.departmentCode := intToStr( plan.finExecutor.finCode );
     end
     else
       Application.MessageBox(PChar('Не выбрана бригада! Выберите бригаду на плане или воспользуйтесь фильтром!'), PChar('Внимание!'), MB_ICONINFORMATION);
   end;


   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal,f);
   try

     frmFINWorkerShow.dateGet := TXSDate.Create;
     frmFINWorkerShow.dateGet.XSToNative(GetXSDate( EncodeDate(plan.dateStart.Year,plan.dateStart.Month,plan.dateStart.Day) ));

     frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH;
     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            /// 15.02.11
            NVZType := GetReturnValue(sgFINWorker,8);
            IsNVZ := false;

            // NET-4396 Запрещаем использовать работников ОВБ на работах других бюджетодержателей
            departmentNameString := GetReturnValue(sgFINWorker,5);
            departmentCode := GetReturnValue(sgFINWorker,6);

            if (DMReports.UsesMDAXData) then isODS := (departmentCode = '001')
             else isODS := (departmentCode = '93');

            if (Pos('Оперативно', departmentNameString) > 0) then
               begin
                  if (((plan.budgetRef.code <> ENConsts.ENBUDGET_ODG)
                  and (plan.budgetRef.code <> ENConsts.ENBUDGET_SPS))
                  and (not isODS) ) then
                     begin
                         Application.MessageBox(PChar('Цей робітник відноситься до ОДГ(ОВБ)! План повинен бути для бюджетотримача ОДГ або СПС'),
                                PChar('Увага !'), MB_ICONERROR+MB_OKCANCEL);
                         exit;
                     end;
               end;


            if (eType <> EN_BYT) and (eType <> EN_PROM) then
            begin
              if NVZType = '1' then IsNVZ := true  // НВЗ
            end
            else
              if NVZType = '2' then IsNVZ := true; // НВЗ_Е

            if eType = EN_SERVICES_OBJECT then
              if (NVZType = '1') or (NVZType = '2') then
                IsNVZ := true;

            {
            if  (
                  ((GetReturnValue(sgFINWorker,8) <> '2') and ((eType = EN_BYT) or (eType = EN_PROM) or (eType = EN_SERVICES_OBJECT)) )
                or
                  ( ( GetReturnValue(sgFINWorker,8) <> '1') and ((eType <> EN_BYT) and ( eType <> EN_PROM) and (eType <> EN_SERVICES_OBJECT))  )
                )
            }
            if (( not IsNVZ ) and (GetReturnValue(sgFINWorker,8) = '')) then
            ///
            begin
              if Application.MessageBox(PChar('У цього працівника не встановлений признак участі в НВЗ !!! '+ #13#10+'Він не буде відображений у Додатках 3...'+ #13#10+'Тел. 12-62 ...'),
                                PChar('Увага !'), MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
              exit;
            end;

            try
              if ENHumenItemObj.finWorker = nil then
              begin
                ENHumenItemObj.finWorker := FINWorker.Create;
                ENHumenItemObj.finWorker.code := low(Integer);
              end;

              ENHumenItemObj.finWorker.name := GetReturnValue(sgFINWorker,1);
              ENHumenItemObj.finWorker.tabNumber := GetReturnValue(sgFINWorker,2);
              ENHumenItemObj.finWorker.positionName := GetReturnValue(sgFINWorker,3);

              if (GetReturnValue(sgFINWorker,4) <> '') then
                ENHumenItemObj.finWorker.positionCode := StrToInt(GetReturnValue(sgFINWorker,4))
              else
                ENHumenItemObj.finWorker.positionCode := LOW_INT;

              ENHumenItemObj.finWorker.departmentName := GetReturnValue(sgFINWorker,5);
              ENHumenItemObj.finWorker.departmentCode := (GetReturnValue(sgFINWorker,6));

              if ENHumenItemObj.finWorker.priceGen = nil then ENHumenItemObj.finWorker.priceGen := TXSDecimal.Create;
              ENHumenItemObj.finWorker.priceGen.DecimalString := String(sgFINWorker.Objects[0, sgFINWorker.Row]); //GetReturnValue(sgFINWorker,7);

              ENHumenItemObj.finWorker.kindRef := FINWorkerKindRef.Create;
              ENHumenItemObj.finWorker.categor := LOW_INT;

              if GetReturnValue(sgFINWorker,8) = '' then
              begin
                ENHumenItemObj.finWorker.kindRef.code := FINWORKER_KIND_OTHER;
              end
              else
              begin
                //if StrToInt(GetReturnValue(sgFINWorker,8)) =
                ENHumenItemObj.finWorker.kindRef.code := StrToInt(GetReturnValue(sgFINWorker,8));
              end;

              if (GetReturnValue(sgFINWorker,9) <> '') then
                ENHumenItemObj.finWorker.finCode := StrToInt(GetReturnValue(sgFINWorker,9))
              else
                ENHumenItemObj.finWorker.finCode := LOW_INT;

              // 26.02.2015
              if (GetReturnValue(sgFINWorker,12) <> '') then
                ENHumenItemObj.finWorker.categorId := StrToInt(GetReturnValue(sgFINWorker,12))
              else
                ENHumenItemObj.finWorker.categorId := LOW_INT;

              ENHumenItemObj.finWorker.categorName := GetReturnValue(sgFINWorker,13);
              ENHumenItemObj.finWorker.workTimeId := GetReturnValue(sgFINWorker,14);
              ENHumenItemObj.finWorker.positionId := GetReturnValue(sgFINWorker,15);

              edtENWorkerWorkerFactName.Text := ENHumenItemObj.finWorker.name;
              edtENManningTableManningTableName.Text := ENHumenItemObj.finWorker.positionName;
              // перешифроавть автоматом ...

              HideControls([lblisSentAssignment, isSentAssignment], false);
             // tsDeliveryTime.TabVisible := true;

              isSentAssignment.Checked := false;

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

{
var
   frmENWorkerShow: TfrmENWorkerShow;
   f : ENWorkerFilter;
   plan : ENPlanWork;
begin

      plan := DMReports.getPlanByCode(ENHumenItemObj.planRef.code);

      f :=ENWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);

      //f.manningTable := ENManningTable.Create;

      if ENHumenItemObj.manningTable <> nil then
      begin
       if ENHumenItemObj.manningTable.code > low(Integer) then
       begin
          f.manningTable := ENManningTable.Create;
          f.manningTable.code := ENHumenItemObj.manningTable.code;
       end
       else
          f.conditionSQL := 'manningtablecode in (select enmanningtable.code from enmanningtable where enmanningtable.departmentcode in (select endepartment.code from endepartment where endepartment.rencode = ' + intToStr(plan.departmentRef.code) + '))';
      end
      else
        f.conditionSQL := 'manningtablecode in (select enmanningtable.code from enmanningtable where enmanningtable.departmentcode in (select endepartment.code from endepartment where endepartment.rencode = ' + intToStr(plan.departmentRef.code) + '))';

      //f.conditionSQL := 'manningtablecode in (select enmanningtable.code from enmanningtable where enmanningtable.departmentcode = ' + intToStr(plan.departmentRef.code) + ')';


   frmENWorkerShow:=TfrmENWorkerShow.Create(Application,fmNormal,f);
   try
      with frmENWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENHumenItemObj.workerFact = nil then ENHumenItemObj.workerFact := ENWorker.Create();
               ENHumenItemObj.workerFact.code := StrToInt(GetReturnValue(sgENWorker,0));
               edtENWorkerWorkerFactName.Text:=GetReturnValue(sgENWorker,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENWorkerShow.Free;
   end;
end;
}


procedure TfrmENHumenItemEdit.FormCreate(Sender: TObject);
begin
  inherited;
  departmentCode := -1;
  workerCount := 0;
end;

procedure TfrmENHumenItemEdit.spbFINWorkerClearClick(Sender: TObject);
begin
  if ENHumenItemObj.finWorker <> nil then
  begin
     ENHumenItemObj.finWorker.code := LOW_INT;
     ENHumenItemObj.finWorker.tabNumber := '';
     edtENManningTableManningTableName.Text := '';
     edtENWorkerWorkerFactName.Text := '';

     HideControls([lblisSentAssignment, isSentAssignment]);
     tsDeliveryTime.TabVisible := false;
     isSentAssignment.Checked := false;
  end;
end;

procedure TfrmENHumenItemEdit.pcHumensChange(Sender: TObject);
var
  TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  i: Integer;
  ENDeliveryTimeList: ENDeliveryTimeShortList;
  f : ENDeliveryTimeFilter;
begin
  inherited;

  if pcHumens.ActivePage = tsHumen then
  begin

  end;

  // ----------------------------------------------
  if pcHumens.ActivePage = tsDeliveryTime then
  begin
    SetGridHeaders(ENDeliveryTimeHeaders, sgENDeliveryTime.ColumnHeaders);

    TempENDeliveryTime :=  HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;

    f := ENDeliveryTimeFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);

    f.humenItemRef := ENHumenItemRef.Create;
    f.humenItemRef.code := ENHumenItemObj.code;

    ENDeliveryTimeList := TempENDeliveryTime.getScrollableFilteredList(f,0,-1);


    //LastCount:=High(ENDeliveryTimeList.list);

    if High(ENDeliveryTimeList.list) > -1 then
       sgENDeliveryTime.RowCount:= High(ENDeliveryTimeList.list)+ 2
    else
       sgENDeliveryTime.RowCount:=2;

     with sgENDeliveryTime do
      for i:=0 to High(ENDeliveryTimeList.list) do
        begin
          Application.ProcessMessages;
          if ENDeliveryTimeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENDeliveryTimeList.list[i].code)
          else
          Cells[0,i+1] := '';

          if ENDeliveryTimeList.list[i].deliveryTimePlan = nil then
            Cells[1,i+1] := ''
          else
            Cells[1,i+1] := ENDeliveryTimeList.list[i].deliveryTimePlan.DecimalString;

          if ENDeliveryTimeList.list[i].deliveryTimeFact = nil then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := ENDeliveryTimeList.list[i].deliveryTimeFact.DecimalString;

           Cells[3, i + 1] := ENDeliveryTimeList.list[i].deliveryKindName;
           
          sgENDeliveryTime.RowCount:=High(ENDeliveryTimeList.list)+2;
        end;
     sgENDeliveryTime.Row:=1;
  end;

  {
  if pcHumens.ActivePage = tsWorkOrderByt then
  begin
    HideControls([tsWorkOrderByt]);

    // Дернем метод для проверки прав на просмотр сменных заданий по рейдовым бригадам
    TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
    TempENWorkOrderByt.getObjectForRaid(-1);

    // Если права есть, показываем сменные задания и их строки
    HideControls([tsWorkOrderByt], false);
  end;
  }
end;

procedure TfrmENHumenItemEdit.actInsertExecute(Sender: TObject);
Var
  TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;

begin
  inherited;

  if pcHumens.ActivePage = tsDeliveryTime then
  begin
      TempENDeliveryTime := HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;
      ENDeliveryTimeObj:=ENDeliveryTime.Create;

       ENDeliveryTimeObj.deliveryTimePlan:= TXSDecimal.Create;
       ENDeliveryTimeObj.deliveryTimeFact:= TXSDecimal.Create;

       ENDeliveryTimeObj.deliveryKind := ENDeliveryKind.Create;
       ENDeliveryTimeObj.deliveryKind.code := 2;

       ENDeliveryTimeObj.humenItemRef := ENHumenItemRef.Create();
       ENDeliveryTimeObj.humenItemRef.code := ENHumenItemObj.code;

      try
        frmENDeliveryTimeEdit:=TfrmENDeliveryTimeEdit.Create(Application, dsInsert);
        try
          if frmENDeliveryTimeEdit.ShowModal = mrOk then
          begin
            if ENDeliveryTimeObj<>nil then
                //TempENDeliveryTime.add(ENDeliveryTimeObj);
                //UpdateGrid(Sender);
                pcHumensChange(Sender);
          end;
        finally
          frmENDeliveryTimeEdit.Free;
          frmENDeliveryTimeEdit:=nil;
        end;
      finally
        ENDeliveryTimeObj.Free;
      end;
  end;

end;


procedure TfrmENHumenItemEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;

  pcHumensChange(Sender);
end;

procedure TfrmENHumenItemEdit.actEditExecute(Sender: TObject);
Var
  TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
begin
  inherited;

  if pcHumens.ActivePage = tsDeliveryTime then
  begin
      TempENDeliveryTime := HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;

      try
       ENDeliveryTimeObj := TempENDeliveryTime.getObject(StrToInt(sgENDeliveryTime.Cells[0,sgENDeliveryTime.Row]));
      except
       on EConvertError do Exit;
      end;

      if  ENDeliveryTimeObj.deliveryKind.code = 1 then
      begin
         Application.MessageBox(PChar('Нельзя изменять этот Вид доставки !!! '), PChar('Внимание!'), MB_ICONINFORMATION);
         Exit;
      end;

      try
        frmENDeliveryTimeEdit:=TfrmENDeliveryTimeEdit.Create(Application, dsEdit);
        try
          if frmENDeliveryTimeEdit.ShowModal = mrOk then
          begin
            if ENDeliveryTimeObj<>nil then
                //TempENDeliveryTime.add(ENDeliveryTimeObj);
                //UpdateGrid(Sender);
                pcHumensChange(Sender);
          end;
        finally
          frmENDeliveryTimeEdit.Free;
          frmENDeliveryTimeEdit:=nil;
        end;
      finally
        ENDeliveryTimeObj.Free;
      end;
  end;


end;

procedure TfrmENHumenItemEdit.actDeleteExecute(Sender: TObject);
var
   objCode : Integer;
   TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
begin
  inherited;

  if pcHumens.ActivePage = tsDeliveryTime then
  begin
      TempENDeliveryTime := HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;

      try
       objCode := StrToInt(sgENDeliveryTime.Cells[0,sgENDeliveryTime.Row]);
      except
       on EConvertError do Exit;
      end;

      if Application.MessageBox(PChar('Вы действительно хотите удалить (Время доставки) ?'),
                        PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempENDeliveryTime.remove(ObjCode);
          pcHumensChange(Sender);
      end;

  end;


end;

procedure TfrmENHumenItemEdit.UpdateENWorkOrderBytItemsList;
var
  TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  i, LastCount, workOrderBytCode: Integer;
  ENWorkOrderBytItemList: ENWorkOrderBytItemShortList;
  itemFilter: ENWorkOrderBytItemFilter;
  customerName: String;
begin
  ClearGrid(sgENWorkOrderBytItem);

  if DialogState = dsInsert then Exit;
  if ENHumenItemObj = nil then Exit;
  if ENHumenItemObj.code = LOW_INT then Exit;

  try
    workOrderBytCode := StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]);
  except
    on EConvertError do Exit;
  end;

  if workOrderBytCode <= 0 then Exit;

  itemFilter := ENWorkOrderBytItemFilter.Create;
  SetNullIntProps(itemFilter);
  SetNullXSProps(itemFilter);

  itemFilter.humenItemRef := ENHumenItemRef.Create;
  itemFilter.humenItemRef.code := ENHumenItemObj.code;
  itemFilter.workOrderBytRef := ENWorkOrderBytRef.Create;
  itemFilter.workOrderBytRef.code := workOrderBytCode;

  TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;

  ENWorkOrderBytItemList := TempENWorkOrderBytItem.getScrollableFilteredList(itemFilter, 0, -1);

  LastCount := High(ENWorkOrderBytItemList.list);

  if LastCount > -1 then
    sgENWorkOrderBytItem.RowCount := LastCount + 2
  else
    sgENWorkOrderBytItem.RowCount := 2;

  with sgENWorkOrderBytItem do
    for i:=0 to LastCount do
    begin
      Application.ProcessMessages;

      if ENWorkOrderBytItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkOrderBytItemList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := ENWorkOrderBytItemList.list[i].finWorkerName + ' (таб. №' + ENWorkOrderBytItemList.list[i].finWorkerTabNumber + ')';

      //if DialogState = dsEdit then
      //  AddCheckBox(1, i+1, false, false);

      Cells[2,i+1] := ENWorkOrderBytItemList.list[i].kartaRefNum;
      Cells[3,i+1] := ENWorkOrderBytItemList.list[i].kartaRefName;

      Cells[4,i+1] := ENWorkOrderBytItemList.list[i].contractNumberServices;
      Cells[5,i+1] := ENWorkOrderBytItemList.list[i].accountNumber;

      ///
      //Cells[6,i+1] := ENWorkOrderBytItemList.list[i].name;
      customerName := ENWorkOrderBytItemList.list[i].customerName;
      if ENWorkOrderBytItemList.list[i].recordPointPromRefCode <> Low(Integer) then
        customerName := customerName + ' (' + ENWorkOrderBytItemList.list[i].recordPointName + ')';

      Cells[6,i+1] := customerName;
      ///

      Cells[7,i+1] := ENWorkOrderBytItemList.list[i].address;
      Cells[8,i+1] := ENWorkOrderBytItemList.list[i].phone;
      Cells[9,i+1] := ENWorkOrderBytItemList.list[i].invNumber;
      Cells[10,i+1] := ENWorkOrderBytItemList.list[i].serialNumber;
      Cells[11,i+1] := ENWorkOrderBytItemList.list[i].seal;

      Cells[12,i+1] := ENWorkOrderBytItemList.list[i].positionName;

      Objects[1,i+1] := TObject(ENWorkOrderBytItemList.list[i].planRefCode);

      sgENWorkOrderBytItem.RowCount := i + 2;
    end;

   sgENWorkOrderBytItem.Row := 1;
end;


procedure TfrmENHumenItemEdit.UpdateENWorkOrderBytList;
var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  i, LastCount: Integer;
  ENWorkOrderBytList: ENWorkOrderBytShortList;
  workOrderBytFilter: ENWorkOrderBytFilter;
begin
  ClearGrid(sgENWorkOrderByt);

  if DialogState = dsInsert then Exit;
  if ENHumenItemObj = nil then Exit;
  if ENHumenItemObj.code = LOW_INT then Exit;

  workOrderBytFilter := ENWorkOrderBytFilter.Create;
  SetNullIntProps(workOrderBytFilter);
  SetNullXSProps(workOrderBytFilter);

  workOrderBytFilter.conditionSQL := 'ENWORKORDERBYT.CODE in ' +
                                     '(select ENWORKORDERBYTITEM.WORKORDERBYTREFCODE from ENWORKORDERBYTITEM ' +
                                     ' where ENWORKORDERBYTITEM.HUMENITEMREFCODE = ' + IntToStr(ENHumenItemObj.code) + ')';

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;

  ENWorkOrderBytList := TempENWorkOrderByt.getScrollableFilteredList(workOrderBytFilter, 0, -1);

  LastCount := High(ENWorkOrderBytList.list);

  if LastCount > -1 then
  begin
    sgENWorkOrderByt.RowCount := LastCount + 2;
    tsWorkOrderByt.TabVisible := true;
  end
  else begin
    sgENWorkOrderByt.RowCount := 2;
    tsWorkOrderByt.TabVisible := false;
    Exit;
  end;

  with sgENWorkOrderByt do
    for i := 0 to LastCount do
    begin
      Application.ProcessMessages;

      if ENWorkOrderBytList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENWorkOrderBytList.list[i].code)
      else
        Cells[0,i+1] := '';
      Cells[1,i+1] := ENWorkOrderBytList.list[i].numberGen;
      if ENWorkOrderBytList.list[i].dateGen = nil then
        Cells[2,i+1] := ''
      else
        Cells[2,i+1] := XSDate2String(ENWorkOrderBytList.list[i].dateGen);
      //Cells[3,i+1] := ENWorkOrderBytList.list[i].commentGen;

      Cells[3,i+1] := ENWorkOrderBytList.list[i].departmentRefShortName;

      Cells[4,i+1] := ENWorkOrderBytList.list[i].userAdd;
      if ENWorkOrderBytList.list[i].dateAdd = nil then
        Cells[5,i+1] := ''
      else
        Cells[5,i+1] := XSDateTimeWithDate2String(ENWorkOrderBytList.list[i].dateAdd);

      Cells[6,i+1] := ENWorkOrderBytList.list[i].userEdit;
      if ENWorkOrderBytList.list[i].dateEdit = nil then
        Cells[7,i+1] := ''
      else
        Cells[7,i+1] := XSDateTimeWithDate2String(ENWorkOrderBytList.list[i].dateEdit);

      Objects[0,i+1] := TObject(ENWorkOrderBytList.list[i].typeRefCode);

      sgENWorkOrderByt.RowCount := i + 2;
    end;

  sgENWorkOrderByt.Row := 1;
  sgENWorkOrderBytClick(sgENWorkOrderByt);
end;

procedure TfrmENHumenItemEdit.actViewExecute(Sender: TObject);
Var
  TempENDeliveryTime: ENDeliveryTimeControllerSoapPort;
begin
  inherited;

  if pcHumens.ActivePage = tsDeliveryTime then
  begin
      TempENDeliveryTime := HTTPRIOENDeliveryTime as ENDeliveryTimeControllerSoapPort;

      try
       ENDeliveryTimeObj := TempENDeliveryTime.getObject(StrToInt(sgENDeliveryTime.Cells[0,sgENDeliveryTime.Row]));
      except
       on EConvertError do Exit;
      end;

      try
        frmENDeliveryTimeEdit:=TfrmENDeliveryTimeEdit.Create(Application, dsView);
        try
          if frmENDeliveryTimeEdit.ShowModal = mrOk then
          begin
            if ENDeliveryTimeObj<>nil then
                //TempENDeliveryTime.add(ENDeliveryTimeObj);
                //UpdateGrid(Sender);
                pcHumensChange(Sender);
          end;
        finally
          frmENDeliveryTimeEdit.Free;
          frmENDeliveryTimeEdit:=nil;
        end;
      finally
        ENDeliveryTimeObj.Free;
      end;
  end;

end;

procedure TfrmENHumenItemEdit.actViewWorkOrderBytExecute(Sender: TObject);
Var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  typeCode: Integer;
begin
  typeCode := Integer(sgENWorkOrderByt.Objects[0, sgENWorkOrderByt.Row]);

  if typeCode <= 0 then Exit;

  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  frmENWorkOrderBytEdit := TfrmENWorkOrderBytEdit.Create(Application, dsView);
  try
    try
      ///// 27.01.15 Для сменных заданий по рейдовым бригадам выделяем права на просмотр в отдельную группу
      if typeCode = ENWORKORDERBYTTYPE_RAID_BY_BILLING then
        frmENWorkOrderBytEdit.ENWorkOrderBytObj := TempENWorkOrderByt.getObjectForRaid(StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]))
      else
        frmENWorkOrderBytEdit.ENWorkOrderBytObj := TempENWorkOrderByt.getObject(StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]));
      /////
    except
      on EConvertError do Exit;
    end;

    frmENWorkOrderBytEdit.ShowModal;
  finally
    frmENWorkOrderBytEdit.Free;
    frmENWorkOrderBytEdit := nil;
  end;
end;

procedure TfrmENHumenItemEdit.actViewWorkOrderBytItemExecute(Sender: TObject);
Var
  TempENWorkOrderByt: ENWorkOrderBytControllerSoapPort;
  TempENWorkOrderBytItem: ENWorkOrderBytItemControllerSoapPort;
  tmpWorkOrderBytObj: ENWorkOrderByt;
  typeCode: Integer;
begin
  typeCode := Integer(sgENWorkOrderByt.Objects[0, sgENWorkOrderByt.Row]);

  if typeCode <= 0 then Exit;

  ///// Дернем объект для проверки прав на просмотр сменных заданий по рейдовым бригадам
  TempENWorkOrderByt := HTTPRIOENWorkOrderByt as ENWorkOrderBytControllerSoapPort;
  try
    if typeCode = ENWORKORDERBYTTYPE_RAID_BY_BILLING then
      tmpWorkOrderBytObj := TempENWorkOrderByt.getObjectForRaid(StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]))
    else
      tmpWorkOrderBytObj := TempENWorkOrderByt.getObject(StrToInt(sgENWorkOrderByt.Cells[0, sgENWorkOrderByt.Row]));
  except
    on EConvertError do Exit;
  end;
  /////

  TempENWorkOrderBytItem := HTTPRIOENWorkOrderBytItem as ENWorkOrderBytItemControllerSoapPort;
  try
    ENWorkOrderBytItemObj := TempENWorkOrderBytItem.getObject(StrToInt(sgENWorkOrderBytItem.Cells[0, sgENWorkOrderBytItem.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENWorkOrderBytItemEdit := TfrmENWorkOrderBytItemEdit.Create(Application, dsView);
  try
    // frmENWorkOrderBytItemEdit.workOrderBytType := ENWorkOrderBytObj.typeRef.code;
    frmENWorkOrderBytItemEdit.workOrderBytType := tmpWorkOrderBytObj.typeRef.code;

    frmENWorkOrderBytItemEdit.ShowModal;
  finally
    frmENWorkOrderBytItemEdit.Free;
    frmENWorkOrderBytItemEdit := nil;
  end;
end;

end.
