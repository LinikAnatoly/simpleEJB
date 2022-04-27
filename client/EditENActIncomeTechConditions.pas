
unit EditENActIncomeTechConditions;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENConsts,
	  EnergyproController, EnergyproController2, ENActIncomeTechConditionsController,
  AdvObj, TB2Item, TB2Dock, TB2Toolbar, DFDocSignerController
  , ShowDocumentManagement;

type
  TfrmENActIncomeTechConditionsEdit = class(TDialogForm)
  
  lblCode : TLabel;
	edtCode : TEdit;

  HTTPRIOENActIncomeTechConditions: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    pcMain: TPageControl;
    tsGeneral: TTabSheet;
    tsDFDoc: TTabSheet;
    lblNumbergen: TLabel;
    lblDategen: TLabel;
    lblActDateStart: TLabel;
    lblActDateEnd: TLabel;
    lblSummaGen: TLabel;
    lblSummaVat: TLabel;
    lblCommentGen: TLabel;
    edtNumbergen: TEdit;
    edtDategen: TDateTimePicker;
    edtActDateStart: TDateTimePicker;
    edtActDateEnd: TDateTimePicker;
    edtSummaGen: TEdit;
    edtSummaVat: TEdit;
    edtCommentGen: TEdit;
    gbWarrant: TGroupBox;
    lblWarrantFIO: TLabel;
    lblWarrantNumber: TLabel;
    spbWarrantNumber: TSpeedButton;
    edtWarrantFIO: TEdit;
    edtWarrantNumber: TEdit;
    ImageList1: TImageList;
    alDoc: TActionList;
    actClearDFDocSigners: TAction;
    actViewDFDoc: TAction;
    actUpdateDFDocs: TAction;
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
    HTTPRIOENTechConditionsServices: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbWarrantNumberClick(Sender: TObject);
    procedure actViewDFDocExecute(Sender: TObject);
    procedure actClearDFDocSignersExecute(Sender: TObject);
    procedure actUpdateDFDocsExecute(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);


  private
    { Private declarations }
    procedure initDFDocsTab;
    procedure initDFDocSignersGrid(setDefaultSigners: Boolean = true);
    procedure loadDFDocSigners;
    function getDFDocSignersForSaving(var dfDocSigners: ArrayOfDFDocSigner): Boolean;
    procedure updateDFDocs;
  public
    { Public declarations }
    EnTechConditionsServicesCode : Integer;
    departmentCode : Integer;
    soCode : Integer;
    ENActIncomeTechConditionsObj: ENActIncomeTechConditions;
  end;

var
  frmENActIncomeTechConditionsEdit: TfrmENActIncomeTechConditionsEdit;

implementation

uses
  ENTechConditionsServicesController, ShowENWarrant, DMReportsUnit,
  ENWarrantController, ENDepartmentController, ENServicesObjectController;


{uses  
    EnergyproController, EnergyproController2, ENActIncomeTechConditionsController  ;
}
{$R *.dfm}



procedure TfrmENActIncomeTechConditionsEdit.FormShow(Sender: TObject);
var
  warrant : ENWarrant;
begin
  SetFloatStyle([edtSummaGen,edtSummaVat]);

  pcMain.ActivePage := tsGeneral;

  if DialogState = dsInsert then
  begin
    HideControls([lblCode, edtCode, btnPrint]);
    edtSummaGen.Text := '0';
    edtSummaVat.Text := '0';
  end;

  if DialogState = dsView then
  begin
    DisableControls([gbWarrant]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([edtNumbergen]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENActIncomeTechConditionsObj.code);
    edtNumbergen.Text := ENActIncomeTechConditionsObj.numbergen;

    if ENActIncomeTechConditionsObj.dategen <> nil then
    begin
      edtDategen.DateTime:=EncodeDate(ENActIncomeTechConditionsObj.dategen.Year,ENActIncomeTechConditionsObj.dategen.Month,ENActIncomeTechConditionsObj.dategen.Day);
      edtDategen.checked := true;
    end
    else
    begin
      edtDategen.DateTime:=SysUtils.Date;
      edtDategen.checked := false;
    end;
    if ENActIncomeTechConditionsObj.actDateStart <> nil then
    begin
      edtActDateStart.DateTime:=EncodeDate(ENActIncomeTechConditionsObj.actDateStart.Year,ENActIncomeTechConditionsObj.actDateStart.Month,ENActIncomeTechConditionsObj.actDateStart.Day);
      edtActDateStart.checked := true;
    end
    else
    begin
      edtActDateStart.DateTime:=SysUtils.Date;
      edtActDateStart.checked := false;
    end;
    if ENActIncomeTechConditionsObj.actDateEnd <> nil then
    begin
      edtActDateEnd.DateTime:=EncodeDate(ENActIncomeTechConditionsObj.actDateEnd.Year,ENActIncomeTechConditionsObj.actDateEnd.Month,ENActIncomeTechConditionsObj.actDateEnd.Day);
      edtActDateEnd.checked := true;
    end
    else
    begin
      edtActDateEnd.DateTime:=SysUtils.Date;
      edtActDateEnd.checked := false;
    end;
    if ( ENActIncomeTechConditionsObj.summaGen <> nil ) then
       edtSummaGen.Text := ENActIncomeTechConditionsObj.summaGen.decimalString
    else
       edtSummaGen.Text := ''; 
    if ( ENActIncomeTechConditionsObj.summaVat <> nil ) then
       edtSummaVat.Text := ENActIncomeTechConditionsObj.summaVat.decimalString
    else
       edtSummaVat.Text := ''; 
    edtCommentGen.Text := ENActIncomeTechConditionsObj.commentGen; 

    if (ENActIncomeTechConditionsObj.warrantRef.code <> LOW_INT) then
    begin
      warrant := DMReports.getWarrantByCode(ENActIncomeTechConditionsObj.warrantRef.code);

      edtWarrantNumber.Text := warrant.numbergen;
      edtWarrantFIO.Text := warrant.warrantFIO;
    end;    

  end;

  if (DialogState = dsview) or  (DialogState = dsview) then
  begin
    DisableControls([edtDategen, edtActDateStart , edtActDateEnd , edtNumbergen]);
  end;

  initDFDocsTab;
end;



function TfrmENActIncomeTechConditionsEdit.getDFDocSignersForSaving(
  var dfDocSigners: ArrayOfDFDocSigner): Boolean;
begin
  Result := DMReports.getDFDocSignersForSaving(ENActIncomeTechConditionsObj, Self, sgDFDocSigners, dfDocSigners);
end;

procedure TfrmENActIncomeTechConditionsEdit.initDFDocSignersGrid(
  setDefaultSigners: Boolean);
begin
  DMReports.initDFDocSignersGrid(ENActIncomeTechConditionsObj, Self, sgDFDocSigners, setDefaultSigners);
end;

procedure TfrmENActIncomeTechConditionsEdit.initDFDocsTab;
begin
  tsDFDoc.TabVisible := false;
  DisableActions([actClearDFDocSigners], DialogState = dsView);

  if ENActIncomeTechConditionsObj = nil then Exit;

  if DMReports.isSignable(ENActIncomeTechConditionsObj) then
  begin
    tsDFDoc.TabVisible := true;
    DMReports.setComponentPropsForDFDocsTab(Self, sgDFDocs, sgDFDocSigners);

    if (DialogState = dsInsert) then
      initDFDocSignersGrid;

    if (DialogState = dsEdit) or (DialogState = dsView) then
      loadDFDocSigners;
  end;
end;

procedure TfrmENActIncomeTechConditionsEdit.loadDFDocSigners;
begin
  DMReports.loadDFDocSigners(ENActIncomeTechConditionsObj, Self, sgDFDocSigners);
end;

procedure TfrmENActIncomeTechConditionsEdit.pcMainChange(Sender: TObject);
begin
  if (pcMain.ActivePage = tsDFDoc) then
  begin
    updateDFDocs;
  end;
end;

procedure TfrmENActIncomeTechConditionsEdit.actClearDFDocSignersExecute(
  Sender: TObject);
begin
  if DialogState = dsView then Exit;

  initDFDocSignersGrid(false);
end;

procedure TfrmENActIncomeTechConditionsEdit.actUpdateDFDocsExecute(
  Sender: TObject);
begin
  updateDFDocs;
end;

procedure TfrmENActIncomeTechConditionsEdit.actViewDFDocExecute(
  Sender: TObject);
begin
  ShowDocumentManagement.openDFDocForViewFromGrid(ENActIncomeTechConditionsObj, Self, sgDFDocs);
end;

procedure TfrmENActIncomeTechConditionsEdit.btnPrintClick(Sender: TObject);
var
  argNames, args: EnergyproController.ArrayOfString;
  reportName: String;
  TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
  ENTechConditionsServicesObj: ENTechConditionsServices;
begin
  if DialogState = dsInsert then Exit;
  if ENActIncomeTechConditionsObj = nil then Exit;
  if ENActIncomeTechConditionsObj.code <= 0 then Exit;

  if DMReports.printReportsForObject(ENActIncomeTechConditionsObj, true) then Exit;

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'codeAct';
  args[0] := IntToStr(ENActIncomeTechConditionsObj.code);

  TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
  ENTechConditionsServicesObj := TempENTechConditionsServices.getObject(ENActIncomeTechConditionsObj.techCondServicesRef.code);

  if (ENTechConditionsServicesObj.contragentForm.code = ENTECHCONDITIONSSERVICES_FORM_SOLIDARITY) then
    reportName := 'TechConditions/ActPriPerSolidary'
  else
    reportName := 'TechConditions/ActPriPer';

  makeReport(reportName, argNames, args, 'pdf');
end;

procedure TfrmENActIncomeTechConditionsEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENActIncomeTechConditions: ENActIncomeTechConditionsControllerSoapPort;
  dfDocSigners: ArrayOfDFDocSigner;
  isSignable: Boolean;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumbergen,
      edtDategen,
      edtActDateStart,
      edtActDateEnd
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    isSignable := DMReports.isSignable(ENActIncomeTechConditionsObj);

    //////
    if (isSignable) and (not DMReports.checkDFDocSigners(sgDFDocSigners)) then
    begin
      Application.MessageBox(PChar('Потрібно вказати всіх підписантів!'), PChar('Увага !'), MB_ICONWARNING + MB_OK);
      pcMain.ActivePage := tsDFDoc;
      Action := caNone;
      Exit;
    end;
    /////

    SetLength(dfDocSigners, 0);

    if isSignable then
    begin
      if not getDFDocSignersForSaving(dfDocSigners) then
      begin
        Action := caNone;
        Exit;
      end;
    end;

    TempENActIncomeTechConditions := HTTPRIOENActIncomeTechConditions as ENActIncomeTechConditionsControllerSoapPort;


     ENActIncomeTechConditionsObj.numbergen := edtNumbergen.Text;

     if edtdategen.checked then
     begin 
       if ENActIncomeTechConditionsObj.dategen = nil then
          ENActIncomeTechConditionsObj.dategen := TXSDate.Create;
       ENActIncomeTechConditionsObj.dategen.XSToNative(GetXSDate(edtdategen.DateTime));
     end
     else
       ENActIncomeTechConditionsObj.dategen := nil;

     if edtactDateStart.checked then
     begin
       if ENActIncomeTechConditionsObj.actDateStart = nil then
          ENActIncomeTechConditionsObj.actDateStart := TXSDate.Create;
       ENActIncomeTechConditionsObj.actDateStart.XSToNative(GetXSDate(edtactDateStart.DateTime));
     end
     else
       ENActIncomeTechConditionsObj.actDateStart := nil;

     if edtactDateEnd.checked then
     begin 
       if ENActIncomeTechConditionsObj.actDateEnd = nil then
          ENActIncomeTechConditionsObj.actDateEnd := TXSDate.Create;
       ENActIncomeTechConditionsObj.actDateEnd.XSToNative(GetXSDate(edtactDateEnd.DateTime));
     end
     else
       ENActIncomeTechConditionsObj.actDateEnd := nil;

     if (ENActIncomeTechConditionsObj.summaGen = nil ) then
       ENActIncomeTechConditionsObj.summaGen := TXSDecimal.Create;
     if edtSummaGen.Text <> '' then
       ENActIncomeTechConditionsObj.summaGen.decimalString := edtSummaGen.Text 
     else
       ENActIncomeTechConditionsObj.summaGen := nil;

     if (ENActIncomeTechConditionsObj.summaVat = nil ) then
       ENActIncomeTechConditionsObj.summaVat := TXSDecimal.Create;
     if edtSummaVat.Text <> '' then
       ENActIncomeTechConditionsObj.summaVat.decimalString := edtSummaVat.Text 
     else
       ENActIncomeTechConditionsObj.summaVat := nil;

     ENActIncomeTechConditionsObj.commentGen := edtCommentGen.Text;

     
     ENActIncomeTechConditionsObj.techCondServicesRef := ENTechConditionsServicesRef.Create;
     ENActIncomeTechConditionsObj.techCondServicesRef.code :=  EnTechConditionsServicesCode;


    if DialogState = dsInsert then
    begin
      ENActIncomeTechConditionsObj.code:=low(Integer);

      if High(dfDocSigners) > -1 then
        TempENActIncomeTechConditions.add(ENActIncomeTechConditionsObj, dfDocSigners)
      else
        TempENActIncomeTechConditions.add(ENActIncomeTechConditionsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      if High(dfDocSigners) > -1 then
        TempENActIncomeTechConditions.save(ENActIncomeTechConditionsObj, dfDocSigners)
      else
        TempENActIncomeTechConditions.save(ENActIncomeTechConditionsObj);
    end;
  end;
end;


procedure TfrmENActIncomeTechConditionsEdit.spbWarrantNumberClick(Sender: TObject);
var
  frmENWarrantShow : TfrmENWarrantShow;
  f : ENWarrantFilter;
  warrant : ENWarrant;
  datContract, datWarrant : TXSDate;
  dtdatContract, dtdatWarrant : TDateTime;
  power : Double;
begin
  datContract := TXSDate.Create;
  datWarrant := TXSDate.Create;

  f := ENWarrantFilter.Create();
  SetNullXSProps(f);
  SetNullIntProps(f);
  f.departmentRef := ENDepartmentRef.Create();
  f.departmentRef.code := departmentCode;
  f.conditionSQL := ' warrantstatusrefcode = 0';

  frmENWarrantShow := TfrmENWarrantShow.Create(Application,fmNormal, f);
  DisableActions([frmENWarrantShow.actNoFilter]);

  try
  with frmENWarrantShow do
    if ShowModal = mrOk then
    begin
      try
        ENActIncomeTechConditionsObj.warrantRef := ENWarrantRef.Create;
        ENActIncomeTechConditionsObj.warrantRef.code := StrToInt(GetReturnValue(sgENWarrant,0));

        warrant := DMReports.getWarrantByCode(ENActIncomeTechConditionsObj.warrantRef.code);

        if (warrant.warrantStatusRef.code = WARRANT_INVALID) then
        begin
          Application.MessageBox(PChar('Довіреність недійсна!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
          edtWarrantNumber.Text := '';
          edtWarrantFIO.Text := '';
          ENActIncomeTechConditionsObj.warrantRef.code := LOW_INT;
          Exit;
        end;

        edtWarrantNumber.Text := GetReturnValue(sgENWarrant,1);
        edtWarrantFIO.Text := GetReturnValue(sgENWarrant,3);

      except
        on EConvertError do Exit;
      end;
    end;
  finally
    frmENWarrantShow.Free;
  end;
end;

procedure TfrmENActIncomeTechConditionsEdit.updateDFDocs;
begin
  if DialogState = dsInsert then Exit;
  if ENActIncomeTechConditionsObj = nil then Exit;
  if ENActIncomeTechConditionsObj.code = LOW_INT then Exit;

  DMReports.fillDFDocsGrid(ENActIncomeTechConditionsObj, Self, sgDFDocs);
end;

end.