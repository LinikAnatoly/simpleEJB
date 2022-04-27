unit EditMaterialsRQFKOrderZoneChanging;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DialogFormUnit, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  ExtCtrls, InvokeRegistry, Rio, SOAPHTTPClient, ActnList, Menus,
  tmsAdvGridExcel, AdvObj, ENPlanWorkController
  , RQOrderItemController
  , RQFKOrderController, TB2Item, TB2Dock, TB2Toolbar, ImgList
  ;

type
  TfrmMaterialsRQFKOrderZoneChangingEdit = class(TDialogForm)
    HTTPRIOTKMaterials: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    HTTPRIORQOrderItem: THTTPRIO;
    PanelFINMaterials: TPanel;
    gbFINMaterials: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    lblFINMol: TLabel;
    spbFINMol: TSpeedButton;
    sgFINMaterials: TAdvStringGrid;
    edtNomenclature: TEdit;
    edtMaterialName: TEdit;
    btnFind: TButton;
    edtFINMol: TEdit;
    HTTPRIOFINMaterials: THTTPRIO;
    HTTPRIORQFKOrder: THTTPRIO;
    HTTPRIOFINDoc2FKOrder: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    HTTPRIORQFKOrderItem: THTTPRIO;
    actRemove310: TAction;
    edtCFO: TEdit;
    Label3: TLabel;
    HTTPRIORQFKOrderItem2ENEstimateItem: THTTPRIO;
    Label6: TLabel;
    lblStorageZoneName: TLabel;
    edtStorageZoneName: TEdit;
    spbStorageZoneName: TSpeedButton;
    HTTPRIORQStorageZone: THTTPRIO;
    SpeedButton2: TSpeedButton;
    btnSave: TButton;
    btnReturnToNormalForm: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure spbStorageZoneNameClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnReturnToNormalFormClick(Sender: TObject);
    procedure sgFINMaterialsCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: string; var Valid: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
    //RQOrderItemObj: RQOrderItem;

    rqFKOrderCode : Integer;
    rqFKOrderObj : RQFKOrder;
    finDoc : Integer;
    isNeededAnotherForm : Boolean;


    elementCode: Integer;
    elementName: String;
    budgetCode: Integer;
    budgetName: String;
    planCodes: String;
    planFilter: ENPlanWorkFilter;
    MOLCode : String;
    masterMOLCode : String;
    departmentCode : Integer;
    departmentName : String;
    materialsINCode : Integer;
    partnerCode : String;
    zoneCode : Integer;
    previousValue : String;

    procedure updateFINMaterialsGrid();

  end;

var
  frmMaterialsRQFKOrderZoneChangingEdit: TfrmMaterialsRQFKOrderZoneChangingEdit;


implementation

{$R *.dfm}

uses ShowENEPRen, ChildFormUnit, ShowENElement, ENElementController,
  EnergyproController, ENConsts, ShowENDepartment, ENDepartmentController,
  ENDepartmentTypeController, TKMaterialsController, GridHeadersUnit,
  {ENPlanWorkController, }ENPlanWorkKindController, EditTKMaterials,
  EditENPlanWork, DMReportsUnit, ShellAPI, Globals,
  ENPlanWorkItemController, EditENPlanWorkItem, ENEstimateItemController,
  XSBuiltIns, FINMolController, ShowFINMol, ENDepartment2EPRenController,
  ENEstimateItemKindController, EditRQOrderItem, RQOrderController,
  TKMeasurementController, ENPlanWorkFormController,
  FINMaterialsController, FINDoc2FKOrderController, FINDocTypeController,
  FINMaterialsStatusController, EditFINMaterialCount, FINMolDataController,
  RQFKOrderItemController, RQFKOrderItem2ENEstimateItemController,
  RQFKOrderData2FKPartyController, Math, RQStorageZoneController, ShowRQStorageZone,
  EditMaterialsRQFKOrderOut;

var



{
  TKMaterialsHeaders: array [1..5] of String =
        ( 'Код'
          ,'Наименование '
          ,'Ед. изм.'
          ,'Цена'
          ,'Срок поставки'
        );
}
  TKMaterialsHeaders: array [1..7] of String =
        ( 'Код'
          ,'Назва'
          ,'Од. вим.'
          ,'Кіл-ть'
          ,'Ціна без ПДВ (індикативна)'
          ,'Вартість без ПДВ'
          ,'Строк постачання'
        );
{
  ENPlanWorkHeaders: array [1..17] of String =
        ( 'Код'
          ,'Об''єкт планування'
          ,'Інв. №'
          ,'РЕЗ та ЕМ'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Дата початку робіт'
          ,'Вид робіт'
          ,'Тип робіт'
          ,'Вид плану'
          ,'Статус'
          ,'Підрозділ'
          ,'БюджетоТримач'
          ,'Центр відповідальності'
          //,'Дата складання плану'
          ,'Номер наряда'
          ,'Користувач, що вніс зміни'
          ,'Дата останньої зміни'
        );

  ENPlanWorkItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Код роботи'
          ,'Робота'
          ,'Кільк. м-лу'
          ,'Джерело нормативу'
          ,'Кільк. робіт'
          ,'Норма часу на од.'
          ,'Всього часу'
          ,'Вимірювач'
          ,'Од. виміру'
          ,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );
}


  FINMaterialsHeaders: array [1..25] of String =
        ( 'Код'
          ,'Номенклатурний №'
          ,'Назва'
          ,'Одиниця виміру'
          ,'Кількість матеріалу'
          ,'Призначення залишку'{*** передвинуто ***}
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код ...'
          //,'Призначення залишку'
          ,'код ...'
          ,'код ...'
          ,'код ЦФВ'
          ,'ЦФВ'
          ,'Ціна розрахункова'
          ,'ПІБ МОЛа'
          ,'Ціна матеріалу'
          ,'Вартість матеріалу'
          ,'Балансовий рахунок'
          //-----------------
          ,'mat_id'
          ,'party_id'
          ,'partner'
          , 'mu_id'
          , 'doc_num'
          ,'дата ввода в экспл.'
        );

  ENEstimateItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Матеріал'
          //,'Кількість нормативна'
          ,'Кількість скорегована'           // !!! используеться при разноске с ФинКол !!!
          ,'Од. виміру'
          ,'Дата поч.робіт'
          ,'Підрозділ'
          ,'Інв. №'
          ,'Назва об''єкту'
          ,'Код роботи'
          ,'Робота'
          ,'Вид плану'
          ,'Тип плану'

          //,'Користувач, що вніс зміни'
          //,'Дата останньої зміни'
        );

  ENFINMaterialsHeaders: array [1..25] of String =
        ( 'Код'
          ,'Номенклатурний №'
          ,'Назва'
          ,'Одиниця виміру'
          ,'Кількість матеріалу'
          ,'код,назва ЦФВ'
          ,'ПІБ МОЛа'

          ,'Призначення залишку' {*** передвинуто ***}
          ,'Постачальник'
          ,'Дата постачання'
          ,'Опис постачання'
          ,'код ...'
          //,'Призначення залишку'
          ,'код ...'
          ,'код ...'
          ,'код ...'
          ,'...'
          ,'Ціна розрахункова'

          ,'Ціна матеріалу'
          ,'Вартість матеріалу'
          ,'Балансовий рахунок'
          //-----------------
          ,'mat_id'
          ,'party_id'
          ,'partner'
          , 'mu_id'
          , 'doc_num'
        );


procedure TfrmMaterialsRQFKOrderZoneChangingEdit.updateFINMaterialsGrid();
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  TempRQStorageZone : RQStorageZoneControllerSoapPort;
  i, j, k : Integer;
  cfoCode : string;
  FINMaterialsList : FINMaterialsList_;
  fmList : FINMaterialsShortList;
  fmFilter : FINMaterialsFilter;

  TempRQFKOrderItem2ENEstimateItem: RQFKOrderItem2ENEstimateItemControllerSoapPort;
  RQFKOrderItem2ENEstimateItemList: RQFKOrderItem2ENEstimateItemShortList;
  f2 : RQFKOrderItem2ENEstimateItemFilter;

  TempRQFKOrderData2FKParty: RQFKOrderData2FKPartyControllerSoapPort;
  RQFKOrderData2FKPartyList: RQFKOrderData2FKPartyShortList;
  f : RQFKOrderData2FKPartyFilter;


  fCondition, partyCondition, condition : String;
  estimateCode : Integer;
  //estimateObj : ENEstimateItem;

  balansNumberCondition, materialCondition : String;
  finFilter : FINMaterialsFilter;
  dateRemains : TXSDate;
  plan : ENPlanWork;

  TempRQFKOrderItem : RQFKOrderItemControllerSoapPort;
  orderItemFilter :  RQFKOrderItemFilter;
  orderItemList : RQFKOrderItemShortList;
  restPurposesCondition : String;

  objecto : FINMaterials;

begin
   TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;
   TempRQStorageZone := HTTPRIORQStorageZone as RQStorageZoneControllerSoapPort;

   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';
   sgFINMaterials.RowCount := 2;

      balansNumberCondition := '';

      materialCondition := ' and h.op_kind_id not in(''5'',''10'',''310'',''300'',''320'',''321'',''20'',''15'', ''322'')';

      finFilter := FINMaterialsFilter.Create;
      SetNullIntProps(finFilter);
      SetNullXSProps(finFilter);

      condition := '';
      // исщем с фильтрами ...
      if (edtMaterialName.Text <> '') then
        finFilter.mat_name := '*' + edtMaterialName.Text + '*';
      If (edtNomenclature.Text <> '') then
        finFilter.nn := '*' + edtNomenclature.Text + '*';

        AddCondition(condition, ' ( substr(dat.bal_sch,1,2) in (''15'', ''20'', ''22'', ''28'') ) ');


      // NET-3773 условие по назначениям остатка если выбрана партия
      if zoneCode <> LOW_INT then
      begin
                 restPurposesCondition := TempRQStorageZone.getStrRestPurposesByZone(zoneCode);
                 AddCondition( condition , ' DAT.REST_PURPOSE_ID in ( ' + restPurposesCondition + ')');
      end;

      finFilter.conditionSQL := condition;
      finFilter.orderBySQL := ' dat.mat_name';


      dateRemains := TXSDate.Create;
      dateRemains.XSToNative(GetXSDate( StrToDate('31.01.3000') ));

      if  edtCFO.Text <> '' then begin
        cfoCode := edtCFO.Text;
        if StrToInt(cfoCode) >LOW_INT then
        begin
        // !!!
          AddCondition(materialCondition, ' rst.budget_core_id = (' +
                                          ' SELECT c.id FROM sprav.budget_core c, sprav.frc_list f ' +
                                          ' WHERE c.frc_list_id = f.id ' +
                                          ' AND f.code = ' + chr(39) + cfoCode + chr(39) + ')');
        end;
      end;

   if (partnerCode <> '') then  finFilter.partner := partnerCode;

   FINMaterialsList := TempFINMaterials.getMaterialsList(
                  finFilter,
                  balansNumberCondition,
                  molCode,
                  materialCondition,
                  rqFKOrderObj.dateGen,
                  finDoc
                  );

  if High(FINMaterialsList.list) > -1 then
     sgFINMaterials.RowCount:=High(FINMaterialsList.list)+2
  else
     sgFINMaterials.RowCount:=2;

   with sgFINMaterials do
    for i:=0 to High(FINMaterialsList.list) do
      begin
        if FINMaterialsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(FINMaterialsList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := FINMaterialsList.list[i].nn;
        Cells[2,i+1] := FINMaterialsList.list[i].mat_name;
        Cells[3,i+1] := FINMaterialsList.list[i].mu_name;

        if FINMaterialsList.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := FINMaterialsList.list[i].quantity.DecimalString;

        Cells[5,i+1] := FINMaterialsList.list[i].rest_purpose_name;


        Cells[6,i+1] := FINMaterialsList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[8,i+1] := FINMaterialsList.list[i].party_discription;
        if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);
        //Cells[9,i+1] := FINMaterialsList.list[i].rest_purpose_name;
        if FINMaterialsList.list[i].rest_purpose_type_id = Low(Integer) then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_type_id);
        if FINMaterialsList.list[i].budget_core_id = Low(Integer) then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := IntToStr(FINMaterialsList.list[i].budget_core_id);

        if FINMaterialsList.list[i].frc_code = Low(Integer) then
          Cells[12,i+1] := ''
        else
          Cells[12,i+1] := IntToStr(FINMaterialsList.list[i].frc_code);
        Cells[13,i+1] := FINMaterialsList.list[i].frc_name;

        if FINMaterialsList.list[i].calc_price = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;

        Cells[15,i+1] := FINMaterialsList.list[i].div_name;

        if FINMaterialsList.list[i].price = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := FINMaterialsList.list[i].price.DecimalString;
        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+1] := FINMaterialsList.list[i].bal_sch;

// ---------------------------------------

        if FINMaterialsList.list[i].mat_id = Low(Integer) then
          Cells[19,i+1] := ''
        else
          Cells[19,i+1] := IntToStr(FINMaterialsList.list[i].mat_id);

        if FINMaterialsList.list[i].party_id = Low(Integer) then
          Cells[20,i+1] := ''
        else
          Cells[20,i+1] := IntToStr(FINMaterialsList.list[i].party_id);  // НЕ двигать !!! ... берем данные!!!

         Cells[21, i+1] := FINMaterialsList.list[i].partner;

         Cells[22, i+1] := IntToStr(FINMaterialsList.list[i].mu_id) ;

         Cells[23, i+1] := FINMaterialsList.list[i].doc_num;

        if FINMaterialsList.list[i].wear_date = nil then
          Cells[24,i+1] := ''
        else
          Cells[24,i+1] := XSDate2String(FINMaterialsList.list[i].wear_date);

          // Назначение доступных для редактирования ячеек
          // и их разукрашивание
          for k := 0 to 24 do begin
              if k <> 1 then
              begin
                if k <> 4 then begin
                  CellProperties[k, i+1].ReadOnly := True;
                end
                else begin
                  CellProperties[k, i+1].ReadOnly := False;
                  Colors[k, i+1] := clYellow;
                end;
              end;
          end;

        sgFINMaterials.Objects[0, i+1] := FINMaterialsList.list[i];

        sgFINMaterials.Objects[1, i+1] := TObject(FINMaterialsList.list[i].quantity);

        sgFINMaterials.RowCount:= i + 2;

      AddCheckBox(1,i+1, false, false);

      end;

   sgFINMaterials.Row:=1;
end;

procedure TfrmMaterialsRQFKOrderZoneChangingEdit.FormShow(Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  TempFINDoc2FKOrder: FINDoc2FKOrderControllerSoapPort;
  FINDoc2FKOrderList: FINDoc2FKOrderShortList;
  FINDoc2FKOrderFilterObj: FINDoc2FKOrderFilter;

begin
  DisableControls([edtFINMol, edtStorageZoneName]);

  sgFINMaterials.Options := sgFINMaterials.Options - [goColMoving];
  sgFINMaterials.Options := sgFINMaterials.Options + [goEditing];

  SetGridHeaders(FINMaterialsHeaders, sgFINMaterials.ColumnHeaders);


  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  rqFKOrderObj := TempRQFKOrder.getObject(rqFKOrderCode);

  FINDoc2FKOrderFilterObj := FINDoc2FKOrderFilter.Create;
  SetNullIntProps(FINDoc2FKOrderFilterObj);
  SetNullXSProps(FINDoc2FKOrderFilterObj);

  FINDoc2FKOrderFilterObj.fkOrderRef := RQFKOrderRef.Create;
  FINDoc2FKOrderFilterObj.fkOrderRef.code := rqFKOrderObj.code;
  FINDoc2FKOrderFilterObj.finDocTypeRef := FINDocTypeRef.Create;

  FINDoc2FKOrderFilterObj.finDocTypeRef.code := FINDOCTYPE_312;

  TempFINDoc2FKOrder :=  HTTPRIOFINDoc2FKOrder as FINDoc2FKOrderControllerSoapPort;
  FINDoc2FKOrderList := TempFINDoc2FKOrder.getScrollableFilteredList(FINDoc2FKOrderFilterObj,0,-1);
  if   FINDoc2FKOrderList.totalCount > 0 then
  begin
     finDoc := FINDoc2FKOrderList.list[0].finDocCode;
  end
  else
  begin
      ShowMessage('Страшная ошибка при работе с ФинКоллекцией ... удалите Ордер !!!');
      exit;
  end;

end;

procedure TfrmMaterialsRQFKOrderZoneChangingEdit.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Exit;
end;

procedure TfrmMaterialsRQFKOrderZoneChangingEdit.btnReturnToNormalFormClick(
  Sender: TObject);
var
 frmMaterialsRQFKOrderOutEdit : TfrmMaterialsRQFKOrderOutEdit;
begin
  inherited;
        isNeededAnotherForm := True;
end;

procedure TfrmMaterialsRQFKOrderZoneChangingEdit.btnSaveClick(Sender: TObject);
var
  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  newZoneCode : Integer;
  finList : ArrayOfFINMaterialsData;
  count, i, k : Integer;
  state_ : Boolean;
begin
  inherited;

  count := 0;
  for i:=1 to sgFINMaterials.RowCount - 1 do
  begin
      sgFINMaterials.GetCheckBoxState(1,i,state_);
     if state_ then
       count := count + 1;
  end;

  if count = 0 then
  begin
      Application.MessageBox(PChar('Не обрано жодної строки з матеріалом'), PChar('Внимание!'), MB_ICONWARNING);
      Exit;
  end;

  SetLength(finList, count);

  k := 0;
  for i:=1 to sgFINMaterials.RowCount - 1 do
  begin
      sgFINMaterials.GetCheckBoxState(1,i,state_);
     if state_ then
     begin
        finList[k] := FINMaterials(sgFINMaterials.Objects[0, i]);
        // Введенные вручную показания количества
        finList[k].quantity.DecimalString := sgFINMaterials.Cells[4, i];
        finList[k].parentRef := nil;
        k := k + 1;
     end;
  end;

  TempRQFKOrderItem := HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

  TempRQFKOrderItem.addZoneChanging(finList, rqFKOrderCode);

  updateFINMaterialsGrid;

end;

procedure TfrmMaterialsRQFKOrderZoneChangingEdit.FormCreate(Sender: TObject);
begin
  inherited;
  MOLCode := '';
  masterMOLCode := '';
  departmentCode := LOW_INT;
  elementCode := LOW_INT;
  budgetCode := LOW_INT;
  materialsINCode := LOW_INT;
  finDoc := LOW_INT;
  zoneCode := LOW_INT;
  partnerCode := '';
  isNeededAnotherForm := False;
end;

procedure TfrmMaterialsRQFKOrderZoneChangingEdit.btnFindClick(Sender: TObject);
begin
  inherited;

  updateFINMaterialsGrid;
end;

procedure TfrmMaterialsRQFKOrderZoneChangingEdit.sgFINMaterialsCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: string; var Valid: Boolean);
  var
  overallQty : Single;
  inputQty : Single;
  finMatObj : FINMaterials;
begin
  inherited;
  // Если не колонка с количеством - то выходим
  if (ACol <> 4) then Exit;

  if sgFINMaterials.Cells[2, ARow] = '' then Exit;

  overallQty := StrToFloat(TXSDecimal(sgFINMaterials.Objects[1, ARow]).DecimalString);

  finMatObj := FINMaterials(sgFINMaterials.Objects[0, ARow]);

  try
    inputQty := StrToFloat(sgFINMaterials.Cells[ACol, ARow]);
  except
  on EConvertError do
  begin
      Application.MessageBox(PChar('Неприпустиме значення: "' + Value + '"!'), PChar('Помилка!'), MB_ICONERROR);
      Valid := false;
  end;
  end;

  if inputQty <= 0 then
  begin
    Application.MessageBox(PChar('Неприпустиме значення: "' + Value + '"!'), PChar('Помилка!'), MB_ICONERROR);
    Valid := false;
  end;

  if overallQty < inputQty then begin
    Application.MessageBox(PChar('Кількість не може перевищувати ' + FloatToStr(overallQty) + ' ' + finMatObj.mu_name + '!'), PChar('Помилка!'), MB_ICONERROR);
    Valid := false;
  end;
end;

procedure TfrmMaterialsRQFKOrderZoneChangingEdit.spbStorageZoneNameClick(
  Sender: TObject);
var zoneFilter: RQStorageZoneFilter;
    frmRQStorageZoneShow: TfrmRQStorageZoneShow;
begin

  zoneFilter := RQStorageZoneFilter.Create;
  SetNullIntProps(zoneFilter);
  SetNullXSProps(zoneFilter);

  zoneFilter.conditionSQL :=
    ' rqstoragezone.code in ' +
    ' (select sm.zonerefcode from rqstorage2enmol2zone sm ' +
    '  where sm.molrefcode in ' +
    '    (select m.code from enmol m where m.fincode = ''' + MOLCode + ''')) ';
  zoneFilter.orderBySQL := 'rqstoragezone.name';

  frmRQStorageZoneShow := TfrmRQStorageZoneShow.Create(Application, fmNormal, zoneFilter);
  try
    frmRQStorageZoneShow.DisableActions([frmRQStorageZoneShow.actInsert,
                                         frmRQStorageZoneShow.actDelete,
                                         frmRQStorageZoneShow.actEdit]);
    with frmRQStorageZoneShow do
      if ShowModal = mrOk then
      begin
        try
          zoneCode := StrToInt(GetReturnValue(sgRQStorageZone, 0));
          edtStorageZoneName.Text := GetReturnValue(sgRQStorageZone, 2);
        except
           on EConvertError do Exit;
        end;
      end;
  finally
    frmRQStorageZoneShow.Free;
  end;
end;


procedure TfrmMaterialsRQFKOrderZoneChangingEdit.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  zoneCode := LOW_INT;
  edtStorageZoneName.Text := '';
end;

end.
