
unit EditENSheets4SO;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  ENSheets4SOController, AdvObj, EditENSheets4SOItems,
    Generics.Collections, Generics.Defaults, ENSheets4SOItemsTemplateController;

type
  TfrmENSheets4SOEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    pcSheets: TPageControl;
    HTTPRIOENSheets4SO: THTTPRIO;
    HTTPRIOENSheets4SOType: THTTPRIO;
    HTTPRIOENServicesObject: THTTPRIO;
    HTTPRIOENSigner: THTTPRIO;
    tsOveral: TTabSheet;
    gbAdditional: TGroupBox;
    lblRecipient: TLabel;
    lblSignerPosition: TLabel;
    lblSignerFio: TLabel;
    lblExecutorFio: TLabel;
    lblExecutorPhone: TLabel;
    lblExecutorEmail: TLabel;
    lblAdditionalText: TLabel;
    lblRecipientAddress: TLabel;
    spbExecutor: TSpeedButton;
    edtRecipient: TEdit;
    edtSignerPosition: TEdit;
    edtSignerFio: TEdit;
    edtExecutorFio: TEdit;
    edtExecutorPhone: TEdit;
    edtExecutorEmail: TEdit;
    edtAdditionalText: TMemo;
    edtRecipientAddress: TEdit;
    chbIsWithSignature: TCheckBox;
    btnENSheet4SOTypeClear: TSpeedButton;
    btnENSheet4SOType: TSpeedButton;
    edtENSheet4SOTypeName: TEdit;
    edtCommentgen: TMemo;
    Label2: TLabel;
    lblCommentgen: TLabel;
    edtDayscnt: TEdit;
    lblDayscnt: TLabel;
    lblDateGen: TLabel;
    edtDateGen: TDateTimePicker;
    edtName: TMemo;
    edtNumbergen: TEdit;
    lblNumbergen: TLabel;
    lblName: TLabel;
    tsItems: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    sgENSheets4SOItems: TAdvStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    ImageList1: TImageList;
    actInsertDefault: TAction;
    actDeleteDefault: TAction;
    btnInsertDefault: TToolButton;
    btnDeleteDefault: TToolButton;
    HTTPRIOENSheets4SOItems: THTTPRIO;
    btnRegenerateSheet: TButton;
    HTTPRIO1: THTTPRIO;
    lblPostCode: TLabel;
    edtPostCode: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnENSheet4SOTypeClick(Sender: TObject);
    procedure btnENSheet4SOTypeClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chbIsWithSignatureClick(Sender: TObject);
    procedure spbExecutorClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actInsertDefaultExecute(Sender: TObject);
    procedure actDeleteDefaultExecute(Sender: TObject);
    procedure btnRegenerateSheetClick(Sender: TObject);
  private
    { Private declarations }
    itemList: TList<ENSheets4SOItems>;
    procedure initFields();
    procedure initFieldsByPreviousSheet();
    procedure initFieldsBySheetType(sheetTypeCode: Integer; onlyIfEmpty: Boolean = true);
    procedure initFieldsByServicesObject();
    procedure setDefaultDaysCnt();
    procedure setSigner(signerCode: Integer);
    procedure renderItemList;
    function getItemsForSaving: ArrayOfENSheets4SOItems;
  public
    { Public declarations }
    previousSheetCode: Integer;
  end;

var
  frmENSheets4SOEdit: TfrmENSheets4SOEdit;
  ENSheets4SOObj: ENSheets4SO;

  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSheets4SOItemsHeaders: array [1..3] of String =
        ( 'Код'
          ,'зміст пункту'
          ,'доповнення до пункту'
        );


implementation

uses ShowENSheets4SOType, ENSheets4SOTypeController, ENConsts,
  ENServicesObjectController, DMReportsUnit, ENSettingsConsts,
  ENSignerController, ShowENExecutor, ENExecutorController;

{$R *.dfm}



procedure TfrmENSheets4SOEdit.renderItemList;
var
  i, count: Integer;
begin
  ClearGrid(sgENSheets4SOItems);

  count := itemList.Count;

  if count > 0 then
    sgENSheets4SOItems.RowCount := count + 1
  else
    sgENSheets4SOItems.RowCount := 2;

  with sgENSheets4SOItems do
    for i := 0 to count-1 do
    begin
      if itemList[i].sheetItemTemplateRef.code <> LOW_INT then
        Cells[0, i + 1] := IntToStr(itemList[i].sheetItemTemplateRef.code)
      else
        Cells[0, i + 1] := '';
      Cells[1, i + 1] := itemList[i].contentValue;
      Cells[2, i + 1] := itemList[i].additionalContent;

      sgENSheets4SOItems.RowCount := i + 2;
    end;

  sgENSheets4SOItems.Row := 1;
end;



procedure TfrmENSheets4SOEdit.FormShow(Sender: TObject);
var
  TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  ENSheets4SOTypeObj: ENSheets4SOType;
  servicesObject: ENServicesObject;
begin
  DisableControls([edtCode, edtENSheet4SOTypeName]);
  SetIntStyle(edtDayscnt);
  tsItems.TabVisible := False;
  btnRegenerateSheet.Visible := False;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode, lblNumbergen, edtNumbergen]);
    HideActions([actInsertDefault, actDeleteDefault]);

    if ENSheets4SOObj.sheet4sotype <> nil then
    if ENSheets4SOObj.sheet4sotype.code = ENSHEETS4SOTYPE_ISSUE then
       tsItems.TabVisible := True;

    chbIsWithSignature.Checked := false;
    chbIsWithSignature.Visible := false;

    if previousSheetCode > 0 then
      initFieldsByPreviousSheet();
    initFields();
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtDateGen
      ,edtDayscnt
      ,edtENSheet4SOTypeName
      ,edtSignerPosition
      ,edtSignerFio
     ]);
   end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    HideActions([actInsert, actDelete]);
    btnRegenerateSheet.Visible := True;
    edtCode.Text := IntToStr(ENSheets4SOObj.code);
    edtNumbergen.Text := ENSheets4SOObj.numbergen;
    MakeMultiline(edtName.Lines, ENSheets4SOObj.name);
    SetDateFieldForDateTimePicker(edtDateGen, ENSheets4SOObj.dateGen);
    if ( ENSheets4SOObj.dayscnt <> LOW_INT ) then
       edtDayscnt.Text := IntToStr(ENSheets4SOObj.dayscnt)
    else
       edtDayscnt.Text := '';

    edtRecipient.Text := ENSheets4SOObj.recipient;
    edtRecipientAddress.Text := ENSheets4SOObj.recipientAddress;
    edtPostCode.Text := ENSheets4SOObj.postCode;

    edtSignerPosition.Text := ENSheets4SOObj.signerPosition;
    edtSignerFio.Text := ENSheets4SOObj.signerFio;
    chbIsWithSignature.Checked := (ENSheets4SOObj.isWithSignature = 1);

    edtExecutorFio.Text := ENSheets4SOObj.executorFio;
    edtExecutorPhone.Text := ENSheets4SOObj.executorPhone;
    edtExecutorEmail.Text := ENSheets4SOObj.executorEmail;

    MakeMultiline(edtAdditionalText.Lines, ENSheets4SOObj.additionalText);
    MakeMultiline(edtCommentgen.Lines, ENSheets4SOObj.commentgen);

    if ENSheets4SOObj.sheet4sotype <> nil then
      if ENSheets4SOObj.sheet4sotype.code <> LOW_INT then
      begin
        if ENSheets4SOObj.sheet4sotype.code <> ENSHEETS4SOTYPE_LAND_SHEET then
          HideControls([lblDayscnt, edtDayscnt]);

        if ENSheets4SOObj.sheet4sotype.code = ENSHEETS4SOTYPE_ISSUE then
           tsItems.TabVisible := True;

        TempENSheets4SOType := HTTPRIOENSheets4SOType as ENSheets4SOTypeControllerSoapPort;
        ENSheets4SOTypeObj := TempENSheets4SOType.getObject(ENSheets4SOObj.sheet4sotype.code);
        if ENSheets4SOTypeObj <> nil then
          edtENSheet4SOTypeName.Text := ENSheets4SOTypeObj.name;
      end;

      actUpdateExecute(Sender);
  end;

  DisableControls([btnENSheet4SOType, btnENSheet4SOTypeClear]);
end;



procedure TfrmENSheets4SOEdit.setSigner(signerCode: Integer);
var
  TempENSigner: ENSignerControllerSoapPort;
  signer: ENSigner;
begin
  if signerCode <= 0 then Exit;

  TempENSigner := HTTPRIOENSigner as ENSignerControllerSoapPort;
  signer := TempENSigner.getObject(signerCode);

  if signer <> nil then
  begin
    edtSignerPosition.Text := signer.signerPosition;
    edtSignerFio.Text := signer.signerFio;
  end;
end;

procedure TfrmENSheets4SOEdit.setDefaultDaysCnt;
var
  daysCnt: Integer;
  TempENServicesObject: ENServicesObjectControllerSoapPort;
begin
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  daysCnt := TempENServicesObject.getLandSheetDelayForServicesObject(ENSheets4SOObj.servicesobject.code);

  if daysCnt > 0 then
  begin
    edtDayscnt.Text := IntToStr(daysCnt);
    DisableControls([edtDayscnt]);
  end;
end;

procedure TfrmENSheets4SOEdit.spbExecutorClick(Sender: TObject);
var
  frmENExecutorShow: TfrmENExecutorShow;
  executorFilter: ENExecutorFilter;
begin
  executorFilter := ENExecutorFilter.Create;
  SetNullIntProps(executorFilter);
  SetNullXSProps(executorFilter);

  executorFilter.conditionSQL := 'sheettyperefcode is null';
  if ENSheets4SOObj.sheet4sotype <> nil then
    if ENSheets4SOObj.sheet4sotype.code <> LOW_INT then
      executorFilter.conditionSQL := '(sheettyperefcode = ' + IntToStr(ENSheets4SOObj.sheet4sotype.code) + ' or ' +
                                     ' sheettyperefcode is null)';

  frmENExecutorShow := TfrmENExecutorShow.Create(Application, fmNormal, executorFilter);
  try
    with frmENExecutorShow do
    begin
      if ShowModal = mrOk then
      begin
        try
          edtExecutorFio.Text := GetReturnValue(sgENExecutor, 1);
          edtExecutorPhone.Text := GetReturnValue(sgENExecutor, 2);
          edtExecutorEmail.Text := GetReturnValue(sgENExecutor, 3);
        except
          on EConvertError do Exit;
        end;
      end;
    end;
  finally
    frmENExecutorShow.Free;
  end;
end;

procedure TfrmENSheets4SOEdit.actDeleteDefaultExecute(Sender: TObject);
Var TempENSheets4SOItems: ENSheets4SOItemsControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSheets4SOItems := HTTPRIOENSheets4SOItems as ENSheets4SOItemsControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSheets4SOItems.Cells[0,sgENSheets4SOItems.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Пункти для листів для ServicesObject)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSheets4SOItems.remove(ObjCode);
      actUpdateExecute(Sender);
  end;
end;

procedure TfrmENSheets4SOEdit.actDeleteExecute(Sender: TObject);
var
  itemObj: ENSheets4SOItems;
begin

  itemObj := ENSheets4SOItems.Create;
  SetNullIntProps(itemObj);
  SetNullXSProps(itemObj);
  itemObj.contentValue := sgENSheets4SOItems.Cells[1, sgENSheets4SOItems.Row];
  itemObj.additionalContent := sgENSheets4SOItems.Cells[2, sgENSheets4SOItems.Row];
  itemObj.sheetItemTemplateRef := ENSheets4SOItemsTemplateRef.Create;
  itemObj.sheetItemTemplateRef.code := StrToInt(sgENSheets4SOItems.Cells[0, sgENSheets4SOItems.Row]);

  itemList.Remove(itemObj);
  renderItemList;
end;

procedure TfrmENSheets4SOEdit.actInsertDefaultExecute(Sender: TObject);
begin
  // TempENSheets4SOItems := HTTPRIOENSheets4SOItems as ENSheets4SOItemsControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSheets4SOItemsObj:=ENSheets4SOItems.Create;
  SetNullIntProps(ENSheets4SOItemsObj);
  SetNullXSProps(ENSheets4SOItemsObj);

  ENSheets4SOItemsObj.sheet4soRef := ENSheets4SORef.Create;
  ENSheets4SOItemsObj.sheet4soRef.code := ENSheets4SOObj.code;

  try
    frmENSheets4SOItemsEdit:=TfrmENSheets4SOItemsEdit.Create(Application, dsInsert);
    try
      if frmENSheets4SOItemsEdit.ShowModal = mrOk then
      begin
        if ENSheets4SOItemsObj<>nil then
            actUpdateExecute(Sender);
      end;
    finally
      frmENSheets4SOItemsEdit.Free;
      frmENSheets4SOItemsEdit:=nil;
    end;
  finally
    ENSheets4SOItemsObj.Free;
  end;
end;

procedure TfrmENSheets4SOEdit.actInsertExecute(Sender: TObject);
Var LastCount : Integer;
itemObj : ENSheets4SOItems;
begin

  ENSheets4SOItemsObj:=ENSheets4SOItems.Create;
  SetNullIntProps(ENSheets4SOItemsObj);
  SetNullXSProps(ENSheets4SOItemsObj);

  try
    frmENSheets4SOItemsEdit:=TfrmENSheets4SOItemsEdit.Create(Application, dsInsert);
    frmENSheets4SOItemsEdit.isNotController := True;
    try
      if frmENSheets4SOItemsEdit.ShowModal = mrOk then
      begin
      if ENSheets4SOItemsObj<>nil then
        begin

        itemObj := ENSheets4SOItems.Create;
        SetNullIntProps(itemObj);
        SetNullXSProps(itemObj);

        itemObj.contentValue := ENSheets4SOItemsObj.contentValue;
        itemObj.additionalContent := ENSheets4SOItemsObj.additionalContent;

        if ENSheets4SOItemsObj.sheetItemTemplateRef <> nil then
          begin
            itemObj.sheetItemTemplateRef := ENSheets4SOItemsTemplateRef.Create;
            itemObj.sheetItemTemplateRef.code := ENSheets4SOItemsObj.sheetItemTemplateRef.code;
          end;


        if (not itemList.Contains(itemObj)) then
          itemList.Add(itemObj);
        renderItemList;

        end;
      end;
    finally
      frmENSheets4SOItemsEdit.Free;
      frmENSheets4SOItemsEdit:=nil;
    end;
  finally
    ENSheets4SOItemsObj.Free;
  end;
end;

procedure TfrmENSheets4SOEdit.actUpdateExecute(Sender: TObject);
var
  TempENSheets4SO: ENSheets4SOItemsControllerSoapPort;
  i: Integer;
  ENSheets4SOItemsList: ENSheets4SOItemsShortList;
  sheetsItemFilter : ENSheets4SOItemsFilter;
begin
  SetGridHeaders(ENSheets4SOItemsHeaders, sgENSheets4SOItems.ColumnHeaders);
  TempENSheets4SO :=  HTTPRIOENSheets4SO as ENSheets4SOItemsControllerSoapPort;

  sheetsItemFilter := ENSheets4SOItemsFilter.Create;
  SetNullIntProps(sheetsItemFilter);
  SetNullXSProps(sheetsItemFilter);

  sheetsItemFilter.sheet4soRef := ENSheets4SORef.Create;
  sheetsItemFilter.sheet4soRef.code := ENSheets4SOObj.code;

  ENSheets4SOItemsList := TempENSheets4SO.getScrollableFilteredList(sheetsItemFilter,0,-1);
  LastCount:=High(ENSheets4SOItemsList.list);

  if LastCount > -1 then
     sgENSheets4SOItems.RowCount:=LastCount+2
  else
     sgENSheets4SOItems.RowCount:=2;

   with sgENSheets4SOItems do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSheets4SOItemsList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSheets4SOItemsList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSheets4SOItemsList.list[i].contentValue;
        Objects[0, i+1] := ENSheets4SOItemsList.list[i];
        Cells[2,i+1] := ENSheets4SOItemsList.list[i].additionalContent;
        Objects[0, i+1] := ENSheets4SOItemsList.list[i];
        LastRow:=i+1;
        sgENSheets4SOItems.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENSheets4SOItems.Row:=1;
end;

procedure TfrmENSheets4SOEdit.btnENSheet4SOTypeClearClick(Sender: TObject);
begin
  ENSheets4SOObj.sheet4sotype := nil;
  edtENSheet4SOTypeName.Text := '';
end;

procedure TfrmENSheets4SOEdit.btnENSheet4SOTypeClick(Sender: TObject);
var
   frmENSheets4SOTypeShow : TfrmENSheets4SOTypeShow;
begin
   frmENSheets4SOTypeShow := TfrmENSheets4SOTypeShow.Create(Application,fmNormal);
   try
      with frmENSheets4SOTypeShow do begin

        if ShowModal = mrOk then
        begin
          try
             {
             edtENSheet4SOTypeName.Text := GetReturnValue(sgENSheets4SOType,1);
             ENSheets4SOObj.sheet4sotype := ENSheets4SOTypeRef.Create;
             ENSheets4SOObj.sheet4sotype.code := StrToInt(GetReturnValue(sgENSheets4SOType,0));
             }
             initFieldsBySheetType(StrToInt(GetReturnValue(sgENSheets4SOType, 0)), false);
          except
             on EConvertError do Exit;
          end;
        end;
      end;
   finally
      frmENSheets4SOTypeShow.Free;
   end;
end;

procedure TfrmENSheets4SOEdit.btnRegenerateSheetClick(Sender: TObject);
var sheetContr : ENSheets4SOControllerSoapPort;
begin
      sheetContr := HTTPRIO1 as ENSheets4SOControllerSoapPort;
      sheetContr.regenerateENSheets4SO(ENSheets4SOObj.code);
end;

procedure TfrmENSheets4SOEdit.initFields;
var
  TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
  ENSheets4SOTypeObj: ENSheets4SOType;
begin
  if DialogState <> dsInsert then Exit;

  if not edtDateGen.Checked then
  begin
    edtDateGen.Date := Date();
    edtDateGen.Checked := true;
  end;

  if (ENSheets4SOObj.sheet4sotype = nil) or (ENSheets4SOObj.sheet4sotype.code = LOW_INT) then
    // Установим тип по умолчанию ("Лист про землевпорядну документацію")
    initFieldsBySheetType(ENSHEETS4SOTYPE_LAND_SHEET)
  else
    initFieldsBySheetType(ENSheets4SOObj.sheet4sotype.code);

  if (ENSheets4SOObj.sheet4sotype <> nil) and (ENSheets4SOObj.sheet4sotype.code = ENSHEETS4SOTYPE_LAND_SHEET) then
  begin
    // Будем брать всегда из настроек, а не из предыдущего письма
    //if edtDayscnt.Text = '' then
    setDefaultDaysCnt();
  end else
    HideControls([lblDayscnt, edtDayscnt]);

  initFieldsByServicesObject();

  if previousSheetCode > 0 then
    if edtAdditionalText.CanFocus then
      edtAdditionalText.SetFocus;
end;

procedure TfrmENSheets4SOEdit.initFieldsByPreviousSheet;
var
  TempENSheets4SO: ENSheets4SOControllerSoapPort;
  previousSheet: ENSheets4SO;
begin
  if previousSheetCode <= 0 then Exit;

  TempENSheets4SO := HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;
  previousSheet := TempENSheets4SO.getObject(previousSheetCode);
  if previousSheet = nil then Exit;

  edtName.Text := previousSheet.name;

  // Будем создавать всегда текущей датой
  //SetDateFieldForDateTimePicker(edtDateGen, previousSheet.nextSheetDate);

  // Будем брать всегда из настроек, а не из предыдущего письма
  // edtDayscnt.Text := IntToStr(previousSheet.dayscnt);
  DisableControls([edtDayscnt]);
  edtRecipient.Text := previousSheet.recipient;
  edtRecipientAddress.Text := previousSheet.recipientAddress;
  edtPostCode.Text := previousSheet.postCode;
  // Берем подписанта из настроек, а не из предыдущего письма
  {
  edtSignerPosition.Text := previousSheet.signerPosition;
  edtSignerFio.Text := previousSheet.signerFio;
  chbIsWithSignature.Checked := (previousSheet.isWithSignature = 1);
  if chbIsWithSignature.Checked then
  begin
    frmENSheets4SOEdit.DisableControls([edtSignerPosition, edtSignerFio]);
    chbIsWithSignature.Visible := true;
  end;
  }
  edtExecutorFio.Text := previousSheet.executorFio;
  edtExecutorPhone.Text := previousSheet.executorPhone;
  edtExecutorEmail.Text := previousSheet.executorEmail;

  initFieldsBySheetType(previousSheet.sheet4sotype.code);
end;

procedure TfrmENSheets4SOEdit.initFieldsByServicesObject;
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  servicesObject: ENServicesObject;
begin
  if DialogState <> dsInsert then Exit;

  if ENSheets4SOObj = nil then Exit;
  if ENSheets4SOObj.servicesobject = nil then Exit;
  if ENSheets4SOObj.servicesobject.code = LOW_INT then Exit;

  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  servicesObject := TempENServicesObject.getObject(ENSheets4SOObj.servicesobject.code);

  if servicesObject = nil then Exit;

  if edtRecipient.Text = '' then
    edtRecipient.Text := servicesObject.contragentName;
  if edtRecipientAddress.Text = '' then
  begin
    if servicesObject.customerMailingAddress <> '' then
      edtRecipientAddress.Text := servicesObject.customerMailingAddress
    else
      edtRecipientAddress.Text := servicesObject.contragentAddress;
  end;
  if edtPostCode.Text = '' then
  begin
    edtPostCode.Text := servicesObject.postCode;
  end;

end;

procedure TfrmENSheets4SOEdit.initFieldsBySheetType(sheetTypeCode: Integer; onlyIfEmpty: Boolean = true);
var
  TempENSheets4SOType: ENSheets4SOTypeControllerSoapPort;
  ENSheets4SOTypeObj: ENSheets4SOType;
begin
  if sheetTypeCode <= 0 then Exit;
  
  TempENSheets4SOType := HTTPRIOENSheets4SOType as ENSheets4SOTypeControllerSoapPort;
  ENSheets4SOTypeObj := TempENSheets4SOType.getObject(sheetTypeCode);
  if ENSheets4SOTypeObj <> nil then
  begin
    ENSheets4SOObj.sheet4sotype := ENSheets4SOTypeRef.Create;
    ENSheets4SOObj.sheet4sotype.code := sheetTypeCode;
    edtENSheet4SOTypeName.Text := ENSheets4SOTypeObj.name;

    if (edtName.Text = '') or (not onlyIfEmpty) then
      edtName.Text := ENSheets4SOTypeObj.nameForDfDoc;

    if (edtSignerFio.Text = '') or (not onlyIfEmpty) then
      if ENSheets4SOTypeObj.signerRef <> nil then
        if ENSheets4SOTypeObj.signerRef.code <> LOW_INT then
        begin
          setSigner(ENSheets4SOTypeObj.signerRef.code);
          chbIsWithSignature.Checked := true;
          chbIsWithSignature.Visible := true;
          DisableControls([edtSignerPosition, edtSignerFio]);
        end;

    if (edtExecutorFio.Text = '') or (not onlyIfEmpty) then
    begin
      edtExecutorFio.Text := ENSheets4SOTypeObj.executorFio;
      edtExecutorPhone.Text := ENSheets4SOTypeObj.executorPhone;
      edtExecutorEmail.Text := ENSheets4SOTypeObj.executorEmail;
    end;

    // Для всех писем, кроме Белугинских, закроем редактирование даты,
    // т.к. они все равно в исходящих регистрируются текущей физической датой
    // (для земельных и Белугинских пока оставим)
    if (sheetTypeCode <> ENSHEETS4SOTYPE_DISTRIBUTION_CONTRACT) and
       (sheetTypeCode <> ENSHEETS4SOTYPE_DISTRIBUTION_ADDAGREEMENT) then
      DisableControls([edtDateGen]);
  end;
end;

procedure TfrmENSheets4SOEdit.chbIsWithSignatureClick(Sender: TObject);
begin
  if DialogState <> dsView then
  begin
    DisableControls([edtSignerPosition, edtSignerFio], chbIsWithSignature.Checked);
    DenyBlankValues([edtSignerPosition, edtSignerFio]);
  end;
end;

function TfrmENSheets4SOEdit.getItemsForSaving: ArrayOfENSheets4SOItems;
var
  sheets4soItems: ENSheets4SOController.ArrayOfENSheets4SOItems;
  sheets4soitem: ENSheets4SOController.ENSheets4SOItems;
  i, templateCode, count: Integer;
begin
  SetLength(sheets4soItems, 0);


  for i := 1 to sgENSheets4SOItems.RowCount - 1 do
  begin

     try
        templateCode := StrToInt(sgENSheets4SOItems.Cells[0, i]);
      except
        on EConvertError do
          templateCode := LOW_INT;
      end;

      if templateCode <= 0 then
        Exit;

    if templateCode <> LOW_INT then
    begin
      sheets4soitem := ENSheets4SOItems.Create;
      SetNullIntProps(sheets4soitem);
      SetNullXSProps(sheets4soitem);


      sheets4soitem.contentValue := sgENSheets4SOItems.Cells[1, i];
      sheets4soitem.additionalContent := sgENSheets4SOItems.Cells[2, i];

      sheets4soitem.sheetItemTemplateRef := ENSheets4SOItemsTemplateRef.Create;
      sheets4soitem.sheetItemTemplateRef.code := templateCode;

      count := High(sheets4soItems) + 1;
      SetLength(sheets4soItems, count + 1);
      sheets4soItems[count] := sheets4soitem;
    end;
  end;

  Result := sheets4soItems;
end;

procedure TfrmENSheets4SOEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSheets4SO: ENSheets4SOControllerSoapPort;
  sheets4soItems: ArrayOfENSheets4SOItems;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtName
      //,edtDayscnt
      ,edtENSheet4SOTypeName
      ,edtSignerPosition
      ,edtSignerFio
     ])  then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else begin
    if (ENSheets4SOObj.sheet4sotype.code = ENSHEETS4SOTYPE_LAND_SHEET) and (not NoBlankValues([edtDayscnt])) then
    begin
      Application.MessageBox(PChar('Введіть кількість днів відтермінування!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    TempENSheets4SO := HTTPRIOENSheets4SO as ENSheets4SOControllerSoapPort;

    ENSheets4SOObj.numbergen:= edtNumbergen.Text;
    ENSheets4SOObj.name := edtName.Text;

    ENSheets4SOObj.dateGen := GetTXSDateFromTDateTimePicker(edtdateGen);

    if ( edtDayscnt.Text <> '' ) then
       ENSheets4SOObj.dayscnt := StrToInt(edtDayscnt.Text)
    else
       ENSheets4SOObj.dayscnt := Low(Integer) ;

    ENSheets4SOObj.recipient := edtRecipient.Text;
    ENSheets4SOObj.recipientAddress := edtRecipientAddress.Text;
    ENSheets4SOObj.postCode := edtPostCode.Text;
    ENSheets4SOObj.signerPosition := edtSignerPosition.Text;
    ENSheets4SOObj.signerFio := edtSignerFio.Text;
    if chbIsWithSignature.Checked then
      ENSheets4SOObj.isWithSignature := 1
    else
      ENSheets4SOObj.isWithSignature := 0;
    ENSheets4SOObj.executorFio := edtExecutorFio.Text;
    ENSheets4SOObj.executorPhone := edtExecutorPhone.Text;
    ENSheets4SOObj.executorEmail := edtExecutorEmail.Text;
    ENSheets4SOObj.additionalText := edtAdditionalText.Text;

    ENSheets4SOObj.commentgen := edtCommentgen.Text;

    if DialogState = dsInsert then
    begin
      ENSheets4SOObj.code:=low(Integer);

      sheets4soItems := getItemsForSaving;
      if High(sheets4soItems) > -1 then
        TempENSheets4SO.add(ENSheets4SOObj, sheets4soItems)
      else
        TempENSheets4SO.add(ENSheets4SOObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENSheets4SO.save(ENSheets4SOObj);
    end;
  end;
end;


procedure TfrmENSheets4SOEdit.FormCreate(Sender: TObject);
begin
 inherited;
  itemList := TList<ENSheets4SOItems>.Create(TDelegatedComparer<ENSheets4SOItems>.Create(
     function(const Left, Right: ENSheets4SOItems): Integer
     begin
       if Left.sheetItemTemplateRef.code > Right.sheetItemTemplateRef.code then
         result := 1
       else if Left.sheetItemTemplateRef.code < Right.sheetItemTemplateRef.code then
         result := -1
       else
         result := 0;
     end)
  );

  previousSheetCode := LOW_INT;
end;

procedure TfrmENSheets4SOEdit.FormDestroy(Sender: TObject);
begin
  inherited;
  itemList.Free;
end;

end.
