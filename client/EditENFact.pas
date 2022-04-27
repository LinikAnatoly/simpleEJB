unit EditENFact;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkController

  ;

type
  TfrmENFactEdit = class(TDialogForm)
  

  HTTPRIOENPlanWork: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcPlanWork: TPageControl;
    tsPlanWork: TTabSheet;
    tsPlanWorkItems: TTabSheet;
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    lblYearGen: TLabel;
    lblMonthGen: TLabel;
    lblCommentGen: TLabel;
    edtCommentGen: TEdit;
    spbENPlanWorkStatus: TSpeedButton;
    edtENPlanWorkStatusName: TEdit;
    lblENPlanWorkStatusName: TLabel;
    lblEnElement: TLabel;
    edtENElementName: TEdit;
    spbENElement: TSpeedButton;
    edtYearGen: TComboBox;
    edtMonthGen: TComboBox;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgENPlanWorkItem: TAdvStringGrid;
    ImageList1: TImageList;
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
    HTTPRIOENPlanWorkItem: THTTPRIO;
    HTTPRIOENElement: THTTPRIO;
    tsEstimateItems: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    HTTPRIOENEstimateItem: THTTPRIO;
    btnPlanReport: TButton;
    lblTypeName: TLabel;
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    tsMoves: TTabSheet;
    tsCorrections: TTabSheet;
    sgENPlanWorkMoveHistory: TAdvStringGrid;
    HTTPRIOENPlanWorkMoveHistory: THTTPRIO;
    sgENPlanCorrectHistory: TAdvStringGrid;
    HTTPRIOENPlanCorrectHistory: THTTPRIO;
    lblENBudgetName: TLabel;
    edtENBudgetName: TEdit;
    spbENBudget: TSpeedButton;
    lblResponsibility: TLabel;
    edtResponsibility: TEdit;
    spbResponsibility: TSpeedButton;
    lblDepartment: TLabel;
    edtDepartment: TEdit;
    spbDepartment: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;


    
    lblDateStart: TLabel;
    lblDateFinal: TLabel;
    edtDateFinal: TDateTimePicker;
    edtDateStart: TDateTimePicker;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    HTTPRIOENPlanWorkType: THTTPRIO;
    tsHumens: TTabSheet;
    sgENEstimateItem: TAdvStringGrid;
    tsTransports: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    ToolBar4: TToolBar;
    ToolButton22: TToolButton;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton27: TToolButton;
    ToolButton28: TToolButton;
    sgENHumenItem: TAdvStringGrid;
    sgENTransportItem: TAdvStringGrid;
    HTTPRIOENHumenItem: THTTPRIO;
    HTTPRIOENTransportItem: THTTPRIO;
    lblENPlanWorkKindKindName: TLabel;
    edtENPlanWorkKindKindName: TEdit;
    spbENPlanWorkKindKind: TSpeedButton;
    cbPlanWorkKind: TComboBox;
    actMaterialBinding: TAction;
    N5: TMenuItem;
    N9: TMenuItem;
    lblDistanceTo: TLabel;
    edtDistanceTo: TEdit;
    lblDistanceAlong: TLabel;
    edtDistanceAlong: TEdit;
    gbFINMaterials: TGroupBox;
    sgFINMaterials: TAdvStringGrid;
    HTTPRIOFINMaterials: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENPlanWorkStatusClick(Sender : TObject);
    procedure spbENElementClick(Sender: TObject);
    procedure pcPlanWorkChange(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);

  procedure UpdateGrid(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure btnPlanReportClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure sgENPlanCorrectHistoryDblClick(Sender: TObject);
    procedure spbENBudgetClick(Sender: TObject);
    procedure spbResponsibilityClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure edtDateStartClick(Sender: TObject);
    procedure actMaterialBindingExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure sgENEstimateItemClick(Sender: TObject);

    procedure updateFINMaterialsGrid(estimateItemCode : Integer);

  private
    { Private declarations }
  public
    { Public declarations }
      ENPlanWorkObj: ENPlanWork;

end;

var
  frmENFactEdit: TfrmENFactEdit;
  //ENPlanWorkObj: ENPlanWork;

implementation

uses
  ShowENPlanWorkStatus
  ,ENPlanWorkStatusController
, ShowENElement, ENElementController, ENPlanWorkItemController,
  EditENPlanWorkItem, EditENLine04, ENEstimateItemController,

  EditENFactEstimateItem, ENConsts, DMReportsUnit, ENPlanWorkTypeController,

  ENPlanWorkMoveHistoryController, ENPlanCorrectHistoryController,
  ShowEPDepartment, ENDepartmentController, ShowENDepartment,
  ENDepartmentTypeController
  ,ShowENPlanWorkType

  , ENHumenItemController, ENTransportItemController,
  ENPlanWorkKindController
  , DateUtils
  , EditMaterialToPlanItemBinding, EditENHumenItem, EditENTransportItem,
  EditENPlanWork, EditENFactItem, EditENEstimateItem,
  FINMaterialsController, FINMaterialsStatusController;

{uses  
    EnergyproController, EnergyproController2, ENPlanWorkController  ;
}
{$R *.dfm}

var
  planItemFilter: ENPlanWorkItemFilter;
  estimateItemFilter: ENEstimateItemFilter;
  moveFilterObject : ENPlanWorkMoveHistoryFilter;
  corrFilterObject : ENPlanCorrectHistoryFilter;

  ENPlanWorkItemHeaders: array [1..9] of String =
        ( 'Код'
          ,'Код роботи'
          ,'Робота'
          ,'кількість'
          ,'норма часу на од.'
          ,'Вимірювач'
          ,'Од. виміру'
          ,'користувач, що вніс зміни'
          ,'дата останньої зміни'
        );

  ENEstimateItemHeaders: array [1..10] of String =
        ( 'Код'
          ,'Матеріал'
          ,'кількість нормативна'
          ,'кількість скорегована'
          ,'од. виміру'
          ,'код роботи'
          ,'робота'
          ,'тип строки кошторису'
          ,'користувач, що вніс зміни'
          ,'дата останньої зміни'
        );

  ENPlanWorkMoveHistoryHeaders: array [1..7] of String =
        ( 'Код'
          ,'Дата зміни плану'
          ,'Попередній рік для виконання плану'
          ,'Попередній місяц для виконання плану'
          ,'Причина зміни'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );

  ENPlanCorrectHistoryHeaders: array [1..5] of String =
        ( 'Код'
          ,'Дата коригування плану'
          ,'Причина коригування'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );

  ENHumenItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'Посада нормативна'
          ,'Посада штатна'
          ,'Робітник'
          ,'норма часу нормативна'
          ,'норма часу скорегована'
          ,'код роботи'
          ,'робота'
          ,'Ціна нормочасу'
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
          ,'код роботи'
          ,'робота'
          ,'Ціна нормочасу'
          ,'Вартість нормочасу'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
        );

  FINMaterialsShortHeaders: array [1..8] of String =
        ( 'Код'
          ,'Матеріал'
          ,'од. виміру'
          ,'номенклатурний номер'
          ,'кількість'
          ,'ціна'
          ,'вартість'
          ,'МОЛ'
          //,'тип строки кошторису'
          //,'користувач, що вніс зміни'
          //,'дата останньої зміни'
        );
                        
  iColCount, iLastCount: Integer;
  iLastRow: Integer = 1;

  eiColCount, eiLastCount: Integer;
  eiLastRow: Integer = 1;
  selectedRow : Integer;

  
procedure TfrmENFactEdit.FormShow(Sender: TObject);
var
 eFilter : ENElementFilter;
 eList : ENElementShortList;
 TempENElement: ENElementControllerSoapPort;
 TempENDepartment: ENDepartmentControllerSoapPort;
 typeObj : ENPlanWorkType;
 TempENPlanWorkType : ENPlanWorkTypeControllerSoapPort;
begin

  SetFloatStyle([edtDistanceTo, edtDistanceAlong]);

  if tsPlanWork.TabVisible then
    pcPlanWork.ActivePage := tsPlanWork;

  //HideControls([btnPlanReport]{, DialogState = dsInsert});
  DisableControls([edtEPRenName, edtENElementName
      ,edtENBudgetName
      ,edtResponsibility
      ,edtDepartment
      ,edtTypeName
  ]);

  //HideControls([btnMaterialBinding], DialogState in [dsInsert, dsView]);

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    //DisableControls([edtENElementName]);
    DenyBlankValues([
      edtYearGen
      ,edtMonthGen
      ,edtENElementName
      ,edtENBudgetName
      ,edtResponsibility
      ,edtDepartment
      ,edtDateStart
      ,edtDateFinal
      ,edtTypeName
     ]);
   end;

  if  (DialogState = dsInsert) then
  begin
     if ENPlanWorkObj.status = nil then ENPlanWorkObj.status := ENPlanWorkStatus.Create;
     ENPlanWorkObj.status.code := 1;

     tsPlanWorkItems.TabVisible := false;
     tsEstimateItems.TabVisible := false;
     tsMoves.TabVisible := false;
     tsCorrections.TabVisible := false;
     tsHumens.TabVisible := false;
     tsTransports.TabVisible := false;

     edtDateStartClick(Sender);
  end;

  if  (DialogState = dsView) then
  begin
    DisableControls([spbResponsibility ,spbENBudget, spbDepartment, spbType]);
    DisableActions([actInsert, actEdit, actDelete, actMaterialBinding]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      //if ENPlanWorkObj.status.code = ENPLANWORKSTATUS_LOCKED then
      if ENPlanWorkObj.status.code in [ENPLANWORKSTATUS_LOCKED, ENPLANWORKSTATUS_CORRECTED] then
      begin
          DisableControls([edtYearGen, edtMonthGen]);
      end;

      if ENPlanWorkObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(ENPlanWorkObj.dateGen.Year,ENPlanWorkObj.dateGen.Month,ENPlanWorkObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;

      if ENPlanWorkObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENPlanWorkObj.dateStart.Year,ENPlanWorkObj.dateStart.Month,ENPlanWorkObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;
      if ENPlanWorkObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENPlanWorkObj.dateFinal.Year,ENPlanWorkObj.dateFinal.Month,ENPlanWorkObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;

            
    if ( ENPlanWorkObj.yearGen <> Low(Integer) ) then
       //edtYearGen.Text := IntToStr(ENPlanWorkObj.yearGen)
       edtYearGen.ItemIndex := ENPlanWorkObj.yearGen - 2009
    else
       //edtYearGen.Text := '';
       edtYearGen.ItemIndex := -1;
    if ( ENPlanWorkObj.monthGen <> Low(Integer) ) then
       //edtMonthGen.Text := IntToStr(ENPlanWorkObj.monthGen)
       edtMonthGen.ItemIndex := ENPlanWorkObj.monthGen - 1
    else
       //edtMonthGen.Text := '';
       edtMonthGen.ItemIndex := -1;
    edtCommentGen.Text := ENPlanWorkObj.commentGen;

    if ( ENPlanWorkObj.distanceTo <> nil ) then
       edtDistanceTo.Text := ENPlanWorkObj.distanceTo.decimalString
    else
       edtDistanceTo.Text := '';
    if ( ENPlanWorkObj.distanceAlong <> nil ) then
       edtDistanceAlong.Text := ENPlanWorkObj.distanceAlong.decimalString
    else
       edtDistanceAlong.Text := '';

{    edtUserGen.Text := ENPlanWorkObj.userGen;
      if ENPlanWorkObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENPlanWorkObj.dateEdit.Year,ENPlanWorkObj.dateEdit.Month,ENPlanWorkObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;

    edtENPlanWorkStatusName.Text := ENPlanWorkObj.status.name;
}

{
    cbTypeName.ItemIndex := -1;
    if ENPlanWorkObj.typeRef <> nil then
      if ENPlanWorkObj.typeRef.code <> Low(Integer) then
        cbTypeName.ItemIndex := ENPlanWorkObj.typeRef.code - 1;
}

    if  ENPlanWorkObj.typeRef = nil then
       ENPlanWorkObj.typeRef := ENPlanWorkTypeRef.Create
    else
    if  ENPlanWorkObj.typeRef.code > Low(Integer) then
    begin

         try

             TempENPlanWorkType :=  HTTPRIOENPlanWorkType as ENPlanWorkTypeControllerSoapPort;
             typeObj := TempENPlanWorkType.getObject(ENPlanWorkObj.typeRef.code);
             if typeObj <> nil then
             begin
                 edtTypeName.Text := typeObj.name;
             end;
         finally

         end;
    end;
      if ENPlanWorkObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(ENPlanWorkObj.dateStart.Year,ENPlanWorkObj.dateStart.Month,ENPlanWorkObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;
      if ENPlanWorkObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(ENPlanWorkObj.dateFinal.Year,ENPlanWorkObj.dateFinal.Month,ENPlanWorkObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;

    cbPlanWorkKind.ItemIndex := ENPlanWorkObj.kind.code - 1;


    if ENPlanWorkObj.elementRef.code > Low(Integer) then
    begin
       eFilter := ENElementFilter.Create;
       try
         SetNullIntProps(eFilter);
         SetNullXSProps(eFilter);

         //s04Filter.conditionSQL := '';
         eFilter.code := ENPlanWorkObj.elementRef.code;
         //eFilter.element.code := ENLine04Obj.element.elementInRef.code;

         TempENElement :=  HTTPRIOENElement as ENElementControllerSoapPort;
         eList := TempENElement.getScrollableFilteredList(eFilter,0,-1);
         if eList.totalCount > 0 then
         begin
             edtENElementName.Text := eList.list[0].objectName;

             frmENPlanWorkEdit.Caption := 'План робіт для ' + eList.list[0].objectName;

             edtEPRenName.Text := eList.list[0].renRefName;
             DisableControls([edtENElementName, spbENElement, edtEPRenName]);
         end;
       finally
         eFilter.Free;
       end;
    end
    else
    begin
       edtENElementName.Text := '';
       edtEPRenName.Text := '';
    end;

      if ENPlanWorkObj.budgetRef <> nil then
        if ENPlanWorkObj.budgetRef.code <> low(Integer) then
        begin
          TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

          edtENBudgetName.Text := TempENDepartment.getObject(ENPlanWorkObj.budgetRef.code).shortName;
        end;

      if ENPlanWorkObj.responsibilityRef <> nil then
        if ENPlanWorkObj.responsibilityRef.code <> low(Integer) then
        begin
          TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

          edtResponsibility.Text := TempENDepartment.getObject(ENPlanWorkObj.responsibilityRef.code).shortName;
        end;

      if ENPlanWorkObj.departmentRef <> nil then
        if ENPlanWorkObj.departmentRef.code <> low(Integer) then
        begin
          TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

          edtDepartment.Text := TempENDepartment.getObject(ENPlanWorkObj.departmentRef.code).shortName;
        end;

  end;

  tsPlanWork.Enabled := false;
end;



procedure TfrmENFactEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWork: ENPlanWorkControllerSoapPort;
    TempENElement: ENElementControllerSoapPort;
    element : ENElement;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtYearGen
      ,edtMonthGen
      ,edtENElementName
      ,edtENBudgetName
      ,edtResponsibility
      ,edtDepartment
      ,edtDateStart
      ,edtDateFinal
      ,edtTypeName      
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    {if cbTypeName.ItemIndex = -1 then
    begin
      Application.MessageBox(PChar('Оберіть вид ремонту !'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
      if cbTypeName.CanFocus then cbTypeName.SetFocus;
      Action := caNone;
      Exit;
    end;
    }
    TempENPlanWork := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    if edtDateGen.Checked then
    begin
      if ENPlanWorkObj.dateGen = nil then
        ENPlanWorkObj.dateGen := TXSDate.Create;
      ENPlanWorkObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
    end else
      ENPlanWorkObj.dateGen := nil;

     if edtdateStart.checked then
     begin 
       if ENPlanWorkObj.dateStart = nil then
          ENPlanWorkObj.dateStart := TXSDate.Create;
       ENPlanWorkObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       ENPlanWorkObj.dateStart := nil;

     if edtdateFinal.checked then
     begin 
       if ENPlanWorkObj.dateFinal = nil then
          ENPlanWorkObj.dateFinal := TXSDate.Create;
       ENPlanWorkObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       ENPlanWorkObj.dateFinal := nil;

     if ENPlanWorkObj.kind = nil then ENPlanWorkObj.kind := ENPlanWorkKind.Create;
     ENPlanWorkObj.kind.code := cbPlanWorkKind.ItemIndex + 1;

     //if ( edtYearGen.Text <> '' ) then
     //  ENPlanWorkObj.yearGen := StrToInt(edtYearGen.Text)
     if (edtYearGen.ItemIndex >= 0) then
       ENPlanWorkObj.yearGen := edtYearGen.ItemIndex + 2009
     else
       ENPlanWorkObj.yearGen := Low(Integer) ;

     //if ( edtMonthGen.Text <> '' ) then
       //ENPlanWorkObj.monthGen := StrToInt(edtMonthGen.Text)
     if (edtMonthGen.ItemIndex >= 0) then
       ENPlanWorkObj.monthGen := edtMonthGen.ItemIndex + 1
     else
       ENPlanWorkObj.monthGen := Low(Integer) ;

     ENPlanWorkObj.commentGen := edtCommentGen.Text;

     ENPlanWorkObj.distanceTo := TXSDecimal.Create;
     if edtDistanceTo.Text <> '' then
       ENPlanWorkObj.distanceTo.decimalString := edtDistanceTo.Text
     else
       ENPlanWorkObj.distanceTo := nil;

     ENPlanWorkObj.distanceAlong := TXSDecimal.Create;
     if edtDistanceAlong.Text <> '' then
       ENPlanWorkObj.distanceAlong.decimalString := edtDistanceAlong.Text
     else
       ENPlanWorkObj.distanceAlong := nil;
       {
     ENPlanWorkObj.userGen := edtUserGen.Text;

     if ENPlanWorkObj.dateEdit = nil then
        ENPlanWorkObj.dateEdit := TXSDate.Create;
      ENPlanWorkObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
}

      {
      if ENPlanWorkObj.typeRef = nil then
        ENPlanWorkObj.typeRef := ENPlanWorkTypeRef.Create;
      ENPlanWorkObj.typeRef.code := cbTypeName.ItemIndex + 1;
      }

    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    TempENElement := HTTPRIOENElement as ENElementControllerSoapPort;
    element := TempENElement.getObject(ENPlanWorkObj.elementRef.code);


    if DialogState = dsInsert then
    begin
      ENPlanWorkObj.code:=low(Integer);
      case element.typeRef.code of
        1,2,3 : TempENPlanWork.addBySRS(ENPlanWorkObj);
        5 : TempENPlanWork.addBySVES(ENPlanWorkObj);
        6 : TempENPlanWork.addBySPS(ENPlanWorkObj);
        else
        begin
          Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
          exit;
        end;
      end;
    end
    else
    if DialogState = dsEdit then
    begin
      case element.typeRef.code of
        1,2,3 : TempENPlanWork.saveBySRS(ENPlanWorkObj);
        5 : TempENPlanWork.saveBySVES(ENPlanWorkObj);
        6 : TempENPlanWork.saveBySPS(ENPlanWorkObj);
        else
        begin
          Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
          exit;
        end;
      end;

    end;
  end;
end;

procedure TfrmENFactEdit.spbENPlanWorkStatusClick(Sender : TObject);
var
   frmENPlanWorkStatusShow: TfrmENPlanWorkStatusShow;
begin
   frmENPlanWorkStatusShow:=TfrmENPlanWorkStatusShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkStatusShow do
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkObj.status = nil then ENPlanWorkObj.status := ENPlanWorkStatus.Create();
               ENPlanWorkObj.status.code := StrToInt(GetReturnValue(sgENPlanWorkStatus,0));
               edtENPlanWorkStatusName.Text := GetReturnValue(sgENPlanWorkStatus,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENPlanWorkStatusShow.Free;
   end;
end;



procedure TfrmENFactEdit.spbENElementClick(Sender: TObject);
var
   frmENElementShow: TfrmENElementShow;
   f : ENElementFilter;
   invNum , depName: String;
   depCode : Integer;
   depShort : ENDepartmentShort;
   //o : EN
begin
   f := ENElementFilter.Create;
     SetNullIntProps(f);
     SetNullXSProps(f);
     f.orderBySQL := 'typerefcode';
     //f.conditionSQL := 'code in (select elementrefcode from enline10 union all select elementcode from enlin150 union all select elementrefcode from ensubstation10 union all select elementrefcode from ensubstation150)
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal, f);
   try

      with frmENElementShow do
        if ShowModal = mrOk then
        begin

            try
               //enObj := DMReports.getIByElement(StrToInt(GetReturnValue(sgENElement,0)));
               invNum := GetReturnValue(sgENElement,3) ; //DMReports.getInvNumByElement(StrToInt(GetReturnValue(sgENElement,0)));
               if (length(invNum) < 5) then
               begin
                   Application.MessageBox(PChar('Плани можливо заносити тільки для об"єктів з інвентарним номером !!!' + ' ' + invNum +' < 5 символов'), PChar('Ошибка'), MB_ICONERROR);
                   exit;
               end;



               if ENPlanWorkObj.elementRef = nil then ENPlanWorkObj.elementRef := ENElementRef.Create();
              // ENPlanWorkObj.status.code := StrToInt(GetReturnValue(sgENPlanWorkStatus,0));
               ENPlanWorkObj.elementRef.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementName.Text := GetReturnValue(sgENElement,1);

               if  ENPlanWorkObj.renRef = nil then ENPlanWorkObj.renRef := EPRenRef.Create;
               ENPlanWorkObj.renRef.code := ENElementShort(sgENElement.Objects[0,sgENElement.Row]).renRefCode ;
               edtEPRenName.Text := GetReturnValue(sgENElement,2);

               // подкинуть депртамент ...
              depShort := DMReports.getDepartmentByRenCode(ENPlanWorkObj.renRef.code);
              if depShort <> nil then
              begin
                  if ENPlanWorkObj.departmentRef = nil then  ENPlanWorkObj.departmentRef := ENDepartmentRef.Create;
                  ENPlanWorkObj.departmentRef.code := depShort.code;
                  edtDepartment.Text:= depShort.shortName;
              end;

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;

procedure TfrmENFactEdit.pcPlanWorkChange(Sender: TObject);
var
  TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  i,LastCountM: Integer;
  ENPlanWorkItemList: ENPlanWorkItemShortList;

  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  ENEstimateItemList: ENEstimateItemShortList;

  TempENPlanWorkMoveHistory: ENPlanWorkMoveHistoryControllerSoapPort;
  ENPlanWorkMoveHistoryList: ENPlanWorkMoveHistoryShortList;

  TempENPlanCorrectHistory : ENPlanCorrectHistoryControllerSoapPort;
  ENPlanCorrectHistoryList : ENPlanCorrectHistoryShortList;

    TempENHumenItem: ENHumenItemControllerSoapPort;
    ENHumenItemList: ENHumenItemShortList;
    TempENTransportItem: ENTransportItemControllerSoapPort;
    ENTransportItemList: ENTransportItemShortList;

  humenItemFilter : ENHumenItemFilter;
  transportItemFilter : ENTransportItemFilter;
begin

  //DisableActions([actInsert,  actEdit, actDelete, actFilter, actNoFilter], false);

  if pcPlanWork.ActivePage = tsPlanWorkItems then
  begin
    SetGridHeaders(ENPlanWorkItemHeaders, sgENPlanWorkItem.ColumnHeaders);
    iColCount:=-1;
    TempENPlanWorkItem :=  HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

    if planItemFilter = nil then
    begin
       planItemFilter := ENPlanWorkItemFilter.Create;
       SetNullIntProps(planItemFilter);
       SetNullXSProps(planItemFilter);
    end;

    if planItemFilter.planRef = nil then planItemFilter.planRef := ENPlanWorkRef.Create;
    planItemFilter.planRef.code := ENPlanWorkObj.code;

    ENPlanWorkItemList := TempENPlanWorkItem.getScrollableFilteredList(planItemFilter,0,iColCount);

    iLastCount:=High(ENPlanWorkItemList.list);

    if iLastCount > -1 then
       sgENPlanWorkItem.RowCount:=iLastCount+2
    else
       sgENPlanWorkItem.RowCount:=2;

     with sgENPlanWorkItem do
      for i:=0 to iLastCount do
        begin
          Application.ProcessMessages;
          if ENPlanWorkItemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(ENPlanWorkItemList.list[i].code)
          else
            Cells[0,i+1] := '';

          Cells[1,i+1] := ENPlanWorkItemList.list[i].kartaNum;
          Cells[2,i+1] := ENPlanWorkItemList.list[i].kartaRefName;


          if ENPlanWorkItemList.list[i].countGen = nil then
            Cells[3,i+1] := ''
          else
            Cells[3,i+1] := ENPlanWorkItemList.list[i].countGen.DecimalString;

          if ENPlanWorkItemList.list[i].normOfTime = nil then
             Cells[4, i+1] := ''
          else
             Cells[4, i+1] := ENPlanWorkItemList.list[i].normOfTime.DecimalString;

          Cells[5, i+1] := ENPlanWorkItemList.list[i].meter;
          Cells[6, i+1] := ENPlanWorkItemList.list[i].measurementUnit;

          Cells[7,i+1] := ENPlanWorkItemList.list[i].userGen;
          if ENPlanWorkItemList.list[i].dateEdit = nil then
            Cells[8,i+1] := ''
          else
            Cells[8,i+1] := XSDate2String(ENPlanWorkItemList.list[i].dateEdit);
          iLastRow:=i+1;
          sgENPlanWorkItem.RowCount:=iLastRow+1;
        end;
     iColCount:=iColCount+1;
     sgENPlanWorkItem.Row:=1;
  end; // selected tsPlanWorkItems

  //--------------------------------------------------------------------------------
  if pcPlanWork.ActivePage = tsEstimateItems then
  begin
    SetGridHeaders(ENEstimateItemHeaders, sgENEstimateItem.ColumnHeaders);
    eiColCount := -1;
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;

    if estimateItemFilter = nil then
    begin
       estimateItemFilter := ENEstimateItemFilter.Create;
       SetNullIntProps(estimateItemFilter);
       SetNullXSProps(estimateItemFilter);
    end;

    if estimateItemFilter.planRef = nil then estimateItemFilter.planRef := ENPlanWorkRef.Create;
    estimateItemFilter.planRef.code := ENPlanWorkObj.code;

    ////
    estimateItemFilter.orderBySQL := 'ENESTIMATEITEMTYPE.CODE, KR.TECHKARTNUMBER, SM.NAME';
    ////

    ENEstimateItemList := TempENEstimateItem.getScrollableFilteredList(estimateItemFilter, 0, eiColCount);

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

         if ENEstimateItemList.list[i].countGen = nil then
           Cells[2,i+1] := ''
         else
           Cells[2,i+1] := ENEstimateItemList.list[i].countGen.DecimalString;

         if ENEstimateItemList.list[i].countFact = nil then
           Cells[3,i+1] := ''
         else
           Cells[3,i+1] := ENEstimateItemList.list[i].countFact.DecimalString;

         Cells[4,i+1] := ENEstimateItemList.list[i].measureType;

         Cells[5,i+1] := ENEstimateItemList.list[i].kartaNum;
         Cells[6,i+1] := ENEstimateItemList.list[i].kartaRefName;

         Cells[7,i+1] := ENEstimateItemList.list[i].typeRefName;

         Cells[8,i+1] := ENEstimateItemList.list[i].userGen;

         if ENEstimateItemList.list[i].dateEdit = nil then
           Cells[9,i+1] := ''
         else
           Cells[9,i+1] := XSDate2String(ENEstimateItemList.list[i].dateEdit);


         // Выделяем цветом ручной ввод
         if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_CORRECTED, ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
           RowColor[i+1] := clMoneyGreen; //$EBFFF5

         // Выделяем цветом строки, относящиеся ко всей смете
         if ENEstimateItemList.list[i].typeRefCode in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN]  then
           RowColor[i+1] := clYellow;

         Objects[0,i+1] := TObject(ENEstimateItemList.list[i].typeRefCode);

         eiLastRow := i + 1;
         sgENEstimateItem.RowCount := eiLastRow + 1;
       end;

     //sgENEstimateItem.RowColor[1] := clGreen;

     eiColCount := eiColCount + 1;
     sgENEstimateItem.Row := 1;
  end;

// ----------------------------------------------------------
  if pcPlanWork.ActivePage = tsHumens then
  begin
  SetGridHeaders(ENHumenItemHeaders, sgENHumenItem.ColumnHeaders);
  DisableActions([actInsert,  actEdit, actDelete, actFilter, actNoFilter]);
  if humenItemFilter = nil then
  begin
    humenItemFilter := ENHumenItemFilter.Create;
    SetNullIntProps(humenItemFilter);
    SetNullXSProps(humenItemFilter);
  end;

  if HumenItemFilter.planRef = nil then HumenItemFilter.planRef := ENPlanWorkRef.Create;
  HumenItemFilter.planRef.code := ENPlanWorkObj.code;

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

//        Cells[2, i+1] := ENHumenItemList.list[i].manningTableName;
//        Cells[3, i+1] := ENHumenItemList.list[i].workerFactName;

        if ENHumenItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENHumenItemList.list[i].countGen.DecimalString;

        if ENHumenItemList.list[i].countFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENHumenItemList.list[i].countFact.DecimalString;

        Cells[6, i+1] := ENHumenItemList.list[i].kartaNum;
        Cells[7,i + 1] := ENHumenItemList.list[i].kartaRefName;
        
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

  sgENHumenItem.Row := 1;
  end;
end;

// -----------------------------------------------------------------------------------------------------

  if pcPlanWork.ActivePage = tsTransports then
  begin
     DisableActions([actInsert,  actEdit, actDelete, actFilter, actNoFilter]);

  SetGridHeaders(ENTransportItemHeaders, sgENTransportItem.ColumnHeaders);

  TempENTransportItem :=  HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;

  transportItemFilter := ENTransportItemFilter.Create;
  SetNullIntProps(transportItemFilter);
  SetNullXSProps(transportItemFilter);

  transportItemFilter.planRef := ENPlanWorkRef.Create;
  transportItemFilter.planRef.code := ENPlanWorkObj.code;

  ENTransportItemList := TempENTransportItem.getScrollableFilteredList(transportItemFilter,0,-1);

  if High(ENTransportItemList.list) > -1 then
    sgENTransportItem.RowCount := High(ENTransportItemList.list) + 2
  else
    sgENTransportItem.RowCount := 2;


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
        Cells[3, i+1] := ENTransportItemList.list[i].finWorkerName + ' ' + ENTransportItemList.list[i].finWorkerPositionName;

        if ENTransportItemList.list[i].countGen = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENTransportItemList.list[i].countGen.DecimalString;

        if ENTransportItemList.list[i].countFact = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENTransportItemList.list[i].countFact.DecimalString;

        Cells[6, i+1] := ENTransportItemList.list[i].kartaNum;
        Cells[7,i + 1] := ENTransportItemList.list[i].kartaRefName;

        Cells[8,i+1] := '';
        Cells[9,i+1] := '';

        Cells[10,i+1] := ENTransportItemList.list[i].userGen;

        if ENTransportItemList.list[i].dateEdit = nil then
          Cells[11,i+1] := ''
        else
          Cells[12,i+1] := XSDate2String(ENTransportItemList.list[i].dateEdit);
        //LastRow:=i+1;
        //sgENHumenItem.RowCount:=LastRow+1;

                       // Выделяем цветом ручной ввод
       if ENTransportItemList.list[i].typeRefCode <> ENESTIMATEITEMTYPE_AUTO then
         sgENTransportItem.RowColor[i+1] := clMoneyGreen; //$EBFFF5

       Objects[0,i+1] := TObject(ENTransportItemList.list[i].typeRefCode);


  sgENTransportItem.Row := 1;
    end;


  end;

  //--------------------------------------------------------------------------------

  if pcPlanWork.ActivePage = tsMoves then
  begin
  SetGridHeaders(ENPlanWorkMoveHistoryHeaders, sgENPlanWorkMoveHistory.ColumnHeaders);
  TempENPlanWorkMoveHistory :=  HTTPRIOENPlanWorkMoveHistory as ENPlanWorkMoveHistoryControllerSoapPort;

  if moveFilterObject = nil then
  begin
     moveFilterObject := ENPlanWorkMoveHistoryFilter.Create;
     SetNullIntProps(moveFilterObject);
     SetNullXSProps(moveFilterObject);
  end;

  moveFilterObject.planRef := ENPlanWorkRef.Create;
  moveFilterObject.planRef.code := ENPlanWorkObj.code;
  moveFilterObject.orderBySQL := ' dategen desc';

  ENPlanWorkMoveHistoryList := TempENPlanWorkMoveHistory.getScrollableFilteredList(moveFilterObject,0,-1);


  LastCountM:=High(ENPlanWorkMoveHistoryList.list);

  if LastCountM > -1 then
     sgENPlanWorkMoveHistory.RowCount:=LastCountM+2
  else
     sgENPlanWorkMoveHistory.RowCount:=2;

   with sgENPlanWorkMoveHistory do
    for i:=0 to LastCountM do
      begin
        Application.ProcessMessages;
        if ENPlanWorkMoveHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWorkMoveHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENPlanWorkMoveHistoryList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENPlanWorkMoveHistoryList.list[i].dateGen);
        if ENPlanWorkMoveHistoryList.list[i].yearGen = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENPlanWorkMoveHistoryList.list[i].yearGen);
        if ENPlanWorkMoveHistoryList.list[i].monthGen = Low(Integer) then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := IntToStr(ENPlanWorkMoveHistoryList.list[i].monthGen);

        Cells[4,i+1] := ENPlanWorkMoveHistoryList.list[i].reasonName;

        Cells[5,i+1] := ENPlanWorkMoveHistoryList.list[i].userGen;
        if ENPlanWorkMoveHistoryList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(ENPlanWorkMoveHistoryList.list[i].dateEdit);
        //LastRow:=i+1;
        sgENPlanWorkMoveHistory.RowCount:= i + 2; //LastRow+1;
      end;
   //ColCount:=ColCount+1;
   sgENPlanWorkMoveHistory.Row:=1;
  end; // pcPlanWork.ActivePage = tsMoves

  //--------------------------------------------------------------------------------

  if pcPlanWork.ActivePage = tsCorrections then
  begin
  SetGridHeaders(ENPlanCorrectHistoryHeaders, sgENPlanCorrectHistory.ColumnHeaders);

  TempENPlanCorrectHistory :=  HTTPRIOENPlanCorrectHistory as ENPlanCorrectHistoryControllerSoapPort;

  if corrFilterObject = nil then
  begin
     corrFilterObject := ENPlanCorrectHistoryFilter.Create;
     SetNullIntProps(corrFilterObject);
     SetNullXSProps(corrFilterObject);
  end;

  //corrFilterObject.planRef := ENPlanWorkRef.Create;
  //corrFilterObject.planRef.code := ENPlanWorkObj.code;

  //if ENPlanWorkObj.kind.code =

   corrFilterObject.conditionSQL := ' planrefcode in (select ph.planrefcode from enplancorrecthistory ph where ph.plannewrefcode = '+ IntToStr(ENPlanWorkObj.code) +')';

  ENPlanCorrectHistoryList := TempENPlanCorrectHistory.getScrollableFilteredList(corrFilterObject,0,-1);


  LastCountM:=High(ENPlanCorrectHistoryList.list);

  if LastCountM > -1 then
     sgENPlanCorrectHistory.RowCount:=LastCountM+2
  else
     sgENPlanCorrectHistory.RowCount:=2;

   with sgENPlanCorrectHistory do
    for i:=0 to LastCountM do
      begin
        Application.ProcessMessages;
        if ENPlanCorrectHistoryList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanCorrectHistoryList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENPlanCorrectHistoryList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENPlanCorrectHistoryList.list[i].dateGen);

        Cells[2,i+1] := ENPlanCorrectHistoryList.list[i].reasonName;

        Cells[3,i+1] := ENPlanCorrectHistoryList.list[i].userGen;
        if ENPlanCorrectHistoryList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENPlanCorrectHistoryList.list[i].dateEdit);

        sgENPlanCorrectHistory.RowCount:=i+2;
      end;

   sgENPlanCorrectHistory.Row:=1;
   end;
   
  //end; //pcPlanWork.ActivePage = tsCorrections

end;

procedure TfrmENFactEdit.actInsertExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin

  //if ENPlanWorkObj.status.code <> ENPLANWORKSTATUS_GOOD then
  if not ENPlanWorkObj.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION] then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  if pcPlanWork.ActivePage = tsPlanWorkItems then
  begin

    selectedRow := sgENPlanWorkItem.Row;

    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    ENPlanWorkItemObj:=ENPlanWorkItem.Create;
           SetNullIntProps(ENPlanWorkItemObj);
           SetNullXSProps(ENPlanWorkItemObj);

     ENPlanWorkItemObj.countGen:= TXSDecimal.Create;
     ENPlanWorkItemObj.dateEdit:= TXSDate.Create;
     ENPlanWorkItemObj.planRef := ENPlanWorkRef.Create;

    try
      frmENFactItemEdit:=TfrmENFactItemEdit.Create(Application, dsInsert);
      try

        ENPlanWorkItemObj.planRef.code := ENPlanWorkObj.code;
        frmENFactItemEdit.pcEstimate.Visible := false;
        if frmENFactItemEdit.ShowModal = mrOk then
        begin
          if ENPlanWorkItemObj<>nil then
          begin
              //TempENPlanWorkItem.add(ENPlanWorkItemObj);
              UpdateGrid(Sender);
          end;
        end;
        sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount - 1;
      finally
        frmENFactItemEdit.Free;
        frmENFactItemEdit:=nil;
      end;
    finally
      ENPlanWorkItemObj.Free;
    end;
  end;

  // -------------------------------------------------------------------------------------------
  
  if pcPlanWork.ActivePage = tsEstimateItems then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    ENEstimateItemObj := ENEstimateItem.Create;

    ENEstimateItemObj.countGen := TXSDecimal.Create;
    ENEstimateItemObj.countFact := TXSDecimal.Create;
    ENEstimateItemObj.dateEdit := TXSDate.Create;

    ENEstimateItemObj.planRef := ENPlanWorkRef.Create;
    ENEstimateItemObj.planRef.code := ENPlanWorkObj.code;

    try
      frmENEstimateItemEdit := TfrmENEstimateItemEdit.Create(Application, dsInsert);
      frmENEstimateItemEdit.ENPlanWorkCode := ENPlanWorkObj.code;
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
  end;
end;

procedure TfrmENFactEdit.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 if pcPlanWork.ActivePage = tsPlanWorkItems then
 begin
   for i:=1 to sgENPlanWorkItem.RowCount-1 do
     for j:=0 to sgENPlanWorkItem.ColCount-1 do
       sgENPlanWorkItem.Cells[j,i]:='';
 end;

 if pcPlanWork.ActivePage = tsEstimateItems then
 begin
   for i:=1 to sgENEstimateItem.RowCount-1 do
     for j:=0 to sgENEstimateItem.ColCount-1 do
       sgENEstimateItem.Cells[j,i]:='';
 end;

 if pcPlanWork.ActivePage = tsMoves then
 begin
   for i:=1 to sgENPlanWorkMoveHistory.RowCount-1 do
     for j:=0 to sgENPlanWorkMoveHistory.ColCount-1 do
       sgENPlanWorkMoveHistory.Cells[j,i]:='';
 end;

 if pcPlanWork.ActivePage = tsCorrections then
 begin
   for i:=1 to sgENPlanCorrectHistory.RowCount-1 do
     for j:=0 to sgENPlanCorrectHistory.ColCount-1 do
       sgENPlanCorrectHistory.Cells[j,i]:='';
 end;

 if pcPlanWork.ActivePage = tsHumens then
 begin
   for i:=1 to sgENHumenItem.RowCount-1 do
     for j:=0 to sgENHumenItem.ColCount-1 do
       sgENHumenItem.Cells[j,i]:='';
 end;

 if pcPlanWork.ActivePage = tsTransports then
 begin
   for i:=1 to sgENTransportItem.RowCount-1 do
     for j:=0 to sgENTransportItem.ColCount-1 do
       sgENTransportItem.Cells[j,i]:='';
 end;

 pcPlanWorkChange(Sender);
end;

procedure TfrmENFactEdit.actEditExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
begin
  //if ENPlanWorkObj.status.code <> ENPLANWORKSTATUS_GOOD then
  if not ENPlanWorkObj.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION] then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  if pcPlanWork.ActivePage = tsPlanWorkItems then
  begin


    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    try
      ENPlanWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]));
    except
      on EConvertError do Exit;
    end;

    selectedRow := sgENPlanWorkItem.Row;
    frmENFactItemEdit:=TfrmENFactItemEdit.Create(Application, dsEdit);
    try
      //frmENPlanWorkItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
            frmENFactItemEdit.lblMeasure.Caption := 'Вимірювач : ' + sgENPlanWorkItem.Cells[5,sgENPlanWorkItem.Row] + ' /  Од.виміру : ' + sgENPlanWorkItem.Cells[6,sgENPlanWorkItem.Row];
      if frmENFactItemEdit.ShowModal= mrOk then
        begin
          //TempENLine04.save(ENLine04Obj);
          UpdateGrid(Sender);
        end;

        if  sgENPlanWorkItem.RowCount > selectedRow then
           sgENPlanWorkItem.Row := selectedRow
        else
           sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount-1;

    finally
      frmENFactItemEdit.Free;
      frmENFactItemEdit:=nil;
    end;
  end;


///--------------------------------------------------------------------------------

  if pcPlanWork.ActivePage = tsEstimateItems then
  begin
    TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
    try
      ENEstimateItemObj := TempENEstimateItem.getObject(StrToInt(sgENEstimateItem.Cells[0,sgENEstimateItem.Row]));
    except
      on EConvertError do Exit;
    end;

     if  not (Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN ]) then //такие редактировать из РАБОТЫ
     begin
       Application.MessageBox(PChar('Цей матеріaл змінюється в роботі !!!'), PChar('Внимание !'),MB_ICONQUESTION+MB_OK);
       exit;
     end;

    frmENFactEstimateItemEdit:=TfrmENFactEstimateItemEdit.Create(Application, dsEdit);
    try
    //ENEstimateItemObj.planRef.code := ENPlanWorkObj.code;
      if frmENEstimateItemEdit.ShowModal= mrOk then
      begin
        //TempENEstimateItem.save(ENEstimateItemObj);
        UpdateGrid(Sender);
      end;
    finally
      frmENEstimateItemEdit.Free;
      frmENEstimateItemEdit:=nil;
    end;
  end;
end;

procedure TfrmENFactEdit.actViewExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
    TempENEstimateItem: ENEstimateItemControllerSoapPort;
    TempENTransportItem: ENTransportItemControllerSoapPort;
    TempENHumenItem: ENHumenItemControllerSoapPort;
begin
  if pcPlanWork.ActivePage = tsPlanWorkItems then
  begin

    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
    try
      ENPlanWorkItemObj := TempENPlanWorkItem.getObject(StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkItemEdit:=TfrmENPlanWorkItemEdit.Create(Application, dsView);
    try
      //frmENPlanWorkItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
      frmENPlanWorkItemEdit.lblMeasure.Caption := 'Вимірювач : ' + sgENPlanWorkItem.Cells[5,sgENPlanWorkItem.Row] + ' /  Од.виміру : ' + sgENPlanWorkItem.Cells[6,sgENPlanWorkItem.Row];
      if frmENPlanWorkItemEdit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        //UpdateGrid(Sender);
      end;
    finally
      frmENPlanWorkItemEdit.Free;
      frmENPlanWorkItemEdit:=nil;
    end;

  end;

  if pcPlanWork.ActivePage = tsEstimateItems then
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
  end;

  if pcPlanWork.ActivePage = tsHumens then
  begin

    TempENHumenItem := HTTPRIOENHumenItem as ENHumenItemControllerSoapPort;
    try
      ENHumenItemObj := TempENHumenItem.getObject(StrToInt(sgENHumenItem.Cells[0, sgENHumenItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENHumenItemEdit := TfrmENHumenItemEdit.Create(Application, dsView);
    try
      //frmENEstimateItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
      if frmENHumenItemEdit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        //UpdateGrid(Sender);
      end;
    finally
      frmENHumenItemEdit.Free;
      frmENHumenItemEdit := nil;
    end;
  end;

  if pcPlanWork.ActivePage = tsTransports then
  begin

    TempENTransportItem := HTTPRIOENTransportItem as ENTransportItemControllerSoapPort;
    try
      ENTransportItemObj := TempENTransportItem.getObject(StrToInt(sgENTransportItem.Cells[0, sgENTransportItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmENTransportItemEdit := TfrmENTransportItemEdit.Create(Application, dsView);
    try
      //frmENEstimateItemEdit.DisableControls([frmENLine04Edit.edtENSubstation04Name, frmENLine04Edit.spbENSubstation04]);
      if frmENTransportItemEdit.ShowModal= mrOk then
      begin
        //TempENLine04.save(ENLine04Obj);
        //UpdateGrid(Sender);
      end;
    finally
      frmENTransportItemEdit.Free;
      frmENTransportItemEdit := nil;
    end;
  end;

end;

procedure TfrmENFactEdit.actUpdateExecute(Sender: TObject);
begin
  inherited;
  //selectedRow := sgENPlanWorkItem.Row;
  UpdateGrid(Sender);
  {
  if  sgENPlanWorkItem.RowCount > selectedRow then
     sgENPlanWorkItem.Row := selectedRow
  else
     sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount-1;
  }   
end;

procedure TfrmENFactEdit.btnPlanReportClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
begin
  if DialogState = dsInsert then Exit;

  /////// Parameters
{  SetLength(argNames, 2);
  SetLength(args, 2);

  argNames[0] := 'yearGen';
  args[0] := IntToStr(ENPlanWorkObj.yearGen);

  argNames[1] := 'monthGen';
  args[1] := IntToStr(ENPlanWorkObj.monthGen);
  ///////

  makeReport('materialByRen', argNames, args, 'pdf');
  }
  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'planCode';
  args[0] := IntToStr(ENPlanWorkObj.code);

  ///////

  makeReport('materialUndeliveredByPlan', argNames, args, 'xls');
end;



procedure TfrmENFactEdit.actDeleteExecute(Sender: TObject);
Var TempENPlanWorkItem: ENPlanWorkItemControllerSoapPort;
  ObjCode: Integer;
  TempENEstimateItem: ENEstimateItemControllerSoapPort;
  eType : integer;
begin

  //if ENPlanWorkObj.status.code <> ENPLANWORKSTATUS_GOOD then
  if not ENPlanWorkObj.status.code in [ENPLANWORKSTATUS_GOOD, ENPLANWORKSTATUS_INCORRECTION] then
  begin
      Application.MessageBox(PChar('План затверджений або видалений !'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  if Application.MessageBox(PChar('Вы действительно хотите удалить запись ?'),
                            PChar('Внимание!'),
                            MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  if pcPlanWork.ActivePage = tsPlanWorkItems then
  begin
    selectedRow := sgENPlanWorkItem.Row;
    TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;

    try
      ObjCode := StrToInt(sgENPlanWorkItem.Cells[0,sgENPlanWorkItem.Row]);
    except
      on EConvertError do Exit;
    end;

    // определим тип элемента по коду
    // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
    //eType := DMReports.getElementTypeByPlanItem(ObjCode);
{
      if eType in [1,2,3] then
        TempENPlanWorkItem.removeBySRS(ObjCode)
      else
      if eType = 5 then
        TempENPlanWorkItem.removeBySVES(ObjCode);
}
{
      case eType of
        1,2,3 : TempENPlanWorkItem.removeBySRS(ObjCode);
        5 : TempENPlanWorkItem.removeBySVES(ObjCode);
        6 : TempENPlanWorkItem.removeBySPS(ObjCode);
        else
        begin
          Application.MessageBox(PChar('Невідомий тип Об"єкту !!!'), PChar('Помилка'), MB_ICONERROR);
          exit;
        end;
      end;
     }
      TempENPlanWorkItem.remove(ObjCode);
      UpdateGrid(Sender);

        if  sgENPlanWorkItem.RowCount > selectedRow then
           sgENPlanWorkItem.Row := selectedRow - 1
        else
           sgENPlanWorkItem.Row :=  sgENPlanWorkItem.RowCount-1;

    //end;
  end; // pcPlanWork.ActivePage = tsPlanWorkItems

// ---------------------------------------------------------------------------------
  if pcPlanWork.ActivePage = tsEstimateItems then
  begin
     if  Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM ] then //такие удалять из РАБОТЫ .., ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
     begin
       Application.MessageBox(PChar('Цей матеріaл видаляеться в роботі !!!'), PChar('Внимание !'),MB_ICONQUESTION+MB_OK);
       exit;
     end;

     if  Integer(sgENEstimateItem.Objects[0,sgENEstimateItem.Row]) in [ENESTIMATEITEMTYPE_MANUAL_BY_PLAN ] then //такие удалять из РАБОТЫ .., ENESTIMATEITEMTYPE_MANUAL_BY_PLANITEM]  then
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
            // определим тип элемента по коду
            // и вызовм НУЖНЫЙ метод ... - чтоб левые юзера не планировали на правые обьекты
            {
            eType := DMReports.getElementTypeByEstimateItem(ObjCode);
            case eType of
              1,2,3 : TempENEstimateItem.removeBySRS(ObjCode);
              5 : TempENEstimateItem.removeBySVES(ObjCode);
              6 : TempENEstimateItem.removeBySPS(ObjCode);
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

  end; //pcPlanWork.ActivePage = tsEstimateItems

end;

procedure TfrmENFactEdit.sgENPlanCorrectHistoryDblClick(
  Sender: TObject);
  var
  frmViewOldPlan : TfrmENPlanWorkEdit;
  TempENPlanCorrectHistory : ENPlanCorrectHistoryControllerSoapPort;
  TempENPlanWork: ENPlanWorkControllerSoapPort;

  planCorrectHistory : ENPlanCorrectHistory;
  plan : ENPlanWork;
  objcode : integer;
begin

         try
           ObjCode := StrToInt(sgENPlanCorrectHistory.Cells[0,sgENPlanCorrectHistory.Row]);
         except
         on EConvertError do Exit;
        end;

   frmViewOldPlan := TfrmENPlanWorkEdit.Create(Application, dsView);

  try

    TempENPlanCorrectHistory  := HTTPRIOENPlanCorrectHistory as ENPlanCorrectHistoryControllerSoapPort;

    planCorrectHistory := TempENPlanCorrectHistory.getObject(ObjCode);

    TempENPlanWork  := HTTPRIOENPlanWork as ENPlanWorkControllerSoapPort;

    frmViewOldPlan.ENPlanWorkObj := ENPlanWork.Create;
    frmViewOldPlan.ENPlanWorkObj :=  TempENPlanWork.getObject(planCorrectHistory.planOldRef.code);

   // frmViewOldPlan.DisableActions([frmViewOldPlan.actInsert, frmViewOldPlan.actEdit, frmViewOldPlan.actDelete]);
    frmViewOldPlan.tsCorrections.TabVisible := false;
    frmViewOldPlan.Caption := 'Змінений план при коригуванні';
    frmViewOldPlan.ShowModal;
  finally
    frmViewOldPlan.Free;
    frmViewOldPlan:=nil;
  end;

end;

procedure TfrmENFactEdit.spbENBudgetClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;

begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_BUDGET;
   f.conditionSQL := ' parentrefcode is null';
   
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try

      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkObj.budgetRef = nil then ENPlanWorkObj.budgetRef := ENDepartmentRef.Create();
               ENPlanWorkObj.budgetRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENBudgetName.Text:=ENDepartmentShort(tvDep.Selected.Data).shortName ;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENFactEdit.spbResponsibilityClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.typeRef := ENDepartmentTypeRef.Create;
   f.typeRef.code := ENDEPARTMENTTYPE_RESPOSIBILITY;
   f.conditionSQL := ' parentrefcode is null';

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkObj.responsibilityRef = nil then ENPlanWorkObj.responsibilityRef := ENDepartmentRef.Create();
               ENPlanWorkObj.responsibilityRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtResponsibility.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
end;

procedure TfrmENFactEdit.spbDepartmentClick(Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   //f.typeRef := ENDepartmentTypeRef.Create;
   //f.typeRef.code := 0; // предприятие ХОЕ ... ENDEPARTMENTTYPE_DEPARTMENT;
   //f.conditionSQL := ' parentrefcode is null';
   //f.conditionSQL :=

   f.code := 1;
   if ENPlanWorkObj.elementRef <> nil then
      if ENPlanWorkObj.elementRef.code > low(Integer) then
         if ENPlanWorkObj.renRef <> nil then
            /// Если код РЭСа > 0 (т.е. это не ХОЭ), то фильтруем подразделения по РЭСу,
            /// иначе выводим все
            //if ENPlanWorkObj.renRef.code > low(Integer) then
            if ENPlanWorkObj.renRef.code > 0 then
            begin
               f.conditionSQL := 'code in (select departmentrefcode from endepartment2epren where renrefcode = ' + IntToStr(ENPlanWorkObj.renRef.code) +')';
               f.code := Low(integer);
            end;





   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkObj.departmentRef = nil then ENPlanWorkObj.departmentRef := ENDepartmentRef.Create();
               ENPlanWorkObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TfrmENFactEdit.spbTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow: TfrmENPlanWorkTypeShow;
   f : ENPlanWorkTypeFilter;
begin
   frmENPlanWorkTypeShow:=TfrmENPlanWorkTypeShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkTypeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENPlanWorkObj.typeRef = nil then ENPlanWorkObj.typeRef := ENPlanWorkTypeRef.Create();
               ENPlanWorkObj.typeRef.code := StrToInt(GetReturnValue(sgENPlanWorkType,0));//ENDepartmentShort(tvDep.Selected.Data).code;
               edtTypeName.Text:= GetReturnValue(sgENPlanWorkType,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENPlanWorkTypeShow.Free;
   end;
end;


procedure TfrmENFactEdit.edtDateStartClick(Sender: TObject);
begin
  inherited;
//if edtDateStart.Checked then
begin
  edtDateStart.DateTime := EncodeDate( edtYearGen.ItemIndex + 2009 , edtMonthGen.ItemIndex + 1 ,1);
  edtDateFinal.DateTime := EncodeDate( edtYearGen.ItemIndex + 2009 , edtMonthGen.ItemIndex + 1 , DaysInMonth(edtDateStart.DateTime));
end;

end;


procedure TfrmENFactEdit.actMaterialBindingExecute(Sender: TObject);
begin
  if DialogState in [dsView, dsInsert] then Exit;
  // Привязывать можно только материал, еще не привязанный к работе
  if Integer(sgENEstimateItem.Objects[0, sgENEstimateItem.Row]) <> ENESTIMATEITEMTYPE_MANUAL_BY_PLAN then Exit;

  frmMaterialToPlanItemBindingEdit := TfrmMaterialToPlanItemBindingEdit.Create(Application, dsInsert);
  try
    frmMaterialToPlanItemBindingEdit.materialCode := Low(Integer);
    frmMaterialToPlanItemBindingEdit.materialCount := 0;
    frmMaterialToPlanItemBindingEdit.materialName := '';

    frmMaterialToPlanItemBindingEdit.planCode := ENPlanWorkObj.code;

    try
      //frmMaterialToPlanItemBindingEdit.materialCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
      frmMaterialToPlanItemBindingEdit.estimateItemCode := StrToInt(sgENEstimateItem.Cells[0, sgENEstimateItem.Row]);
      frmMaterialToPlanItemBindingEdit.materialName := sgENEstimateItem.Cells[1, sgENEstimateItem.Row];
      frmMaterialToPlanItemBindingEdit.materialCount := StrToFloat(sgENEstimateItem.Cells[3, sgENEstimateItem.Row]);
    except
      on EConvertError do Exit;
    end;

    //if frmMaterialToPlanItemBindingEdit.materialCode < 0 then Exit;
    if frmMaterialToPlanItemBindingEdit.estimateItemCode < 0 then Exit;
    if frmMaterialToPlanItemBindingEdit.materialCount <= 0 then Exit;

    if frmMaterialToPlanItemBindingEdit.ShowModal = mrOk then
    begin
      actUpdateExecute(Sender);
    end;
  finally
    frmMaterialToPlanItemBindingEdit.Free;
  end;
end;

procedure TfrmENFactEdit.PopupMenu1Popup(Sender: TObject);
begin
  actMaterialBinding.Enabled := (DialogState = dsEdit) and
                                (pcPlanWork.ActivePage = tsEstimateItems) and
                                (Integer(sgENEstimateItem.Objects[0, sgENEstimateItem.Row]) = ENESTIMATEITEMTYPE_MANUAL_BY_PLAN);
  actMaterialBinding.Visible := actMaterialBinding.Enabled;                                
end;

procedure TfrmENFactEdit.sgENEstimateItemClick(Sender: TObject);
var
  j : Integer;
begin

     // выведем список ФИН материалов .... если они есть ВААЩЕ ...
    try
      j := StrToInt( sgENEstimateItem.Cells[0, sgENEstimateItem.Row ]); //   (sgENEstimateItem,0));
    except
      on EConvertError do Exit;
    end;

    updateFINMaterialsGrid(j);

end;


procedure TfrmENFactEdit.updateFINMaterialsGrid(estimateItemCode : Integer);
var
  TempFINMaterials: FINMaterialsControllerSoapPort;
  j,i: Integer;
  finList: FINMaterialsShortList; //List_;
  finFilter : FINMaterialsFilter;
begin
   for i:=1 to sgFINMaterials.RowCount-1 do
     for j:=0 to sgFINMaterials.ColCount-1 do
       sgFINMaterials.Cells[j,i]:='';

  SetGridHeaders(FINMaterialsShortHeaders, sgFINMaterials.ColumnHeaders);

  finFilter := FINMaterialsFilter.Create;
  SetNullIntProps(finFilter);
  SetNullXSProps(finFilter);
  finFilter.estimateItemRef := ENEstimateItemRef.Create;
  finFilter.estimateItemRef.code := estimateItemCode;

  finFilter.statusRef := FINMaterialsStatusRef.Create;
  finFilter.statusRef.code := FINMATERIALSSTATUS_GOOD;

  TempFINMaterials :=  HTTPRIOFINMaterials as FINMaterialsControllerSoapPort;

  finList := TempFINMaterials.getScrollableFilteredList(finFilter,0,-1);

  if High(finList.list) > -1 then
     sgFINMaterials.RowCount:=High(finList.list)+2
  else
     sgFINMaterials.RowCount:=2;

   with sgFINMaterials do
    for i:=0 to High(finList.list) do
      begin
        Application.ProcessMessages;
        if finList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(finList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := finList.list[i].mat_name;
        Cells[2,i+1] := finList.list[i].mu_name;
        Cells[3,i+1] := finList.list[i].nn;

        if finList.list[i].quantity = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := finList.list[i].quantity.DecimalString;


        if finList.list[i].price = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := finList.list[i].price.DecimalString;

        if finList.list[i].cost = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := finList.list[i].cost.DecimalString;


        Cells[7,i+1] := finList.list[i].div_name;

        {
        Cells[5,i+1] := finList.list[i].partner_name;
        if FINMaterialsList.list[i].doc_date = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := XSDate2String(FINMaterialsList.list[i].doc_date);
        Cells[7,i+1] := FINMaterialsList.list[i].party_discription;
        if FINMaterialsList.list[i].rest_purpose_id = Low(Integer) then
          Cells[8,i+1] := ''
        else
          Cells[8,i+1] := IntToStr(FINMaterialsList.list[i].rest_purpose_id);
        Cells[9,i+1] := FINMaterialsList.list[i].rest_purpose_name;
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
          Cells[14,i+1] := ''
        else
          Cells[14,i+1] := FINMaterialsList.list[i].calc_price.DecimalString;
        if FINMaterialsList.list[i].quantity = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := FINMaterialsList.list[i].quantity.DecimalString;
        if FINMaterialsList.list[i].price = nil then
          Cells[16,i+1] := ''
        else
          Cells[16,i+1] := FINMaterialsList.list[i].price.DecimalString;
        if FINMaterialsList.list[i].cost = nil then
          Cells[17,i+1] := ''
        else
          Cells[17,i+1] := FINMaterialsList.list[i].cost.DecimalString;
        Cells[18,i+1] := FINMaterialsList.list[i].bal_sch;
        LastRow:=i+1;
        }
        sgFINMaterials.RowCount:= i + 2;
      end;
   //ColCount:=ColCount+1;
   sgFINMaterials.Row:=1;


end;
end.
