unit ShowRQFKOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2, tmsAdvGridExcel, AdvObj,
  RQFKOrderController, ExtCtrls, StdCtrls;

procedure prepareRQFKOrderGridHeadersForServicesFromSide(grid : TAdvStringGrid);

type TProc = reference to procedure();
type TFilterProc = reference to procedure(filter : RQFKOrderFilter);
type
  TfrmRQFKOrderShow = class(TChildForm)
  HTTPRIORQFKOrder: THTTPRIO;
    ImageList1: TImageList;
    sgRQFKOrder: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    actCreatePrihod: TAction;
    actMoveToFK: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    actUnCreatePrihod: TAction;
    actUnMoveToFK: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    actExcel: TAction;
    Excel1: TMenuItem;
    actMoveOSToFK: TAction;
    N14: TMenuItem;
    actAddChecked: TAction;
    btnAddChecked: TToolButton;
    pnlRQFKOrderItem: TPanel;
    gbRQFKOrderItem: TGroupBox;
    sgRQFKOrderItem: TAdvStringGrid;
    spl1: TSplitter;
    HTTPRIORQFKOrderItem: THTTPRIO;
    N15: TMenuItem;
    HTTPRIOENPlanWork: THTTPRIO;
    N16: TMenuItem;
    actUpdateDateDelivery: TAction;
    N13: TMenuItem;
    N17: TMenuItem;
    actIsMaterialsSent: TAction;
    N18: TMenuItem;
    actMoveAndUnMoveToWorkOnWarehouse: TAction;
    N19: TMenuItem;
    actCheckOrUncheckByAccountant: TAction;
    mniCheckOrUncheckByAccountant: TMenuItem;
    aeExcel: TAdvGridExcelIO;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQFKOrderTopLeftChanged(Sender: TObject);
procedure sgRQFKOrderDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actCreatePrihodExecute(Sender: TObject);
    procedure actMoveToFKExecute(Sender: TObject);
    procedure actUnCreatePrihodExecute(Sender: TObject);
    procedure actUnMoveToFKExecute(Sender: TObject);
    procedure actExcelExecute(Sender: TObject);
    procedure actMoveOSToFKExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAddCheckedExecute(Sender: TObject);
    procedure sgRQFKOrderClick(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure actUpdateDateDeliveryExecute(Sender: TObject);
    procedure actIsMaterialsSentExecute(Sender: TObject);
    procedure actMoveAndUnMoveToWorkOnWarehouseExecute(Sender: TObject);
    procedure actCheckOrUncheckByAccountantExecute(Sender: TObject);
  private
   { Private declarations }
 public
   { Public declarations }

   isTransportRoutes : Boolean;
   procedure UpdateGrid(Sender: TObject);
   procedure UpdateItemGrid();

   class procedure moveToFK(ObjCode : Integer; rio : THTTPRIO); overload; stdcall; static;
   class procedure moveToFK(ObjCode : Integer; rio : THTTPRIO; proc: TProc); overload; stdcall; static;
   class procedure unMoveToFK(ObjCode : Integer; rio : THTTPRIO); overload; stdcall; static;
   class procedure unMoveToFK(ObjCode : Integer; rio : THTTPRIO; proc: TProc); overload; stdcall; static;
   class function chooseFromList(kindCode : Integer) : RQFKOrderShort; stdcall; static;
   procedure createPrihod(ObjCode : Integer); overload; stdcall;
   procedure createPrihod(ObjCode : Integer; isAllocationList : Boolean); overload; stdcall;
   procedure createPrihod(ObjCode : Integer; proc: TProc); overload; stdcall;
   procedure createPrihod(ObjCode : Integer; proc: TProc; isAllocationList : Boolean); overload; stdcall;
   procedure unCreatePrihod(ObjCode : Integer); overload; stdcall;
   procedure unCreatePrihod(ObjCode : Integer; isAllocationList : Boolean); overload; stdcall;
   procedure unCreatePrihod(ObjCode : Integer; proc: TProc); overload; stdcall;
   procedure unCreatePrihod(ObjCode : Integer; proc: TProc; isAllocationList : Boolean); overload; stdcall;

   procedure edit(ObjCode : Integer); overload; stdcall;
   procedure edit(ObjCode : Integer; isAllocationList : Boolean); overload; stdcall;
   procedure edit(ObjCode : Integer; proc: TProc); overload; stdcall;
   procedure edit(ObjCode : Integer; proc: TProc; isAllocationList : Boolean); overload; stdcall;
   
   procedure remove(ObjCode : Integer); overload; stdcall;
   procedure remove(ObjCode : Integer; isAllocationList : Boolean); overload; stdcall;
   procedure remove(ObjCode : Integer; proc: TProc); overload; stdcall;
   procedure remove(ObjCode : Integer; proc: TProc; isAllocationList : Boolean); overload; stdcall;

   {Процедура построит фильтр и вернет его через процедуру TFilterProc}
   procedure filter(proc: TFilterProc); overload; stdcall;

 end;

//var
 // RQFKOrderObj: RQFKOrder;
 // RQFKOrderFilterObj: RQFKOrderFilter;
  
  
implementation

uses Main, EditRQFKOrder, EditRQFKOrderFilter, ShowRQInvoice,
  RQInvoiceController, RQInvoiceStatusController, ENConsts
  ,RQFKOrderKindController, Globals, ShellAPI, RQFKOrderItemController,
  DateUtils, TKAccountingTypeController, ENPlanWorkController, ENPlanWorkStatusController,
  UpdateDate, EditChooseTXSDate, Math,DMReportsUnit;//, ShowRQFKOrder;

class function TfrmRQFKOrderShow.chooseFromList(kindCode : Integer) : RQFKOrderShort;
var
  f1 : RQFKOrderFilter;
  frmRQFKOrderShow : TfrmRQFKOrderShow;
  selected : RQFKOrderShort;
begin
  inherited;
     selected := nil;
     f1 := RQFKOrderFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
	   f1.kind := RQFKOrderKind.Create;
	   f1.kind.code := kindCode;
     frmRQFKOrderShow := TfrmRQFKOrderShow.Create(Application, fmNormal, f1);
       try
          with frmRQFKOrderShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := RQFKOrderShort(sgRQFKOrder.Objects[0, sgRQFKOrder.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmRQFKOrderShow.Free;
       end;
end;

procedure prepareRQFKOrderGridHeadersForServicesFromSide(grid : TAdvStringGrid);
begin
  grid.ColumnHeaders[3] := 'Код постачальника';
  grid.ColumnHeaders[4] := 'Постачальник';
  grid.ColWidths[4] := 400;
  grid.ColumnHeaders[5] := 'сума (без ПДВ)';
  grid.ColWidths[6] := 0;
  grid.ColWidths[8] := 0;
  grid.ColWidths[9] := 0;
  grid.ColWidths[10] := 0;
  grid.ColWidths[11] := 0;
  grid.ColWidths[12] := 0;
end;


{$R *.dfm}

var
  //frmRQFKOrderShow : TfrmRQFKOrderShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQFKOrderHeaders: array [1..22] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата документу'
          ,'Дата проведення'
          ,'Код відправника'
          ,'ПІБ відправника'
          ,'Код одержувача'
          ,'ПІБ одержувача'
          ,'Статус'
          ,'Перевірено у бухгалтерії'
          , 'Сума без ПДВ (грн)'
          ,'Код експедитора'
          ,'ПІБ експедитора'
          ,'№ доручення'
          ,'Дата доручення'
          ,'ПІБ в дорученні'
          ,'Загальна вага, кг'
          ,'Створив'
          ,'Дата ств.'
          ,'Змінив'
          ,'Дата зміни'
          ,'Дата постач. матеріалів'

        );

 RQFKOrderItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Норм. матеріал'
          ,'Норм. од.виміру'
          ,'Ном. номер матеріалу'
          ,'Назва матеріалу'
          ,'Од.виміру'
          ,'кількість'
          ,'ціна'
          ,'Сума'
          ,'Вага, кг'
          ,'Дж.фін.'
          ,''
        );

procedure TfrmRQFKOrderShow.filter(proc : TFilterProc);
var kindCode : Integer;
begin
  kindCode := Low(Integer);
  frmRQFKOrderFilterEdit:=TfrmRQFKOrderFilterEdit.Create(Application, dsInsert);
  try
    RQFKOrderFilterObj := RQFKOrderFilter.Create;
    SetNullIntProps(RQFKOrderFilterObj);
    SetNullXSProps(RQFKOrderFilterObj);

    if FilterObject <> nil then
      if RQFKOrderFilter(FilterObject).kind <> nil then
         kindCode := RQFKOrderFilter(FilterObject).kind.code;

    RQFKOrderFilterObj.kind := RQFKOrderKind.Create;
    RQFKOrderFilterObj.kind.code := kindCode;

    if (kindCode = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
    begin
      HideControls([frmRQFKOrderFilterEdit.lblOZNumber, frmRQFKOrderFilterEdit.edtOZNumber], true);
    end else
    begin
      HideControls([frmRQFKOrderFilterEdit.lblOZNumber, frmRQFKOrderFilterEdit.edtOZNumber], false);
//      HideControls([frmRQFKOrderFilterEdit.lblSumWithoutNds, frmRQFKOrderFilterEdit.edtSumWithoutNds], true);
    end;

    if frmRQFKOrderFilterEdit.ShowModal = mrOk then
    begin
      proc(RQFKOrderFilterObj);
    end;
  finally
    frmRQFKOrderFilterEdit.Free;
    frmRQFKOrderFilterEdit:=nil;
  end;
end;


class procedure TfrmRQFKOrderShow.moveToFK(ObjCode : Integer; rio : THTTPRIO);
begin
    TfrmRQFKOrderShow.moveToFK(ObjCode, rio);
end;

class procedure TfrmRQFKOrderShow.moveToFK(ObjCode : Integer; rio : THTTPRIO; proc: TProc);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    obj : RQFKOrder;
    buhDate: TXSDate;
    dtBuhDate, dtDocDate: TDateTime;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте провести в ФК накладну ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempRQFKOrder := rio as RQFKOrderControllerSoapPort;
    obj := TempRQFKOrder.getObject(ObjCode);
    if (obj = nil) then Exit;

    dtDocDate := EncodeDate(obj.dateGen.Year, obj.dateGen.Month, obj.dateGen.Day);
    if Assigned(obj.datePosting) then begin
      dtBuhDate := EncodeDate(obj.datePosting.Year, obj.datePosting.Month, obj.datePosting.Day);
      if dtDocDate > dtBuhDate then begin
               if Application.MessageBox(PChar('Дата проведення ордеру (''' + DateToStr(dtBuhDate) + ''') меньша ' +
                                        ' ніж дата документу (''' + DateToStr(dtDocDate) + ''').' + Chr(10) +
                                        'Ви дійсно бажаєте продовжити?'),
                                        PChar('Увага !'), MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON1) <> IDYES then
                Exit;
            end;
    end;

    if obj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA then
    begin

      // пока только для себя ;)
      // if (HTTPRIORQFKOrder.HTTPWebNode.UserName = 'energynet') or (HTTPRIORQFKOrder.HTTPWebNode.UserName = 'SofyanikIP') then

        // При проведении прихода Основных - доп. проверка
        if obj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS then
        begin

          buhDate := TempRQFKOrder.getCurrentBuhDate();

          if buhDate <> nil then
          begin
            dtBuhDate := EncodeDateTime(buhDate.Year, buhDate.Month, 1, 0, 0, 0, 0);
            dtDocDate := EncodeDateTime(obj.dateGen.Year, obj.dateGen.Month, 1, 0, 0, 0, 0);

            if dtDocDate < dtBuhDate then
            begin
              if Application.MessageBox(PChar('Місяць придбання ОЗ (' + DateToStr(dtDocDate) + ') менший, ' + #13#10 +
                                              'ніж поточний бух. місяць (' + DateToStr(dtBuhDate) + ').' + #13#10#13#10 +
                                              'Провести прибутковий ордер поточною бух. датою?'),
                                        PChar('Увага !'), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) <> IDYES then
                Exit;
            end;
          end;
        end; // if obj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS

      TempRQFKOrder.movePrihodInFK(obj.code)

    end // if obj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM then
      TempRQFKOrder.moveRashodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT then
      TempRQFKOrder.moveRashodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT then
      TempRQFKOrder.moveRashodOperative2Tranzit(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
      TempRQFKOrder.moveRashodMeasurementChange(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_E2E then
      TempRQFKOrder.moveRashodE2E(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP then
      TempRQFKOrder.moveRashodInFKLoadMBP(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA then
      TempRQFKOrder.moveRashodInFKLoadMNMA(obj.code)
    else
    /////
    if obj.kind.code = RQFKORDER_KIND_MBP then
      TempRQFKOrder.moveRashodInFKMBP(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_MNMA then
      TempRQFKOrder.moveRashodInFKMNMA(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_MNMA then
      TempRQFKOrder.moveRashodOutInFKMNMA(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS then
      TempRQFKOrder.moveRashodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET then
      TempRQFKOrder.movePrihodBufetInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_BUFET then
      TempRQFKOrder.moveRashodBufetInFK(obj.code)
    /////
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT then
      TempRQFKOrder.moveRashodReturnInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_GIFT then
      TempRQFKOrder.moveRashodGiftInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE then
      TempRQFKOrder.moveRashodToStorageInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_ZONE_CHANGING then
      TempRQFKOrder.moveZoneChangingInFK(obj.code)
    else
        if obj.kind.code = RQFKORDER_KIND_OUT_FUEL then
      TempRQFKOrder.moveOutFuelInFK(obj.code)
    else
        if obj.kind.code = RQFKORDER_KIND_AVAR_OUT then
      TempRQFKOrder.moveAvarOutInFK(obj.code)
    else
        if obj.kind.code = RQFKORDER_KIND_AVAR_IN then
      TempRQFKOrder.moveAvarInInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_OS_EXPL then
    begin
      buhDate := TempRQFKOrder.getCurrentBuhDate();

      if buhDate <> nil then
      begin
        dtBuhDate := EncodeDateTime(buhDate.Year, buhDate.Month, 1, 0, 0, 0, 0);
        dtDocDate := EncodeDateTime(obj.dateGen.Year, obj.dateGen.Month, 1, 0, 0, 0, 0);

        if dtDocDate < dtBuhDate then
        begin
          if Application.MessageBox(PChar('Місяць дати ОЗ-1 (' + DateToStr(dtDocDate) + ') менший, ' + #13#10 +
                                          'ніж поточний бух. місяць (' + DateToStr(dtBuhDate) + ').' + #13#10#13#10 +
                                          'Провести введення в експлуатацію поточною бух. датою?'),
                                    PChar('Увага !'), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) <> IDYES then
            Exit;
        end;
      end;

      TempRQFKOrder.moveOSExplToFK(obj.code)
    end

    else
    if obj.kind.code = RQFKORDER_KIND_OS_MOVEMENT then
    begin
      buhDate := TempRQFKOrder.getCurrentBuhDate();

      if buhDate <> nil then
      begin
        dtBuhDate := EncodeDateTime(buhDate.Year, buhDate.Month, 1, 0, 0, 0, 0);
        dtDocDate := EncodeDateTime(obj.dateGen.Year, obj.dateGen.Month, 1, 0, 0, 0, 0);

        if dtDocDate < dtBuhDate then
        begin
          if Application.MessageBox(PChar('Місяць дати ОЗ-1 (' + DateToStr(dtDocDate) + ') менший, ' + #13#10 +
                                          'ніж поточний бух. місяць (' + DateToStr(dtBuhDate) + ').' + #13#10#13#10 +
                                          'Провести внутрішнє переміщення поточною бух. датою?'),
                                    PChar('Увага !'), MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) <> IDYES then
            Exit;
        end;
      end;

      TempRQFKOrder.moveOSMovementToFK(obj.code)
    end

    else
      ShowMessage('Ошибка в типе Ордера ...');

    if Assigned(proc) then begin
      proc();
    end;
  end;
end;

class procedure TfrmRQFKOrderShow.unMoveToFK(ObjCode : Integer; rio : THTTPRIO);
begin
    TfrmRQFKOrderShow.unMoveToFK(ObjCode, rio);
end;

class procedure TfrmRQFKOrderShow.unMoveToFK(ObjCode : Integer; rio : THTTPRIO; proc: TProc);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    obj : RQFKOrder;
begin

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити проведення у ФК накладної ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQFKOrder := rio as RQFKOrderControllerSoapPort;
    obj := TempRQFKOrder.getObject(ObjCode);
    if (obj = nil) then Exit;

    // Для ордеров, подписанных с помощью ЭЦП, вызываем свой метод отмены проведения
    // (чтобы были отдельные права, потому что их могут проводить/отменять проведение
    // все подряд, а старые - только бухгалтера)
    if DMReports.getDocCodeForObject(obj) > 0 then
      TempRQFKOrder.unMoveByEcp(obj.code)
    else

    if obj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA then
      TempRQFKOrder.unMovePrihodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_OE2REM then
      TempRQFKOrder.unMoveRashodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_OE2OUT then
      TempRQFKOrder.unMoveRashodInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT then
      TempRQFKOrder.unMoveRashodOperative2Tranzit(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
      TempRQFKOrder.unMoveRashodMeasurementChange(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_E2E then
      TempRQFKOrder.unMoveRashodE2E(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP then
      TempRQFKOrder.unMoveRashodInFKLoadMBP(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA then
      TempRQFKOrder.unMoveRashodInFKLoadMNMA(obj.code)
    else
    /////
    if obj.kind.code = RQFKORDER_KIND_MBP then
      TempRQFKOrder.unMoveRashodInFKMBP(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_MNMA then
      TempRQFKOrder.unMoveRashodInFKMNMA(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_MNMA then
      TempRQFKOrder.unMoveRashodOutInFKMNMA(obj.code)
    /////
    else
    if obj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS then
      TempRQFKOrder.unMoveRashodInFK(obj.code)
    else
    /////
    if obj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET then
      TempRQFKOrder.unMovePrihodBufetInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_BUFET then
      TempRQFKOrder.unMoveRashodBufetInFK(obj.code)
    /////

    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT then
      TempRQFKOrder.unMoveRashodReturnInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_GIFT then
      TempRQFKOrder.unMoveRashodGiftInFK(obj.code)

    else
    if obj.kind.code = RQFKORDER_KIND_OS_EXPL then
      TempRQFKOrder.unMoveOSExplInFK(obj.code)

    else
    if obj.kind.code = RQFKORDER_KIND_OS_MOVEMENT then
      TempRQFKOrder.unMoveOSMovementInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE then
      TempRQFKOrder.unMoveRashodToStorageInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_ZONE_CHANGING then
      TempRQFKOrder.unMoveZoneChangingInFK(obj.code)
    else
    if obj.kind.code = RQFKORDER_KIND_OUT_FUEL then
      TempRQFKOrder.unMoveOutFuelInFK(obj.code)
    else
        if obj.kind.code = RQFKORDER_KIND_AVAR_OUT then
      TempRQFKOrder.unMoveAvarOutInFK(obj.code)
    else
        if obj.kind.code = RQFKORDER_KIND_AVAR_IN then
      TempRQFKOrder.unMoveAvarInInFK(obj.code)
    else
      ShowMessage('Ошибка в типе Ордера ...');

    if Assigned(proc) then begin
		proc();
	end;
  end;
end;

procedure TfrmRQFKOrderShow.remove(ObjCode : Integer);
begin
    Self.remove(ObjCode, nil, false);
end;

procedure TfrmRQFKOrderShow.remove(ObjCode : Integer; isAllocationList : Boolean);
begin
    Self.remove(ObjCode, nil, isAllocationList);
end;

procedure TfrmRQFKOrderShow.remove(ObjCode : Integer; proc : TProc);
begin
    Self.remove(ObjCode, proc, false);
end;

procedure TfrmRQFKOrderShow.remove(ObjCode : Integer; proc: TProc; isAllocationList : Boolean);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  fkOrderObj : RQFKOrder;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  fkOrderObj := TempRQFKOrder.getObject(ObjCode);

  if fkOrderObj.status.code <> RQFKORDER_STATUS_GOOD then
  begin
      Application.MessageBox(PChar('Цей ордер не видаляється ... відмініть проведення або затвердження ...'),
                    PChar('Внимание !'),MB_ICONWARNING );
      Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити ордер ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    //if (RQFKOrderObj.kind.code <> RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT) then
    if (fkOrderObj.kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA,
                                   RQFKORDER_KIND_RASHOD_OE2REM,
                                   RQFKORDER_KIND_RASHOD_REM2MOL,
                                   RQFKORDER_KIND_RASHOD_OE2OUT]) then
    begin
      if (fkOrderObj.accountingTypeRef.code in [ TK_ACCOUNTINGTYPE_TMC, TK_ACCOUNTINGTYPE_OS,
       TK_ACCOUNTINGTYPE_SEAL, TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO]) then
      begin
        TempRQFKOrder.remove(ObjCode, isAllocationList, false);
      end
      else
      if  (fkOrderObj.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER ) then
         TempRQFKOrder.removeSCCounterMove(ObjCode)
      else
      begin
        ShowMessage('Ошибка в типе Учета ...');
        Exit;
      end;
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT) then
    begin
      TempRQFKOrder.removeRashodOperative2Tranzit(ObjCode, isAllocationList);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE) then
    begin
      TempRQFKOrder.removeRashodMeasurementChange(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_RASHOD_E2E) then
    begin
      TempRQFKOrder.removeE2E(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MBP) then
    begin
      TempRQFKOrder.removeOrderLoadMBP(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_LOADEXPL_MNMA) then
    begin
      TempRQFKOrder.removeOrderLoadMNMA(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_MBP) then
    begin
      TempRQFKOrder.removeOrderMBP(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_MNMA) then
    begin
      TempRQFKOrder.removeOrderMNMA(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_WRITEOFFCOUNTERS) then
    begin
      TempRQFKOrder.removeSCCounterWriteOff(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_RASHOD_MNMA) then
    begin
      TempRQFKOrder.removeOrderOutMNMA(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
    begin
      TempRQFKOrder.removeServicesFS(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_BUFET) then
    begin
      TempRQFKOrder.removePrihodBufet(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_RASHOD_BUFET) then
    begin
      TempRQFKOrder.removeRashodBufet(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
    begin
      TempRQFKOrder.removeRashodReturn(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_RASHOD_GIFT) then
    begin
      TempRQFKOrder.removeRashodGift(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_OS_EXPL) then
    begin
      TempRQFKOrder.removeOSExpl(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_OS_MOVEMENT) then
    begin
      TempRQFKOrder.removeOSMovement(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_RASHOD_TO_STORAGE) then
    begin
      TempRQFKOrder.removeRashodToStorage(ObjCode, isAllocationList);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_ZONE_CHANGING) then
    begin
      TempRQFKOrder.removeZoneChanging(ObjCode);
    end;
    if (fkOrderObj.kind.code = RQFKORDER_KIND_OUT_FUEL) then
    begin
      TempRQFKOrder.removeOutFuel(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_AVAR_OUT) then
    begin
      TempRQFKOrder.removeAvarOut(ObjCode);
    end
    else
    if (fkOrderObj.kind.code = RQFKORDER_KIND_AVAR_IN) then
    begin
      TempRQFKOrder.removeAvarIn(ObjCode);
    end;
    if Assigned(proc) then begin
      proc();
    end;
  end;
end;

procedure TfrmRQFKOrderShow.edit(ObjCode : Integer);
begin
    Self.edit(ObjCode, nil, false);
end;

procedure TfrmRQFKOrderShow.edit(ObjCode : Integer; isAllocationList : Boolean);
begin
    Self.edit(ObjCode, nil, isAllocationList);
end;

procedure TfrmRQFKOrderShow.edit(ObjCode : Integer; proc : TProc);
begin
    Self.edit(ObjCode, proc, false);
end;


procedure TfrmRQFKOrderShow.edit(ObjCode : Integer; proc: TProc; isAllocationList : Boolean);
Var TempRQFKOrder: RQFKOrderControllerSoapPort;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit:=TfrmRQFKOrderEdit.Create(Application, dsEdit);

  try
    try
      frmRQFKOrderEdit.RQFKOrderObj := TempRQFKOrder.getObject(ObjCode);
    except
      on EConvertError do Exit;
    end;

    // 23.02.2012 +++ разрешаем редактировать бух.атрибуты на акте со статусом "Складений"
    if ((frmRQFKOrderEdit.RQFKOrderObj.status.code <> RQFKORDER_STATUS_GOOD)
           and (frmRQFKOrderEdit.RQFKOrderObj.kind.code <> RQFKORDER_KIND_SERVICES_FROM_SIDE)
           and (frmRQFKOrderEdit.RQFKOrderObj.kind.code <> RQFKORDER_KIND_SALE_PRODUCTS)) then
    begin
        Application.MessageBox(PChar('Цей ордер не редагується ... відмініть проведення або затвердження ...'),
                      PChar('Увага !'),MB_ICONWARNING );
        Exit;
    end; // else

    //if ((RQFKOrderObj.status.code = RQFKORDER_STATUS_IN_FK)
    //       and (RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE)
    //       and (RQFKOrderObj.kind.code <> RQFKORDER_KIND_SALE_PRODUCTS)) then
    if (frmRQFKOrderEdit.RQFKOrderObj.status.code = RQFKORDER_STATUS_IN_FK) then
    begin
        Application.MessageBox(PChar('Цей акт не редагується ... відмініть проведення...'),
                      PChar('Увага !'),MB_ICONWARNING );
        Exit;
    end;

    frmRQFKOrderEdit.isAllocationList := isAllocationList;
    if frmRQFKOrderEdit.ShowModal= mrOk then
      begin
        if Assigned(proc) then begin
		      proc();
	      end;
      end;
  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;
end;


procedure TfrmRQFKOrderShow.createPrihod(ObjCode : Integer);
begin
    Self.createPrihod(ObjCode, nil, false);
end;

procedure TfrmRQFKOrderShow.createPrihod(ObjCode : Integer; isAllocationList : Boolean);
begin
    Self.createPrihod(ObjCode, nil, isAllocationList);
end;

procedure TfrmRQFKOrderShow.createPrihod(ObjCode : Integer; proc : TProc);
begin
    Self.createPrihod(ObjCode, proc, false);
end;

procedure TfrmRQFKOrderShow.createPrihod(ObjCode : Integer; proc: TProc; isAllocationList : Boolean);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    TempENPlanWork : ENPlanWorkControllerSoapPort;
    obj : RQFKOrder;

    finishedPlansFilterObj : ENPlanWorkFilter;
    finishedPlansList : ENPlanWorkShortList;
	  sumWithoutVat, sumVat, sumVatCalculated, ndsPercent : Single;
    sumitemitem : Double;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити статус на "Складений" у накладної ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
    Exit;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  obj := TempRQFKOrder.getObject(ObjCode);

  {Проверка суммы НДС}
  if (obj.kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET
      , RQFKORDER_KIND_SERVICES_FROM_SIDE, RQFKORDER_KIND_SALE_PRODUCTS])
     and (obj.sumWithoutNds <> nil) and (obj.ndsPercent <> Low(Integer)) then begin
      sumWithoutVat := StrToFloat(obj.sumWithoutNds.DecimalString);
      ndsPercent := RoundTo(obj.ndsPercent / 100, -2);
      sumVat := StrToFloat(obj.sumNds.DecimalString);
      sumVatCalculated := RoundTo(sumWithoutVat * ndsPercent, -2);
      if(sumVat <> sumVatCalculated) then begin
       if Application.MessageBox(PChar(Format('Перевірте суму за ПДВ прибуткового ордеру %s від %s.' + Chr(10) + 'Сума ПДВ у ордері: %f грн.' + Chr(10)
        + 'Порахована сума ПДВ: (%f грн. * %d%% = %f грн.).' + Chr(10) + 'Бажаєте продовжити ?'
              , [obj.numberDoc, XSDate2String(obj.dateGen), sumVat, sumWithoutVat, obj.ndsPercent, sumVatCalculated])),
                  PChar('Увага !'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDNO then
             Exit;
       end;
  end;

    {Проверка сумм всего по документу с суммой по строкам rqfkorderitem2enstmttm  и rqfkorderitemremainder }
    if (obj.kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET ]) then
    begin
       sumitemitem := DMReports.getSumRQFKOrderItem(obj.code);
       if (sumitemitem <> StrToFloat( obj.sumWithoutNds.decimalString) ) then
       begin
         if Application.MessageBox(PChar( ' Прибутковий ордер '+obj.numberDoc+' від  ' + XSDate2String(obj.dateGen) +
          '. Сума у ордері без ПДВ: '+ FloatToStr(RoundTo(sumWithoutVat,-2)) +' грн.'
          + ' Загальна сума по строкам документу без ПДВ: '+ FloatToStr(RoundTo(sumitemitem,-2))+' грн..'
          + Chr(10) + 'Бажаєте автоматично скоригувати строки ордеру при складанні ?'
           ),
                PChar('Увага !'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDNO then
           Exit;
       end;
    end;

    if obj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT then
      TempRQFKOrder.createdPrihodOperative2Tranzit(ObjCode, isAllocationList)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
      TempRQFKOrder.createdPrihodMeasurementChange(ObjCode)
    else
    if obj.kind.code = RQFKORDER_KIND_RASHOD_E2E then
      TempRQFKOrder.createdPrihodE2E(ObjCode)
    else
    if obj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE then
    begin
      {SUPP-5149 Проверка на планы со статусом работы завершены}
      TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
      finishedPlansFilterObj := ENPlanWorkFilter.Create;
      SetNullXSProps(finishedPlansFilterObj);
      SetNullIntProps(finishedPlansFilterObj);
      finishedPlansFilterObj.status := ENPlanWorkStatus.Create;
      finishedPlansFilterObj.status.code := ENConsts.ENPLANWORKSTATUS_WORKS_FINISHED;
      finishedPlansFilterObj.conditionSQL := ' EXISTS ( ' +
                    ' select i.code from enestimateitem i where i.planrefcode = ENPLANWORK.CODE and i.code in ( ' +
                    ' select o2e.estimateitemcode from rqfkorderitem2enstmttm o2e where o2e.fkorderitemrefcode in (' +
                    ' select oi.code from rqfkorderitem oi where oi.fkorderrefcode = ' + IntToStr(ObjCode) + ')))';
      finishedPlansList := TempENPlanWork.getScrollableFilteredList(finishedplansFilterObj, 0, -1);
      if finishedPlansList.totalCount > 0 then
      begin
            if Application.MessageBox(PChar('План, що зв''язаний з цим ордером, знаходиться у статусі "Роботи завершені". Чи бажаєте ви перезатрведити план для складання ордеру (потім здійсниться повторне переведення плану у статус "Роботи завершенні") ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then TempRQFKOrder.createActFromServicesFS(ObjCode, True) Else Exit;
      end
      else
        TempRQFKOrder.createActFromServicesFS(ObjCode);
    end
    else
      TempRQFKOrder.createdPrihod(ObjCode, isAllocationList);

    if Assigned(proc) then begin
		  proc();
	  end;
end;



procedure TfrmRQFKOrderShow.unCreatePrihod(ObjCode : Integer);
begin
    Self.unCreatePrihod(ObjCode, nil, false);
end;

procedure TfrmRQFKOrderShow.unCreatePrihod(ObjCode : Integer; isAllocationList : Boolean);
begin
    Self.unCreatePrihod(ObjCode, nil, isAllocationList);
end;

procedure TfrmRQFKOrderShow.unCreatePrihod(ObjCode : Integer; proc : TProc);
begin
    Self.unCreatePrihod(ObjCode, proc, false);
end;

procedure TfrmRQFKOrderShow.unCreatePrihod(ObjCode : Integer; proc: TProc; isAllocationList : Boolean);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    obj : RQFKOrder;
begin
  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити складання накладної ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
begin

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  obj := TempRQFKOrder.getObject(ObjCode);

  if obj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT then
    TempRQFKOrder.unCreatedPrihodOperative2Tranzit(ObjCode, isAllocationList)
  else
  if obj.kind.code = RQFKORDER_KIND_RASHOD_E2E then
    TempRQFKOrder.unCreatedPrihodE2E(ObjCode)
  else
  if obj.kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
    TempRQFKOrder.unCreatedPrihodMeasurementChange(ObjCode)
  else
  if obj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE then
    TempRQFKOrder.unCreateActFromServicesFS(ObjCode)
  else
    TempRQFKOrder.unCreatedPrihod(ObjCode, isAllocationList);

  if Assigned(proc) then begin
	proc();
  end;
end;

end;

procedure TfrmRQFKOrderShow.FormClose(Sender: TObject; var Action: TCloseAction);
var rqKind : Integer;
  begin
    if (FormMode = fmChild) and (FilterObject <> nil) then
    begin
      rqKind := RQFKOrderFilter(FilterObject).kind.code;

      if rqKind = RQFKORDER_KIND_PRIHOD_POSTAVKA then
         frmRQFKOrderInShow := nil
      else
      if rqKind = RQFKORDER_KIND_RASHOD_OE2REM then
         frmRQFKOrderOutShow := nil
      else
      if rqKind = RQFKORDER_KIND_RASHOD_OE2OUT then
         frmRQFKOrderOut2Show := nil
      else
      if rqKind = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT then
         frmRQFKOrderOutOperative2TranzitShow := nil
      else
      if rqKind = RQFKORDER_KIND_RASHOD_TRANZIT2OPERATIVE then
         frmRQFKOrderOutTranzit2OperativeShow := nil
      else
      if rqKind = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE then
        frmRQFKOrderMeasurementChange := nil
      else
      if rqKind = RQFKORDER_KIND_RASHOD_E2E then
        frmRQFKOrderOutE2E := nil

      else
      if rqKind = RQFKORDER_KIND_LOADEXPL_MBP then
        frmRQFKOrderLoadExplMBP := nil
      else
      if rqKind = RQFKORDER_KIND_LOADEXPL_MNMA then
        frmRQFKOrderLoadExplMNMA := nil

      else
      if rqKind = RQFKORDER_KIND_MBP then
        frmRQFKOrderMBP := nil
      else
      if rqKind = RQFKORDER_KIND_MNMA then
        frmRQFKOrderMNMA := nil
      else
      if rqKind = RQFKORDER_KIND_RASHOD_MNMA then
        frmRQFKOrderRashodMNMA := nil
      else
      if rqKind = RQFKORDER_KIND_SERVICES_FROM_SIDE then
        frmRQFKOrderServicesFS := nil
      else
      if rqKind = RQFKORDER_KIND_WRITEOFFCOUNTERS then
        frmRQFKOrderWhiteOffCounters := nil
      else
      if rqKind = RQFKORDER_KIND_PRIHOD_BUFET then
        frmRQFKOrderInBufetShow := nil
      else
      if rqKind = RQFKORDER_KIND_RASHOD_BUFET then
        frmRQFKOrderOutBufetShow := nil
      else
      if rqKind = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT then
         frmRQFKOrderOut2Show := nil
      else
      if rqKind = RQFKORDER_KIND_RASHOD_GIFT then
         frmRQFKOrderRashodGiftShow := nil
      else
      if rqKind = RQFKORDER_KIND_OS_EXPL then
         frmRQFKOrderOSExplShow := nil
      else
      if rqKind = RQFKORDER_KIND_OS_MOVEMENT then
         frmRQFKOrderOSMovementShow := nil
      else
      if rqKind = RQFKORDER_KIND_RASHOD_TO_STORAGE then
         frmRQFKOrderRashodToStorageShow := nil
      else
      if rqKind = RQFKORDER_KIND_ZONE_CHANGING then
         frmRQFKOrderZoneChangingShow := nil
      else
      if rqKind = RQFKORDER_KIND_OUT_FUEL then
         frmRQFKOrderOutFuelShow := nil
      else
      if rqKind = RQFKORDER_KIND_AVAR_OUT then
         frmRQFKOrderAvarOutShow := nil
      else
      if rqKind = RQFKORDER_KIND_AVAR_IN then
         frmRQFKOrderAvarInShow := nil;
      end;
    inherited;
  end;


procedure TfrmRQFKOrderShow.FormShow(Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  i: Integer;
  RQFKOrderList: RQFKOrderShortList;
  isSentMaterials : String;
begin
  SetGridHeaders(RQFKOrderHeaders, sgRQFKOrder.ColumnHeaders);
  SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);

  btnAddChecked.Visible := False;
  DisableActions([actAddChecked], not (isTransportRoutes));
  btnAddChecked.Visible := isTransportRoutes;

  if RQFKOrderFilter(FilterObject).kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
  begin
    sgRQFKOrder.ColumnHeaders[4] := 'Код постачальника';
    sgRQFKOrder.ColumnHeaders[5] := 'Постачальник';
  end;


  if not (RQFKOrderFilter(FilterObject).kind.code in
  [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET
  , RQFKORDER_KIND_RASHOD_BUFET, RQFKORDER_KIND_RASHOD_OE2REM
  , RQFKORDER_KIND_RASHOD_OE2OUT, RQFKORDER_KIND_RASHOD_MNMA
  , RQFKORDER_KIND_RASHOD_TO_STORAGE, RQFKORDER_KIND_OUT_FUEL]) then begin
    sgRQFKOrder.ColWidths[9] := 0;
  end else begin
    // SUPP-70367 Для приходных ордеров и внутренних перемещения
    // наведем небольшую красоту - для первого ряда
    sgRQFKOrder.WordWrap := True;
    sgRQFKOrder.AutoSizeRow(0);
  end;

  if RQFKOrderFilter(FilterObject).kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE then
  begin
    sgRQFKOrder.ColWidths[5] := 400;
    sgRQFKOrder.ColumnHeaders[6] := 'сума (без ПДВ)';
    sgRQFKOrder.ColWidths[7] := 0;
    sgRQFKOrder.ColWidths[10] := 0;
    sgRQFKOrder.ColWidths[11] := 0;
    sgRQFKOrder.ColWidths[12] := 0;
    sgRQFKOrder.ColWidths[13] := 0;
    sgRQFKOrder.ColWidths[14] := 0;
    sgRQFKOrder.ColWidths[15] := 0;
    sgRQFKOrder.ColWidths[16] := 0;
  end;

  if (RQFKOrderFilter(FilterObject).kind.code = RQFKORDER_KIND_OS_EXPL) or
     (RQFKOrderFilter(FilterObject).kind.code = RQFKORDER_KIND_OS_MOVEMENT) then
  begin
    sgRQFKOrderItem.ColumnHeaders[3] := 'Інв. №';
    sgRQFKOrderItem.ColumnHeaders[4] := 'Назва осн. засобу';
    sgRQFKOrderItem.ColWidths[2] := 0;
    sgRQFKOrderItem.ColWidths[4] := 300;
    sgRQFKOrderItem.ColWidths[5] := 0;
    sgRQFKOrderItem.ColWidths[6] := 0;
    sgRQFKOrderItem.ColWidths[7] := 0;
    sgRQFKOrderItem.ColWidths[9] := 0;

    // SUPP-72386 Сокрытие колонки с суммой для НДС, т.к. для
    // ввода и перемещения основных средств она все равно не просчитывается
    sgRQFKOrder.ColWidths[10] := 0;
  end;

        if ( not (RQFKOrderFilter(FilterObject).kind.code in ([RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET])) ) then
             sgRQFKOrder.ColumnHeaders[20] := ' ';

   

  // Автоматические ордера Транзит --> Опер. запас доступны только для просмотра
  if RQFKOrderFilter(FilterObject).kind.code = RQFKORDER_KIND_RASHOD_TRANZIT2OPERATIVE then
  begin
    DisableActions([actInsert, actDelete, actEdit, actCreatePrihod,
                    actUnCreatePrihod, actMoveToFK, actUnMoveToFK, actMoveOSToFK]);
  end;

  ColCount:=100;
  TempRQFKOrder :=  HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderFilter(FilterObject).orderBySQL := 'dategen desc, statuscode desc, RQFKORDER.code desc';

  RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(RQFKOrderFilter(FilterObject),0,ColCount);

  LastCount:=High(RQFKOrderList.list);

  if LastCount > -1 then
     sgRQFKOrder.RowCount:=LastCount+2
  else
     sgRQFKOrder.RowCount:=2;

   with sgRQFKOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if (isTransportRoutes) then AddCheckBox(1, i+1, false, false);
        isSentMaterials := '';
        if RQFKOrderList.list[i].isMaterialsSent = ENConsts.RQFKORDER_ISMATERIALSSENT_TRUE then begin
          isSentMaterials := ' (Відправлено виконавцю) ';
        end else begin
          isSentMaterials := '';
        end;


        if RQFKOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQFKOrderList.list[i].numberDoc;
        if RQFKOrderList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(RQFKOrderList.list[i].dateGen);
		  
		if RQFKOrderList.list[i].datePosting = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQFKOrderList.list[i].datePosting);

        if RQFKOrderFilter(FilterObject).kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[4,i+1] := RQFKOrderList.list[i].orgOkpo
        else
          Cells[4,i+1] := RQFKOrderList.list[i].molInCode;

        if RQFKOrderFilter(FilterObject).kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[5,i+1] := RQFKOrderList.list[i].orgName
        else
          Cells[5,i+1] := RQFKOrderList.list[i].molInName;

        if RQFKOrderFilter(FilterObject).kind.code in [RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[6,i+1] := RQFKOrderList.list[i].sumWithoutNds.DecimalString
        else if (RQFKOrderFilter(FilterObject).kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
          Cells[6,i+1] := RQFKOrderList.list[i].orgOkpo
        else
          Cells[6,i+1] := RQFKOrderList.list[i].molOutCode;

        if (RQFKOrderFilter(FilterObject).kind.code = RQFKORDER_KIND_RASHOD_RETURN_PRODUCT) then
          Cells[7,i+1] := RQFKOrderList.list[i].orgName
        else
          Cells[7,i+1] := RQFKOrderList.list[i].molOutName;


        Cells[8, i+1] := RQFKOrderList.list[i].statusName + isSentMaterials;
        if (Assigned(RQFKOrderList.list[i].checkedByAccountant)) 
		  and (RQFKOrderList.list[i].checkedByAccountant.AsBoolean = true) then
          Cells[9,i+1] := 'Так'
        else
          Cells[9,i+1] := '';
		  
		if (Assigned(RQFKOrderList.list[i].sumWithoutNds)) then
          Cells[10,i+1] := RQFKOrderList.list[i].sumWithoutNds.DecimalString
        else
          Cells[10,i+1] := '';
		  
        Cells[11,i+1] := RQFKOrderList.list[i].expeditorCode;
        Cells[12,i+1] := RQFKOrderList.list[i].expeditorName;

        Cells[13,i+1] := RQFKOrderList.list[i].warrantNumber;
        if RQFKOrderList.list[i].warrantDate = nil then
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := XSDate2String(RQFKOrderList.list[i].warrantDate);
        Cells[15,i+1] := RQFKOrderList.list[i].warrantFIO;

        if RQFKOrderList.list[i].totalWeight = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := RQFKOrderList.list[i].totalWeight.DecimalString;

        Cells[17,i+1] := RQFKOrderList.list[i].userAdd;

        if RQFKOrderList.list[i].dateAdd = nil then
          Cells[18,i+1] := ''
        else
          Cells[18,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

        Cells[19,i+1] := RQFKOrderList.list[i].userGen;

        if RQFKOrderList.list[i].dateEdit = nil then
          Cells[20,i+1] := ''
        else
          Cells[20,i+1] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

        if RQFKOrderList.list[i].dateDelivery = nil then
          Cells[21,i+1] := ''
        else
          Cells[21,i+1] := XSDate2String(RQFKOrderList.list[i].dateDelivery);

        Objects[0, i+1] := RQFKOrderList.list[i];

        LastRow:=i+1;
        sgRQFKOrder.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQFKOrder.Row:=1;

   UpdateItemGrid();


   ///// 19.07.12 Сделаем по-другому, а то все дисейблы выше уходят в горы
   // DisableActions( [actInsert , actDelete , actEdit , actCreatePrihod ,
   // actUnCreatePrihod , actMoveToFK , actUnMoveToFK , actMoveOSToFK  ] ,  isTransportRoutes );
   if isTransportRoutes then
     DisableActions([actInsert, actDelete, actEdit, actCreatePrihod,
                     actUnCreatePrihod, actMoveToFK, actUnMoveToFK, actMoveOSToFK]);
   /////

end;

procedure TfrmRQFKOrderShow.sgRQFKOrderTopLeftChanged(Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  i,CurrentRow: Integer;
  RQFKOrderList: RQFKOrderShortList;
  isMaterialsSent : String;
  begin
  if LastCount < 99 then Exit;
  if (sgRQFKOrder.TopRow + sgRQFKOrder.VisibleRowCount) = ColCount
  then
    begin
      TempRQFKOrder :=  HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
      CurrentRow:=sgRQFKOrder.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQFKOrderFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQFKOrderFilter(FilterObject).orderBySQL := 'dategen desc, statuscode desc, RQFKORDER.code desc';

  RQFKOrderList := TempRQFKOrder.getScrollableFilteredList(RQFKOrderFilter(FilterObject),ColCount-1, 100);

  sgRQFKOrder.RowCount:=sgRQFKOrder.RowCount+100;
  LastCount:=High(RQFKOrderList.list);
  with sgRQFKOrder do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if (isTransportRoutes) then AddCheckBox(1, i+CurrentRow, false, false);

        if RQFKOrderList.list[i].isMaterialsSent = ENConsts.RQFKORDER_ISMATERIALSSENT_TRUE then begin
           isMaterialsSent := ' (Відправлено виконавцю) ';
        end else begin
           isMaterialsSent := '';
        end;

        if RQFKOrderList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQFKOrderList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQFKOrderList.list[i].numberDoc;
        if RQFKOrderList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(RQFKOrderList.list[i].dateGen);
		  
		if RQFKOrderList.list[i].datePosting = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(RQFKOrderList.list[i].datePosting);

        //Cells[3,i+CurrentRow] := RQFKOrderList.list[i].molInCode;
        //Cells[4,i+CurrentRow] := RQFKOrderList.list[i].molInName;

        if RQFKOrderFilter(FilterObject).kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[4,i+CurrentRow] := RQFKOrderList.list[i].orgOkpo
        else
          Cells[4,i+CurrentRow] := RQFKOrderList.list[i].molInCode;

        if RQFKOrderFilter(FilterObject).kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET, RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[5,i+CurrentRow] := RQFKOrderList.list[i].orgName
        else
          Cells[5,i+CurrentRow] := RQFKOrderList.list[i].molInName;

        if RQFKOrderFilter(FilterObject).kind.code in [RQFKORDER_KIND_SERVICES_FROM_SIDE] then
          Cells[6,i+CurrentRow] := RQFKOrderList.list[i].sumWithoutNds.DecimalString
        else
          Cells[6,i+CurrentRow] := RQFKOrderList.list[i].molOutCode;

        Cells[7,i+CurrentRow] := RQFKOrderList.list[i].molOutName;
        Cells[8, i + CurrentRow] := RQFKOrderList.list[i].statusName + isMaterialsSent;
        if (Assigned(RQFKOrderList.list[i].checkedByAccountant)) 
		  and (RQFKOrderList.list[i].checkedByAccountant.AsBoolean = true) then
          Cells[9,i+CurrentRow] := 'Так'
        else
          Cells[9,i+CurrentRow] := '';

		if (Assigned(RQFKOrderList.list[i].sumWithoutNds)) then
          Cells[10,i+CurrentRow] := RQFKOrderList.list[i].sumWithoutNds.DecimalString
        else
          Cells[10,i+CurrentRow] := '';
		  
        Cells[11,i+CurrentRow] := RQFKOrderList.list[i].expeditorCode;
        Cells[12,i+CurrentRow] := RQFKOrderList.list[i].expeditorName;
        Cells[13,i+CurrentRow] := RQFKOrderList.list[i].warrantNumber;
        if RQFKOrderList.list[i].warrantDate = nil then
          Cells[14,i+CurrentRow] := ''
        else
          Cells[14,i+CurrentRow] := XSDate2String(RQFKOrderList.list[i].warrantDate);
        Cells[15,i+CurrentRow] := RQFKOrderList.list[i].warrantFIO;

        if RQFKOrderList.list[i].totalWeight = nil then
          Cells[16,i+CurrentRow] := ''
        else
          Cells[16,i+CurrentRow] := RQFKOrderList.list[i].totalWeight.DecimalString;

        Cells[17,i+CurrentRow] := RQFKOrderList.list[i].userAdd;

        if RQFKOrderList.list[i].dateAdd = nil then
          Cells[18,i+CurrentRow] := ''
        else
          Cells[18,i+CurrentRow] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateAdd);

        Cells[19,i+CurrentRow] := RQFKOrderList.list[i].userGen;

        if RQFKOrderList.list[i].dateEdit = nil then
          Cells[20,i+CurrentRow] := ''
        else
          Cells[20,i+CurrentRow] := XSDateTimeWithDate2String(RQFKOrderList.list[i].dateEdit);

        if RQFKOrderList.list[i].dateDelivery = nil then
          Cells[21,i+CurrentRow] := ''
        else
          Cells[21,i+CurrentRow] := XSDate2String(RQFKOrderList.list[i].dateDelivery);

        Objects[0, i+CurrentRow] := RQFKOrderList.list[i];

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQFKOrder.Row:=CurrentRow-5;
   sgRQFKOrder.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQFKOrderShow.sgRQFKOrderDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQFKOrder,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQFKOrderShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQFKOrder.RowCount-1 do
   for j:=0 to sgRQFKOrder.ColCount-1 do
     sgRQFKOrder.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQFKOrderShow.actViewExecute(Sender: TObject);
var
  TempRQFKOrder: RQFKOrderControllerSoapPort;
  frmRQFKOrderEditView : TfrmRQFKOrderEdit;
begin
  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEditView:=TfrmRQFKOrderEdit.Create(Application, dsView);

  try
    try
      frmRQFKOrderEditView.RQFKOrderObj := TempRQFKOrder.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    if (frmRQFKOrderEditView.ShowModal = mrOk)
          and (frmRQFKOrderEditView.RQFKOrderObj.kind.code = RQFKORDER_KIND_SERVICES_FROM_SIDE) then
      begin
        UpdateGrid(Sender);
      end;

  finally
    frmRQFKOrderEditView.Free;
    frmRQFKOrderEditView:=nil;
  end;
end;

procedure TfrmRQFKOrderShow.actEditExecute(Sender: TObject);
var ObjCode : Integer;
begin

    try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
    except
     on EConvertError do Exit;
    end;

	Self.edit(ObjCode, procedure()
		begin
			UpdateGrid(Sender);
		end, false);

end;

procedure TfrmRQFKOrderShow.actDeleteExecute(Sender: TObject);
var
  ObjCode: Integer;
begin
  try
    ObjCode := StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]);
  except
    on EConvertError do Exit;
  end;
  
  	Self.remove(ObjCode, procedure()
		begin
			UpdateGrid(Sender);
		end, false);
end;

procedure TfrmRQFKOrderShow.actInsertExecute(Sender: TObject);
Var TempRQFKOrder: RQFKOrderControllerSoapPort;
    frmRQInvoiceShow : TfrmRQInvoiceShow;
    invoiceFilter : RQInvoiceFilter;
    objCode : Integer;
begin

  if FilterObject = nil then
    exit;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;

  frmRQFKOrderEdit:=TfrmRQFKOrderEdit.Create(Application, dsInsert);

  try
    frmRQFKOrderEdit.RQFKOrderObj:=RQFKOrder.Create;

    //RQFKOrderObj.dateGen:= TXSDate.Create;
    frmRQFKOrderEdit.RQFKOrderObj.warrantDate:= TXSDate.Create;
    //RQFKOrderObj.dateEdit:= TXSDateTime.Create;

    frmRQFKOrderEdit.RQFKOrderObj.kind := RQFKOrderKind.Create;
    //RQFKOrderObj.kind.code := RQFKOrderFilter(FilterObject).kind.code;

    frmRQFKOrderEdit.RQFKOrderObj.kind.code := RQFKOrderFilter(FilterObject).kind.code;

    // 28.02.2017 Закрываем создание актов перевода единиц измерения (будет использоваться функционал Аксапты)
    if (RQFKOrderFilter(FilterObject).kind.code = RQFKORDER_KIND_RASHOD_MEASUREMENT_CHANGE) then
    begin
      Application.MessageBox(PChar('Цей функціонал більше не використовується!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    // 04.04.2017 Закрываем создание перемещений между объектами
    if (RQFKOrderFilter(FilterObject).kind.code = RQFKORDER_KIND_RASHOD_E2E) then
    begin
      Application.MessageBox(PChar('Цей функціонал більше не використовується!'), PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    if (RQFKOrderFilter(FilterObject).kind.code = RQFKORDER_KIND_OS_EXPL) or
       (RQFKOrderFilter(FilterObject).kind.code = RQFKORDER_KIND_OS_MOVEMENT) then
    begin
      frmRQFKOrderEdit.RQFKOrderObj.accountingTypeRef := TKAccountingTypeRef.Create;
      frmRQFKOrderEdit.RQFKOrderObj.accountingTypeRef.code := TK_ACCOUNTINGTYPE_OS;

      frmRQFKOrderEdit.cbTKAccountingType.ItemIndex := frmRQFKOrderEdit.RQFKOrderObj.accountingTypeRef.code - 1;
    end;

    {
    if (RQFKOrderObj.kind.code = RQFKORDER_KIND_RASHOD_OPERATIVE2TRANZIT) then
    begin
      Application.MessageBox(PChar('Ці ордери вже складати не потрібно! ' + #13#10 +
                                   'Ви можете прив''язувати матеріали на наряд-завданнях відразу з "Net. Оперативний запас"!'),
                             PChar('Увага!'), MB_ICONINFORMATION);
      Exit;
    end;
    }


{
    if  RQFKOrderObj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA then
    begin
        // выбор Накладной ...
        invoiceFilter := RQInvoiceFilter.Create;
        SetNullIntProps(invoiceFilter);
        SetNullXSProps(invoiceFilter);
        invoiceFilter.statusRef := RQInvoiceStatusRef.Create;
        invoiceFilter.statusRef.code := 3; // пока типа утвержденные ...
        // тормоза !!!
        invoiceFilter.conditionSQL := 'rqinvoice.code not in (select RQFKORDER2INVOICE.INVOICEREFCODE from RQFKORDER2INVOICE )';

        frmRQInvoiceShow := TfrmRQInvoiceShow.Create(Application, fmNormal,invoiceFilter);
        DisableActions([frmRQInvoiceShow.actInsert, frmRQInvoiceShow.actEdit, frmRQInvoiceShow.actDelete,
                        frmRQInvoiceShow.actFilter, frmRQInvoiceShow.actNoFilter
                        ]);

        if frmRQInvoiceShow.ShowModal = mrOk then
        begin
               try
                 ObjCode := StrToInt(frmRQInvoiceShow.sgRQInvoice.Cells[0,frmRQInvoiceShow.sgRQInvoice.Row]);
               except
               on EConvertError do Exit;
              end;
              frmRQFKOrderEdit.invoiceCode := objCode;
        end
        else
        begin
          Application.MessageBox(PChar('Прибутковий ордер складається ТІЛЬКИ з затвердженої накладної !!!'),
                    PChar('Помилка !'),MB_ICONERROR+MB_OK);
          Exit;
        end;

     end // приход на склад с накладной ...
     else
     // расход на экспедтора/склад/МОЛа
    if  RQFKOrderObj.kind.code in [RQFKORDER_KIND_RASHOD_OE2REM , RQFKORDER_KIND_RASHOD_REM2MOL] then
    begin
        // типа выбрать ПРИХОДНЫЕ накладные??
        
    end
    else
      exit;
}


      if frmRQFKOrderEdit.ShowModal = mrOk then
      begin
        if frmRQFKOrderEdit.RQFKOrderObj<>nil then
            //TempRQFKOrder.add(RQFKOrderObj);
            UpdateGrid(Sender);
      end;
  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;

end;

procedure TfrmRQFKOrderShow.actIsMaterialsSentExecute(Sender: TObject);
var TempRQFKOrderController: RQFKOrderControllerSoapPort;
    orderObj : RQFKOrder;
    _str : String;
    isMaterials : Integer;

begin

    TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    try
      orderObj := TempRQFKOrderController.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    if orderObj.isMaterialsSent = RQFKORDER_ISMATERIALSSENT_TRUE then begin
      _str := 'Ви дійсно бажаєте відмінити відправлення виконавцю?';
      isMaterials := RQFKORDER_ISMATERIALSSENT_FALSE;
    end else begin
      _str := 'Ви дійсно бажаєте відправити виконавцю ?';
      isMaterials := RQFKORDER_ISMATERIALSSENT_TRUE;
    end;


if Application.MessageBox(PChar(_str),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin


    if orderObj = nil then Exit;
    if orderObj.code = LOW_INT then Exit;

    orderObj.isMaterialsSent := isMaterials;
    TempRQFKOrderController.updateIsSentMaterials(orderObj);

    UpdateGrid(Sender);

  end;

end;

procedure TfrmRQFKOrderShow.actUpdateDateDeliveryExecute(Sender: TObject);
var TempRQFKOrderController: RQFKOrderControllerSoapPort;
    orderObj : RQFKOrder;
begin

if Application.MessageBox(PChar('Ви дійсно бажаєте змінити дату поставки матеріалів ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQFKOrderController := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
    try
      orderObj := TempRQFKOrderController.getObject(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
    except
      on EConvertError do Exit;
    end;

    if orderObj = nil then Exit;
    if orderObj.code = LOW_INT then Exit;


    frmUpdateDate:= TfrmUpdateDate.Create(Application, dsInsert);
    frmUpdateDate.lblDateGen.Caption:= 'Дата поставки матеріалів';

    try
       if frmUpdateDate.ShowModal = mrOk then
       begin
          if (not frmUpdateDate.edtDateGen.Checked) then
            begin
              Application.MessageBox(PChar('Вкажіть дату!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
              Exit;
            end else
            begin
              orderObj.dateDelivery := TXSDate.Create;
              orderObj.dateDelivery.XSToNative(GetXSDate(frmUpdateDate.edtDateGen.DateTime));
              TempRQFKOrderController.updateDateDelivery(orderObj);
            end;
         UpdateGrid(Sender);
       end;


      finally
        frmUpdateDate.Free;
        frmUpdateDate:=nil;

      end;
  end;
end;



procedure TfrmRQFKOrderShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQFKOrderShow.actFilterExecute(Sender: TObject);
begin
  Self.filter(procedure(filterObj: RQFKOrderFilter)
begin
  FilterObject := filterObj;
  actUpdateExecute(Sender);
end);
end;

procedure TfrmRQFKOrderShow.actNoFilterExecute(Sender: TObject);
var
  kindCode : Integer;
begin

  if FilterObject <> nil then
    if RQFKOrderFilter(FilterObject).kind <> nil then
      kindCode := RQFKOrderFilter(FilterObject).kind.code;

  FilterObject.Free;
  FilterObject := nil;

  FilterObject := RQFKOrderFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);

  RQFKOrderFilter(FilterObject).kind := RQFKOrderKind.Create();
  RQFKOrderFilter(FilterObject).kind.code := kindCode;

  UpdateGrid(Sender);
end;

procedure TfrmRQFKOrderShow.PopupMenu1Popup(Sender: TObject);
var
  fkOrder : RQFKOrder;
  ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
   except
     on EConvertError do Exit;
   end;

   fkOrder := DMReports.getRQFKOrderByCode(ObjCode);

   if  fkOrder = nil  then Exit;
   if  isTransportRoutes then Exit;

   if  fkOrder.kind.code = RQFKORDER_KIND_RASHOD_TRANZIT2OPERATIVE then
     Exit;

   //DisableActions([actCreatePrihod, actMoveToFK]);
   
   //if  fkOrder.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA then
   begin
      actCreatePrihod.Enabled := (fkOrder.status.code = RQFKORDER_STATUS_GOOD);

      actMoveToFK.Enabled := (fkOrder.status.code in [RQFKORDER_STATUS_CREATED, RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE]);

      //actMoveOSToFK.Enabled := (actMoveToFK.Enabled) and (fkOrder.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA);
      // . лочим вааще ...  хотя права!!!
      actMoveOSToFK.Enabled := False; //(fkOrder.status.code = RQFKORDER_STATUS_GOOD) and (fkOrder.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA);

      actUnCreatePrihod.Enabled := (fkOrder.status.code = RQFKORDER_STATUS_CREATED);
      
      actUnMoveToFK.Enabled := (fkOrder.kind.code <> RQFKORDER_KIND_SERVICES_FROM_SIDE)
        and (fkOrder.status.code in [RQFKORDER_STATUS_IN_FK , RQFKORDER_STATUS_OS_IN_FK, RQFKORDER_STATUS_COUNTER_IN_FK ]); // одна на всех ;) (fkOrder.status.code = RQFKORDER_STATUS_IN_FK);

      if fkOrder.status.code in [RQFKORDER_STATUS_CREATED, RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE] then
      begin
      if  fkOrder.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC then
      begin
         actMoveToFK.Caption := 'Провести в ТМЦ';
         actUnMoveToFK.Caption := 'Відмінити проведення в ТМЦ';
      end
      else
      if  fkOrder.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_COUNTER, TK_ACCOUNTINGTYPE_SEAL,
                                             TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO] then
      begin
           actMoveToFK.Caption := 'Провести в Скан-Лічильник';
           actUnMoveToFK.Caption := 'Відмінити проведення в Скан-Лічильник';
      end
      else
      if  fkOrder.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS then
      begin
           actMoveToFK.Caption := 'Провести в ОЗ';
           actUnMoveToFK.Caption := 'Відмінити проведення в ОЗ';
      end
      else

      if fkOrder.accountingTypeRef.code = TK_ACCOUNTINGTYPE_SERVICES then
      begin
           actMoveToFK.Caption := 'Провести як Послугу';
           actUnMoveToFK.Caption := 'Відмінити проведення як Послуги';
           actMoveToFK.Enabled := False;
           actUnMoveToFK.Enabled := False;
      end
      else

      begin
        ShowMessage('Неизвестный тип учета ...');
        actMoveToFK.Enabled := False;
        Exit;
      end;

      end; // ??????

      if fkOrder.status.code = RQFKORDER_STATUS_IN_FK then
      begin
          if  fkOrder.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC then
              actUnMoveToFK.Caption := 'Відмінити проведення в ТМЦ';
      end;

      if fkOrder.status.code = RQFKORDER_STATUS_OS_IN_FK then
      begin
          if  fkOrder.accountingTypeRef.code = TK_ACCOUNTINGTYPE_OS then
              actUnMoveToFK.Caption := 'Відмінити проведення в ОЗ';
      end;

      if fkOrder.status.code = RQFKORDER_STATUS_COUNTER_IN_FK then
      begin
          if  fkOrder.accountingTypeRef.code in [TK_ACCOUNTINGTYPE_COUNTER, TK_ACCOUNTINGTYPE_SEAL,
                                             TK_ACCOUNTINGTYPE_IMP, TK_ACCOUNTINGTYPE_HOLO] then
              actUnMoveToFK.Caption := 'Відмінити проведення в Скан-Лічильник';
      end;

      if ((fkOrder.status.code =RQFKORDER_STATUS_IN_FK) and(fkOrder.kind.code=RQFKORDER_KIND_PRIHOD_BUFET)) then
        N15.Visible:=true
      else N15.Visible:=false;

      actCreatePrihod.Visible :=  actCreatePrihod.Enabled;
      actMoveToFK.Visible := actMoveToFK.Enabled;
      actMoveOSToFK.Visible := actMoveOSToFK.Enabled;

      actUnCreatePrihod.Visible :=  actUnCreatePrihod.Enabled;
      actUnMoveToFK.Visible :=  actUnMoveToFK.Enabled;

      // SUPP-30929
      actUpdateDateDelivery.Visible := (fkOrder.kind.code in [RQFKORDER_KIND_PRIHOD_POSTAVKA, RQFKORDER_KIND_PRIHOD_BUFET] );

      //NET-4451
      actIsMaterialsSent.Visible :=
      ((fkOrder.kind.code = RQFKORDER_KIND_RASHOD_OE2REM) and (fkOrder.accountingTypeRef.code = TK_ACCOUNTINGTYPE_COUNTER));

      if fkOrder.isMaterialsSent = RQFKORDER_ISMATERIALSSENT_TRUE then begin
        actIsMaterialsSent.Caption := 'Відмінити відправлення виконавцю'
      end else begin
        actIsMaterialsSent.Caption := 'Відправити виконавцю';
      end;

	  // SUPP-70367
	  if (Assigned(fkOrder.checkedByAccountant)) and (fkOrder.checkedByAccountant.asBoolean) then begin
        actCheckOrUncheckByAccountant.Caption := 'Відмінити ознаку "Перевірено у бухгалтерії"'
      end else begin
        actCheckOrUncheckByAccountant.Caption := 'Поставити ознаку "Перевірено у бухгалтерії"';
      end;

      // SUPP-68524
      DisableActions([actMoveAndUnMoveToWorkOnWarehouse], false);
      HideActions([actMoveAndUnMoveToWorkOnWarehouse], false);

	  // SUPP-70367
	  DisableActions([actCheckOrUncheckByAccountant], (not (fkOrder.status.code in [RQFKORDER_STATUS_IN_FK, RQFKORDER_STATUS_OS_IN_FK, RQFKORDER_STATUS_COUNTER_IN_FK])));
      HideActions([actCheckOrUncheckByAccountant], (not (fkOrder.status.code in [RQFKORDER_STATUS_IN_FK, RQFKORDER_STATUS_OS_IN_FK, RQFKORDER_STATUS_COUNTER_IN_FK])));

	  // SUPP-68524
      case fkOrder.status.code of
        RQFKORDER_STATUS_CREATED: begin
          actMoveAndUnMoveToWorkOnWarehouse.Caption := 'Взяти у роботу на складі';
        end;
        RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE: begin
          actMoveAndUnMoveToWorkOnWarehouse.Caption := 'Перевести у статус "Складений"';
        end;
        Else begin
          DisableActions([actMoveAndUnMoveToWorkOnWarehouse]);
          HideActions([actMoveAndUnMoveToWorkOnWarehouse]);
        end;
      end;
   end;


end;

procedure TfrmRQFKOrderShow.actCheckOrUncheckByAccountantExecute(
  Sender: TObject);
  var TempRQFKOrder: RQFKOrderControllerSoapPort;
    ObjCode : Integer;
    obj : RQFKOrder;
    isChecked : Boolean;
    actionName, confirmationMessage, orderString : String;
begin
  inherited;
  try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  obj := TempRQFKOrder.getObject(ObjCode);
  if (obj = nil) then Exit;

  orderString := Format('№ %s від %s', [obj.numberDoc, XSDate2String(obj.dateGen)]);
  
  if (Assigned(obj.checkedByAccountant)) and (obj.checkedByAccountant.asBoolean) then begin
      actionName := Format('зняти ознаку "Перевірено у бухгалтерії" для ордеру %s', [orderString]);
      confirmationMessage := Format('Ознака "Перевірено у бухгалтерії" знята для ордеру %s', [orderString]);
      isChecked := false;
  end else begin
      actionName := Format('поставити ознаку "Перевірено у бухгалтерії" для ордеру %s', [orderString]);
      confirmationMessage := Format('Ознака "Перевірено у бухгалтерії" поставлена для ордеру %s', [orderString]);
      isChecked := true;  
  end;
  
  if Application.MessageBox(PChar(Format('Ви дійсно бажаєте %s ?', [actionName])),
    PChar('Увага !'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then
  begin
    TempRQFKOrder.checkOrUncheckByAccountant(ObjCode, isChecked);
    UpdateGrid(Sender);
    Application.MessageBox(PChar(confirmationMessage), PChar('Повідомлення')
    , MB_ICONINFORMATION);

  end;
end;

procedure TfrmRQFKOrderShow.actCreatePrihodExecute(Sender: TObject);
var ObjCode : Integer;
begin

    try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
    except
     on EConvertError do Exit;
    end;

	Self.createPrihod(ObjCode, procedure()
		begin
			UpdateGrid(Sender);
		end);

end;

procedure TfrmRQFKOrderShow.actMoveToFKExecute(Sender: TObject);
var ObjCode : Integer;
begin

    try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
    except
     on EConvertError do Exit;
    end;
	
	TfrmRQFKOrderShow.moveToFK(ObjCode, HTTPRIORQFKOrder, procedure() 
		begin
			UpdateGrid(Sender);
		end);
end;

procedure TfrmRQFKOrderShow.actUnCreatePrihodExecute(Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    ObjCode : Integer;
    obj : RQFKOrder;
begin

  try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;
  
	Self.unCreatePrihod(ObjCode, procedure()
		begin
			UpdateGrid(Sender);
		end);  

end;

procedure TfrmRQFKOrderShow.actUnMoveToFKExecute(Sender: TObject);
var ObjCode : Integer;
begin
    try
     ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
    except
     on EConvertError do Exit;
    end;
	
	TfrmRQFKOrderShow.unMoveToFK(ObjCode, HTTPRIORQFKOrder, procedure() 
		begin
			UpdateGrid(Sender);
		end);
	
end;

procedure TfrmRQFKOrderShow.actExcelExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName(Self.Caption + ' (фільтр) ') + '.xls';

    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmRQFKOrderShow.actMoveAndUnMoveToWorkOnWarehouseExecute(
  Sender: TObject);
  var TempRQFKOrder: RQFKOrderControllerSoapPort;
    ObjCode : Integer;
    obj : RQFKOrder;
    isMove : Boolean;
    actionName, confirmationMessage, orderString : String;
begin
  inherited;
  try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  obj := TempRQFKOrder.getObject(ObjCode);
  if (obj = nil) then Exit;

  orderString := Format('№ %s від %s', [obj.numberDoc, XSDate2String(obj.dateGen)]);

  case obj.status.code of
    RQFKORDER_STATUS_CREATED: begin
      actionName := Format('перевести ордер %s в роботу на складі', [orderString]);
      confirmationMessage := Format('Ордер %s переведено в роботу на складі', [orderString]);
      isMove := true;
    end;
    RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE: begin
      actionName := Format('перевести ордер %s у статус "Складений"', [orderString]);
      confirmationMessage := Format('Ордер %s переведено в статус "Складений"', [orderString]);
      isMove := false;
    end;
    Else begin
      raise Exception.Create('Невідомий статус для ордеру!');
    end;
  end;

  if Application.MessageBox(PChar(Format('Ви дійсно бажаєте %s ?', [actionName])),
    PChar('Увага !'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=IDYES then
  begin
    TempRQFKOrder.moveOrUnmoveForWorkOnWarehouse(ObjCode, isMove);
    UpdateGrid(Sender);
    Application.MessageBox(PChar(confirmationMessage), PChar('Повідомлення')
    , MB_ICONINFORMATION);

  end;
end;

procedure TfrmRQFKOrderShow.actMoveOSToFKExecute(Sender: TObject);
var TempRQFKOrder: RQFKOrderControllerSoapPort;
    ObjCode : Integer;
    obj : RQFKOrder;
begin

  try
   ObjCode := StrToInt(sgRQFKorder.Cells[0,sgRQFKorder.Row]);
  except
   on EConvertError do Exit;
  end;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  obj := TempRQFKOrder.getObject(ObjCode);
  if (obj = nil) then Exit;

  if obj.kind.code = RQFKORDER_KIND_PRIHOD_POSTAVKA then
  begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте змінити статус на "Проведений в ОЗ" для приходу осн.засобів ?'),
                      PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
    begin
      TempRQFKOrder.movePrihodInFK(obj.code, 1);
      UpdateGrid(Sender);
    end;
 end
  else
    ShowMessage('Це не той ордер ;) !!! ');

end;

procedure TfrmRQFKOrderShow.FormCreate(Sender: TObject);
begin
  isTransportRoutes := False;
end;

procedure TfrmRQFKOrderShow.actAddCheckedExecute(Sender: TObject);
begin
  inherited;
//
//
   ModalResult:= mrOk;
end;

procedure TfrmRQFKOrderShow.UpdateItemGrid();
var
  TempRQFKOrderItem: RQFKOrderItemControllerSoapPort;
  i: Integer;
  RQFKOrderItemList: RQFKOrderItemShortList;
  itemFilter: RQFKOrderItemFilter;
  orderCode, itemLastCount : Integer;

begin
  ClearGrid(sgRQFKOrderItem);
  //sgRQFKOrderItem.Clear;
  //sgRQFKOrderItem.RowCount := 2;

  try
    orderCode := StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]);
  except
   on EConvertError do Exit;
  end;

  //SetGridHeaders(RQFKOrderItemHeaders, sgRQFKOrderItem.ColumnHeaders);
  TempRQFKOrderItem :=  HTTPRIORQFKOrderItem as RQFKOrderItemControllerSoapPort;

     itemfilter := RQFKOrderItemFilter.Create;
     SetNullIntProps(itemfilter);
     SetNullXSProps(itemfilter);
     itemFilter.fkOrderRef := RQFKOrderRef.Create;
     itemFilter.fkOrderRef.code := orderCode;

  RQFKOrderItemList := TempRQFKOrderItem.getScrollableFilteredList(itemFilter,0,-1);

  itemLastCount:=High(RQFKOrderItemList.list);

  if itemLastCount > -1 then
     sgRQFKOrderItem.RowCount:=itemLastCount+2
  else
     sgRQFKOrderItem.RowCount:=2;

   with sgRQFKOrderItem do
    for i:=0 to itemLastCount do
      begin
        // Application.ProcessMessages;
        if RQFKOrderItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQFKOrderItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := RQFKOrderItemList.list[i].materialName;
        Cells[2, i+1] := RQFKOrderItemList.list[i].measurementName;
        Cells[3, i+1] := RQFKOrderItemList.list[i].nomenclatureNum;
        Cells[4, i+1] := RQFKOrderItemList.list[i].nomenclatureName;
        Cells[5, i+1] := RQFKOrderItemList.list[i].nomenclatureUnitName;
        if RQFKOrderItemList.list[i].countGen = nil then
          Cells[6,i+1] := ''
        else
        begin
          Cells[6,i+1] := RQFKOrderItemList.list[i].countGen.DecimalString;
        end;

        if RQFKOrderItemList.list[i].priceWithoutNds = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := RQFKOrderItemList.list[i].priceWithoutNds.DecimalString;

        if RQFKOrderItemList.list[i].sumWithoutNds = nil then
          Cells[8,i+1] := ''
        else
        begin
          Cells[8,i+1] := RQFKOrderItemList.list[i].sumWithoutNds.DecimalString;
        end;

        if (RQFKOrderItemList.list[i].weight = nil) then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := RQFKOrderItemList.list[i].weight.DecimalString;

        Cells[10,i+1] := RQFKOrderItemList.list[i].fundingTypeStr;

        sgRQFKOrderItem.RowCount:=i+2;
      end;
   sgRQFKOrderItem.Row:=1;
end;

procedure TfrmRQFKOrderShow.sgRQFKOrderClick(Sender: TObject);
begin
  inherited;
  UpdateItemGrid();
end;

procedure TfrmRQFKOrderShow.N15Click(Sender: TObject);
 var
 TempRQFKOrder: RQFKOrderControllerSoapPort;
begin

   TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
   try
     TempRQFKOrder.export2Bufet(StrToInt(sgRQFKOrder.Cells[0,sgRQFKOrder.Row]));
     Application.MessageBox(PChar('Операція пройшла успішно!'),PChar('Увага!'), MB_ICONINFORMATION);
   except
   on EConvertError do Exit;
  end;


end;

end.
