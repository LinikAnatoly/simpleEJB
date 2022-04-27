
unit EditENPlanWorkItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkItemController, ENPlanWorkController,
  TB2Item, TB2Dock, TB2Toolbar, AdvObj ;

type
  TfrmENPlanWorkItemEdit = class(TDialogForm)

    lblCountGen : TLabel;
    edtCountGen: TEdit;
    lblCommentGen : TLabel;


  HTTPRIOENPlanWorkItem: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    spbEPKard: TSpeedButton;
    edtKartiName: TEdit;
    lblKarta: TLabel;
    HTTPRIOKarti: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    pmActions: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    lblMeasure: TLabel;
    HTTPRIOENElement: THTTPRIO;
    HTTPRIOENPlanWork: THTTPRIO;
    Label1: TLabel;
    edtKartiNum: TEdit;
    pcEstimate: TPageControl;
    tsMaterials: TTabSheet;
    tsWorkers: TTabSheet;
    tsTransports: TTabSheet;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    lblEstimateItem: TLabel;
    sgENEstimateItem: TAdvStringGrid;
    sgENTransportItem: TAdvStringGrid;
    sgENHumenItem: TAdvStringGrid;
    HTTPRIOENHumenItem: THTTPRIO;
    HTTPRIOENTransportItem: THTTPRIO;
    HTTPRIOTKTechCardPWI: THTTPRIO;
    lblNormTime: TLabel;
    edtNormTime: TEdit;
    edtParentCount: TEdit;
    HTTPRIOENPlanCorrectHistory: THTTPRIO;
    Label2: TLabel;
    lblWorkerCount: TLabel;
    edtWorkerCount: TEdit;
    lblCountWorkFact: TLabel;
    edtFactCount: TEdit;
    lblPK: TLabel;
    edtCode: TEdit;
    gbPlanWork: TGroupBox;
    edtPlanWork: TEdit;
    spbPlanWork: TSpeedButton;
    Label3: TLabel;
    edtPlanCount: TEdit;
    spbKoef: TSpeedButton;
    lblKoef: TLabel;
    edtKoef: TEdit;
    HTTPRIOENPlanWorkItem2TKKoef: THTTPRIO;
    actZeroCount: TAction;
    N6: TMenuItem;
    N7: TMenuItem;
    actCheckAll: TAction;
    actUncheckAll: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    btnEditForOrder: TButton;
    tsServices: TTabSheet;
    lblEstimateServices: TLabel;
    sgENEstimateItemServices: TAdvStringGrid;
    edtCommentGen: TMemo;
    lblCostGen: TLabel;
    edtCostGen: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbEPKardClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);

    procedure UpdateGrid(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure pcEstimateChange(Sender: TObject);
    procedure spbPlanWorkClick(Sender: TObject);
    procedure spbKoefClick(Sender: TObject);

    procedure recalcKoef();
    procedure updateNormTime();
    procedure actZeroCountExecute(Sender: TObject);
    procedure actCheckAllExecute(Sender: TObject);
    procedure actUncheckAllExecute(Sender: TObject);
    procedure btnEditForOrderClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    planObj: ENPlanWork;
  public
    isTransport, isSiz, isCalculation, isWriteOffProtection, inServices, isChangePlanWorkitem : Boolean;
    priconnections: Boolean;
    planWorkStateCode : Integer; // Тип акта с формы плана
    // SUPP-67561... +++ услуги для договоров подряда на выполнение ПКД...
    isServicesProject : Boolean;
    { Public declarations }
  end;

var
  frmENPlanWorkItemEdit: TfrmENPlanWorkItemEdit;
  ENPlanWorkItemObj: ENPlanWorkItem;

implementation

uses
 ENEstimateItemController, ENConsts,
  EditENEstimateItem, ENElementController, {ENPlanWorkController,}
  DMReportsUnit, TKTechCardController, ShowTKTechCard,
  ENHumenItemController, EditENHumenItem, ENTransportItemController,
  EditENTransportItem, ENPlanCorrectHistoryController,
  ENEstimateItemKindController, ShowENPlanWork, ENPlanWorkStateController,
  ENDepartmentController, ENPlanWorkKindController,
  ShowENPlanWorkItem2TKKoef, ENPlanWorkItem2TKKoefController;


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkItemController  ;
}
{$R *.dfm}

const
  ENEstimateItemHeaders: array [1..7] of String =
        ( 'Код'
          ,'Матеріал'
          ,'кількість нормативна'
          ,'кількість скорегована'
          ,'од. виміру'
          ,'тип строки кошторису'
          ,'Статус'
        );

  ENHumenItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Посада нормативна'
          ,'Посада штатна'
          ,'Робітник'
          ,'норма часу нормативна'
          ,'норма часу скорегована'
          ,'Ціна нормачасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
        
   ENTransportItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Транспорт нормативний'
          ,'Транспорт штатний'
          ,'Робітник'
          ,'норма часу нормативна'
          ,'норма часу скорегована'
          ,'Тип тр-ту'
          ,'Відстань, км'
          ,'Ціна нормачасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );

var
  eiColCount, eiLastCount: Integer;
  eiLastRow: Integer = 1;
  estimateItemFilter: ENEstimateItemFilter;
  humenItemFilter : ENHumenItemFilter;
  transportItemFilter : ENTransportItemFilter;

procedure TfrmENPlanWorkItemEdit.updateNormTime();
begin
//edtNormTime.Text :='';
end;

procedure TfrmENPlanWorkItemEdit.recalcKoef();
Var
  TempENPlanWorkItem2TKKoef: ENPlanWorkItem2TKKoefControllerSoapPort;
  f : ENPlanWorkItem2TKKoefFilter;
  l: ENPlanWorkItem2TKKoefShortList;
  koef : double;
  i : integer;
begin
   f := ENPlanWorkItem2TKKoefFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.planWorkItemRef := ENPlanWorkItemRef.Create;
   f.planWorkItemRef.code :=  ENPlanWorkItemObj.code;

   TempENPlanWorkItem2TKKoef :=  HTTPRIOENPlanWorkItem2TKKoef as ENPlanWorkItem2TKKoefControllerSoapPort;
   l := TempENPlanWorkItem2TKKoef.getScrollableFilteredList(f, 0, -1);
   koef := 1.0;
   for i:=0 to l.totalCount - 1 do
     koef := Conv(( koef * StrToFloat(l.list[i].sourceKoefKoef.DecimalString)),2);

   //if l.totalCount > 0 then
   //   edtKoef.Text := FloatToStr(koef / l.totalCount)
   //else
   //   edtKoef.Text := '1';

   edtKoef.Text := FloatToStr( Conv(koef,2));

end;

procedure TfrmENPlanWorkItemEdit.FormShow(Sender: TObject);
var
  kFilter : TKTechCardFilter;
  kList : TKTechCardShortList;
  kObj : TKTechCard;
  TempKarti: TKTechCardControllerSoapPort;

  TempENPlanCorrectHistory : ENPlanCorrectHistoryControllerSoapPort;
  ENPlanCorrectHistoryList : ENPlanCorrectHistoryShortList;
  corrFilter : ENPlanCorrectHistoryFilter;

  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  pwiFilter : ENPlanWorkItemFilter;
  pwiList : ENPlanWorkItemShortList;
  factCount , planCount : Double;
  i : Integer;
  isChild : boolean;
  //plan: ENPlanWork;
  //element : ENElement;
  elementType : Integer;
  //plan: ENPlanWork;
begin

  DisableControls([edtCode, edtPlanWork, edtKoef, edtParentCount, edtPlanCount, edtFactCount]);
  
  HideControls([gbPlanWork]);

  ///// NET-4503
  planObj := nil;

  if ENPlanWorkItemObj.planRef <> nil then
    if ENPlanWorkItemObj.planRef.code <> LOW_INT then
      planObj := DMReports.getPlanByCode(ENPlanWorkItemObj.planRef.code);

  if DMReports.isCommentRequiredForPlanWorkItems(planObj) then
    lblCommentGen.Caption := 'Місце роботи, номери опор, прогонів, ТП тощо'
  else
    lblCommentGen.Caption := 'Примітка';

    if (planObj.typeRef.code in [ENPLANWORKTYPE_SERVICES_FROM_SIDE, ENPLANWORKTYPE_SERVICES_FROM_SIDE_INVEST]) then
      lblCommentGen.Caption := 'Предмет виконання робіт';
  /////

  { 30.05.2012 Поле цена пока будет спрятано для других планов, кроме
      с типом акта Акт виконаних робіт договорів підряду}
  if Self.planWorkStateCode <> ENConsts.ENPLANWORKSTATE_TMC_TRANSFER then
  begin
      HideControls([lblCostGen, edtCostGen]);
  end;

  if (not inServices) then tsServices.TabVisible := false;

  if (DialogState = dsView) or (DialogState = dsEdit) then
  begin

    edtCode.Text := IntToStr(ENPlanWorkItemObj.code);

     TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

     if  ENPlanWorkItemObj.planRef.code <> LOW_INT then
     begin
       TempENPlanCorrectHistory :=  HTTPRIOENPlanCorrectHistory as ENPlanCorrectHistoryControllerSoapPort;
        //if corrFilterObject = nil then
        begin
           corrFilter := ENPlanCorrectHistoryFilter.Create;
           SetNullIntProps(corrFilter);
           SetNullXSProps(corrFilter);
        end;

        corrFilter.planNewRef := ENPlanWorkRef.Create;
        corrFilter.planNewRef.code :=  ENPlanWorkItemObj.planRef.code;

        //corrFilterObject.conditionSQL := ' planoldrefcode in (select ph.planrefcode from enplancorrecthistory ph where ph.plannewrefcode = '+ IntToStr(ENPlanWorkObj.code) +')';
        isChild := false;
        ENPlanCorrectHistoryList := TempENPlanCorrectHistory.getScrollableFilteredList(corrFilter,0,-1);
        if  ENPlanCorrectHistoryList.totalCount > 0 then
        begin
           pwiFilter := ENPlanWorkItemFilter.Create;
           SetNullXSProps(pwiFilter);
           SetNullIntProps(pwiFilter);
           pwiFilter.planRef := ENPlanWorkRef.Create;
           pwiFilter.planRef.code := ENPlanCorrectHistoryList.list[0].planOldRefCode;

           pwiFilter.kartaRef := TKTechCardRef.Create;
           pwiFilter.kartaRef.code :=  ENPlanWorkItemObj.kartaRef.code;

           pwiList := TempENPlanWorkItem.getScrollableFilteredList(pwiFilter,0,-1);
           if pwiList.totalCount > 0 then
           begin
             edtParentCount.Text := pwiList.list[0].countGen.DecimalString;
             isChild := true;
           end;
        end;

        //pwiFilter.Free;
        pwiFilter := nil;
        // фактически выполненные работы ..
        factCount := 0;
        try
          pwiFilter := ENPlanWorkItemFilter.Create;
          SetNullXSProps(pwiFilter);
          SetNullIntProps(pwiFilter);
          pwiFilter.kartaRef := TKTechCardRef.Create;
          pwiFilter.kartaRef.code :=  ENPlanWorkItemObj.kartaRef.code;

          //plan := DMReports.getPlanByCode(ENPlanWorkItemObj.planRef.code);

          if not isChild then
            pwiFilter.conditionSQL := 'enplanworkitem.planrefcode in ('
                                      +'select pc.plannewrefcode from enplancorrecthistory pc where pc.planrefcode = ' + IntToStr(ENPlanWorkItemObj.planRef.code)
                                      +' and pc.reasoncode = '+ IntToStr(CORRECTREASON_MOVE_TO_FACT) +')'
          else
            pwiFilter.conditionSQL := 'enplanworkitem.planrefcode in ('
                                      +'select pc.plannewrefcode from enplancorrecthistory pc where pc.planrefcode in ('
                                      +' select pc2.planrefcode from enplancorrecthistory pc2 where pc2.plannewrefcode = ' + IntToStr(ENPlanWorkItemObj.planRef.code)
                                      +') and pc.reasoncode = '+ IntToStr(CORRECTREASON_MOVE_TO_FACT) +')';

          pwiList := TempENPlanWorkItem.getScrollableFilteredList(pwiFilter,0,-1);
          for i := 0 to pwiList.totalCount - 1 do
            factCount := factCount + StrToFloat(pwiList.list[i].countGen.DecimalString);

          edtFactCount.Text := FloatToStr(factCount);
        except
          edtFactCount.Text := '0';
        end;

        pwiFilter := nil;
        // уже ЗАПЛАНИРОВАННЫЕ работы ..
        planCount := 0;
        try
          pwiFilter := ENPlanWorkItemFilter.Create;
          SetNullXSProps(pwiFilter);
          SetNullIntProps(pwiFilter);
          pwiFilter.kartaRef := TKTechCardRef.Create;
          pwiFilter.kartaRef.code :=  ENPlanWorkItemObj.kartaRef.code;

          //plan := DMReports.getPlanByCode(ENPlanWorkItemObj.planRef.code);

          if not isChild then
            pwiFilter.conditionSQL := 'enplanworkitem.planrefcode in ('
                                      +'select pc.plannewrefcode from enplancorrecthistory pc where pc.planrefcode = ' + IntToStr(ENPlanWorkItemObj.planRef.code)
                                      +' and pc.reasoncode = '+ IntToStr(CORRECTREASON_MOVE_TO_NPW) +')'
          else
            pwiFilter.conditionSQL := 'enplanworkitem.planrefcode in ('
                                      +'select pc.plannewrefcode from enplancorrecthistory pc where pc.planrefcode in ('
                                      +' select pc2.planrefcode from enplancorrecthistory pc2 where pc2.plannewrefcode = ' + IntToStr(ENPlanWorkItemObj.planRef.code)
                                      +') and pc.reasoncode = '+ IntToStr(CORRECTREASON_MOVE_TO_NPW) +')';

          pwiList := TempENPlanWorkItem.getScrollableFilteredList(pwiFilter,0,-1);
          for i := 0 to pwiList.totalCount - 1 do
            planCount := planCount + StrToFloat(pwiList.list[i].countGen.DecimalString);

          //edtPlanCount.Text := FloatToStr(factCount); // 19.04.11 Древнейший баг??
          edtPlanCount.Text := FloatToStr(planCount);
        except
          edtPlanCount.Text := '0';
        end;
      end;

     if (ENPlanWorkItemObj.kartaRef <> nil) then
     begin
        if isTransport then
        begin
          // для грузов показываем материалы
          if ((ENPlanWorkItemObj.kartaRef.code = 500004873) or (ENPlanWorkItemObj.kartaRef.code = 500004877)) then
            begin
              pcEstimate.ActivePage := tsMaterials;
              tsMaterials.TabVisible := true;
              tsMaterials.Caption := 'Вантажний матеріал';
            end
          else tsMaterials.TabVisible := false;
        end;

        if isTransport then
        begin
          // для перевозок показываем персонал
          if ((ENPlanWorkItemObj.kartaRef.code = 500004875) or (ENPlanWorkItemObj.kartaRef.code = 500004876)) then
            begin
              pcEstimate.ActivePage := tsWorkers;
              tsWorkers.TabVisible := true;
              tsWorkers.Caption := 'Персонал що перевозиться';
            end
          else tsWorkers.TabVisible := false;
        end;
     end;

    // 12.12.2011 +++ для "Услуг со стороны"
    if inServices then
      begin
        tsTransports.TabVisible := false;
        tsWorkers.TabVisible := false;
        tsMaterials.TabVisible := false;
        pcEstimate.ActivePage := tsServices;
        Label1.Caption := 'код';
        lblKarta.Caption := 'Послуга';
        DenyBlankValues([edtCommentGen]);
      end;     

  end;


 { if isTransport then
    begin
      pcEstimate.ActivePage := tsTransports;
      tsMaterials.TabVisible := false;
      tsWorkers.TabVisible := false;

      // перевезення вантажу
      if (ENPlanWorkItemObj.kartaRef <> nil) and (ENPlanWorkItemObj.kartaRef.code = 500004873) then
        tsMaterials.TabVisible := True
      else tsMaterials.TabVisible := false;

      DisableActions([actInsert, actView, actDelete, actZeroCount]);
    end
  else }

  if isTransport then
     pcEstimate.ActivePage := tsTransports
  else pcEstimate.ActivePage := tsMaterials;


  if isSiz then
    begin
      pcEstimate.ActivePage := tsMaterials;
      tsTransports.TabVisible := false;
      tsWorkers.TabVisible := false;
      DisableActions([actInsert, actView, actDelete, actZeroCount]);
    end;
//  else
//     pcEstimate.ActivePage := tsMaterials;

  if inServices then pcEstimate.ActivePage := tsServices;

  DisableControls([edtKartiName, edtKartiNum, edtNormTime]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DisableControls([edtKartiName]);
    DenyBlankValues([
      edtKartiName,
      edtCountGen
      ,edtWorkerCount
     ]);

     if DMReports.isCommentRequiredForPlanWorkItems(planObj) then
       DenyBlankValues([edtCommentGen]);

     if (ENPlanWorkItemObj.kartaRef <> nil) then
     begin
        if isTransport then
        begin
          // для грузов показываем материалы
          if ((ENPlanWorkItemObj.kartaRef.code = 500004873) or (ENPlanWorkItemObj.kartaRef.code = 500004877)) then
            begin
              pcEstimate.ActivePage := tsMaterials;
              tsMaterials.TabVisible := true;
              tsMaterials.Caption := 'Вантажний матеріал';
            end
          else tsMaterials.TabVisible := false;
        end;

        if isTransport then
        begin
          // для перевозок показываем персонал
          if ((ENPlanWorkItemObj.kartaRef.code = 500004875) or (ENPlanWorkItemObj.kartaRef.code = 500004876)) then
            begin
              pcEstimate.ActivePage := tsWorkers;
              tsWorkers.TabVisible := true;
              tsWorkers.Caption := 'Персонал що перевозиться';
            end
          else tsWorkers.TabVisible := false;
        end;
     end;

    // 12.12.2011 +++ для "Услуг со стороны"
    if inServices then
      begin
        tsTransports.TabVisible := false;
        tsWorkers.TabVisible := false;
        tsMaterials.TabVisible := false;
        pcEstimate.ActivePage := tsServices;
        Label1.Caption := 'код';
        lblKarta.Caption := 'Послуга';
        DisableControls([edtCountGen]);
        edtCountGen.Text := '1';
        DenyBlankValues([edtCommentGen]);
      end;

      if isServicesProject then
      begin
        DisableControls([edtCountGen], False);
        DenyBlankValues([edtCountGen]);
      end;
  end;

  SetFloatStyle(edtCountGen);
  SetIntStyle(edtWorkerCount);

  HideControls([lblEstimateItem, sgENEstimateItem, tbActions, spbKoef], (DialogState = dsInsert));

  if DialogState = dsEdit then
  begin
    DisableControls([spbEPKard]);

    if ENPlanWorkItemObj.countGen <> nil then
      try
        if StrToFloat(ENPlanWorkItemObj.countGen.DecimalString) < 0.000001 then
          DisableActions([actInsert, actEdit, actDelete]);
      except
      end;

{      // RZA и СПС как разберуться с планами на 2010 год - УБРАТЬ !!!!!!!!!!!!!!!

    /// 02.08.10 Убираем !
    if (HTTPRIOENElement.HTTPWebNode.UserName = 'sps') or (HTTPRIOENElement.HTTPWebNode.UserName = 'srza') or
       (HTTPRIOENElement.HTTPWebNode.UserName = 'MaliyUV') then
    begin
      elementType := DMReports.getElementTypeByPlan(ENPlanWorkItemObj.planRef.code);

      if elementType in [EN_SUBSTATION150, EN_RZA] then
      begin
        HideControls([gbPlanWork], false);
      end;
    end;

    // ---------------------------- }

    // СПС очень просили
    if (HTTPRIOENElement.HTTPWebNode.UserName = 'MarinchenkoSI') and (ENPlanWorkItemObj.planRef.code <> LOW_INT) then
    begin
      elementType := DMReports.getElementTypeByPlan(ENPlanWorkItemObj.planRef.code);

      if elementType in [EN_SUBSTATION150] then
      begin
        HideControls([gbPlanWork], false);
      end;
    end;

  end;


  if DialogState = dsView then
  begin
    spbEPKard.Enabled := false;
    DisableActions([actInsert, actEdit, actDelete, actZeroCount]);
    DisableControls([edtCommentGen]);
    // что бы мона было посмотреть список коэф .. DisableControls([spbKoef]);

    { Уже не надо !!! МТС передумал и переубедил СВЭС :-)
    // ВРЕМЕННО!!! Для редактирования материалов для разнарядки
    /// 01.08.10
    if (HTTPRIOENElement.HTTPWebNode.UserName = 'GolovkoLD') then
    begin
      elementType := DMReports.getElementTypeByPlan(ENPlanWorkItemObj.planRef.code);
      plan := DMReports.getPlanByCode(ENPlanWorkItemObj.planRef.code);

      if (elementType = EN_LINE150) and (plan.kind.code = ENPLANWORKKIND_CURRENT) then
      begin
        HideControls([btnEditForOrder], false);
      end;
    end;
    ///
    }
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    recalcKoef();

    if isServicesProject then
      DisableActions([actInsert, actEdit, actDelete]);


    if ( ENPlanWorkItemObj.countGen <> nil ) then
       edtCountGen.Text := ENPlanWorkItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';

    if ( ENPlanWorkItemObj.costGen <> nil ) then
       edtCostGen.Text := ENPlanWorkItemObj.costGen.decimalString
    else
       edtCostGen.Text := '';

    MakeMultiline(edtCommentGen.Lines, ENPlanWorkItemObj.commentGen);

{    edtUserGen.Text := ENPlanWorkItemObj.userGen;
      if ENPlanWorkItemObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanWorkItemObj.dateEdit.Year,ENPlanWorkItemObj.dateEdit.Month,ENPlanWorkItemObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;
}

{
     if ENPlanWorkItemObj.workerCount <> LOW_INT then
      edtWorkerCount.Text := IntToStr(ENPlanWorkItemObj.workerCount)
     else
      edtWorkerCount.Text := '';
}
     if ENPlanWorkItemObj.kartaRef.code > Low(Integer)then
     begin
           //try
             TempKarti :=  HTTPRIOKarti as TKTechCardControllerSoapPort;
             kObj := TempKarti.getObject(ENPlanWorkItemObj.kartaRef.code);
             edtKartiName.Text := kObj.name;
             edtKartiNum.Text :=  kObj.techKartNumber;
             
             if kObj.normOfTime <> nil then
                edtNormTime.Text := kObj.normOfTime.DecimalString
             else
                edtNormTime.Text := 'нет в нормативе ;)';

           //finally
             //eFilter.Free;
           //end;
     end
     else
         edtKartiName.Text := '';

     UpdateGrid(Sender);
  end;

end;



procedure TfrmENPlanWorkItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENElement: ENElementControllerSoapPort;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    element : ENElement;
    plan : ENPlanWork;
    pwiF : ENPlanWorkItemFilter;
    pwiList : ENPlanWorkItemShortList;
    err, strComment : String;
    distance: TXSDecimal;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtKartiName,
      edtCountGen
      //,edtWorkerCount
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else

  if (inServices) and (not NoBlankValues([edtCommentGen])) then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
      Exit;
  end
  else begin
    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

     if (ENPlanWorkItemObj.countGen = nil ) then
       ENPlanWorkItemObj.countGen := TXSDecimal.Create;
     if edtCountGen.Text <> '' then
       ENPlanWorkItemObj.countGen.decimalString := edtCountGen.Text
     else
       ENPlanWorkItemObj.countGen := nil;

    ///// NET-4503
    if ENPlanWorkItemObj.countGen <> nil then
      try
        if StrToFloat(ENPlanWorkItemObj.countGen.DecimalString) >= 0.000001 then // Если работу обнуляют, не проверяем
          if DMReports.isCommentRequiredForPlanWorkItems(planObj) then
          begin
            if (not NoBlankValues([edtCommentGen])) then
            begin
              Application.MessageBox(PChar('Заповніть, будь ласка, поле "Місце роботи, номери опор, прогонів, ТП тощо" !'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
              Action := caNone;
              Exit;
            end;

            // Еще дополнительно проверим
            strComment := Trim(edtCommentGen.Text);
            strComment := AnsiReplaceText(strComment, #13, '');
            strComment := AnsiReplaceText(strComment, #10, '');

            if (strComment = '') then
            begin
              Application.MessageBox(PChar('Заповніть, будь ласка, поле "Місце роботи, номери опор, прогонів, ТП тощо" !'), PChar('Увага !'), MB_ICONWARNING + MB_OK);

              if edtCommentGen.CanFocus then
                edtCommentGen.SetFocus;

              Action := caNone;
              Exit;
            end;
          end;
      except
      end;
    /////



     if (ENPlanWorkItemObj.costGen = nil ) then
       ENPlanWorkItemObj.costGen := TXSDecimal.Create;
     if edtCostGen.Text <> '' then
       ENPlanWorkItemObj.costGen.decimalString := edtCostGen.Text
     else
       ENPlanWorkItemObj.costGen := nil;
{
     if edtWorkerCount.Text <> '' then
       ENPlanWorkItemObj.workerCount := StrToInt( edtWorkerCount.Text )
     else
       ENPlanWorkItemObj.workerCount := LOW_INT;
}

     ENPlanWorkItemObj.commentGen := edtCommentGen.Text;

{
     ENPlanWorkItemObj.userGen := edtUserGen.Text;

     if ENPlanWorkItemObj.dateEdit = nil then
        ENPlanWorkItemObj.dateEdit := TXSDate.Create;
      ENPlanWorkItemObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
}


  if (ENPlanWorkItemObj.planRef.code = LOW_INT) and (DialogState = dsInsert) then
  begin
    /// Пока 0... Этот кусок все равно не используется
    distance := TXSDecimal.Create;
    distance.DecimalString := '0';
    ///
    ENPlanWorkItemObj.code := TempENPlanWorkItem.addForCalculation(ENPlanWorkItemObj, distance);
    ModalResult := mrOk;
    Exit;
  end;
    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
    plan := TempENPlanWork.getObject(ENPlanWorkItemObj.planRef.code);

    // проверим кол-во фактических людей ..
    {
    if (plan.kind.code = ENPLANWORKKIND_NPZ) or (plan.kind.code = ENPLANWORKKIND_FACT) then
      if not NoBlankValues( [edtWorkerCount] ) then
      begin
        Application.MessageBox(PChar('Введіть кількість людей, фактично задіяних у роботі! !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
        Action:=caNone;
        Exit;
      end;
 }
    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
    element := TempENElement.getObject(plan.elementRef.code);


    if DialogState = dsInsert then
    begin

      if ENPlanWorkItemObj.countGen <> nil then
        try
          if StrToFloat(ENPlanWorkItemObj.countGen.DecimalString) < 0.000001 then
          begin
            Application.MessageBox(PChar('Додавати роботу з нульовою кількістю неможна!'), PChar('Увага!'), MB_ICONWARNING);
            ModalResult := mrNone;
            Exit;
          end;
        except
          raise;
        end;


      // проверить нет ли такой работы в плане ....
      pwiF := ENPlanWorkItemFilter.Create;
      SetNullIntProps(pwiF);
      SetNullXSProps(pwiF);
      pwiF.planRef := ENPlanWorkRef.Create;
      pwiF.planRef.code := ENPlanWorkItemObj.planRef.code;
      pwiF.kartaRef := TKTechCardRef.Create;
      pwiF.kartaRef.code :=  ENPlanWorkItemObj.kartaRef.code;
      pwiList := TempENPlanWorkItem.getScrollableFilteredList(pwiF,0,-1);
      if ( pwiList.totalCount  > 0 ) then
      begin
          err := 'На цей план вже є робота з кодом ' + pwiList.list[0].kartaNum +  ' у кількості ' + pwiList.list[0].countGen.DecimalString;
          Application.MessageBox(PChar(err) , PChar('Помилка !!!'), MB_ICONERROR);
          ModalResult := mrNone;
          exit;
      end;

    // усе поменялось .. СМОТРЕТЬ контроллер на серваке !!!!


      if (isChangePlanWorkitem) then
         ENPlanWorkItemObj.code := TempENPlanWorkItem.changePlanWorkItem(ENPlanWorkItemObj)
      else begin

        /////////////////////////////////////
        ENPlanWorkItemObj.code:=low(Integer);
        if  plan.kind.code = ENPLANWORKKIND_CALCULATION then // если Калькуляция то отдельный метод
        begin
          // такое поидее отрабатывает выше ..
          /// Пока 0... Этот кусок все равно не используется
          distance := TXSDecimal.Create;
          distance.DecimalString := '0';
          ///
          ENPlanWorkItemObj.code := TempENPlanWorkItem.addForCalculation(ENPlanWorkItemObj, distance);
        end
        else
          ENPlanWorkItemObj.code := TempENPlanWorkItem.add(ENPlanWorkItemObj);
        /////////////////////////////////////

      end;


      {
      case element.typeRef.code of
        1,2,3 : TempENPlanWorkItem.addBySRS(ENPlanWorkItemObj);
        5 : TempENPlanWorkItem.addBySVES(ENPlanWorkItemObj);
        6 : TempENPlanWorkItem.addBySPS(ENPlanWorkItemObj);
        7 : TempENPlanWorkItem.addByByt(ENPlanWorkItemObj);
        8 : TempENPlanWorkItem.addByProm(ENPlanWorkItemObj);
        else
        begin
          Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
          exit;
        end;
       end; }
    end
    else
    if DialogState = dsEdit then
    begin
       if  plan.kind.code = ENPLANWORKKIND_CALCULATION then // если Калькуляция то отдельный метод
       begin
         /// Пока 0... Этот кусок все равно не используется
         distance := TXSDecimal.Create;
         distance.DecimalString := '0';
         ///
         if not priconnections then
           TempENPlanWorkItem.saveForcalculation(ENPlanWorkItemObj, distance)
         else
           TempENPlanWorkItem.saveForCalculationSilent(ENPlanWorkItemObj, distance);
       end
       else
         TempENPlanWorkItem.save(ENPlanWorkItemObj);
    {
      case element.typeRef.code of
        1,2,3 : TempENPlanWorkItem.saveBySRS(ENPlanWorkItemObj);
        5 : TempENPlanWorkItem.saveBySVES(ENPlanWorkItemObj);
        6 : TempENPlanWorkItem.saveBySPS(ENPlanWorkItemObj);
        7 : TempENPlanWorkItem.saveByByt(ENPlanWorkItemObj);
        8 : TempENPlanWorkItem.saveByProm(ENPlanWorkItemObj);
        else
        begin
          Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
          exit;
        end;
      end;
     }
    end;
  end;
end;


procedure TfrmENPlanWorkItemEdit.spbEPKardClick(Sender: TObject);
var
   frmKartiShow: TfrmTKTechCardShow;
   TempTKTechCard: TKTechCardControllerSoapPort;
   tcObj: TKTechCard;
begin
   frmKartiShow:=TfrmTKTechCardShow.Create(Application,fmNormal);

   // 12.12.2011 +++ источник "Услуги со стороны"
   if inServices then
   begin
     frmKartiShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_SERVICES_FROM_SIDE);
     //DisableActions([frmKartiShow.actFilter]);
     frmKartiShow.inServices := true;
   end else
   begin
     frmKartiShow.techCardSourceCondition := 'tktechcardsource.code not in (' + IntToStr(TKTECHCARDSOURCE_SERVICES_FROM_SIDE) + ')';
     // DisableActions([frmKartiShow.actFilter], false);
   end;
      
   if isTransport then //frmKartiShow.isTransport := true;
   begin
     frmKartiShow.isTransport := true;
     frmKartiShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_TRANSPORT);
     DisableActions([frmKartiShow.actFilter]);
   end;

   if isSiz then //  источник Средства защиты
   begin
     frmKartiShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_SIZ);
     DisableActions([frmKartiShow.actFilter]);
   end;

   if isCalculation then //  источник калькуляции
   begin
      frmKartiShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS);
      DisableActions([frmKartiShow.actFilter]);
   end;

   // SUPP-67561... +++ услуги для договоров подряда на выполнение ПКД...
   if isServicesProject then
   begin
     frmKartiShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_SERVICES_FROM_SIDE);
     DisableActions([frmKartiShow.actFilter]);
     frmKartiShow.inServices := True;
     frmKartiShow.isServicesProject := True;
   end;

   try
      with frmKartiShow do
      begin
        // NET-73 Закрываем любое редактирование техкарт (оставляем только просмотр)
        // (для редактирования есть отдельный клиент!)
        DisableActions([actInsert, actEdit, actDelete]);

        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkItemObj.kartaRef = nil then ENPlanWorkItemObj.kartaRef := TKTechCardRef.Create();

               TempTKTechCard := HTTPRIOTKTechCardPWI as TKTechCardControllerSoapPort;
               tcObj := TempTKTechCard.getObject(StrToInt(GetReturnValue(sgTKTechCard,0)));

              // ENPlanWorkObj.status.code := StrToInt(GetReturnValue(sgENPlanWorkStatus,0));
               ENPlanWorkItemObj.kartaRef.code := tcObj.code; //StrToInt(GetReturnValue(sgTKTechCard,0));
               edtKartiName.Text := tcObj.name; //GetReturnValue(sgTKTechCard,2);
               edtKartiNum.Text := tcObj.techKartNumber; //GetReturnValue(sgTKTechCard,1);
               lblMeasure.Caption := 'Вимірювач : ' + tcObj.meter + ' /  Од.виміру : ' + tcObj.measurement.name;

               if tcObj.normOfTime <> nil then
                  edtNormTime.Text := tcObj.normOfTime.DecimalString
               else
                  edtNormTime.Text := 'нет в нормативе ;)';

            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmKartiShow.Free;
   end;
end;

procedure TfrmENPlanWorkItemEdit.actViewExecute(Sender: TObject);
Var TempENEstimateItem: ENEstimateItemControllerSoapPort;
     TempENHumenItem: ENHumenItemControllerSoapPort;
     TempENTransportItem: ENTransportItemControllerSoapPort;

begin
  if pcEstimate.ActivePage = tsMaterials then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsView);
    try
      //frmENEstimateItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
      if frmENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        //UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit := nil;
    end;
  end /// workers
  else
  if pcEstimate.ActivePage = tsWorkers then
  begin
     TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
     try
       ENHumenItemObj := TempENHumenItem.getObject(StrToInt(sgENHumenItem.Cells[0,sgENHumenItem.Row]));
     except
     on EConvertError do Exit;
    end;
    frmENHumenItemEdit:=TfrmENHumenItemEdit.Create(Application, dsView);
    try
      frmENHumenItemEdit.ShowModal;
    finally
      frmENHumenItemEdit.Free;
      frmENHumenItemEdit:=nil;
    end;
  end // materials
  else
  if pcEstimate.ActivePage = tsTransports then
  begin
     TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
     try
       ENTransportItemObj := TempENTransportItem.getObject(StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row]));
     except
     on EConvertError do Exit;
    end;
    frmENTransportItemEdit:=TfrmENTransportItemEdit.Create(Application, dsView);
    try
      frmENTransportItemEdit.ShowModal;
    finally
      frmENTransportItemEdit.Free;
      frmENTransportItemEdit:=nil;
    end;
  end

  // -------- Услуги ------------
  else
  if pcEstimate.ActivePage = tsServices then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
       ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItemServices.Cells[0,sgENEstimateItemServices.Row]));
     except
     on EConvertError do Exit;
    end;
      frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsView);
      frmENEstimateItemEdit.inServices := True;
    try
      frmENEstimateItemEdit.ShowModal;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit := nil;
    end;
  end;
  // -------- Услуги ------------

end;

procedure TfrmENPlanWorkItemEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;

    TempENHumenItem: ENHumenItemControllerSoapPort;
    ENHumenItemList: ENHumenItemShortList;
begin
if pcEstimate.ActivePage = tsMaterials then
begin
  for i:=1 to sgENEstimateItem.RowCount-1 do
    for j:=0 to sgENEstimateItem.ColCount-1 do
      sgENEstimateItem.Cells[j,i]:='';
end
else
if pcEstimate.ActivePage = tsWorkers then
begin
  for i:=1 to sgENHumenItem.RowCount-1 do
    for j:=0 to sgENHumenItem.ColCount-1 do
      sgENHumenItem.Cells[j,i]:='';
end;

if pcEstimate.ActivePage = tsTransports then
begin
  for i:=1 to sgENTransportItem.RowCount-1 do
    for j:=0 to sgENTransportItem.ColCount-1 do
      sgENTransportItem.Cells[j,i]:='';
end;

pcEstimateChange(Sender);


end;



procedure TfrmENPlanWorkItemEdit.actInsertExecute(Sender: TObject);
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
TempENHumenItem: ENHumenItemControllerSoapPort;
TempENTransportItem: ENTransportItemControllerSoapPort;
plan : ENPlanWork;

begin

if pcEstimate.ActivePage = tsMaterials then
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  ENEstimateItemObj := ENEstimateItem.Create;
{
  ENEstimateItemObj.countGen := TXSDecimal.Create;
  ENEstimateItemObj.countFact := TXSDecimal.Create;
  ENEstimateItemObj.dateEdit := TXSDate.Create;
}
  ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
  ENEstimateItemObj.planRef.code := ENPlanWorkItemObj.planRef.code;

  ENEstimateItemObj.planItemRef := ENPlanWorkItemRef.Create;
  ENEstimateItemObj.planItemRef.code := ENPlanWorkItemObj.code;

  ENEstimateItemObj.kindRef := ENEstimateItemKindRef.Create;
  ENEstimateItemObj.kindRef.code := ENESTIMATEITEMKIND_MATERIALS;

  try
    frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsInsert);
    frmENEstimateItemEdit.ENPlanWorkCode := ENPlanWorkItemObj.planRef.code; //ENPlanWorkObj.code;
    frmENEstimateItemEdit.ENPlanWorkItemCode := ENPlanWorkItemObj.code;
    frmENEstimateItemEdit.ENPlanWorkItemName := edtKartiName.Text;

    //frmENEstimateItemEdit.rgPlans.ItemIndex := 1;
    DisableControls([frmENEstimateItemEdit.edtPlanItem, frmENEstimateItemEdit.spbPlanItem ]);

    try
      if frmENEstimateItemEdit.ShowModal = mrOk then
      begin
        if ENEstimateItemObj <> nil then
          //TempENEstimateItem.add(ENEstimateItemObj);
          UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit := nil;
    end;
  finally
    ENEstimateItemObj.Free;
  end;
end // add MATERIALS
else
// begin workers
if pcEstimate.ActivePage = tsWorkers then
begin
  TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
  ENHumenItemObj:=ENHumenItem.Create;

   ENHumenItemObj.countGen:= TXSDecimal.Create;
   ENHumenItemObj.countFact:= TXSDecimal.Create;
   ENHumenItemObj.price:= TXSDecimal.Create;
   ENHumenItemObj.cost:= TXSDecimal.Create;
   ENHumenItemObj.dateEdit:= TXSDate.Create;

   ENHumenItemObj.planRef := ENPlanWorkRef.Create;
   ENHumenItemObj.planRef.code := ENPlanWorkItemObj.planRef.code;

   ENHumenItemObj.planItemRef := ENPlanWorkItemRef.Create;
   ENHumenItemObj.planItemRef.code := ENPlanWorkItemObj.code;

  try
    frmENHumenItemEdit:=TfrmENHumenItemEdit.Create(Application, dsInsert);
    frmENHumenItemEdit.edtCountGen.Text := '0';

    ENPlanWorkItemObj.workerCount := DMReports.getHumenCountInPlanWorkItem(ENPlanWorkItemObj.code);
    
    if (ENPlanWorkItemObj.workerCount <> LOW_INT) and (ENPlanWorkItemObj.workerCount + 1 <>0) then
    begin
      frmENHumenItemEdit.edtCountFact.Text := FloatToStr (( StrToFloat(ENPlanWorkItemObj.countGen.DecimalString) * StrToFloat(edtNormTime.Text) ) / (ENPlanWorkItemObj.workerCount + 1) ) ;
      //frmENHumenItemEdit.edtCountFact.Text := IntToStr(DMReports.getHumenCountInPlanWorkItem(ENPlanWorkItemObj.code) + 1
    end;

    //else
    //  frmENHumenItemEdit.workerCount := 1;

    DisableControls([frmENHumenItemEdit.edtCountGen]);
    try
      if frmENHumenItemEdit.ShowModal = mrOk then
      begin
        if ENHumenItemObj<>nil then
            //TempENHumenItem.add(ENHumenItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENHumenItemEdit.Free;
      frmENHumenItemEdit:=nil;
    end;
  finally
    ENHumenItemObj.Free;
  end;
end /// end workers
else
if pcEstimate.ActivePage = tsTransports then
begin
  TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
  ENTransportItemObj:=ENTransportItem.Create;

   ENTransportItemObj.countWorkGen:= TXSDecimal.Create;
   ENTransportItemObj.countWorkFact:= TXSDecimal.Create;
   ENTransportItemObj.price:= TXSDecimal.Create;
   ENTransportItemObj.cost:= TXSDecimal.Create;
   ENTransportItemObj.dateEdit:= TXSDate.Create;

   ENTransportItemObj.planRef := ENPlanWorkRef.Create;
   ENTransportItemObj.planRef.code := ENPlanWorkItemObj.planRef.code;

   ENTransportItemObj.planItemRef := ENPlanWorkItemRef.Create;
   ENTransportItemObj.planItemRef.code := ENPlanWorkItemObj.code;

  try
    frmENTransportItemEdit:=TfrmENTransportItemEdit.Create(Application, dsInsert);
    frmENTransportItemEdit.edtCountGen.Text := '0';
    DisableControls([frmENTransportItemEdit.edtCountGen]);

    {plan := DMReports.getPlanByCode(ENPlanWorkItemObj.planRef.code);
    ENTransportItemObj.distanceTo := TXSDecimal.Create;
    ENTransportItemObj.distanceTo.DecimalString := plan.distanceTo.DecimalString;
    ENTransportItemObj.distanceAlong := TXSDecimal.Create;
    ENTransportItemObj.distanceAlong.DecimalString := plan.distanceAlong.DecimalString;}

    try
      if frmENTransportItemEdit.ShowModal = mrOk then
      begin
        if ENTransportItemObj<>nil then
            //TempENHumenItem.add(ENHumenItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportItemEdit.Free;
      frmENTransportItemEdit:=nil;
    end;
  finally
    ENTransportItemObj.Free;
  end;
end; /// transporttttttttttttt



end;

procedure TfrmENPlanWorkItemEdit.actEditExecute(Sender: TObject);
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
TempENHumenItem: ENHumenItemControllerSoapPort;
TempENTransportItem: ENTransportItemControllerSoapPort;
begin

if pcEstimate.ActivePage = tsMaterials then
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  try
    ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));
  except
    on EConvertError do Exit;
  end;
  frmENEstimateItemEdit:=TfrmENEstimateItemEdit.Create(Application, dsEdit);
  try
    //frmENEstimateItemEdit.rgPlans.ItemIndex := 1;
    //DisableControls([frmENEstimateItemEdit.edtPlanItem, frmENEstimateItemEdit.spbPlanItem, frmENEstimateItemEdit.rgPlans]);

    if  ENEstimateItemObj.planRef <> nil then
    begin
        if ENEstimateItemObj.planRef.code <> low(Integer) then
        begin
            frmENEstimateItemEdit.ENPlanWorkCode := ENEstimateItemObj.planRef.code;

            if  ENEstimateItemObj.planItemRef <> nil then
            begin
                if ENEstimateItemObj.planItemRef.code <> low(Integer) then
                    frmENEstimateItemEdit.ENPlanWorkItemCode := ENEstimateItemObj.planItemRef.code
                else
                    frmENEstimateItemEdit.ENPlanWorkItemCode := -1;
            end
            else
              frmENEstimateItemEdit.ENPlanWorkItemCode := -1;
        end
        else
            frmENEstimateItemEdit.ENPlanWorkCode := -1;
    end
    else
    begin
       frmENEstimateItemEdit.ENPlanWorkCode := -1;
       frmENEstimateItemEdit.ENPlanWorkItemCode := -1;
    end;

    //frmENEstimateItemEdit.ENPlanWorkCode := 0;

    if frmENEstimateItemEdit.ShowModal= mrOk then
    begin
      //TempENEstimateItem.save(ENEstimateItemObj);
      UpdateGrid(Sender);
    end;
  finally
    frmENEstimateItemEdit.Free;
    frmENEstimateItemEdit:=nil;
  end;
end /// materials
else
if pcEstimate.ActivePage = tsWorkers then
begin
 TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
   try
     ENHumenItemObj := TempENHumenItem.getObject(StrToInt(sgENHumenItem.Cells[0,sgENHumenItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENHumenItemEdit:=TfrmENHumenItemEdit.Create(Application, dsEdit);
  //DisableControls();
  try

    ENPlanWorkItemObj.workerCount := DMReports.getHumenCountInPlanWorkItem(ENPlanWorkItemObj.code);

    if (ENPlanWorkItemObj.workerCount <> LOW_INT) and (ENPlanWorkItemObj.workerCount <>0) then
    begin
      frmENHumenItemEdit.edtCountFact.Text := FloatToStr (( StrToFloat(ENPlanWorkItemObj.countGen.DecimalString) * StrToFloat(edtNormTime.Text) ) / ENPlanWorkItemObj.workerCount ) ;
    end;

  
    if frmENHumenItemEdit.ShowModal= mrOk then
      begin
        //TempENHumenItem.save(ENHumenItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENHumenItemEdit.Free;
    frmENHumenItemEdit:=nil;
  end;
end // workers
else
if pcEstimate.ActivePage = tsTransports then
begin
  TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
  try
     ENTransportItemObj := TempENTransportItem.getObject(StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row]));
  except
     on EConvertError do Exit;
  end;

    frmENTransportItemEdit:=TfrmENTransportItemEdit.Create(Application, dsEdit);
    //departmentCode := ENPlanWorkItemObj.
    if isTransport then frmENTransportItemEdit.isTransport := true;

    try

    frmENTransportItemEdit.edtTKTransport.Text := ENTransportItemObj.transport.name;

    if ENTransportItemObj.finWorker <> nil then
      if ENTransportItemObj.finWorker.code = Low(Integer) then
        ENTransportItemObj.finWorker := nil;

      if frmENTransportItemEdit.ShowModal = mrOk then
      begin
            //TempENHumenItem.add(ENHumenItemObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTransportItemEdit.Free;
      frmENTransportItemEdit:=nil;
    end;

end // transport
else
if pcEstimate.ActivePage = tsServices then  // услуги
begin
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  try
    ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItemServices.Cells[0,sgENEstimateItemServices.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsEdit);
  frmENEstimateItemEdit.inServices := true;
  
  try

    if  ENEstimateItemObj.planRef <> nil then
    begin
        if ENEstimateItemObj.planRef.code <> low(Integer) then
        begin
            frmENEstimateItemEdit.ENPlanWorkCode := ENEstimateItemObj.planRef.code;

            if  ENEstimateItemObj.planItemRef <> nil then
            begin
                if ENEstimateItemObj.planItemRef.code <> low(Integer) then
                    frmENEstimateItemEdit.ENPlanWorkItemCode := ENEstimateItemObj.planItemRef.code
                else
                    frmENEstimateItemEdit.ENPlanWorkItemCode := -1;
            end
            else
              frmENEstimateItemEdit.ENPlanWorkItemCode := -1;
        end
        else
            frmENEstimateItemEdit.ENPlanWorkCode := -1;
    end
    else
    begin
       frmENEstimateItemEdit.ENPlanWorkCode := -1;
       frmENEstimateItemEdit.ENPlanWorkItemCode := -1;
    end;

    if frmENEstimateItemEdit.ShowModal= mrOk then
    begin
      UpdateGrid(Sender);
    end;
  finally
    frmENEstimateItemEdit.Free;
    frmENEstimateItemEdit:=nil;
  end;
end;  /// услуги

end;

procedure TfrmENPlanWorkItemEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  UpdateGrid(Sender);
end;

procedure TfrmENPlanWorkItemEdit.actDeleteExecute(Sender: TObject);
var
  ObjCode, eType: Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  TempENHumenItem: ENHumenItemControllerSoapPort;
  TempENTransportItem: ENTransportItemControllerSoapPort;
begin

if pcEstimate.ActivePage = tsMaterials then
begin
     if  Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
     begin

       TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
         try
           ObjCode := StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]);
         except
         on EConvertError do Exit;
        end;
        if Application.MessageBox(PChar('Вы действительно хотите удалить (Кошторис робіт) ?'),
                          PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
        begin
        {
            eType := DMReports.getElementTypeByEstimateItem(ObjCode);
            case eType of
              1,2,3 : TempENEstimateItem.removeBySRS(ObjCode);
              5 : TempENEstimateItem.removeBySVES(ObjCode);
              6 : TempENEstimateItem.removeBySPS(ObjCode);
              7 : TempENEstimateItem.removeByByt(ObjCode);
              8 : TempENEstimateItem.removeByProm(ObjCode);
              else
              begin
                Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
                exit;
              end;              
            end;
            }
            TempENEstimateItem.remove(ObjCode);
            UpdateGrid(Sender);
        end;
     end
     else
        Application.MessageBox(PChar('Цю строку неможливо видалити! Змінюйте фактичну кількість або видаляйте строку плану !'),
                          PChar('Увага!'),MB_ICONWARNING);

end // materials
else
if pcEstimate.ActivePage = tsWorkers then
begin
     if  Integer(sgENHumenItem.Objects[0,sgENHumenItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
     begin

       TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
         try
           ObjCode := StrToInt(sgENHumenItem.Cells[0,sgENHumenItem.Row]);
         except
         on EConvertError do Exit;
        end;
        if Application.MessageBox(PChar('Вы действительно хотите удалить (Людські ресурси) ?'),
                          PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
        begin
            TempENHumenItem.remove(ObjCode);
            UpdateGrid(Sender);
        end;
     end
     else
        Application.MessageBox(PChar('Цю строку неможливо видалити! Змінюйте фактичну кількість або видаляйте строку плану !'),
                          PChar('Увага!'),MB_ICONWARNING);
end // workers
else // transport
if pcEstimate.ActivePage = tsTransports then
begin
     if  Integer(sgENTransportItem.Objects[0,sgENTransportItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
     begin

       TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
         try
           ObjCode := StrToInt(sgENTransportItem.Cells[0,sgENTransportItem.Row]);
         except
         on EConvertError do Exit;
        end;
        if Application.MessageBox(PChar('Вы действительно хотите удалить (Транспортні ресурси) ?'),
                          PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
        begin
            TempENTransportItem.remove(ObjCode);
            UpdateGrid(Sender);
        end;
     end
     else
        Application.MessageBox(PChar('Цю строку неможливо видалити! Змінюйте фактичну кількість або видаляйте строку плану !'),
                          PChar('Увага!'),MB_ICONWARNING);
end; // transport


end;

procedure TfrmENPlanWorkItemEdit.pcEstimateChange(Sender: TObject);
Var i, j: Integer;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemList: ENEstimateItemShortList;
    TempENHumenItem: ENHumenItemControllerSoapPort;
    ENHumenItemList: ENHumenItemShortList;
    TempENTransportItem: ENTransportItemControllerSoapPort;
    ENTransportItemList: ENTransportItemShortList;
    TempENPlanWork: ENPlanWorkControllerSoapPort;
    plan: ENPlanWork;
begin

TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;
plan :=  TempENPlanWork.getObject(ENPlanWorkItemObj.planRef.code);

if pcEstimate.ActivePage = tsMaterials then
begin
 { for i:=1 to sgENEstimateItem.RowCount-1 do
    for j:=0 to sgENEstimateItem.ColCount-1 do
      sgENEstimateItem.Cells[j,i]:='';
  }
  //// Локальний кошторис ////////////////////////////////////////////////////
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
  eiColCount := 100;
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  if estimateItemFilter = nil then
  begin
    estimateItemFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(estimateItemFilter);
    SetNullXSProps(estimateItemFilter);
  end;

  if (isTransport) and (DialogState = dsEdit)
    then DisableActions([actInsert, actDelete], false);

  //if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
  //estimateItemFilter.planRef.code := ENPlanWorkItemObj.planRef.code;

  if estimateItemFilter.planItemRef = nil then estimateItemFilter.planItemRef := ENPlanWorkItemRef.Create;
  estimateItemFilter.planItemRef.code := ENPlanWorkItemObj.code;

  if estimateItemFilter.kindRef = nil then estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
  estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_MATERIALS; 

  ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

  eiLastCount := High(ENEstimateItemList.list);

  if eiLastCount > -1 then
    sgENEstimateItem.RowCount := eiLastCount + 2
  else
    sgENEstimateItem.RowCount := 2;

  with sgENEstimateItem do
     for i := 0 to eiLastCount do
     begin
       Application.ProcessMessages;

       if ENEstimateItemList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
       else
         Cells[0,i+1] := '';

       Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

       AddCheckBox(1, i+1, false, false);

       if ENEstimateItemList.list[i].countGen = nil then
         Cells[2,i+1] := ''
       else
         Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;

       if ENEstimateItemList.list[i].countFact = nil then
         Cells[3,i+1] := ''
       else
         Cells[3,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

       Cells[4,i+1] := ENEstimateItemList.list[i].measureType;

       Cells[5,i+1] := ENEstimateItemList.list[i].typeRefName;

       Cells[6,i+1] := ENEstimateItemList.list[i].statusRefName;

       // Выделяем цветом ручной ввод
       if ENEstimateItemList.list[i].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENEstimateItem.RowColor[i+1] := clMoneyGreen //$EBFFF5
       else
         sgENEstimateItem.RowColor[i+1] := clWindow;

        try
           if ((plan.kind.code = ENPLANWORKKIND_YEAR) and
               (plan.yearGen = CurrentYear+1) and
              (StrToFloat(ENEstimateItemList.list[i].countGen.DecimalString) <
              StrToFloat(ENEstimateItemList.list[i].countFact.DecimalString))) then
           RowColor[i+1] := clFuchsia;
           except
        end;

       Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

       // Выделяем цветом строки, относящиеся ко всей смете
       //if ENEstimateItemList.list[i].planItemRefCode = Low(Integer) then
       //  RowColor[i+1] := clYellow;

       eiLastRow := i + 1;
       sgENEstimateItem.RowCount := eiLastRow + 1;
     end;

   //sgENEstimateItem.RowColor[1] := clGreen;

   eiColCount := eiColCount + 1;
   sgENEstimateItem.Row := 1;
   ///////////////////////////////////////////////////////////////////////////
end// MATERIALS
else
if pcEstimate.ActivePage = tsWorkers then
begin
  {for i:=1 to sgENHumenItem.RowCount-1 do
    for j:=0 to sgENHumenItem.ColCount-1 do
      sgENHumenItem.Cells[j,i]:='';
      }
  SetGridHeaders(ENHumenItemHeaders, sgENHumenItem.ColumnHeaders);

  if (isTransport) and (DialogState = dsEdit)
    then DisableActions([actInsert, actDelete], false);

  if humenItemFilter = nil then
  begin
    humenItemFilter := ENHumenItemFilter.Create;
    SetNullIntProps(humenItemFilter);
    SetNullXSProps(humenItemFilter);
  end;

  if HumenItemFilter.planItemRef = nil then HumenItemFilter.planItemRef := ENPlanWorkItemRef.Create;
  HumenItemFilter.planItemRef.code := ENPlanWorkItemObj.code;

  TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;

  ENHumenItemList := TempENHumenItem.getScrollableFilteredList(HumenItemFilter, 0, -1);

  //eiLastCount := High(ENHumenItemList.list);

  if High(ENHumenItemList.list) > -1 then
    sgENHumenItem.RowCount := High(ENHumenItemList.list) + 2
  else
    sgENHumenItem.RowCount := 2;

    {    ( 'Код'
          ,'Посада нормативна'
          ,'Посада штатна'
          ,'Робітник'
          ,'норма часу нормативна'
          ,'норма часу скорегована'
          ,'Ціна нормачасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );
        }
  with sgENHumenItem do
     for i := 0 to High(ENHumenItemList.list) do
     begin
        Application.ProcessMessages;
        if ENHumenItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENHumenItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := ENHumenItemList.list[i].positionGenName + ' ' + ENHumenItemList.list[i].positionGenRank + ' розряду';

        Cells[2, i+1] := ENHumenItemList.list[i].finWorkerPositionName;
        Cells[3, i+1] := ENHumenItemList.list[i].finWorkerName;

        //Cells[2, i+1] := ENHumenItemList.list[i].manningTableName;
        //Cells[3, i+1] := ENHumenItemList.list[i].workerFactName;

        if ENHumenItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENHumenItemList.list[i].countGen.DecimalString;

        if ENHumenItemList.list[i].countFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENHumenItemList.list[i].countFact.DecimalString;
          {
        if ENHumenItemList.list[i].price = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENHumenItemList.list[i].price.DecimalString;
        if ENHumenItemList.list[i].cost = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENHumenItemList.list[i].cost.DecimalString;
        Cells[5,i+1] := ENHumenItemList.list[i].userGen;
        if ENHumenItemList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENHumenItemList.list[i].dateEdit);
          }
        //LastRow:=i+1;
        //sgENHumenItem.RowCount:=LastRow+1;

       // Выделяем цветом ручной ввод
       if ENHumenItemList.list[i].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENHumenItem.RowColor[i+1] := clMoneyGreen //$EBFFF5
       else
         sgENHumenItem.RowColor[i+1] := clWindow;

       Objects[0,i+1] := TObject(ENHumenItemList.list[i].typeRefCode);

  sgENHumenItem.Row := 1;
  end;
end // WORKERSSSSSSSSSS
else
if pcEstimate.ActivePage = tsTransports then
begin
  for i:=1 to sgENTransportItem.RowCount-1 do
    for j:=0 to sgENTransportItem.ColCount-1 do
      sgENHumenItem.Cells[j,i]:='';
  SetGridHeaders(ENTransportItemHeaders, sgENTransportItem.ColumnHeaders);

  if (isTransport) and (pcEstimate.ActivePage = tsTransports) and (DialogState = dsEdit)
    then DisableActions([actInsert, actDelete]);

  if transportItemFilter = nil then
  begin
    transportItemFilter := ENTransportItemFilter.Create;
    SetNullIntProps(transportItemFilter);
    SetNullXSProps(transportItemFilter);
  end;

  if TransportItemFilter.planItemRef = nil then TransportItemFilter.planItemRef := ENPlanWorkItemRef.Create;
  TransportItemFilter.planItemRef.code := ENPlanWorkItemObj.code;

  TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

  ENTransportItemList := TempENTransportItem.getScrollableFilteredList(TransportItemFilter, 0, -1);

  //eiLastCount := High(ENHumenItemList.list);

  if High(ENTransportItemList.list) > -1 then
    sgENTransportItem.RowCount := High(ENTransportItemList.list) + 2
  else
    sgENTransportItem.RowCount := 2;
           {
        ( 'Код'
          ,'Транспорт нормативний'
          ,'Транспорт штатний'
          ,'Робітник'
          ,'норма часу нормативна'
          ,'норма часу скорегована'
          ,'Ціна нормачасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
          }
  with sgENTransportItem do
     for i := 0 to High(ENTransportItemList.list) do
     begin
        Application.ProcessMessages;
        if ENTransportItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTransportItemList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1, i+1] := ENTransportItemList.list[i].transportName;
        Cells[2, i+1] := ENTransportItemList.list[i].transportRealName;
        //Cells[3, i+1] := ENTransportItemList.list[i].workerFactName;

        Cells[3, i+1] := ENTransportItemList.list[i].finWorkerName;

        //Cells[1,i+1] := ENTransportItemList.list[i].

        if ENTransportItemList.list[i].countWorkGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[i].countWorkGen.DecimalString;

        if ENTransportItemList.list[i].countWorkFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransportItemList.list[i].countWorkFact.DecimalString;
{
        if ENTransportItemList.list[i].price = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransportItemList.list[i].price.DecimalString;

        if ENTransportItemList.list[i].cost = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[i].cost.DecimalString;

        if ENTransportItemList.list[i].countWorkGen = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransportItemList.list[i].countWorkGen.DecimalString;
}

        Cells[6, i +1 ] := ENTransportItemList.list[i].tktransportTypeName;

        if ENTransportItemList.list[i].distance <> nil then
           Cells[7, i + 1] := ENTransportItemList.list[i].distance.DecimalString
        else
           Cells[7, i + 1] := '';

        Cells[8,i+1] := ENTransportItemList.list[i].userGen;

        if ENTransportItemList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(ENTransportItemList.list[i].dateEdit);
        //LastRow:=i+1;
        //sgENHumenItem.RowCount:=LastRow+1;

                       // Выделяем цветом ручной ввод
       if ENTransportItemList.list[i].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENTransportItem.RowColor[i+1] := clMoneyGreen //$EBFFF5
       else
         sgENTransportItem.RowColor[i+1] := clWindow;

       Objects[0,i+1] := TObject(ENTransportItemList.list[i].typeRefCode);

  sgENTransportItem.Row := 1;
  end;
end // TRANSPORT
else
if pcEstimate.ActivePage = tsServices then   // послуги
begin
  //// Локальний кошторис ////////////////////////////////////////////////////
  SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItemServices.ColumnHeaders);
  eiColCount := 100;
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  if estimateItemFilter = nil then
  begin
    estimateItemFilter := ENEstimateItemFilter.Create;
    SetNullIntProps(estimateItemFilter);
    SetNullXSProps(estimateItemFilter);
  end;

  if (isTransport) and (DialogState = dsEdit)
    then DisableActions([actInsert, actDelete], false);

  if estimateItemFilter.planItemRef = nil then estimateItemFilter.planItemRef := ENPlanWorkItemRef.Create;
  estimateItemFilter.planItemRef.code := ENPlanWorkItemObj.code;

  if estimateItemFilter.kindRef = nil then estimateItemFilter.kindRef := ENEstimateItemKindRef.Create;
  estimateItemFilter.kindRef.code := ENESTIMATEITEMKIND_SERVICES; 

  ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, -1);

  eiLastCount := High(ENEstimateItemList.list);

  if eiLastCount > -1 then
    sgENEstimateItemServices.RowCount := eiLastCount + 2
  else
    sgENEstimateItemServices.RowCount := 2;

  with sgENEstimateItemServices do
     for i := 0 to eiLastCount do
     begin
       Application.ProcessMessages;

       if ENEstimateItemList.list[i].code <> Low(Integer) then
         Cells[0,i+1] := IntToStr(ENEstimateItemList.list[i].code)
       else
         Cells[0,i+1] := '';

       Cells[1,i+1] := ENEstimateItemList.list[i].materialRefName;

       AddCheckBox(1, i+1, false, false);

       if ENEstimateItemList.list[i].countGen = nil then
         Cells[2,i+1] := ''
       else
         Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;

       if ENEstimateItemList.list[i].countFact = nil then
         Cells[3,i+1] := ''
       else
         Cells[3,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

       Cells[4,i+1] := ENEstimateItemList.list[i].measureType;

       Cells[5,i+1] := ENEstimateItemList.list[i].typeRefName;

       Cells[6,i+1] := ENEstimateItemList.list[i].statusRefName;

       // Выделяем цветом ручной ввод
       if ENEstimateItemList.list[i].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENEstimateItemServices.RowColor[i+1] := clMoneyGreen //$EBFFF5
       else
         sgENEstimateItemServices.RowColor[i+1] := clWindow;

       Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

       // Выделяем цветом строки, относящиеся ко всей смете
       //if ENEstimateItemList.list[i].planItemRefCode = Low(Integer) then
       //  RowColor[i+1] := clYellow;

       eiLastRow := i + 1;
       sgENEstimateItemServices.RowCount := eiLastRow + 1;
     end;

   //sgENEstimateItem.RowColor[1] := clGreen;

   eiColCount := eiColCount + 1;
   sgENEstimateItemServices.Row := 1;
   ///////////////////////////////////////////////////////////////////////////
end; // послуги

end;

// УБРАТЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬЬ когда разберуться РЗА и СПС с планами 2010 года!!!
procedure TfrmENPlanWorkItemEdit.spbPlanWorkClick(Sender: TObject);
Var
//TempENAct2ENPlanWork: ENAct2ENPlanWorkControllerSoapPort;
frmENPlanWorkShow : TfrmENPlanWorkShow;
planFilter : ENPlanWorkFilter;
plan : ENPlanWork;
begin

  //frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application,fmChild);

  plan := DMReports.getPlanByCode(ENPlanWorkItemObj.planRef.code);

  planFilter := ENPlanWorkFilter.Create;
  SetNullIntProps(planFilter);
  SetNullXSProps(planFilter);


  planFilter.kind := ENPlanWorkKind.Create;
  //planFilter.kind.code := ENPLANWORKKIND_NPZ; // HPZ only ...
  planFilter.kind.code :=  plan.kind.code;

  planFilter.stateRef := ENPlanWorkStateRef.Create();
  planFilter.stateRef.code := plan.stateRef.code;

  planFilter.yearGen := plan.yearGen;
  planFilter.monthGen := plan.monthGen;

  planFilter.budgetRef := ENDepartmentRef.Create;
  planFilter.budgetRef.code := plan.budgetRef.code;


  planFilter.conditionSQL := ' elementrefcode in (select enelement.code from enelement where enelement.typerefcode in '+
                             '('+ IntToStr(EN_SUBSTATION150) +',' + IntToStr(EN_RZA)+ '))';


  //planFilter.status := ENPlanWorkStatus.Create;
  //planFilter.status.code := ENPLANWORKSTATUS_LOCKED;

  try
    frmENPlanWorkShow := TfrmENPlanWorkShow.Create(Application, fmNormal, planFilter);

    try

      DisableActions([ frmENPlanWorkShow.actInsert, frmENPlanWorkShow.actEdit, frmENPlanWorkShow.actDelete,
                       frmENPlanWorkShow.actFilter, frmENPlanWorkShow.actNoFilter, frmENPlanWorkShow.actAddPlanItems
                      ]);
      frmENPlanWorkShow.sgENPlanWork.PopupMenu := nil;

      frmENPlanWorkShow.isFiltered := true;

      if frmENPlanWorkShow.ShowModal = mrOk then

      begin
        if ENPlanWorkItemObj <>nil then
        begin
          ENPlanWorkItemObj.planRef.code := StrToInt( frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork,0) );
          edtPlanWork.Text := frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork,2) + ' дата: ' +
           frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork,6) + ' об: ' +
           frmENPlanWorkShow.GetReturnValue(frmENPlanWorkShow.sgENPlanWork,1) ;
        end;
      end;
    finally
      frmENPlanWorkShow.Free;
      frmENPlanWorkShow:=nil;
    end;
  finally
    //planFilter.Free;
    //ENAct2ENPlanWorkObj.Free;
  end;

end;

procedure TfrmENPlanWorkItemEdit.spbKoefClick(Sender: TObject);
var
   frmENPlanWorkItem2TKKoefShow : TfrmENPlanWorkItem2TKKoefShow;
   flt : ENPlanWorkItem2TKKoefFilter;

  kObj : TKTechCard;
  TempKarti: TKTechCardControllerSoapPort;
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
begin

   flt := ENPlanWorkItem2TKKoefFilter.Create;
   SetNullIntProps(flt);
   SetNullXSProps(flt);
   flt.planWorkItemRef := ENPlanWorkItemRef.Create;
   flt.planWorkItemRef.code :=  ENPlanWorkItemObj.code;

   frmENPlanWorkItem2TKKoefShow := TfrmENPlanWorkItem2TKKoefShow.Create(Application,fmNormal, flt);

   try
      frmENPlanWorkItem2TKKoefShow.DisableActions([frmENPlanWorkItem2TKKoefShow.actFilter,
                                                   frmENPlanWorkItem2TKKoefShow.actNoFilter
                                                  ]);

      TempKarti :=  HTTPRIOKarti as TKTechCardControllerSoapPort;
      kObj := TempKarti.getObject(ENPlanWorkItemObj.kartaRef.code);

      frmENPlanWorkItem2TKKoefShow.DisableActions([frmENPlanWorkItem2TKKoefShow.actInsert,
                                                   frmENPlanWorkItem2TKKoefShow.actEdit,
                                                   frmENPlanWorkItem2TKKoefShow.actDelete],
                                                   (DialogState = dsView)
                                                  );
      // if (DialogState = dsInsert) or (DialogState = dsEdit) then

      frmENPlanWorkItem2TKKoefShow.techCardSource :=  kObj.techcardsource.code;
      with frmENPlanWorkItem2TKKoefShow do
      begin

        if ShowModal = mrOk then
        begin

        end;

        recalcKoef();

        TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
        ENPlanWorkItemObj := TempENPlanWorkItem.getObject( ENPlanWorkItemObj.code );
        // :)
        Self.FormShow(Sender);

      end;
   finally
      frmENPlanWorkItem2TKKoefShow.Free;
   end;
end;

procedure TfrmENPlanWorkItemEdit.actZeroCountExecute(Sender: TObject);
var i, eiCode: Integer;
    state, checked: Boolean;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    ENEstimateItemObj: ENEstimateItem;
begin
  if Application.MessageBox(PChar('Вы действительно хотите обнулить количество у выбранных материалов?'),
                            PChar('Внимание!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

  checked := false;

  for i := 1 to sgENEstimateItem.RowCount - 1 do
  begin
    sgENEstimateItem.GetCheckBoxState(1, i, state);

    if state then
    begin
      checked := true;

      try
        eiCode := StrToInt(sgENEstimateItem.Cells[0, i]);
      except
        on EConvertError do Continue;
      end;

      if eiCode < 0 then Continue;

      ENEstimateItemObj := TempENEstimateItem.getObject(eiCode);

      if ENEstimateItemObj <> nil then
        if ENEstimateItemObj.code > LOW_INT then
        begin
          ENEstimateItemObj.countFact.DecimalString := '0';
          TempENEstimateItem.save(ENEstimateItemObj);
        end;
    end;
  end;

  if checked then
    UpdateGrid(Sender);
end;

procedure TfrmENPlanWorkItemEdit.actCheckAllExecute(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENEstimateItem.RowCount - 1 do
    sgENEstimateItem.SetCheckBoxState(1, i, true);
end;

procedure TfrmENPlanWorkItemEdit.actUncheckAllExecute(Sender: TObject);
var i: Integer;
begin
  for i := 1 to sgENEstimateItem.RowCount - 1 do
    sgENEstimateItem.SetCheckBoxState(1, i, false);
end;

procedure TfrmENPlanWorkItemEdit.btnEditForOrderClick(Sender: TObject);
var TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin
  if pcEstimate.ActivePage = tsMaterials then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));
    except
      on EConvertError do Exit;
    end;
    frmENEstimateItemEdit:=TfrmENEstimateItemEdit.Create(Application, dsEdit);
    try
      //frmENEstimateItemEdit.rgPlans.ItemIndex := 1;
      //DisableControls([frmENEstimateItemEdit.edtPlanItem, frmENEstimateItemEdit.spbPlanItem, frmENEstimateItemEdit.rgPlans]);

      frmENEstimateItemEdit.isForOrder := true;

      if  ENEstimateItemObj.planRef <> nil then
      begin
          if ENEstimateItemObj.planRef.code <> low(Integer) then
          begin
              frmENEstimateItemEdit.ENPlanWorkCode := ENEstimateItemObj.planRef.code;

              if  ENEstimateItemObj.planItemRef <> nil then
              begin
                  if ENEstimateItemObj.planItemRef.code <> low(Integer) then
                      frmENEstimateItemEdit.ENPlanWorkItemCode := ENEstimateItemObj.planItemRef.code
                  else
                      frmENEstimateItemEdit.ENPlanWorkItemCode := -1;
              end
              else
                frmENEstimateItemEdit.ENPlanWorkItemCode := -1;
          end
          else
              frmENEstimateItemEdit.ENPlanWorkCode := -1;
      end
      else
      begin
         frmENEstimateItemEdit.ENPlanWorkCode := -1;
         frmENEstimateItemEdit.ENPlanWorkItemCode := -1;
      end;

      //frmENEstimateItemEdit.ENPlanWorkCode := 0;

      if frmENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempENEstimateItem.save(ENEstimateItemObj);
        UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit:=nil;
    end;
  end; /// materials
end;


procedure TfrmENPlanWorkItemEdit.FormCreate(Sender: TObject);
begin
  inherited;

  isChangePlanWorkitem := False;
  priconnections := False;
  isServicesProject := False;

  planObj := nil;
end;


procedure TfrmENPlanWorkItemEdit.FormDestroy(Sender: TObject);
begin
  planObj := nil;

  inherited;
end;

end.
