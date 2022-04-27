
unit EditSCUsageInput;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
    EnergyproController, EnergyproController2, SCUsageInputController , DMReportsUnit,
    DFDocSignerController,
    AdvObj, TB2Item, TB2Dock, TB2Toolbar ;

type
  TfrmSCUsageInputEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblNumberInt : TLabel;
    edtNumberInt: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
  

  HTTPRIOSCUsageInput: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    HTTPRIOENDepartment2EPRen: THTTPRIO;
    pcMain: TPageControl;
    tsGeneral: TTabSheet;
    tsOZ: TTabSheet;
    lblNumberDoc: TLabel;
    lblDateGen: TLabel;
    lblDateStart: TLabel;
    lblDateFinal: TLabel;
    lblMolCode: TLabel;
    lblMolName: TLabel;
    lblCommentGen: TLabel;
    spbENDepartmentDepartment: TSpeedButton;
    lblENDepartmentDepartmentName: TLabel;
    spbPlanMOL: TSpeedButton;
    spbPlanMOLClear: TSpeedButton;
    edtNumberDoc: TEdit;
    edtDateGen: TDateTimePicker;
    edtDateStart: TDateTimePicker;
    edtDateFinal: TDateTimePicker;
    edtMolCode: TEdit;
    edtMolName: TEdit;
    edtCommentGen: TMemo;
    edtENDepartmentDepartmentName: TEdit;
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
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    sgSCUsageInputItemOZ: TAdvStringGrid;
    btnFillUsageInput: TButton;
    HTTPRIOSCUsageInputItemOZ: THTTPRIO;
    tsItems: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    sgSCUsageInputItem: TAdvStringGrid;
    HTTPRIOSCUsageInputItem: THTTPRIO;
    actPrintItem: TAction;
    ToolButton10: TToolButton;
    actEditOZInfo: TAction;
    HTTPRIOSCUsageInputItemOZInfo: THTTPRIO;
    N5: TMenuItem;
    N9: TMenuItem;
    btnProcessInSC: TButton;
    ToolButton12: TToolButton;
    actPrintByOZ: TAction;
    btnChk4Fill: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    edtMolCodeCounter: TEdit;
    edtMolNameCounter: TEdit;
    spbPlanMOLCounter: TSpeedButton;
    spbPlanMOLClearCounter: TSpeedButton;
    HTTPRIOSCUsageInputItemOZ2SCCounter: THTTPRIO;
    tsDFDoc: TTabSheet;
    alDoc: TActionList;
    actClearDFDocSigners: TAction;
    actViewDFDoc: TAction;
    actUpdateDFDocs: TAction;
    actSaveDFDocSigners: TAction;
    gbDFDocSigners: TGroupBox;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    sgDFDocSigners: TAdvStringGrid;
    gbDFDocs: TGroupBox;
    ToolBar18: TToolBar;
    ToolButton95: TToolButton;
    ToolButton101: TToolButton;
    sgDFDocs: TAdvStringGrid;
    btnPrint: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENDepartmentDepartmentClick(Sender : TObject);
    procedure spbPlanMOLClick(Sender: TObject);
    procedure spbPlanMOLClearClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure btnFillUsageInputClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actPrintItemExecute(Sender: TObject);
    procedure actEditOZInfoExecute(Sender: TObject);
    procedure btnProcessInSCClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actPrintByOZExecute(Sender: TObject);
    procedure btnChk4FillClick(Sender: TObject);
    procedure spbPlanMOLCounterClick(Sender: TObject);
    procedure spbPlanMOLClearCounterClick(Sender: TObject);
    function convertIsZKUToInt() : Integer;
    procedure actClearDFDocSignersExecute(Sender: TObject);
    procedure actUpdateDFDocsExecute(Sender: TObject);
    procedure actViewDFDocExecute(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);

  private
    { Private declarations }
    procedure initDFDocsTab;
    procedure initDFDocSignersGrid(setDefaultSigners: Boolean = true);
    procedure loadDFDocSigners;
    function getDFDocSignersForSaving(var dfDocSigners: ArrayOfDFDocSigner): Boolean;
    procedure updateDFDocs;
    procedure initPrintButtons;
  public
    { Public declarations }
    SCUsageInputObj: SCUsageInput;
    isZKU : Boolean;
    procedure UpdateGrid(Sender: TObject);
    function isForExpertise(ozCode : Integer) : Boolean;
  end;

var
  frmSCUsageInputEdit: TfrmSCUsageInputEdit;

implementation

uses
  DateUtils,
  ShowENDepartment
  ,ENDepartmentController
, FINMolController, ShowFINMol, ENDepartment2EPRenController, ENConsts,
  SCUsageInputItemOZController, EditSCUsageInputItemOZ,
  SCUsageInputItemController, EditSCUsageInputItem,
  EditSCUsageInputItemOZInfo, SCUsageInputItemOZInfoController,
  SCUsageInputItemKindController,ShowSCUsageInput,
  SCUsageInputItemOZ2SCCounterController,
  ShowDocumentManagement;

{$R *.dfm}

var
  //frmSCUsageInputItemOZShow : TfrmSCUsageInputItemOZShow;
//  ColCount, LastCount: Integer;
//  LastRow: Integer = 1;
  SCUsageInputItemHeaders: array [1..7] of String =
        ( 'Код'
          ,'Номер документу'
          ,'Кількість'
          ,'Тип накладної'
          ,'код МВО'
          ,'ПІБ МВО'
          ,'код з SC'
        );

  SCUsageInputItemOZHeaders: array [1..9] of String =
        ( 'Код'
          ,'Номер документу'
          ,'Тип лічильника'
          ,'Тип накладної'
          ,'Рахунок'
          , 'Бюджетотримач'
          ,'Вартість'
          ,'Кількість'
          ,'код з SC'
        );

procedure TfrmSCUsageInputEdit.initDFDocSignersGrid(setDefaultSigners: Boolean);
begin
  DMReports.initDFDocSignersGrid(SCUsageInputObj, Self, sgDFDocSigners, setDefaultSigners);
end;

procedure TfrmSCUsageInputEdit.initDFDocsTab;
begin
  tsDFDoc.TabVisible := false;

  if DialogState = dsInsert then Exit;

  DisableActions([actClearDFDocSigners, actSaveDFDocSigners],
                 ((DialogState = dsView) or (SCUsageInputObj.statusRef.code <> SC_USAGE_INPUT_EMPTY)));

  if SCUsageInputObj = nil then Exit;

  if DMReports.isSignable(SCUsageInputObj) then
  begin
    tsDFDoc.TabVisible := true;
    DMReports.setComponentPropsForDFDocsTab(Self, sgDFDocs, sgDFDocSigners);

    // При добавлении не будем отображать
    if (DialogState = dsInsert) then
      //initDFDocSignersGrid;
      tsDFDoc.TabVisible := false;

    if (DialogState = dsEdit) or (DialogState = dsView) then
      loadDFDocSigners;
  end;
end;

procedure TfrmSCUsageInputEdit.initPrintButtons;
begin
  btnPrint.Visible := false;
  if DialogState = dsInsert then Exit;
  if SCUsageInputObj = nil then Exit;

  if DMReports.getDocCodeForObject(SCUsageInputObj) > 0 then
  begin
    btnPrint.Visible := true;
    DisableControls([btnPrint], false);
    DisableActions([actPrintItem, actPrintByOZ]);
    HideActions([actPrintItem, actPrintByOZ]);
  end;
end;

function TfrmSCUsageInputEdit.isForExpertise(ozCode : Integer) : Boolean;
var
  TempSCUsageInputItemOZ2SCCounter : SCUsageInputItemOZ2SCCounterControllerSoapPort;
  ozCounterFilter : SCUsageInputItemOZ2SCCounterFilter;
  ozCounterCodes : SCUsageInputItemOZ2SCCounterController.ArrayOfInteger;
  res : Boolean;
begin
    {
       Если ОЗ содержит счетчики где заполнено поле акт приглашения (на экспертизу),
       то функция будет считать, что это ОЗ с счетчиками на экспертизу,
       в противному случае (если ОЗ не содержит) вернется отрицательный результат
    }
    TempSCUsageInputItemOZ2SCCounter := HTTPRIOSCUsageInputItemOZ2SCCounter as SCUsageInputItemOZ2SCCounterControllerSoapPort;
    ozCounterFilter := SCUsageInputItemOZ2SCCounterFilter.Create;
    SetNullXSProps(ozCounterFilter);
    SetNullIntProps(ozCounterFilter);
    ozCounterFilter.ozRef := SCUsageInputItemOzRef.Create;
    ozCounterFilter.ozRef.code := ozCode;
    ozCounterFilter.conditionSQL := ' exists (select 1 from sccounter as co1 where co1.actinvitationnumber is not null and co1.code = scusageinputtmz2sccntr.sccounterrefcode)';
    ozCounterCodes := TempSCUsageInputItemOZ2SCCounter.getScrollableFilteredCodeArray(ozCounterFilter, 0, -1);
    if Length(ozCounterCodes) > 0 then begin
      res := True;
    end else begin
      res := False;
    end;
    Result := res;
end;

procedure TfrmSCUsageInputEdit.loadDFDocSigners;
begin
  DMReports.loadDFDocSigners(SCUsageInputObj, Self, sgDFDocSigners);
end;

procedure TfrmSCUsageInputEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);

  SetGridHeaders(SCUsageInputItemOZHeaders, sgSCUsageInputItemOZ.ColumnHeaders);
  SetGridHeaders(SCUsageInputItemHeaders, sgSCUsageInputItem.ColumnHeaders);

  HideControls([btnFillUsageInput], DialogState <> dsEdit);
  HideControls([btnProcessInSC], DialogState = dsInsert);

  pcMain.ActivePage := tsGeneral;

  if DialogState = dsView then
  begin
    DisableControls([
      edtENDepartmentDepartmentName
      , spbENDepartmentDepartment
      , spbPlanMOL
      , spbPlanMOLClear
      , spbPlanMOLCounter
      ]);
  end;

  if (DialogState = dsInsert) then
  begin
     edtNumberDoc.Text := 'Auto';
     edtDateStart.Date := EncodeDate(YearOf(Date), MonthOf(Date), 1);
     edtDateStart.Checked := false;
     edtDateFinal.Date := EncodeDate(YearOf(Date), MonthOf(Date), DaysInMonth(Date));
     edtDateFinal.Checked := false;

     tsItems.TabVisible := false;
     tsOZ.TabVisible := false;
     tsDFDoc.TabVisible := false;
  end;


  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin

    DisableControls([edtNumberDoc, edtMolCode, edtMolName, edtENDepartmentDepartmentName,edtMolCodeCounter, edtMolNameCounter]);

    DenyBlankValues([
      edtNumberDoc
      //,edtNumberInt
      ,edtDateGen
      ,edtDateStart
      ,edtDateFinal
      ,edtMolCode
      ,edtMolName
      ,edtENDepartmentDepartmentName
     ,edtMolCodeCounter
      ,edtMolNameCounter
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(SCUsageInputObj.code);
    edtNumberDoc.Text := SCUsageInputObj.numberDoc; 
    if ( SCUsageInputObj.numberInt <> Low(Integer) ) then
       edtNumberInt.Text := IntToStr(SCUsageInputObj.numberInt)
    else
       edtNumberInt.Text := '';
      if SCUsageInputObj.dateGen <> nil then
      begin
        edtDateGen.DateTime:=EncodeDate(SCUsageInputObj.dateGen.Year,SCUsageInputObj.dateGen.Month,SCUsageInputObj.dateGen.Day);
        edtDateGen.checked := true;
      end
      else
      begin
        edtDateGen.DateTime:=SysUtils.Date;
        edtDateGen.checked := false;
      end;
      if SCUsageInputObj.dateStart <> nil then
      begin
        edtDateStart.DateTime:=EncodeDate(SCUsageInputObj.dateStart.Year,SCUsageInputObj.dateStart.Month,SCUsageInputObj.dateStart.Day);
        edtDateStart.checked := true;
      end
      else
      begin
        edtDateStart.DateTime:=SysUtils.Date;
        edtDateStart.checked := false;
      end;
      if SCUsageInputObj.dateFinal <> nil then
      begin
        edtDateFinal.DateTime:=EncodeDate(SCUsageInputObj.dateFinal.Year,SCUsageInputObj.dateFinal.Month,SCUsageInputObj.dateFinal.Day);
        edtDateFinal.checked := true;
      end
      else
      begin
        edtDateFinal.DateTime:=SysUtils.Date;
        edtDateFinal.checked := false;
      end;
    edtMolCode.Text := SCUsageInputObj.molCode;
    edtMolName.Text := SCUsageInputObj.molName;

    edtMolCodeCounter.Text := SCUsageInputObj.molCodeCounter;
    edtMolNameCounter.Text := SCUsageInputObj.molNameCounter;

    MakeMultiline(edtCommentGen.Lines, SCUsageInputObj.commentGen);
      if SCUsageInputObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(SCUsageInputObj.dateEdit.Year,SCUsageInputObj.dateEdit.Month,SCUsageInputObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;
    edtUserGen.Text := SCUsageInputObj.userGen; 

    edtENDepartmentDepartmentName.Text := SCUsageInputObj.department.name;

    if SCUsageInputObj.statusRef.code = SC_USAGE_INPUT_EMPTY then
      btnFillUsageInput.Caption := 'СФОРМУВАТИ строки'
    else
      btnFillUsageInput.Caption := 'ВИДАЛИТИ строки';

    if SCUsageInputObj.statusRef.code = SC_USAGE_INPUT_FILLED then
      btnProcessInSC.Caption := 'ПРОВЕСТИ'
    else if SCUsageInputObj.statusRef.code = SC_USAGE_INPUT_CLOSED then
      btnProcessInSC.Caption := 'ВІДМІНИТИ ПРОВЕДЕННЯ'
    else
      HideControls([btnProcessInSC]);

    if (DialogState = dsView) and (SCUsageInputObj.statusRef.code <> SC_USAGE_INPUT_CLOSED) then
      HideControls([btnProcessInSC]);

    if DialogState = dsEdit then
    begin
      if SCUsageInputObj.statusRef.code = SC_USAGE_INPUT_FILLED then
      begin
        DisableControls(tsGeneral);
        DisableControls([btnFillUsageInput, edtCommentGen], false);
        DisableControls([btnProcessInSC], false);

        // SUPP-68136 Позволяется менять дату для бух. документов
        DisableControls([edtDateGen], false);
      end;
    end;
  end;

  initDFDocsTab;
  initPrintButtons;
end;



function TfrmSCUsageInputEdit.getDFDocSignersForSaving(
  var dfDocSigners: ArrayOfDFDocSigner): Boolean;
begin
  Result := DMReports.getDFDocSignersForSaving(SCUsageInputObj, Self, sgDFDocSigners, dfDocSigners);
end;

procedure TfrmSCUsageInputEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempSCUsageInput: SCUsageInputControllerSoapPort;
  dfDocSigners: ArrayOfDFDocSigner;
  isSignable: Boolean;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberDoc
      //,edtNumberInt
      ,edtMolCode
      ,edtMolName
      ,edtENDepartmentDepartmentName
       ,edtMolCodeCounter
      ,edtMolNameCounter
     ])  then
  begin
      Application.MessageBox(PChar('Заповніть обов''язкові поля!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
  end
  else
  begin
    if not edtDateGen.Checked then
    begin
      Application.MessageBox(PChar('Введіть дату складання!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      edtDateGen.SetFocus;
      Action := caNone;
      Exit;
    end;

    if not edtDateStart.Checked then
    begin
      Application.MessageBox(PChar('Введіть дату початку!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      edtDateStart.SetFocus;
      Action := caNone;
      Exit;
    end;

    if not edtDateFinal.Checked then
    begin
      Application.MessageBox(PChar('Введіть дату закінчення!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      edtDateFinal.SetFocus;
      Action := caNone;
      Exit;
    end;

    isSignable := DMReports.isSignable(SCUsageInputObj);

    //////
    if (isSignable)
         and (DialogState <> dsInsert) and (SCUsageInputObj.statusRef.code = SC_USAGE_INPUT_EMPTY)
         and (not DMReports.checkDFDocSigners(sgDFDocSigners)) then
    begin
      Application.MessageBox(PChar('Потрібно вказати всіх підписантів!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
      pcMain.ActivePage := tsDFDoc;
      Action := caNone;
      Exit;
    end;
    /////

    SetLength(dfDocSigners, 0);

    if (isSignable) and (DialogState <> dsInsert) and (SCUsageInputObj.statusRef.code = SC_USAGE_INPUT_EMPTY) then
    begin
      if not getDFDocSignersForSaving(dfDocSigners) then
      begin
        Action := caNone;
        Exit;
      end;
    end;

    TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;

     SCUsageInputObj.numberDoc := edtNumberDoc.Text;

     if ( edtNumberInt.Text <> '' ) then
       SCUsageInputObj.numberInt := StrToInt(edtNumberInt.Text)
     else
       SCUsageInputObj.numberInt := Low(Integer) ;

     if edtdateGen.checked then
     begin
       if SCUsageInputObj.dateGen = nil then
          SCUsageInputObj.dateGen := TXSDate.Create;
       SCUsageInputObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
     end
     else
       SCUsageInputObj.dateGen := nil;

     if edtdateStart.checked then
     begin 
       if SCUsageInputObj.dateStart = nil then
          SCUsageInputObj.dateStart := TXSDate.Create;
       SCUsageInputObj.dateStart.XSToNative(GetXSDate(edtdateStart.DateTime));
     end
     else
       SCUsageInputObj.dateStart := nil;

     if edtdateFinal.checked then
     begin
       if SCUsageInputObj.dateFinal = nil then
          SCUsageInputObj.dateFinal := TXSDate.Create;
       SCUsageInputObj.dateFinal.XSToNative(GetXSDate(edtdateFinal.DateTime));
     end
     else
       SCUsageInputObj.dateFinal := nil;

     SCUsageInputObj.molCode := edtMolCode.Text; 

     SCUsageInputObj.molName := edtMolName.Text;

     SCUsageInputObj.molCodeCounter := edtMolCodeCounter.Text;

     SCUsageInputObj.molNameCounter := edtMolNameCounter.Text;

     SCUsageInputObj.commentGen := edtCommentGen.Text; 

     if edtdateEdit.checked then
     begin 
       if SCUsageInputObj.dateEdit = nil then
          SCUsageInputObj.dateEdit := TXSDateTime.Create;
       SCUsageInputObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       SCUsageInputObj.dateEdit := nil;	   

     SCUsageInputObj.userGen := edtUserGen.Text; 
    if DialogState = dsInsert then
    begin
      SCUsageInputObj.code:=low(Integer);
      SCUsageInputObj.iszku:=convertIsZKUToInt();
      if High(dfDocSigners) > -1 then
        TempSCUsageInput.add(SCUsageInputObj, dfDocSigners)
      else
        TempSCUsageInput.add(SCUsageInputObj);
    end
    else
    if DialogState = dsEdit then
    begin
      if High(dfDocSigners) > -1 then
        TempSCUsageInput.save(SCUsageInputObj, dfDocSigners)
      else
        TempSCUsageInput.save(SCUsageInputObj);
    end;
  end;
end;


procedure TfrmSCUsageInputEdit.spbENDepartmentDepartmentClick(Sender : TObject);
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

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      frmENDepartmentShow.isShowAll := true;
      with frmENDepartmentShow do begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if SCUsageInputObj.department = nil then SCUsageInputObj.department := ENDepartment.Create();
               SCUsageInputObj.department.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtENDepartmentDepartmentName.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
{
var 
   frmENDepartmentShow: TfrmENDepartmentShow;
begin
   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal);
   try
      with frmENDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if SCUsageInputObj.department = nil then SCUsageInputObj.department := ENDepartment.Create();
               SCUsageInputObj.department.code := StrToInt(GetReturnValue(sgENDepartment,0));
               edtENDepartmentDepartmentName.Text:=GetReturnValue(sgENDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENDepartmentShow.Free;
   end;
}
end;



procedure TfrmSCUsageInputEdit.spbPlanMOLClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  //molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // РЭСы и МОЛы
      //plan := DMReports.getPlanByCode(planCode);

   //if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then
   if SCUsageInputObj.department <> nil then
   if SCUsageInputObj.department.code > LOW_INT then
   begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code :=  SCUsageInputObj.department.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;


   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do
      begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtMolCode.Text := GetReturnValue(sgFINMol,0);
               edtMolName.Text := GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;
end;

procedure TfrmSCUsageInputEdit.spbPlanMOLCounterClick(Sender: TObject);
var
 f : FINMolFilter;
 frmFINMolShow : TfrmFINMolShow;

   TempENDepartment2EPRen: ENDepartment2EPRenControllerSoapPort;
  i: Integer;
  ENDepartment2EPRenList: ENDepartment2EPRenShortList;
  renFilter : ENDepartment2EPRenFilter;
  renList : ENDepartment2EPRenShortList;
  //plan : ENPlanWork;


  //molSel : boolean;
begin
 f := FINMolFilter.Create;
 SetNullXSProps(f);
 SetNullIntProps(f);
 f.state := 1; // типа только работающие ...

      // РЭСы и МОЛы
      //plan := DMReports.getPlanByCode(planCode);

   //if ENWorkOrder2ENPlanWorkObj.workOrder.department <> nil then
   if SCUsageInputObj.department <> nil then
   if SCUsageInputObj.department.code > LOW_INT then
   begin
        TempENDepartment2EPRen :=  HTTPRIOENDepartment2EPRen as ENDepartment2EPRenControllerSoapPort;
        renFilter := ENDepartment2EPRenFilter.Create;
        SetNullXSProps(renFilter);
        SetNullIntProps(renFilter);
        //renFilter.renRef := EPRenRef.Create;
        //renFilter.renRef.code := renCode; //plan.renRef.code;
        renFilter.departmentRef := ENDepartmentRef.Create;
        renFilter.departmentRef.code :=  SCUsageInputObj.department.code;

        renList := TempENDepartment2EPRen.getScrollableFilteredList(renFilter,0,-1);
        if renList.totalCount > 0 then
          f.conditionSQL := 'substr(UMC_DBA.TDIVISION.ID,1,2) = ' + IntToStr(renList.list[0].finRenCode) ;
      end;


   frmFINMolShow:=TfrmFINMolShow.Create(Application,fmNormal, f);

   try

      if length(f.conditionSQL) > 0 then
        frmFINMolShow.isFiltered := true;

      with frmFINMolShow do
      begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               edtMolCodeCounter.Text := GetReturnValue(sgFINMol,0);
               edtMolNameCounter.Text := GetReturnValue(sgFINMol,1); //ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINMolShow.Free;
   end;

end;

procedure TfrmSCUsageInputEdit.updateDFDocs;
begin
  if DialogState = dsInsert then Exit;
  if SCUsageInputObj = nil then Exit;
  if SCUsageInputObj.code = LOW_INT then Exit;

  DMReports.fillDFDocsGrid(SCUsageInputObj, Self, sgDFDocs);
end;

procedure TfrmSCUsageInputEdit.spbPlanMOLClearClick(Sender: TObject);
begin
  inherited;
  edtMolCode.Text := '';
  edtMolName.Text := '';
end;

procedure TfrmSCUsageInputEdit.spbPlanMOLClearCounterClick(Sender: TObject);
begin
  inherited;
 edtMolCodeCounter.Text := '';
 edtMolNameCounter.Text := '';
end;

procedure TfrmSCUsageInputEdit.pcMainChange(Sender: TObject);
begin
  UpdateGrid(Sender);
end;

procedure TfrmSCUsageInputEdit.UpdateGrid(Sender: TObject);
var i: Integer;
    TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
    SCUsageInputItemOZList: SCUsageInputItemOZShortList;
    OZFilter: SCUsageInputItemOZFilter;

    TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
    SCUsageInputItemList: SCUsageInputItemShortList;
    itemFilter: SCUsageInputItemFilter;
begin
  if pcMain.ActivePage = tsItems then
  begin
    ClearGrid(sgSCUsageInputItem);

    itemFilter := SCUsageInputItemFilter.Create;
    SetNullIntProps(itemFilter);
    SetNullXSProps(itemFilter);
    itemFilter.usageInputRef := SCUsageInputRef.Create;
    itemFilter.usageInputRef.code := SCUsageInputObj.code;

    TempSCUsageInputItem := HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;

    SCUsageInputItemList := TempSCUsageInputItem.getScrollableFilteredList(itemFilter, 0, -1);

    if High(SCUsageInputItemList.list) > -1 then
       sgSCUsageInputItem.RowCount := High(SCUsageInputItemList.list) + 2
    else
       sgSCUsageInputItem.RowCount := 2;

     with sgSCUsageInputItem do
      for i:=0 to High(SCUsageInputItemList.list) do
        begin
          Application.ProcessMessages;
          if SCUsageInputItemList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(SCUsageInputItemList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := SCUsageInputItemList.list[i].numberDoc;
          if SCUsageInputItemList.list[i].countGen = Low(Integer) then
            Cells[2,i+1] := ''
          else
            Cells[2,i+1] := IntToStr(SCUsageInputItemList.list[i].countGen);

          Cells[3,i+1] := SCUsageInputItemList.list[i].kindRefName;
          Objects[3,i+1] := TObject(SCUsageInputItemList.list[i].kindRefCode);

          Cells[4, i +1] := SCUsageInputItemList.list[i].molCode;
          Cells[5, i +1] := SCUsageInputItemList.list[i].molName;

          if SCUsageInputItemList.list[i].scCode = Low(Integer) then
            Cells[6,i+1] := ''
          else
            Cells[6,i+1] := IntToStr(SCUsageInputItemList.list[i].scCode);

          //LastRow:=i+1;
          sgSCUsageInputItem.RowCount := i + 2;
        end;
     //ColCount:=ColCount+1;
     sgSCUsageInputItem.Row:=1;
  end;

  if pcMain.ActivePage = tsOZ then
  begin
    ClearGrid(sgSCUsageInputItemOZ);

    OZFilter := SCUsageInputItemOZFilter.Create;
    SetNullIntProps(OZFilter);
    SetNullXSProps(OZFilter);
    OZFilter.conditionSQL := 'scusageinputitemoz.usageinputitemrefcode in ' +
                             '(select scusageinputitem.code from scusageinputitem ' +
                             ' where scusageinputitem.usageinputrefcode = ' + IntToStr(SCUsageInputObj.code) + ')';

    TempSCUsageInputItemOZ := HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;

    SCUsageInputItemOZList := TempSCUsageInputItemOZ.getScrollableFilteredList(OZFilter, 0, -1);

    if isZKU = True then
    begin
      sgSCUsageInputItemOZ.ColWidths[2]:=0;
      sgSCUsageInputItemOZ.ColWidths[3]:=440;
      sgSCUsageInputItemOZ.ColWidths[4]:=0;
      sgSCUsageInputItemOZ.ColWidths[6]:=0;
    end;

    if High(SCUsageInputItemOZList.list) > -1 then
       sgSCUsageInputItemOZ.RowCount := High(SCUsageInputItemOZList.list) + 2
    else
       sgSCUsageInputItemOZ.RowCount := 2;

     with sgSCUsageInputItemOZ do
      for i:=0 to High(SCUsageInputItemOZList.list) do
        begin
          Application.ProcessMessages;
          if SCUsageInputItemOZList.list[i].code <> Low(Integer) then
            Cells[0,i+1] := IntToStr(SCUsageInputItemOZList.list[i].code)
          else
            Cells[0,i+1] := '';
          Cells[1,i+1] := SCUsageInputItemOZList.list[i].numberDoc;
          Cells[2,i+1] := SCUsageInputItemOZList.list[i].counterType;

          Cells[3,i+1] := SCUsageInputItemOZList.list[i].usageInputItemRefKindName;
		  if ((SCUsageInputObj.iszku = 1) and (SCUsageInputItemOZList.list[i].account = '')
		    and (SCUsageInputItemOZList.list[i].usageInputItemRefKindCode = SCUSAGEINPUTITEM_KIND_USAGE_INPUT)) then begin
			Cells[3,i+1] := Cells[3, i+1] + ' (абонентські лічильники)';
		  end;
          Objects[3,i+1] := TObject(SCUsageInputItemOZList.list[i].usageInputItemRefKindCode);

          Cells[4,i+1] := SCUsageInputItemOZList.list[i].account;
          Cells[5, i+1] := SCUsageInputItemOZList.list[i].budgetRefShortName;
          if SCUsageInputItemOZList.list[i].cost = nil then
            Cells[6,i+1] := ''
          else
            Cells[6,i+1] := SCUsageInputItemOZList.list[i].cost.DecimalString;
          if SCUsageInputItemOZList.list[i].countGen = Low(Integer) then
            Cells[7,i+1] := ''
          else
            Cells[7,i+1] := IntToStr(SCUsageInputItemOZList.list[i].countGen);
          if SCUsageInputItemOZList.list[i].scCode = Low(Integer) then
            Cells[8,i+1] := ''
          else
            Cells[8,i+1] := IntToStr(SCUsageInputItemOZList.list[i].scCode);
          //LastRow:=i+1;
          sgSCUsageInputItemOZ.RowCount := i + 2;
        end;
     //ColCount:=ColCount+1;
     sgSCUsageInputItemOZ.Row:=1;
  end;

  if (pcMain.ActivePage = tsDFDoc) then
  begin
    updateDFDocs;
  end;
end;

procedure TfrmSCUsageInputEdit.btnFillUsageInputClick(Sender: TObject);
var TempSCUsageInput: SCUsageInputControllerSoapPort;
begin
  TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;

  if SCUsageInputObj.statusRef.code = SC_USAGE_INPUT_EMPTY then
  begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте сформувати строки документу? Це може зайняти деякий час ...'),
                              PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      if (isZKU = True)
        then begin
          TempSCUsageInput.fillUsageInputZKU(SCUsageInputObj.code);
        end
      else TempSCUsageInput.fillUsageInput(SCUsageInputObj.code);
      Application.MessageBox(PChar('Строки сформовані!'),
                             PChar('Інформація'), MB_ICONINFORMATION);

      //SCUsageInputObj := TempSCUsageInput.getObject(SCUsageInputObj.code);
      //Self.FormShow(Sender);

      /// Закроем форму
      //Self.Close;
      ModalResult := mrYes;
      ///
      Exit;
    end;
  end
  else if SCUsageInputObj.statusRef.code = SC_USAGE_INPUT_FILLED then
  begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте видалити строки документу? Усі змінені дані в строках будуть видалені ...'),
                              PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      if (isZKU = True) then
       TempSCUsageInput.undoFillUsageInputZKU(SCUsageInputObj.code)
       else
      TempSCUsageInput.undoFillUsageInput(SCUsageInputObj.code);
      Application.MessageBox(PChar('Строки видалені!'),
                             PChar('Інформація'), MB_ICONINFORMATION);

      //SCUsageInputObj := TempSCUsageInput.getObject(SCUsageInputObj.code);
      //Self.FormShow(Sender);

      /// Закроем форму
      //Self.Close;
      ModalResult := mrYes;
      ///      
      Exit;
    end;
  end
  else begin
    Application.MessageBox(PChar('Видалення строк при цьому статусі неприпустимо!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;
end;

procedure TfrmSCUsageInputEdit.actViewDFDocExecute(Sender: TObject);
begin
  ShowDocumentManagement.openDFDocForViewFromGrid(SCUsageInputObj, Self, sgDFDocs);
end;

procedure TfrmSCUsageInputEdit.actViewExecute(Sender: TObject);
var TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
    TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
begin
  if pcMain.ActivePage = tsOZ then
  begin
    TempSCUsageInputItemOZ := HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;

    try
      SCUsageInputItemOZObj := TempSCUsageInputItemOZ.getObject(StrToInt(sgSCUsageInputItemOZ.Cells[0, sgSCUsageInputItemOZ.Row]));
    except
      on EConvertError do Exit;
    end;

    frmSCUsageInputItemOZEdit := TfrmSCUsageInputItemOZEdit.Create(Application, dsView);
    try
      frmSCUsageInputItemOZEdit.ShowModal;
    finally
      frmSCUsageInputItemOZEdit.Free;
      frmSCUsageInputItemOZEdit := nil;
    end;
  end;

  if pcMain.ActivePage = tsItems then
  begin
    TempSCUsageInputItem := HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;

    try
      SCUsageInputItemObj := TempSCUsageInputItem.getObject(StrToInt(sgSCUsageInputItem.Cells[0, sgSCUsageInputItem.Row]));
    except
      on EConvertError do Exit;
    end;

    frmSCUsageInputItemEdit := TfrmSCUsageInputItemEdit.Create(Application, dsView);
    try
      frmSCUsageInputItemEdit.ShowModal;
    finally
      frmSCUsageInputItemEdit.Free;
      frmSCUsageInputItemEdit := nil;
    end;
  end;
end;

procedure TfrmSCUsageInputEdit.actUpdateDFDocsExecute(Sender: TObject);
begin
  updateDFDocs;
end;

procedure TfrmSCUsageInputEdit.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;

procedure TfrmSCUsageInputEdit.actPrintItemExecute(Sender: TObject);
var i, itemCode, kindCode: Integer;
    TempSCUsageInputItemOZ: SCUsageInputItemOZControllerSoapPort;
    SCUsageInputItemOZList: SCUsageInputItemOZShortList;
    OZFilter: SCUsageInputItemOZFilter;

    argNames, args: ArrayOfString;
    reportName: String;
    TempSCUsageInputItem : SCUsageInputItemControllerSoapPort;
    TempSCUsageInputItemObj: SCUsageInputItem;

    TempSCUsageInput : SCUsageInputControllerSoapPort;
    TempSCUsageInputObj: SCUsageInput;
begin
  try
    itemCode := StrToInt(sgSCUsageInputItem.Cells[0, sgSCUsageInputItem.Row]);
    kindCode := Integer(sgSCUsageInputItem.Objects[3, sgSCUsageInputItem.Row]);
  except
    on EConvertError do Exit;
  end;

  TempSCUsageInputItem := HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;
  TempSCUsageInputItemObj:=TempSCUsageInputItem.getObject(itemCode);

  TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;
  TempSCUsageInputObj:=TempSCUsageInput.getObject(TempSCUsageInputItemObj.usageInputRef.code);
  if (TempSCUsageInputObj.iszku=1) then Exit;

  OZFilter := SCUsageInputItemOZFilter.Create;
  SetNullIntProps(OZFilter);
  SetNullXSProps(OZFilter);
  OZFilter.usageInputItemRef := SCUsageInputItemRef.Create;
  OZFilter.usageInputItemRef.code := itemCode;

  TempSCUsageInputItemOZ := HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;

  SCUsageInputItemOZList := TempSCUsageInputItemOZ.getScrollableFilteredList(OZFilter, 0, -1);

  if High(SCUsageInputItemOZList.list) = -1 then Exit;

  for i:=0 to High(SCUsageInputItemOZList.list) do
  begin
      SetLength(argNames, 1);
      SetLength(args, 1);


       argNames[0] := 'codeoz';
       args[0] := inttostr(SCUsageInputItemOZList.list[i].code);
      if kindCode = 1 then    // ПРИ ВВОДЕ В ЭКСПЛ ФОРМИРУЕМ ОЗ -1 РЕЕСТР И АКТ
       begin
      reportName := 'Counters/VVOD_EXPL/Counters_vvod_expl';
      makeReport(reportName , argNames , args , 'xls');   // формируем ОЗ-1

      reportName := 'Counters/VVOD_EXPL/Counters_vvod_expl_reestr';
      makeReport(reportName , argNames , args , 'xls');   // формируем реестр к ОЗ-1

      if (SCUsageInputObj.dateGen.Year = 2011 ) AND ( SCUsageInputObj.dateGen.Month < 9 ) then
       reportName := '2011/ActCounters/Act21';
      if (((SCUsageInputObj.dateGen.Year = 2011 ) AND ( SCUsageInputObj.dateGen.Month >= 9 )) or
          (SCUsageInputObj.dateGen.Year > 2011)) then
       reportName := '201109/ActCounters/Act21';
      makeReport(reportName , argNames , args , 'xls');   // формируем АКТ
       end;
     if kindCode = 2 then    // ПРИ ВЫВОДЕ ИЗ ЭКСПЛ ФОРМИРУЕМ ОЗ -1 по выводу
       begin
      reportName := 'Counters/VIVOD_EXPL/Counters_vivod_expl';
      makeReport(reportName , argNames , args , 'xls');   // формируем ОЗ-1
       end;
      if kindCode  = 3 then    // при приеме от абонентов формируем факт безоп
       begin
      reportName := 'Counters/actCounterFull';
      makeReport(reportName , argNames , args , 'xls');   // Акт безоплатньої передачі лічильників №


      reportName := 'Counters/deliveryOrder';
      makeReport(reportName , argNames , args , 'xls');   // " ПРИХОДНЫЙ ОРДЕР
      

       end;

  end;
end;

procedure TfrmSCUsageInputEdit.actClearDFDocSignersExecute(Sender: TObject);
begin
  if DialogState = dsView then Exit;

  initDFDocSignersGrid(false);
end;

procedure TfrmSCUsageInputEdit.actEditOZInfoExecute(Sender: TObject);
var ozCode: Integer;
    TempSCUsageInputItemOZInfo: SCUsageInputItemOZInfoControllerSoapPort;
    ozInfoFilter: SCUsageInputItemOZInfoFilter;
    ozInfoList: SCUsageInputItemOZInfoShortList;
    DialogState_ :  TDialogState;
begin
  if DialogState = dsInsert then Exit;

  if pcMain.ActivePage <> tsOZ then Exit;

  try
    ozCode := StrToInt(sgSCUsageInputItemOZ.Cells[0, sgSCUsageInputItemOZ.Row]);
    //kindCode := Integer(sgSCUsageInputItemOZ.Objects[3, sgSCUsageInputItemOZ.Row]);
  except
    on EConvertError do Exit;
  end;

  ozInfoFilter := SCUsageInputItemOZInfoFilter.Create;
  SetNullIntProps(ozInfoFilter);
  SetNullXSProps(ozInfoFilter);
  ozInfoFilter.usageInputItemOZRef := SCUsageInputItemOZRef.Create;
  ozInfoFilter.usageInputItemOZRef.code := ozCode; //? :) SCUsageInputObj.code;
  //ozInfoFilter.usageInputItemOZRef.code := SCUsageInputObj.code;

  TempSCUsageInputItemOZInfo := HTTPRIOSCUsageInputItemOZInfo as SCUsageInputItemOZInfoControllerSoapPort;
  ozInfoList := TempSCUsageInputItemOZInfo.getScrollableFilteredList(ozInfoFilter, 0, -1);
  if High(ozInfoList.list) > -1 then
  begin
    SCUsageInputItemOZInfoObj := TempSCUsageInputItemOZInfo.getObject(ozInfoList.list[0].code);
    DialogState_ := dsEdit;
  end
  else
  begin
    SCUsageInputItemOZInfoObj := SCUsageInputItemOZInfo.Create;
    SCUsageInputItemOZInfoObj.usageInputItemOZRef := SCUsageInputItemOZRef.Create;
    SCUsageInputItemOZInfoObj.usageInputItemOZRef.code := ozCode;
    DialogState_ := dsInsert;
  end;

  frmSCUsageInputItemOZInfoEdit := TfrmSCUsageInputItemOZInfoEdit.Create(Application, DialogState_);
  try
    if frmSCUsageInputItemOZInfoEdit.ShowModal = mrOk then
    begin
    end;
  finally
    frmSCUsageInputItemOZInfoEdit.Free;
  end;
end;

procedure TfrmSCUsageInputEdit.btnPrintClick(Sender: TObject);
begin
  if DMReports.getDocCodeForObject(SCUsageInputObj) > 0 then
    if DMReports.printReportsForObject(SCUsageInputObj) then Exit;
end;

procedure TfrmSCUsageInputEdit.btnProcessInSCClick(Sender: TObject);
var TempSCUsageInput: SCUsageInputControllerSoapPort;
begin
  TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;

  if SCUsageInputObj.statusRef.code = SC_USAGE_INPUT_FILLED then
  begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте провести документ? Це може зайняти деякий час ...'),
                              PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
    if edtdateGen.checked then
     begin
       if SCUsageInputObj.dateGen = nil then
          SCUsageInputObj.dateGen := TXSDate.Create;
       SCUsageInputObj.dateGen.XSToNative(GetXSDate(edtdateGen.DateTime));
       TempSCUsageInput.save(SCUsageInputObj);
       SCUsageInputObj := TempSCUsageInput.getObject(SCUsageInputObj.code);
     end;

      if (isZKU = True)
        then begin
          TempSCUsageInput.processInSCZKU(SCUsageInputObj.code);
        end
      else TempSCUsageInput.processInSC(SCUsageInputObj.code);

      Application.MessageBox(PChar('Документ проведено!'),
                             PChar('Інформація'), MB_ICONINFORMATION);

      /// Закроем форму
      //Self.Close;
      ModalResult := mrYes;
      ///
      Exit;
    end;
  end
  else if SCUsageInputObj.statusRef.code = SC_USAGE_INPUT_CLOSED then
  begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити проведення документу?'),
                              PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin

      // Для документов, подписанных с помощью ЭЦП, вызываем свой метод отмены проведения
      // (чтобы были отдельные права, потому что их могут проводить/отменять проведение
      // все подряд, а старые - только бухгалтера)
      if DMReports.getDocCodeForObject(SCUsageInputObj) > 0 then
      begin
        if (isZKU = True)
          then begin
            TempSCUsageInput.cancelProcessInSCZKUByEcp(SCUsageInputObj.code);
          end
        else TempSCUsageInput.cancelProcessInSCByEcp(SCUsageInputObj.code);
      end
      else begin
        if (isZKU = True)
          then begin
            TempSCUsageInput.cancelProcessInSCZKU(SCUsageInputObj.code);
          end
        else TempSCUsageInput.cancelProcessInSC(SCUsageInputObj.code);
      end;

      Application.MessageBox(PChar('Проведення відмінено!'),
                             PChar('Інформація'), MB_ICONINFORMATION);

      /// Закроем форму
      //Self.Close;
      ModalResult := mrYes;
      ///      
      Exit;
    end;
  end
  else begin
    Application.MessageBox(PChar('Ця операція при цьому статусі неприпустима!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Exit;
  end;
end;

procedure TfrmSCUsageInputEdit.PopupMenu1Popup(Sender: TObject);
var
  objCode : Integer;
  TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
  SCUsageInputItemFilterObj :  SCUsageInputItemFilter;
  uiiList : SCUsageInputItemShortList;
  ozObj : SCUsageInputItem;
begin
  inherited;
  // менюха для доп инфы в приходе БУ в ОЕ ... чуть шо перенести до ИФа ...
  DisableActions([actEditOZInfo]);
  actEditOZInfo.Visible := actEditOZInfo.Enabled;
  
  if pcMain.ActivePage = tsOZ then
  begin
    try
      objCode := StrToInt(sgSCUsageInputItemOZ.Cells[0, sgSCUsageInputItemOZ.Row]);
    except
      on EConvertError do Exit;
    end;

    SCUsageInputItemFilterObj := SCUsageInputItemFilter.Create;
    SetNullIntProps(SCUsageInputItemFilterObj);
    SetNullXSProps(SCUsageInputItemFilterObj);

    SCUsageInputItemFilterObj.kindRef := SCUsageInputItemKindRef.Create;
    SCUsageInputItemFilterObj.kindRef.code :=  SC_USAGE_INPUT_ITEM_KIND_OUT_USING;
    SCUsageInputItemFilterObj.conditionSQL := 'code in (select oz.usageinputitemrefcode from scusageinputitemoz oz where oz.code = ' +
                                              IntToStr(objCode) +' )';

    TempSCUsageInputItem := HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;
    uiiList := TempSCUsageInputItem.getScrollableFilteredList(SCUsageInputItemFilterObj, 0, -1);
    if (uiiList.totalCount > 0) then
    begin
      DisableActions([actEditOZInfo], False);
      actEditOZInfo.Visible := actEditOZInfo.Enabled;
    end;

  end;

end;

procedure TfrmSCUsageInputEdit.actPrintByOZExecute(Sender: TObject);
var i, itemCode, kindCode: Integer;

  TempSCUsageInputItem: SCUsageInputItemControllerSoapPort;
  SCUsageInputItemFilterObj :  SCUsageInputItemFilter;
  uiiList : SCUsageInputItemShortList;

    argNames, args: ArrayOfString;
    reportName: String;
  TempSCUsageInput : SCUsageInputControllerSoapPort;
  TempSCUsageInputItemOZ : SCUsageInputItemOZControllerSoapPort;
  TempSCUsageInputObj: SCUsageInput;
  oz : SCUsageInputItemOZ;
begin

    try
    itemCode := StrToInt(sgSCUsageInputItemOZ.Cells[0, sgSCUsageInputItemOZ.Row]);

  except
    on EConvertError do Exit;
  end;

    TempSCUsageInputItemOZ := HTTPRIOSCUsageInputItemOZ as SCUsageInputItemOZControllerSoapPort;
    oz := TempSCUsageInputItemOZ.getObject(itemCode);

    SCUsageInputItemFilterObj := SCUsageInputItemFilter.Create;
    SetNullIntProps(SCUsageInputItemFilterObj);
    SetNullXSProps(SCUsageInputItemFilterObj);

    SCUsageInputItemFilterObj.conditionSQL := 'code in (select ii.code from scusageinputitem ii, scusageinputitemoz oz ' +
                                              ' where ii.code = oz.usageinputitemrefcode ' +
                                              '   and oz.code = ' +  IntToStr(itemCode) +  ' )' ;

    TempSCUsageInputItem := HTTPRIOSCUsageInputItem as SCUsageInputItemControllerSoapPort;
    uiiList := TempSCUsageInputItem.getScrollableFilteredList(SCUsageInputItemFilterObj, 0, -1);

    kindCode:= uiiList.list[0].kindRefCode;


      SetLength(argNames, 1);
      SetLength(args, 1);


       argNames[0] := 'codeoz';
       args[0] := inttostr(itemCode);

      TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;
      TempSCUsageInputObj:=TempSCUsageInput.getObject(uiiList.list[0].usageInputRefCode);

      if kindCode = 1 then    // ПРИ ВВОДЕ В ЭКСПЛ ФОРМИРУЕМ ОЗ -1 РЕЕСТР И АКТ
       begin
	   // SUPP-67738 если нет счета, значит счетчик абонента и не надо печатать реестры
       if(Length(Trim(oz.account)) > 0) then begin
           reportName := 'Counters/VVOD_EXPL/Counters_vvod_expl';
           makeReport(reportName , argNames , args , 'xls');   // формируем ОЗ-1

           reportName := 'Counters/VVOD_EXPL/Counters_vvod_expl_reestr';
           makeReport(reportName , argNames , args , 'xls');   // формируем реестр к ОЗ-1	   
      end;

       if (TempSCUsageInputObj.iszku<>1) then
       begin
        if (SCUsageInputObj.dateGen.Year = 2011 ) AND ( SCUsageInputObj.dateGen.Month < 9 ) then
         reportName := '2011/ActCounters/Act21';
        if (((SCUsageInputObj.dateGen.Year = 2011 ) AND ( SCUsageInputObj.dateGen.Month >= 9 )) or
            (SCUsageInputObj.dateGen.Year > 2011)) then
         reportName := '201109/ActCounters/Act21';
        makeReport(reportName , argNames , args , 'xls');   // формируем АКТ
       end
       else
       begin
         reportName := '201109/ActZKU/NormalAct/Act21';
        makeReport(reportName , argNames , args , 'xls');   // формируем АКТ
       end;
       end;
     if kindCode = 2 then    // ПРИ ВЫВОДЕ ИЗ ЭКСПЛ ФОРМИРУЕМ ОЗ -1 по выводу
       begin
      reportName := 'Counters/VIVOD_EXPL/Counters_vivod_expl';
      makeReport(reportName , argNames , args , 'xls');   // формируем ОЗ-1
       end;
      if kindCode  = 3 then    // при приеме от абонентов формируем факт безоп
       begin

        if Self.isForExpertise(itemCode) then begin
            reportName := 'RepOrder/RQFKOrder/actCounterExpertise';
            makeReport(reportName , argNames , args , 'xls');
        end else begin
            reportName := 'Counters/actCounterFull';
            makeReport(reportName , argNames , args , 'xls');   // Акт безоплатньої передачі лічильників №
            reportName := 'Counters/deliveryOrder';
            makeReport(reportName , argNames , args , 'xls');   // " ПРИХОДНЫЙ ОРДЕР
        end;
       end;


      if kindCode  = 4 then    // акт монтажа-демонтажа зку + ОЗ-1 на ЗКУ
       begin
         reportName := 'Counters/ZKU/Counters_vvod_expl';
         makeReport(reportName , argNames , args , 'xls');

        reportName := '201109/ActZKU/Act21';
        makeReport(reportName , argNames , args , 'xls');   // формируем АКТ
      end;


       if kindCode  = 5 then    // замена в составе ЗКУ -  акт доробки зку
       begin
        // reportName := '201109/ActInZKU/Act21';
        // makeReport(reportName , argNames , args , 'xls');   // формируем АКТ
      end;

      TempSCUsageInput.isPrint(TempSCUsageInputObj.code);

end;

procedure TfrmSCUsageInputEdit.btnChk4FillClick(Sender: TObject);
var
    argNames, args: ArrayOfString;
    reportName: String;
begin
     if (edtMolCode.Text = '')  then
  begin
      Application.MessageBox(PChar('Необхідно вибрати МОЛ !'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      ModalResult := mrNone;
  end

  else
  begin
      SetLength(argNames, 3);
      SetLength(args, 3);


    argNames[0] := 'datestart';
    args[0] := DateToStr(edtDateStart.DateTime  );

    argNames[1] := 'datefinal';
    args[1] := DateToStr(edtDateFinal.DateTime);

    argNames[2] := 'finmolcode';
    args[2] := edtMolCode.Text;


    reportName := 'NotMaterialNotHumanInPlan';

    makeReport(reportName, argNames, args, 'xls')

   end;

end;

function TfrmSCUsageInputEdit.convertIsZKUToInt() : Integer;
begin
  if(isZKU) then begin
    Result := 1;
  end else begin
    Result := 0;
  end;
end;

end.
