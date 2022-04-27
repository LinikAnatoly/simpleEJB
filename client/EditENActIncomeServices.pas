
unit EditENActIncomeServices;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENActIncomeServicesController, ExtCtrls,
    TB2Item, TB2Dock, TB2Toolbar, AdvObj, ENWarrantController, ShowENWarrant,
    ENActController;

type
    TfrmENActIncomeServicesEdit = class(TDialogForm)
    HTTPRIOENActIncomeServices: THTTPRIO;
    pnENActIncomeServices: TPanel;
    pcENActIncomeServices: TPageControl;
    tsGeneral: TTabSheet;
    edtNumberGen: TEdit;
    edtCommentGen: TMemo;
    edtSummaVat: TEdit;
    edtSummaGen: TEdit;
    edtDateGen: TDateTimePicker;
    lblCommentGen: TLabel;
    lblSummaVat: TLabel;
    lblSummaGen: TLabel;
    lblDateGen: TLabel;
    lblNumberGen: TLabel;
    edtCode: TEdit;
    lblCode: TLabel;
    btnCancel: TButton;
    btnOk: TButton;
    gbENAct: TGroupBox;
    edtActDateEnd: TDateTimePicker;
    edtActDateStart: TDateTimePicker;
    lblActDateEnd: TLabel;
    lblActDateStart: TLabel;
    btnPostings: TButton;
    btnPrintAct: TButton;
    btnPrintBill: TButton;
    HTTPRIOENServicesObject: THTTPRIO;
    chbIsManualSum: TCheckBox;
    tsENAct: TTabSheet;
    sgENAct: TAdvStringGrid;
    tbENAct: TTBToolbar;
    tbiViewActs: TTBItem;
    actlstENAct: TActionList;
    actENActView: TAction;
    ImageList1: TImageList;
    HTTPRIOENActIncomServ2ENAct: THTTPRIO;
    tbENActUpdate: TTBItem;
    actENActUpdate: TAction;
    HTTPRIOENAct: THTTPRIO;
    btnPrintRegistry: TButton;
    tsENWarrants: TTabSheet;
    gbWarrantExecutor: TGroupBox;
    lblWarrantFullNameExecutor: TLabel;
    lblWarrantNumberExecutor: TLabel;
    spbWarrantNumberExecutor: TSpeedButton;
    edtWarrantFullNameExecutor: TEdit;
    edtWarrantNumberExecutor: TEdit;
    gbWarrantAcceptor: TGroupBox;
    lblWarrantFullNameAcceptor: TLabel;
    lblWarrantNumberAcceptor: TLabel;
    spbWarrantNumberAcceptor: TSpeedButton;
    edtWarrantFullNameAcceptor: TEdit;
    edtWarrantNumberAcceptor: TEdit;
    HTTPRIOENWarrant: THTTPRIO;
    actENActDelete: TAction;
    tbiENActDelete: TTBItem;
    actENActFilter: TAction;
    tbiENActFilter: TTBItem;
    actENActNoFilter: TAction;
    tbiENActNoFilter: TTBItem;
    pmActs: TPopupMenu;
    miENActView: TMenuItem;
    miENActDelete: TMenuItem;
    miENActUpdate: TMenuItem;
    miENActFilter: TMenuItem;
    miENActNoFilter: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrintActClick(Sender: TObject);
    procedure btnPostingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintBillClick(Sender: TObject);
    procedure chbIsManualSumClick(Sender: TObject);
    procedure edtSummaGenChange(Sender: TObject);
    procedure actENActViewExecute(Sender: TObject);
    procedure actENActUpdateExecute(Sender: TObject);
    procedure pcENActIncomeServicesChange(Sender: TObject);
    procedure sgENActDblClick(Sender: TObject);
    procedure btnPrintRegistryClick(Sender: TObject);
    procedure sgENActTopLeftChanged(Sender: TObject);
    procedure spbWarrantNumberExecutorClick(Sender: TObject);
    procedure spbWarrantNumberAcceptorClick(Sender: TObject);

    procedure setWarrantExecutor(warrant : ENWarrantShort);
    procedure setWarrantAcceptor(warrant : ENWarrantShort);
    function getPreviousWarrant(isExecutor : Boolean) : ENWarrantShort;
    function getPreviousWarrantAcceptor : ENWarrantShort;
    function getPreviousWarrantExecutor : ENWarrantShort;
    function getWarrantCurrent(isExecutor : Boolean) : ENWarrantShort;
    procedure actENActDeleteExecute(Sender: TObject);
    procedure actENActFilterExecute(Sender: TObject);
    procedure actENActNoFilterExecute(Sender: TObject);

  private
    actFilterObj: ENActFilter;
    procedure updateENAct(reset : Boolean = true);
    { Private declarations }
  public
    { Public declarations }
    actIncomeServicesCode: Integer;
  end;

var
  frmENActIncomeServicesEdit: TfrmENActIncomeServicesEdit;
  ENActIncomeServicesObj: ENActIncomeServices;

  ENActHeaders: array [1..4] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'Сума, що була сформована з акту (не обов''язково співпадає із сумою акту), грн.'
        );

implementation


uses EditPostings, EnergyproController, DMReportsUnit, ENServicesObjectController, ENConsts
, BaseUtilsUnit, ENActIncomServ2ENActController, EditENAct, FinancialUtilsUnit,
  EditENActFilter;

{$R *.dfm}


procedure TfrmENActIncomeServicesEdit.updateENAct(reset : Boolean = true);
const PAGE_SIZE : Integer = 100;
var
  TempENActIncomServ2ENAct : ENActIncomServ2ENActControllerSoapPort;
  TempENAct : ENActControllerSoapPort;
  filter : ENActIncomServ2ENActFilter;
  ENActIncomServ2ENActList : ENActIncomServ2ENActShortList;
  i, pageNum, LastRow, startPoint : Integer;
  actsArr: ENActController.ArrayOfInteger;
  strActCodes: String;
begin

if reset then begin
    sgENAct.RowCount := 2;
    sgENAct.Clear;
    SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
    sgENAct.AutoSizeRow(0);
    pageNum := 0;
    startPoint := 1;
  end else begin
    pageNum := Trunc(sgENAct.RowCount / PAGE_SIZE);
    startPoint := sgENAct.RowCount;
    if (sgENAct.RowCount - 1) Mod PAGE_SIZE <> 0 then begin
      Exit;
    end;
    if (sgENAct.TopRow + sgENAct.VisibleRowCount) < pageNum * PAGE_SIZE then Exit;
  end;

  if ENActIncomeServicesObj = nil then Exit;
  if ENActIncomeServicesObj.code = LOW_INT then Exit;

  strActCodes := '';
  if actFilterObj <> nil then
  begin
    if actFilterObj.numberGen = '' then
    begin
      Application.MessageBox(PChar('Для пошуку акту введіть його номер!'),
                             PChar('Увага !'), MB_ICONWARNING);
      Exit;
    end;

    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
    actsArr := TempENAct.getScrollableFilteredCodeArray(actFilterObj, 0, -1);
    if High(actsArr) > -1 then
      strActCodes := BaseUtils.arrayOfIntegers2String(actsArr, ',');
  end;

  filter := ENActIncomServ2ENActFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  filter.actIncomeRef := ENActIncomeServicesRef.Create;
  filter.actIncomeRef.code := ENActIncomeServicesObj.code;
  if strActCodes <> '' then
    filter.conditionSQL := 'ENACT.CODE in (' + strActCodes + ')'
  else
    filter.conditionSQL := '';
  filter.orderBySQL := 'ENACT.DATEACT DESC';

  TempENActIncomServ2ENAct := HTTPRIOENActIncomServ2ENAct as ENActIncomServ2ENActControllerSoapPort;

  ENActIncomServ2ENActList := TempENActIncomServ2ENAct.getScrollableFilteredList(filter
    , pageNum * PAGE_SIZE, PAGE_SIZE);

  if ENActIncomServ2ENActList.totalCount = 0 then Exit;

  sgENAct.RowCount := sgENAct.RowCount + ENActIncomServ2ENActList.totalCount;
  if (reset) and (ENActIncomServ2ENActList.totalCount > 0) then
    sgENAct.RowCount := sgENAct.RowCount - 1;

      with sgENAct do
      for i:= 0 to ENActIncomServ2ENActList.totalCount - 1 do
      begin
        Application.ProcessMessages;
        LastRow := i + startPoint;
        if ENActIncomServ2ENActList.list[i].code <> Low(Integer) then
          Cells[0, LastRow] := IntToStr(ENActIncomServ2ENActList.list[i].code)
        else
          Cells[0, LastRow] := '';
        Cells[1, LastRow] := ENActIncomServ2ENActList.list[i].actRefNumberGen;
        if ENActIncomServ2ENActList.list[i].actRefDateAct = nil then
          Cells[2, LastRow] := ''
        else
          Cells[2, LastRow] := XSDate2String(ENActIncomServ2ENActList.list[i].actRefDateAct);

        if ENActIncomServ2ENActList.list[i].summaGen = nil then
          Cells[3, LastRow] := ''
        else
          Cells[3, LastRow] := ENActIncomServ2ENActList.list[i].summaGen.DecimalString;

          Objects[0, LastRow] := TObject(ENActIncomServ2ENActList.list[i].actRefCode);
      end;
      if reset then sgENAct.Row := startPoint else sgENAct.Row := startPoint - 1;

end;

procedure TfrmENActIncomeServicesEdit.FormShow(Sender: TObject);
var
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  servicesObject : ENServicesObject;
  warrant : ENWarrantShort;
begin
  pcENActIncomeServices.ActivePage := tsGeneral;
  DisableControls([edtCode, edtSummaGen, edtSummaVat, edtWarrantNumberExecutor
    , edtWarrantNumberAcceptor, edtWarrantFullNameExecutor, edtWarrantFullNameAcceptor]);
  edtCode.Visible := (DialogState <> dsInsert);
  lblCode.Visible := (DialogState <> dsInsert);
  SetFloatStyle([edtSummaGen, edtSummaVat]);
  btnPrintBill.Visible := (DialogState <> dsInsert);
  btnPrintAct.Visible := (DialogState <> dsInsert);
  btnPostings.Visible := (DialogState <> dsInsert);
  tsENAct.TabVisible := (DialogState <> dsInsert);

  HideControls([btnPrintRegistry]);

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(ENActIncomeServicesObj.servicesObjectRef.code);

  if(servicesObject.contractTypeRef.code <> ENSERVICESOBJECTTYPE_SHIFT_LINES) then begin
    HideControls([chbIsManualSum]);
  end;

  tsENWarrants.TabVisible := (servicesObject.contractTypeRef.code = ENSERVICESOBJECTTYPE_SHIFT_LINES);

  if (DialogState = dsInsert) then
  begin
    edtSummaGen.Text := '0';
    edtSummaVat.Text := '0';

    if servicesObject.contractTypeRef.code = ENSERVICESOBJECTTYPE_SHIFT_LINES then begin
      warrant := Self.getPreviousWarrantExecutor;
      if Assigned(warrant) then Self.setWarrantExecutor(warrant);
      warrant := Self.getPreviousWarrantAcceptor;
      if Assigned(warrant) then Self.setWarrantAcceptor(warrant);
    end;
  end;

  if (DialogState = dsView) then begin
    DisableControls([spbWarrantNumberExecutor, spbWarrantNumberAcceptor]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtNumberGen, edtDateGen, edtActDateStart, edtActDateEnd, edtSummaGen, edtSummaVat, edtCommentGen]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    // NET-4572 для типа договоров по выносу линий скрываются кнопки
    if (servicesObject.contractTypeRef.code = ENSERVICESOBJECTTYPE_SHIFT_LINES) then
    begin
      HideControls([btnPrintBill, btnPrintAct, btnPostings]);
      // Для договоров на выполнение работ по заявкам Поставщиков
      // показываем кнопку для печати реестра
      if (servicesObject.contractKindRef.code = SERVICES_CONTRACT_KIND_SUPPLIER) then
        HideControls([btnPrintRegistry], false);
    end;

    edtCode.Text := IntToStr(ENActIncomeServicesObj.code);
    edtNumberGen.Text := ENActIncomeServicesObj.numberGen;
    SetDateFieldForDateTimePicker(edtDateGen, ENActIncomeServicesObj.dateGen);
    SetDateFieldForDateTimePicker(edtActDateStart, ENActIncomeServicesObj.actDateStart);
    SetDateFieldForDateTimePicker(edtActDateEnd, ENActIncomeServicesObj.actDateEnd);
	
	  chbIsManualSum.Checked := (Assigned(ENActInComeServicesObj.isManualSum))
      and (ENActInComeServicesObj.isManualSum.asBoolean);

    if ( ENActIncomeServicesObj.summaGen <> nil ) then
       edtSummaGen.Text := ENActIncomeServicesObj.summaGen.decimalString
    else
       edtSummaGen.Text := '';

    if ( ENActIncomeServicesObj.summaVat <> nil ) then
       edtSummaVat.Text := ENActIncomeServicesObj.summaVat.decimalString
    else
       edtSummaVat.Text := '';

    edtCommentGen.Text := ENActIncomeServicesObj.commentGen;

    warrant := getWarrantCurrent(true);
    if Assigned(warrant) then Self.setWarrantExecutor(warrant);
    warrant := getWarrantCurrent(false);
    if Assigned(warrant) then Self.setWarrantAcceptor(warrant);
  end;
end;


procedure TfrmENActIncomeServicesEdit.pcENActIncomeServicesChange(
  Sender: TObject);
begin
  inherited;
  if pcENActIncomeServices.ActivePage = tsENAct then begin
    actENActUpdateExecute(Sender);
  end;
end;

procedure TfrmENActIncomeServicesEdit.sgENActDblClick(Sender: TObject);
begin
  inherited;
  actENActViewExecute(Sender);
end;

procedure TfrmENActIncomeServicesEdit.sgENActTopLeftChanged(Sender: TObject);
begin
  inherited;
  Self.updateENAct(false);
end;

function TfrmENActIncomeServicesEdit.getPreviousWarrantExecutor : ENWarrantShort;
begin
  Result := Self.getPreviousWarrant(true);
end;

function TfrmENActIncomeServicesEdit.getPreviousWarrantAcceptor : ENWarrantShort;
begin
  Result := Self.getPreviousWarrant(false);
end;

function TfrmENActIncomeServicesEdit.getWarrantCurrent(isExecutor : Boolean) : ENWarrantShort;
var
  warrant : ENWarrantShort;
  warrantCode : Integer;
  filter : ENWarrantFilter;
  list : ENWarrantShortList;
  TempENWarrant : ENWarrantControllerSoapPort;
begin
  warrant := nil;
  warrantCode := Low(Integer);
  TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
  filter := ENWarrantFilter.Create;
  SetNullXSProps(filter);
  SetNullIntProps(filter);
  if isExecutor then begin
    if (Assigned(ENActIncomeServicesObj.warrantExecutorRef))
      and (ENActIncomeServicesObj.warrantExecutorRef.code <> Low(Integer)) then begin
      warrantCode := ENActIncomeServicesObj.warrantExecutorRef.code;
    end;
  end else begin
    if (Assigned(ENActIncomeServicesObj.warrantAcceptorRef))
      and (ENActIncomeServicesObj.warrantAcceptorRef.code <> Low(Integer)) then begin
      warrantCode := ENActIncomeServicesObj.warrantAcceptorRef.code;
    end;
  end;
  if warrantCode <> Low(Integer) then begin
    filter.code := warrantCode;
    list := TempENWarrant.getScrollableFilteredList(filter, 0, -1, Low(Integer));
    if list.totalCount > 0 then warrant := list.list[0];
    
  end;
  Result := warrant;
end;

function TfrmENActIncomeServicesEdit.getPreviousWarrant(isExecutor : Boolean) : ENWarrantShort;
var
  warrant : ENWarrantShort;
  TempENWarrant : ENWarrantControllerSoapPort;
  TempENActIncomeServices : ENActIncomeServicesControllerSoapPort;
  TempENServicesObject : ENServicesObjectControllerSoapPort;
  actIncomeFilter : ENActIncomeServicesFilter;
  actIncomeArray : ENActIncomeServicesController.ArrayOfInteger;
  act : ENActIncomeServices;
  servicesObject : ENServicesObject;
  warrantFilter : ENWarrantFilter;
  warrantList : ENWarrantShortList;
  warrantCode : Integer;
begin
    warrant := nil;
    warrantCode := Low(Integer);
    TempENWarrant := HTTPRIOENWarrant as ENWarrantControllerSoapPort;
    TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;
    TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
    actIncomeFilter := ENActIncomeServicesFilter.Create;
    SetNullXSProps(actIncomeFilter);
    SetNullIntProps(actIncomeFilter);
    servicesObject := TempENServicesObject.getObject(ENActIncomeServicesObj.servicesObjectRef.code);
    actIncomeFilter.servicesObjectRef := ENServicesObjectRef.Create;
    actIncomeFilter.servicesObjectRef.code := ENActIncomeServicesObj.servicesObjectRef.code;
    if isExecutor then begin
      actIncomeFilter.conditionSQL :=
        'enactincomeservices.warrantexecutorrefcode is not null';
    end else begin
      actIncomeFilter.conditionSQL :=
        'enactincomeservices.warrantacceptorrefcode is not null';
    end;
    actIncomeFilter.orderBySQL := 'enactincomeservices.dategen desc';
    actIncomeArray := TempENActIncomeServices.getScrollableFilteredCodeArray(actIncomeFilter, 0, 1);

    if Length(actIncomeArray) > 0 then begin
      act := TempENActIncomeServices.getObject(actIncomeArray[0]);
      if isExecutor then warrantCode := act.warrantExecutorRef.code
      else warrantCode := act.warrantAcceptorRef.code;
    end else begin
      if isExecutor then begin
        if Assigned(servicesObject.warrantRef)
          and (servicesObject.warrantRef.code <> Low(Integer)) then
        begin
          warrantCode := servicesObject.warrantRef.code;
        end;
      end;
    end;

    if warrantCode <> Low(Integer) then begin
      warrantFilter := ENWarrantFilter.Create;
      SetNullXSProps(warrantFilter);
      SetNullIntProps(warrantFilter);
      warrantFilter.code := warrantCode;
      warrantList := TempENWarrant.getScrollableFilteredList(warrantFilter, 0, 1, Low(Integer));
      if warrantList.totalCount > 0 then warrant := warrantList.list[0];
    end;

    Result := warrant;


end;


procedure TfrmENActIncomeServicesEdit.setWarrantExecutor(warrant : ENWarrantShort);
begin
		if not Assigned(ENActIncomeServicesObj.warrantExecutorRef) then
			ENActIncomeServicesObj.warrantExecutorRef := ENWarrantRef.Create;
		ENActIncomeServicesObj.warrantExecutorRef.code := warrant.code;
    edtWarrantNumberExecutor.Text := warrant.numberGen;
    edtWarrantFullnameExecutor.Text := warrant.warrantFIO;
end;

procedure TfrmENActIncomeServicesEdit.setWarrantAcceptor(warrant : ENWarrantShort);
begin
		if not Assigned(ENActIncomeServicesObj.warrantAcceptorRef) then
			ENActIncomeServicesObj.warrantAcceptorRef := ENWarrantRef.Create;
		ENActIncomeServicesObj.warrantAcceptorRef.code := warrant.code;
    edtWarrantNumberAcceptor.Text := warrant.numberGen;
    edtWarrantFullnameAcceptor.Text := warrant.warrantFIO;
end;

procedure TfrmENActIncomeServicesEdit.spbWarrantNumberAcceptorClick(
  Sender: TObject);
var
	warrant : ENWarrantShort;
begin
	warrant := TfrmENWarrantShow.chooseFromList(true, false);
	if Assigned(warrant) then begin
    Self.setWarrantAcceptor(warrant);
	end;
end;

procedure TfrmENActIncomeServicesEdit.spbWarrantNumberExecutorClick(
  Sender: TObject);
var
	warrant : ENWarrantShort;
begin
	warrant := TfrmENWarrantShow.chooseFromList(false);
	if Assigned(warrant) then begin
    Self.setWarrantExecutor(warrant);
	end;
end;

procedure TfrmENActIncomeServicesEdit.actENActDeleteExecute(Sender: TObject);
var
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
  actCode: Integer;
begin
  actCode := Integer(sgENAct.Objects[0, sgENAct.Row]);
  if actCode <= 0 then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити прив''язку обраного видаткового акту до договору?'),
                            PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) <> IDOK then
    Exit;

  TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;
  TempENActIncomeServices.removeActFromActIncomeServices(actCode);
  actENActUpdateExecute(Sender);
end;

procedure TfrmENActIncomeServicesEdit.actENActFilterExecute(Sender: TObject);
begin
  frmENActFilterEdit := TfrmENActFilterEdit.Create(Application, dsInsert);
  try
    ENActFilterObj := ENActFilter.Create;
    SetNullIntProps(ENActFilterObj);
    SetNullXSProps(ENActFilterObj);

    if frmENActFilterEdit.ShowModal = mrOk then
    begin
      actFilterObj := ENActFilter.Create;
      actFilterObj := ENActFilterObj;
      updateENAct;
    end;

    ENActFilterObj := nil;
  finally
    frmENActFilterEdit.Free;
    frmENActFilterEdit := nil;
  end;
end;

procedure TfrmENActIncomeServicesEdit.actENActNoFilterExecute(Sender: TObject);
begin
  actFilterObj := nil;
  updateENAct;
end;

procedure TfrmENActIncomeServicesEdit.actENActUpdateExecute(Sender: TObject);
begin
  inherited;
  Self.updateENAct;
end;

procedure TfrmENActIncomeServicesEdit.actENActViewExecute(Sender: TObject);
var
TempENAct: ENActControllerSoapPort;
begin
  inherited;
  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

   frmENActEdit:=TfrmENActEdit.Create(Application, dsView);
   try
     try
       frmENActEdit.ENActObj := TempENAct.getObject(Integer(sgENAct.Objects[0, sgENAct.Row]));
     except
       on EConvertError do Exit;
     end;
     frmENActEdit.ShowModal;
   finally
     frmENActEdit.Free;
     frmENActEdit:=nil;
   end;
end;

procedure TfrmENActIncomeServicesEdit.btnPostingsClick(Sender: TObject);
begin
  inherited;
  frmPostingsEdit := TfrmPostingsEdit.Create(Application, dsInsert);
  try
    frmPostingsEdit.actIncomeServicesCode := ENActIncomeServicesObj.code;
    frmPostingsEdit.servicesObjectCode := ENActIncomeServicesObj.servicesObjectRef.code;
    frmPostingsEdit.ShowModal;
  finally
    frmPostingsEdit.Free;
  end;
end;


procedure TfrmENActIncomeServicesEdit.btnPrintActClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  inherited;
  if ENActIncomeServicesObj = nil then Exit;
  if ENActIncomeServicesObj.code = Low(Integer) then Exit;  

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'actIncomeServicesCode';
  args[0] := IntToStr(ENActIncomeServicesObj.code);

  reportName := '201109/ActCalcAdditionalWorkG/ActIncomeServices';
  makeReport(reportName, argNames, args, 'pdf');
end;


procedure TfrmENActIncomeServicesEdit.btnPrintBillClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
begin
  inherited;
  if ENActIncomeServicesObj = nil then Exit;
  if ENActIncomeServicesObj.code = Low(Integer) then Exit;

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'actIncomeServicesCode';
  args[0] := IntToStr(ENActIncomeServicesObj.code);

  reportName := 'Services/Bill/bill4ActIncomeServices';
  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENActIncomeServicesEdit.btnPrintRegistryClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
begin
  if DialogState = dsInsert then Exit;

  if ENActIncomeServicesObj = nil then Exit;
  if ENActIncomeServicesObj.code = LOW_INT then Exit;
  if ENActIncomeServicesObj.servicesObjectRef = nil then Exit;
  if ENActIncomeServicesObj.servicesObjectRef.code = LOW_INT then Exit;

  /////// Parameters
  SetLength(argNames, 4);
  SetLength(args, 4);

  argNames[0] := 'servicesObjectCode';
  args[0] := IntToStr(ENActIncomeServicesObj.servicesObjectRef.code);

  argNames[1] := 'actIncomeCode';
  args[1] := IntToStr(ENActIncomeServicesObj.code);

  argNames[2] := 'actIncomeNum';
  args[2] := ENActIncomeServicesObj.numberGen;

  argNames[3] := 'actIncomeDate';
  args[3] := XSDate2String(ENActIncomeServicesObj.dateGen);
  ///////

  makeReport('Services/4Supplier/registryForSupplierByActIncome', argNames, args, 'xls');
end;

procedure TfrmENActIncomeServicesEdit.chbIsManualSumClick(Sender: TObject);
begin
  inherited;
  if not chbIsManualSum.Checked then begin
   DisableControls([edtSummaGen, edtSummaVAT], True);
   HideControls([gbENAct], False);
  end else begin
   DisableControls([edtSummaGen, edtSummaVAT], False);
   HideControls([gbENAct]);
  end;
end;

procedure TfrmENActIncomeServicesEdit.edtSummaGenChange(Sender: TObject);
var
 date : TDateTime;
begin
  inherited;
  date := Now();
  if edtDateGen.Checked then date := edtDateGen.DateTime;
  FinancialUtilsUnit.calculateVat(edtSummaGen, edtSummaVat, date, False);

end;

procedure TfrmENActIncomeServicesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENActIncomeServices: ENActIncomeServicesControllerSoapPort;
  components : TArray<TWinControl>;
begin
  // NET-4572 Если установлен флаг, что сумму считать вручную, то скрываются поля дат начала и конца периода
  // для расходных актов
  if chbIsManualSum.Checked then begin
    components := TArray<TWinControl>.Create(edtNumberGen, edtDateGen);
  end else begin
    components := TArray<TWinControl>.Create(edtNumberGen, edtDateGen, edtActDateStart, edtActDateEnd);
  end;

  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues(components) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end
  else
  begin
    TempENActIncomeServices := HTTPRIOENActIncomeServices as ENActIncomeServicesControllerSoapPort;

    ENActIncomeServicesObj.numberGen := edtNumberGen.Text;
    ENActIncomeServicesObj.dateGen := GetTXSDateFromTDateTimePicker(edtdateGen);
    ENActIncomeServicesObj.actDateStart := GetTXSDateFromTDateTimePicker(edtactDateStart);
    ENActIncomeServicesObj.actDateEnd := GetTXSDateFromTDateTimePicker(edtactDateEnd);

    if (ENActIncomeServicesObj.summaGen = nil ) then
      ENActIncomeServicesObj.summaGen := TXSDecimal.Create;
    if edtSummaGen.Text <> '' then
      ENActIncomeServicesObj.summaGen.decimalString := edtSummaGen.Text
    else
      ENActIncomeServicesObj.summaGen := nil;

    if (ENActIncomeServicesObj.summaVat = nil ) then
      ENActIncomeServicesObj.summaVat := TXSDecimal.Create;
    if edtSummaVat.Text <> '' then
      ENActIncomeServicesObj.summaVat.decimalString := edtSummaVat.Text
    else
      ENActIncomeServicesObj.summaVat := nil;

    ENActIncomeServicesObj.commentGen := edtCommentGen.Text;
	
    if chbIsManualSum.Checked then begin
        ENActInComeServicesObj.isManualSum := TXSBoolean.Create;
		ENActInComeServicesObj.isManualSum.asBoolean := True;
	end;

    if DialogState = dsInsert then
    begin
      ENActIncomeServicesObj.code:=low(Integer);
      actIncomeServicesCode := TempENActIncomeServices.add(ENActIncomeServicesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActIncomeServices.save(ENActIncomeServicesObj);
    end;
  end;

end;


procedure TfrmENActIncomeServicesEdit.FormCreate(Sender: TObject);
begin
  inherited;
  actIncomeServicesCode := Low(Integer);
  actFilterObj := nil;
end;


end.