unit EditENReportAdditionZbytMetrology;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENReportAdditionZbytMetrologyController,
    AdvObj, Generics.Collections, Generics.Defaults, TKTechCardController,
    TKClassificationTypeController,
    ExtCtrls;

type
  TfrmENReportAdditionZbytMetrologyEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;
    lblName : TLabel;
    edtName: TMemo;
    lblDateStart : TLabel;
    edtDateStart: TDateTimePicker;
    lblDateFinal : TLabel;
    edtDateFinal: TDateTimePicker;


    HTTPRIOENReportAdditionZbytMetrology: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    actClear: TAction;
    gbList: TGroupBox;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton1: TToolButton;
    sgTechCards: TAdvStringGrid;
    HTTPRIOTKTechCard: THTTPRIO;
    rgZbytOrMetrology: TRadioGroup;
    chbIsServices: TCheckBox;
    HTTPRIOTKClassificationType: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actClearExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure chbIsServicesClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);


  private
    { Private declarations }
    techCardsList: TList<TKTechCard>;
    classificationTypeList: TList<TKClassificationType>;
    procedure renderTechCardsList;
    procedure renderClassificationTypeList;
    procedure buildTechCardsList;
    procedure buildClassificationTypeList;
    procedure setGroupBoxCaption;
    function getWorkCodes: String;
  public
    { Public declarations }
  end;

var
  frmENReportAdditionZbytMetrologyEdit: TfrmENReportAdditionZbytMetrologyEdit;
  ENReportAdditionZbytMetrologyObj: ENReportAdditionZbytMetrology;

implementation

uses ShowTKTechCard, ENConsts, ShowTKClassificationType, EditTKTechCard,
  EditTKClassificationType;

{$R *.dfm}

const
  ZBYT: String = 'zbyt';
  METROLOGY: String = 'metrology';

var
  TechCardHeaders: array [1..3] of String =
        ( 'Код'
          ,'№'
          ,'Назва'
        );

procedure TfrmENReportAdditionZbytMetrologyEdit.FormCreate(Sender: TObject);
begin
  techCardsList := TList<TKTechCard>.Create(TDelegatedComparer<TKTechCard>.Create(
     function(const Left, Right: TKTechCard): Integer
     begin
       {
       if Left.code > Right.code then
         result := 1
       else if Left.code < Right.code then
         result := -1
       else
         result := 0;
       }
       if Left.techKartNumber > Right.techKartNumber then
         result := 1
       else if Left.techKartNumber < Right.techKartNumber then
         result := -1
       else
         result := 0;
     end)
  );

  classificationTypeList := TList<TKClassificationType>.Create(TDelegatedComparer<TKClassificationType>.Create(
     function(const Left, Right: TKClassificationType): Integer
     begin
       {
       if Left.code > Right.code then
         result := 1
       else if Left.code < Right.code then
         result := -1
       else
         result := 0;
       }
       if Left.kod > Right.kod then
         result := 1
       else if Left.kod < Right.kod then
         result := -1
       else
         result := 0;
     end)
  );
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.FormShow(Sender: TObject);
begin
  SetGridHeaders(TechCardHeaders, sgTechCards.ColumnHeaders);
  DisableControls([edtCode]);
  sgTechCards.SortSettings.Show := false;

  if (DialogState = dsView) then
  begin
    DisableActions([actInsert, actEdit, actDelete, actClear]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([edtName]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENReportAdditionZbytMetrologyObj.code);
    //MakeMultiline(edtName.Lines, ENReportAdditionZbytMetrologyObj.name);
    edtName.Text := ENReportAdditionZbytMetrologyObj.name;

    chbIsServices.Checked := (ENReportAdditionZbytMetrologyObj.isServices = 1);
    setGroupBoxCaption;

    if ENReportAdditionZbytMetrologyObj.zbytOrmetrology = ZBYT then
      rgZbytOrMetrology.ItemIndex := 0
    else if ENReportAdditionZbytMetrologyObj.zbytOrmetrology = METROLOGY then
      rgZbytOrMetrology.ItemIndex := 1
    else
      rgZbytOrMetrology.ItemIndex := -1;

    SetDateFieldForDateTimePicker(edtDateStart, ENReportAdditionZbytMetrologyObj.dateStart);
    SetDateFieldForDateTimePicker(edtDateFinal, ENReportAdditionZbytMetrologyObj.dateFinal);

    buildTechCardsList;
    buildClassificationTypeList;
  end;
end;



function TfrmENReportAdditionZbytMetrologyEdit.getWorkCodes: String;
var i: Integer;
begin
  Result := '';

  if chbIsServices.Checked then
  begin
    for i := 0 to classificationTypeList.Count - 1 do
      AddListPos(Result, IntToStr(classificationTypeList[i].code));
  end
  else begin
    for i := 0 to techCardsList.Count - 1 do
      AddListPos(Result, IntToStr(techCardsList[i].code));
  end;
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.renderClassificationTypeList;
var
  i, count: Integer;
begin
  ClearGrid(sgTechCards);

  count := classificationTypeList.Count;

  if count > 0 then
    sgTechCards.RowCount := count + 1
  else
    sgTechCards.RowCount := 2;

  with sgTechCards do
    for i := 0 to count-1 do
    begin
      if classificationTypeList[i].code <> LOW_INT then
        Cells[0, i + 1] := IntToStr(classificationTypeList[i].code)
      else
        Cells[0, i + 1] := '';
      Cells[1, i + 1] := classificationTypeList[i].kod;
      Cells[2, i + 1] := classificationTypeList[i].name;

      sgTechCards.RowCount := i + 2;
    end;

  sgTechCards.Row := 1;
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.renderTechCardsList;
var
  i, count: Integer;
begin
  ClearGrid(sgTechCards);

  count := techCardsList.Count;

  if count > 0 then
    sgTechCards.RowCount := count + 1
  else
    sgTechCards.RowCount := 2;

  with sgTechCards do
    for i := 0 to count-1 do
    begin
      if techCardsList[i].code <> LOW_INT then
        Cells[0, i + 1] := IntToStr(techCardsList[i].code)
      else
        Cells[0, i + 1] := '';
      Cells[1, i + 1] := techCardsList[i].techKartNumber;
      Cells[2, i + 1] := techCardsList[i].name;

      sgTechCards.RowCount := i + 2;
    end;

  sgTechCards.Row := 1;
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.setGroupBoxCaption;
begin
  if chbIsServices.Checked then
    gbList.Caption := 'Перелік калькуляцій'
  else
    gbList.Caption := 'Перелік техкарт';
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.actClearExecute(
  Sender: TObject);
begin
  if DialogState = dsView then Exit;

  if Application.MessageBox(PChar('Ви дійсно бажаєте очистити перелік?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    techCardsList.Clear;
    classificationTypeList.Clear;
    ClearGrid(sgTechCards);
  end;
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.actDeleteExecute(
  Sender: TObject);
var
  techCardCode, classificationTypeCode: Integer;
  TempTKTechCard: TKTechCardControllerSoapPort;
  TempTKClassificationType: TKClassificationTypeControllerSoapPort;
  techCardObj: TKTechCard;
  classificationTypeObj: TKClassificationType;
begin
  if DialogState = dsView then Exit;

  if chbIsServices.Checked then
  begin
    try
      classificationTypeCode := StrToInt(sgTechCards.Cells[0, sgTechCards.Row]);
    except
      on EConvertError do Exit;
    end;

    TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
    classificationTypeObj := TempTKClassificationType.getObject(classificationTypeCode);

    classificationTypeList.Remove(classificationTypeObj);
    renderClassificationTypeList;
  end
  else begin
    try
      techCardCode := StrToInt(sgTechCards.Cells[0, sgTechCards.Row]);
    except
      on EConvertError do Exit;
    end;

    TempTKTechCard := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;
    techCardObj := TempTKTechCard.getObject(techCardCode);

    techCardsList.Remove(techCardObj);
    renderTechCardsList;
  end;
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.actInsertExecute(
  Sender: TObject);
var
  frmTKTechCardShow: TfrmTKTechCardShow;
  TempTKTechCard: TKTechCardControllerSoapPort;
  techCardObj: TKTechCard;
  frmTKClassificationTypeShow: TfrmTKClassificationTypeShow;
  TempTKClassificationType: TKClassificationTypeControllerSoapPort;
  classificationTypeObj: TKClassificationType;
begin
  if DialogState = dsView then Exit;

  if chbIsServices.Checked then
  begin

    frmTKClassificationTypeShow := TfrmTKClassificationTypeShow.Create(Application, fmNormal);
    try
      frmTKClassificationTypeShow.techCardSourceCondition := 'tktechcardsource.code = ' + IntToStr(TKTECHCARDSOURCE_CALCULATIONS);
      DisableActions([frmTKClassificationTypeShow.actInsert, frmTKClassificationTypeShow.actEdit, frmTKClassificationTypeShow.actDelete]);

      if frmTKClassificationTypeShow.ShowModal = mrOk then
      begin
        try
          TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
          classificationTypeObj := TempTKClassificationType.getObject(TKClassificationTypeShort(frmTKClassificationTypeShow.tvDep.Selected.Data).code);

          if (not classificationTypeList.Contains(classificationTypeObj)) then
            classificationTypeList.Add(classificationTypeObj);
          renderClassificationTypeList;
        except
          on EConvertError do Exit;
        end;
      end;
    finally
      frmTKClassificationTypeShow.Free;
    end;

  end
  else begin

    frmTKTechCardShow := TfrmTKTechCardShow.Create(Application, fmNormal);
    try
      frmTKTechCardShow.techCardSourceCondition := 'tktechcardsource.code not in (' + IntToStr(TKTECHCARDSOURCE_SERVICES_FROM_SIDE) + ')';
      DisableActions([frmTKTechCardShow.actInsert, frmTKTechCardShow.actEdit, frmTKTechCardShow.actDelete]);

      if frmTKTechCardShow.ShowModal = mrOk then
      begin
        try
          TempTKTechCard := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;
          techCardObj := TempTKTechCard.getObject(StrToInt(GetReturnValue(frmTKTechCardShow.sgTKTechCard, 0)));

          if (not techCardsList.Contains(techCardObj)) then
            techCardsList.Add(techCardObj);
          renderTechCardsList;
        except
          on EConvertError do Exit;
        end;
      end;
    finally
      frmTKTechCardShow.Free;
    end;

  end;
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.actUpdateExecute(
  Sender: TObject);
begin
  if chbIsServices.Checked then
    renderClassificationTypeList
  else
    renderTechCardsList;
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.actViewExecute(Sender: TObject);
var
  TempTKTechCard: TKTechCardControllerSoapPort;
  TempTKClassificationType: TKClassificationTypeControllerSoapPort;
begin
  if chbIsServices.Checked then
  begin

    TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
    try
      TKClassificationTypeObj := TempTKClassificationType.getObject(StrToInt(sgTechCards.Cells[0, sgTechCards.Row]));
    except
      on EConvertError do Exit;
    end;

    frmTKClassificationTypeEdit := TfrmTKClassificationTypeEdit.Create(Application, dsView);
    try
      frmTKClassificationTypeEdit.ShowModal;
    finally
      frmTKClassificationTypeEdit.Free;
      frmTKClassificationTypeEdit := nil;
    end;

  end
  else begin

    TempTKTechCard := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;
    try
      TKTechCardObj := TempTKTechCard.getObject(StrToInt(sgTechCards.Cells[0, sgTechCards.Row]));
    except
      on EConvertError do Exit;
    end;

    frmTKTechCardEdit := TfrmTKTechCardEdit.Create(Application, dsView);
    try
      frmTKTechCardEdit.ShowModal;
    finally
      frmTKTechCardEdit.Free;
      frmTKTechCardEdit := nil;
    end;

  end;
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.buildClassificationTypeList;
var
  TempTKClassificationType: TKClassificationTypeControllerSoapPort;
  classificationTypeObj: TKClassificationType;
  classificationTypeFilter: TKClassificationTypeFilter;
  classificationTypeShortList: TKClassificationTypeShortList;
  i: Integer;
begin
  if DialogState = dsInsert then Exit;
  if ENReportAdditionZbytMetrologyObj = nil then Exit;
  if ENReportAdditionZbytMetrologyObj.isServices <> 1 then Exit;
  if Trim(ENReportAdditionZbytMetrologyObj.workCode) = '' then Exit;

  classificationTypeList.Clear;

  classificationTypeFilter := TKClassificationTypeFilter.Create;
  SetNullIntProps(classificationTypeFilter);
  SetNullXSProps(classificationTypeFilter);
  classificationTypeFilter.conditionSQL := 'tk.CODE in (' + ENReportAdditionZbytMetrologyObj.workCode + ')';

  TempTKClassificationType := HTTPRIOTKClassificationType as TKClassificationTypeControllerSoapPort;
  classificationTypeShortList := TempTKClassificationType.getScrollableFilteredList(classificationTypeFilter, 0, -1);

  for i := 0 to High(classificationTypeShortList.list) do
  begin
    classificationTypeObj := TKClassificationType.Create;
    SetNullIntProps(classificationTypeObj);
    SetNullXSProps(classificationTypeObj);

    classificationTypeObj.code := classificationTypeShortList.list[i].code;
    classificationTypeObj.kod := classificationTypeShortList.list[i].kod;
    classificationTypeObj.name := classificationTypeShortList.list[i].name;

    classificationTypeList.Add(classificationTypeObj);
  end;

  renderClassificationTypeList;
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.buildTechCardsList;
var
  TempTKTechCard: TKTechCardControllerSoapPort;
  techCardObj: TKTechCard;
  techCardFilter: TKTechCardFilter;
  techCardsShortList: TKTechCardShortList;
  i: Integer;
begin
  if DialogState = dsInsert then Exit;
  if ENReportAdditionZbytMetrologyObj = nil then Exit;
  if ENReportAdditionZbytMetrologyObj.isServices <> 0 then Exit;
  if Trim(ENReportAdditionZbytMetrologyObj.workCode) = '' then Exit;

  techCardsList.Clear;

  techCardFilter := TKTechCardFilter.Create;
  SetNullIntProps(techCardFilter);
  SetNullXSProps(techCardFilter);
  techCardFilter.conditionSQL := 'TKTECHCARD.CODE in (' + ENReportAdditionZbytMetrologyObj.workCode + ')';

  TempTKTechCard := HTTPRIOTKTechCard as TKTechCardControllerSoapPort;
  techCardsShortList := TempTKTechCard.getScrollableFilteredList(techCardFilter, 0, -1);

  for i := 0 to High(techCardsShortList.list) do
  begin
    techCardObj := TKTechCard.Create;
    SetNullIntProps(techCardObj);
    SetNullXSProps(techCardObj);

    techCardObj.code := techCardsShortList.list[i].code;
    techCardObj.techKartNumber := techCardsShortList.list[i].techKartNumber;
    techCardObj.name := techCardsShortList.list[i].name;

    techCardsList.Add(techCardObj);
  end;

  renderTechCardsList;
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.chbIsServicesClick(
  Sender: TObject);
begin
  if DialogState = dsView then Exit;

  if chbIsServices.Checked then
    techCardsList.Clear
  else
    classificationTypeList.Clear;

  setGroupBoxCaption;

  actUpdateExecute(Sender);
end;

procedure TfrmENReportAdditionZbytMetrologyEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var
  TempENReportAdditionZbytMetrology: ENReportAdditionZbytMetrologyControllerSoapPort;
  workCodes: String;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      //edtWorkCode
      edtName
      //,edtIsServices
      //,edtZbytOrmetrology
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else begin
    if not edtDateStart.Checked then
    begin
      Application.MessageBox(PChar('Вкажіть дату початку дії додатка!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      if edtDateStart.CanFocus then
        edtDateStart.SetFocus;
      Action := caNone;
      Exit;
    end;

    workCodes := getWorkCodes;
    if workCodes = '' then
    begin
      if chbIsServices.Checked then
        Application.MessageBox(PChar('Додайте хоча б одну калькуляцію!'), PChar('Увага!'), MB_ICONWARNING + MB_OK)
      else
        Application.MessageBox(PChar('Додайте хоча б одну техкарту!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    ENReportAdditionZbytMetrologyObj.workCode := workCodes;

    ENReportAdditionZbytMetrologyObj.name := edtName.Text;

    if chbIsServices.Checked then
      ENReportAdditionZbytMetrologyObj.isServices := 1
    else
      ENReportAdditionZbytMetrologyObj.isServices := 0;

    if rgZbytOrMetrology.ItemIndex = 0 then
      ENReportAdditionZbytMetrologyObj.zbytOrmetrology := ZBYT
    else if rgZbytOrMetrology.ItemIndex = 1 then
      ENReportAdditionZbytMetrologyObj.zbytOrmetrology := METROLOGY
    else begin
      Application.MessageBox(PChar('Оберіть призначення додатку!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
      Action := caNone;
      Exit;
    end;

    ENReportAdditionZbytMetrologyObj.dateStart := GetTXSDateTimeFromTDateTimePicker(edtDateStart);	   
    ENReportAdditionZbytMetrologyObj.dateFinal := GetTXSDateTimeFromTDateTimePicker(edtDateFinal);	   

    TempENReportAdditionZbytMetrology := HTTPRIOENReportAdditionZbytMetrology as ENReportAdditionZbytMetrologyControllerSoapPort;

    if DialogState = dsInsert then
    begin
      ENReportAdditionZbytMetrologyObj.code := Low(Integer);
      TempENReportAdditionZbytMetrology.add(ENReportAdditionZbytMetrologyObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENReportAdditionZbytMetrology.save(ENReportAdditionZbytMetrologyObj);
    end;
  end;
end;


end.