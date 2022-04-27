unit EditRQPackingListItem;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPackingListItemController,
  TB2Item, TB2Dock, TB2Toolbar, AdvObj, HTMLabel;

type
   TPackingListItemFormMode = (Base, Removing, EditingCount);

type
  TfrmRQPackingListItemEdit = class(TDialogForm)
    lblCode : TLabel;
	edtCode : TEdit;
    lblMaterialName : TLabel;
    edtMaterialName: TEdit;


  HTTPRIORQPackingListItem: THTTPRIO;

  btnOk: TButton;
    lblCountGen: TLabel;
    edtCountGen: TEdit;
    lblCountFact: TLabel;
    edtCountFact: TEdit;
    lblMUGen: TLabel;
    lblMUFact: TLabel;
    HTTPRIOENEstimateItem2RQPackingListItem: THTTPRIO;
    gbPackingListItem: TGroupBox;
    sgENEstimateItem2RQPackingListItem: TAdvStringGrid;
    TBToolbar1: TTBToolbar;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    alRQPackingListItem: TActionList;
    actEdit: TAction;
    actDelete: TAction;
    imageList1: TImageList;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    actSaveItemsCountGen: TAction;
    actRemoveItems: TAction;
    actCancel: TAction;
    TBItem5: TTBItem;
    actSelectAll: TAction;
    actDeselectAll: TAction;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    htmlCounts: THTMLabel;
    actShowENPlanWork: TAction;
    actShowENPlanWorkItem: TAction;
    actShowENEstimateItem: TAction;
    pmRQPackingListItem: TPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    N1: TMenuItem;
    HTTPRIOENPlanWork: THTTPRIO;
    HTTPRIOENEstimateItem: THTTPRIO;
    HTTPRIOENPlanWorkItem: THTTPRIO;
    procedure actSaveItemsCountGenExecute(Sender: TObject);
    procedure sgENEstimateItem2RQPackingListItemCellValidate(Sender: TObject;
      ACol, ARow: Integer; var Value: string; var Valid: Boolean);
    procedure sgENEstimateItem2RQPackingListItemCheckBoxChange(Sender: TObject;
      ACol, ARow: Integer; State: Boolean);
    procedure actShowENPlanWorkExecute(Sender: TObject);
    procedure actShowENPlanWorkItemExecute(Sender: TObject);
    procedure actShowENEstimateItemExecute(Sender: TObject);
  const COLUMN_COUNTGEN_INDEX = 1;
  const COLUMN_CODE_INDEX = 0;
  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure updateGrid;
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actRemoveItemsExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actDeselectAllExecute(Sender: TObject);

  
  private
    { Private declarations }
	mode : TPackingListItemFormMode;
	procedure initializeElementsByMode;
	procedure checkMode(pMode: TPackingListItemFormMode);
	procedure setMode(pMode : TPackingListItemFormMode); overload;
	procedure setMode(pMode : TPackingListItemFormMode; isNeedObjectRefresh : Boolean); overload;
	procedure readObject;
	procedure calculateCountsEditing;
	procedure calculateCountsRemoving;
	function getEstimateCodeOfSelectedRow : Integer;
	procedure viewPlan(estimateCode : Integer);
	
  public
    constructor Create(AOwner: TComponent;
                       mode: TDialogState); reintroduce; overload;

    { Public declarations }

end;

var
  frmRQPackingListItemEdit: TfrmRQPackingListItemEdit;
  RQPackingListItemObj: RQPackingListItem;

  ENEstimateItem2RQPackingListItemHeaders: array [1..11] of String =
        ( 'Код'
          ,'Кількість'
          ,'Об''єкт планування'
          ,'Рік плану'
          ,'Місяць плану'
          ,'Вид робіт'
          ,'Підвид робіт'
          ,'Тип акту'
          ,'Бюджетотримач'
          , 'Робота'
          , 'Вартість, грн.'
        );

implementation

uses ENConsts, BaseUtilsUnit, Generics.Collections, ENEstimateItemController,
  EditENPlanWork, DMReportsUnit, ENPlanWorkController, EditENEstimateItem
  , ENPlanWorkItemController, EditENPlanWorkItem;

{$R *.dfm}

function TfrmRQPackingListItemEdit.getEstimateCodeOfSelectedRow : Integer;
var
	estimate : ENEstimateItem;
	estimateCode : Integer;
	TempENEstimateItem : ENEstimateItemControllerSoapPort;
begin
	try
		estimateCode := ENEstimateItem2RQPackingListItemShort((sgENEstimateItem2RQPackingListItem.Objects[0,sgENEstimateItem2RQPackingListItem.Row])).estimateItemRefCode;
	except on EConvertError do begin Result := Low(Integer); Exit; end;
	end;
	Result := estimateCode
end;

procedure TfrmRQPackingListItemEdit.calculateCountsEditing;
var
	i : Integer;
	countSum, tmp : Double;
	html : TSTringList;
begin
	Self.checkMode(EditingCount);
	countSum := 0;
	for i := 1 to sgENEstimateItem2RQPackingListItem.RowCount - 1 do begin
		tmp := StrToFloat(sgENEstimateItem2RQPackingListItem.Cells[COLUMN_COUNTGEN_INDEX, i]);
		countSum := countSum + tmp;
	end;
	html := TStringList.Create;
	html.add('<p align="left"><b>Загальна змінена кількість:</b> ' + FloatToStr(countSum) + '</p>');
	htmlCounts.HTMLText := html;
end;
procedure TfrmRQPackingListItemEdit.calculateCountsRemoving;
var
	i : Integer;
	state : Boolean;
	countChecked, countUnchecked, tmp : Double;
	html : TSTringList;
begin
	Self.checkMode(Removing);
	countChecked := 0;
	countUnchecked := 0;
	for i := 1 to sgENEstimateItem2RQPackingListItem.RowCount - 1 do begin
		sgENEstimateItem2RQPackingListItem.GetCheckBoxState(COLUMN_COUNTGEN_INDEX,i,state);
		tmp := StrToFloat(sgENEstimateItem2RQPackingListItem.Cells[COLUMN_COUNTGEN_INDEX, i]);
		if state then begin
			countChecked := countChecked + tmp;
		end else begin
			countUnchecked := countUnchecked + tmp;
		end;
	end;
	html := TStringList.Create;
	html.add('<p align="left"><b>Кількості: відмічені:</b> ' + FloatToStr(countChecked) + ', <b>невідмічені:</b> ' + FloatToStr(countUnchecked) + '</p>');
	htmlCounts.HTMLText := html;
end;

procedure TfrmRQPackingListItemEdit.readObject;
begin
      edtCode.Text := IntToStr(RQPackingListItemObj.code);
    edtMaterialName.Text := RQPackingListItemObj.materialName;
    if ( RQPackingListItemObj.countGen <> nil ) then
       edtCountGen.Text := RQPackingListItemObj.countGen.decimalString
    else
       edtCountGen.Text := '';
    if ( RQPackingListItemObj.countFact <> nil ) then
       edtCountFact.Text := RQPackingListItemObj.countFact.decimalString
    else
       edtCountFact.Text := '';

       lblMUGen.Caption := RQPackingListItemObj.measurementName;
       lblMUFact.Caption := RQPackingListItemObj.measurementName;
end;
procedure TfrmRQPackingListItemEdit.setMode(pMode : TPackingListItemFormMode);
begin
	Self.setMode(pMode, false);
end;
procedure TfrmRQPackingListItemEdit.setMode(pMode : TPackingListItemFormMode; isNeedObjectRefresh : Boolean);
var
  TempRQPackingListItem  : RQPackingListItemControllerSoapPort;
begin
	if Self.mode = pMode then begin
		raise Exception.Create('The mode already has been set');
	end;
	Self.mode := pMode;
	if isNeedObjectRefresh then begin
		TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
		RQPackingListItemObj := TempRQPackingListItem.getObject(RQPackingListItemObj.code);
		if Assigned(RQPackingListItemObj) then begin
			readObject;		
		end else begin
			Self.Close;
      Exit;
		end;
	end;
	initializeElementsByMode;
end;
procedure TfrmRQPackingListItemEdit.sgENEstimateItem2RQPackingListItemCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: string; var Valid: Boolean);
var userQuantity, objectQuantity, minCountGen : Double;
	shortObj : ENEstimateItem2RQPackingListItemShort;
begin
  if (ACol <> COLUMN_COUNTGEN_INDEX)  then Exit;
  if Self.mode <> EditingCount then begin
	  Exit;
  end;


  shortObj := ENEstimateItem2RQPackingListItemShort(sgENEstimateItem2RQPackingListItem.Objects[0, ARow]);
  objectQuantity := StrToFloat(shortObj.countGen.DecimalString);

  userQuantity := 0;
  minCountGen := 0.000001;
  try
    userQuantity := StrToFloat(Value);
    if objectQuantity < userQuantity then begin
        Application.MessageBox(PChar('Кількість можливо змінювати лише у меньшу сторону (' + Value + ' > ' + FloatToStr(objectQuantity) + ')!'), PChar('Помилка!'), MB_ICONERROR);
        Value := FloatToStr(objectQuantity);
        Valid := false;
        Exit;
    end;
    if userQuantity < minCountGen then begin
        Application.MessageBox(PChar('Мінімальна допустима кількісті прі зміненні: ' + FormatFloat('0.######', minCountGen) + ' ! Або видаляйте кількість!'), PChar('Помилка!'), MB_ICONERROR);
        Value := FloatToStr(objectQuantity);
        Valid := false;
        Exit;
    end;
  except
    on EConvertError do begin
      Application.MessageBox(PChar('Неприпустиме значення: "' + Value + '"!'), PChar('Помилка!'), MB_ICONERROR);
      Value := FloatToStr(objectQuantity);
      Valid := false;
      Exit;
    end;
end;

if Self.mode = EditingCount then begin
	Self.calculateCountsEditing;
end;

end;

procedure TfrmRQPackingListItemEdit.sgENEstimateItem2RQPackingListItemCheckBoxChange(
  Sender: TObject; ACol, ARow: Integer; State: Boolean);
begin
  inherited;
	if Self.mode = Removing then begin
		Self.calculateCountsRemoving;
	end;
end;

procedure TfrmRQPackingListItemEdit.checkMode(pMode: TPackingListItemFormMode);
begin
	if pMode <> Self.mode then begin
		raise Exception.Create(' Error while checking mode ');
	end;
end;
procedure TfrmRQPackingListItemEdit.actEditExecute(Sender: TObject);
begin
  inherited;
  Self.setMode(EditingCount);
end;

procedure TfrmRQPackingListItemEdit.actRemoveItemsExecute(Sender: TObject);
var
  TempRQPackingListItem : RQPackingListItemControllerSoapPort;
  selIndexes : TList<Integer>;
  codes : TList<Integer>;
  arrayCodes : RQPackingListItemController.ArrayOfInteger;
  iter, code, cnt : Integer;
begin
  inherited;
  Self.checkMode(Removing);
  selIndexes := BaseUtils.getCheckedIndexes(Self.sgENEstimateItem2RQPackingListItem, COLUMN_COUNTGEN_INDEX);
  if(selIndexes.Count = 0) then begin
    Application.MessageBox(PChar('Не обрано жодної строки!'), PChar('Увага'), MB_ICONWARNING);
    Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити обрані строки ' + chr(10)
            + ' (вони будуть видалені безповоротно) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
  begin
      Exit;
  end;

  codes := TList<Integer>.Create;
  for iter in selIndexes do begin
     code := StrToInt(sgENEstimateItem2RQPackingListItem.Cells[COLUMN_CODE_INDEX, iter]);
     codes.add(code);
  end;
  TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
  SetLength(arrayCodes, codes.Count);
  cnt := 0;
  For code in codes do begin
	arrayCodes[cnt] := code;
	inc(cnt);
  end;
  TempRQPackingListItem.remove(true, arrayCodes);
  Self.setMode(Base, true);
  Application.MessageBox(PChar('Строки видалені'), PChar('Повідомлення'), MB_ICONINFORMATION);
end;

procedure TfrmRQPackingListItemEdit.actSaveItemsCountGenExecute(
  Sender: TObject);
var
	arrayObjects : RQPackingListItemController.ArrayOfENEstimateItem2RQPackingListItem;
	shortObj : ENEstimateItem2RQPackingListItemShort;
	i, cnt : Integer;
	TempRQPackingListItem : RQPackingListItemControllerSoapPort;
begin
  inherited;
  Self.checkMode(EditingCount);
  cnt := sgENEstimateItem2RQPackingListItem.RowCount - 1;
  if cnt < 1 then begin
	  Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте змінити обрані строки ' + chr(10)
            + ' (вони будуть змінені безповоротно) ?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) <> IDOK then
  begin
      Exit;
  end;
  SetLength(arrayObjects, cnt);
  for i := 0 to cnt -  1 do begin
    arrayObjects[i] := ENEstimateItem2RQPackingListItem.Create;
    shortObj := ENEstimateItem2RQPackingListItemShort(sgENEstimateItem2RQPackingListItem.Objects[0, i + 1]);
    SetNullXSProps(arrayObjects[i]);
    SetNullIntProps(arrayObjects[i]);
    arrayObjects[i].countGen := TXSDecimal.Create;
    arrayObjects[i].countGen.DecimalString := sgENEstimateItem2RQPackingListItem.Cells[COLUMN_COUNTGEN_INDEX, i + 1];
    arrayObjects[i].code := shortObj.code;
    arrayObjects[i].packingListItemRef := RQPackingListItemRef.Create;
    arrayObjects[i].packingListItemRef.code := shortObj.packingListItemRefCode;
    arrayObjects[i].estimateItemRef := ENEstimateItemRef.Create;
    arrayObjects[i].estimateItemRef.code := shortObj.estimateItemRefCode;
  end;
  TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
  TempRQPackingListItem.save(true, arrayObjects);
  Self.setMode(Base, true);
  Application.MessageBox(PChar('Строки змінені!'), PChar('Повідомлення'), MB_ICONINFORMATION);
end;

procedure TfrmRQPackingListItemEdit.actSelectAllExecute(Sender: TObject);
begin
  inherited;
  Self.checkMode(Removing);
  checkGrid(sgENEstimateItem2RQPackingListItem, COLUMN_COUNTGEN_INDEX, true);
  calculateCountsRemoving;
end;

procedure TfrmRQPackingListItemEdit.viewPlan(estimateCode : Integer);
Var TempENPlanWork: ENPlanWorkControllerSoapPort;
tPlan : ENPlanWork;
begin
  frmENPlanWorkEdit:=TfrmENPlanWorkEdit.Create(Application, dsView);
  try

    try
      frmENPlanWorkEdit.ENPlanWorkObj := DMReports.getPlanByEstimateCode( estimateCode );
    except
      on EConvertError do Exit;
    end;

    frmENPlanWorkEdit.ShowModal;

  finally
    frmENPlanWorkEdit.Free;
    frmENPlanWorkEdit:=nil;
  end;
end;

procedure TfrmRQPackingListItemEdit.actShowENEstimateItemExecute(
  Sender: TObject);
  var
	TempENEstimateItem : ENEstimateItemControllerSoapPort;
	estimateCode : Integer;
	form : TfrmENEstimateItemEdit;
begin
  inherited;
   estimateCode := Self.getEstimateCodeOfSelectedRow;
  if(estimateCode = Low(Integer)) then begin
	Exit;
  end;
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  ENEstimateItemObj := TempENEstimateItem.getObject(estimateCode);
  try
	  form := TfrmENEstimateItemEdit.Create(Application, dsView);
	  form.ShowModal;
  finally
	form.Free;
	form := nil;
  end;
end;

procedure TfrmRQPackingListItemEdit.actShowENPlanWorkExecute(Sender: TObject);
var
	estimateCode : Integer;
begin
  inherited;
  estimateCode := Self.getEstimateCodeOfSelectedRow;
  if(estimateCode = Low(Integer)) then begin
	Exit;
  end;
  Self.viewPlan(estimateCode);
end;

procedure TfrmRQPackingListItemEdit.actShowENPlanWorkItemExecute(
  Sender: TObject);
  var
	TempENEstimateItem : ENEstimateItemControllerSoapPort;
  TempENPlanWorkItem : ENPlanWorkItemControllerSoapPort;
	estimateCode : Integer;
  estimate : ENEstimateItem;
	form : TfrmENPlanWorkItemEdit;
begin
  inherited;
   estimateCode := Self.getEstimateCodeOfSelectedRow;
  if(estimateCode = Low(Integer)) then begin
	Exit;
  end;
  TempENEstimateItem := HTTPRIOENEstimateItem as ENEstimateItemControllerSoapPort;
  TempENPlanWorkItem := HTTPRIOENPlanWorkItem as ENPlanWorkItemControllerSoapPort;
  estimate := TempENEstimateItem.getObject(estimateCode);
  if (not Assigned(estimate.planItemRef)
    or (estimate.planItemRef.code = Low(Integer))) then begin
    Exit;
  end;
  ENPlanWorkItemObj := TempENPlanWorkItem.getObject(estimate.planItemRef.code);
  try
	  form := TfrmENPlanWorkItemEdit.Create(Application, dsView);
	  form.ShowModal;
  finally
	form.Free;
	form := nil;
  end;
end;

constructor TfrmRQPackingListItemEdit.Create(AOwner: TComponent; mode: TDialogState);
begin
	Self.mode := Base;
  inherited Create(AOwner, mode);
end;

procedure TfrmRQPackingListItemEdit.initializeElementsByMode;
begin
	if (DialogState in [dsEdit])  then begin
		// Выполняется только если форма открыта на редактирование
		if (mode in [Removing, EditingCount]) then begin
			HideControls([htmlCounts], false);
			DisableActions([actEdit, actDelete], true);
				if mode = EditingCount then begin
					HideActions([actSaveItemsCountGen, actCancel], false);
					DisableActions([actSaveItemsCountGen, actCancel], false);
					calculateCountsEditing;
				end else begin
					HideActions([actRemoveItems, actCancel, actSelectAll, actDeselectAll], false);
					DisableActions([actRemoveItems, actCancel, actSelectAll, actDeselectAll], false);
					calculateCountsRemoving;
				end;
		end else begin
			DisableActions([actEdit, actDelete], false);
			HideActions([actSaveItemsCountGen, actRemoveItems, actCancel, actSelectAll, actDeselectAll], true);
			HideControls([htmlCounts], true);
			DisableActions([actSaveItemsCountGen, actCancel, actRemoveItems, actSelectAll, actDeselectAll], true);
		end;
	end;
	Self.updateGrid;
end;

procedure TfrmRQPackingListItemEdit.updateGrid;
var
TempENEstimateItem2RQPackingListItem : RQPackingListItemControllerSoapPort;
filter : ENEstimateItem2RQPackingListItemFilter;
list :  ENEstimateItem2RQPackingListItemShortList;
i, LastCount, LastRow, index : Integer;
begin
  sgENEstimateItem2RQPackingListItem.Clear;
  SetGridHeaders(ENEstimateItem2RQPackingListItemHeaders, sgENEstimateItem2RQPackingListItem.ColumnHeaders);
  TempENEstimateItem2RQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;
  filter := ENEstimateItem2RQPackingListItemFilter.Create;
  SetNullIntProps(filter);
  SetNullXSProps(filter);
  filter.packingListItemRef := RQPackingListItemRef.Create;
  filter.packingListItemRef.code := RQPackingListItemObj.code;
  list := TempENEstimateItem2RQPackingListItem.getScrollableFilteredList(filter,0,-1);
  
  LastCount := High(list.list);

   if LastCount > -1 then
     sgENEstimateItem2RQPackingListItem.RowCount:=LastCount+2
   else
     sgENEstimateItem2RQPackingListItem.RowCount:=2;
	 
      with sgENEstimateItem2RQPackingListItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        index := 0;

        if list.list[i].code <> Low(Integer) then
          Cells[index,i + 1] := IntToStr(list.list[i].code)
        else
          Cells[index,i + 1] := '';
        CellProperties[index, i+1].ReadOnly := True;
        inc(index);

        if list.list[i].countGen = nil then
          Cells[index,i+1] := ''
        else
          Cells[index,i+1] := list.list[i].countGen.DecimalString;

        if Self.mode <> Base then begin
          CellProperties[index, i+1].ReadOnly := False;
          if Self.mode = Removing then begin
             AddCheckBox(index,i+1, false, false);
          end else begin
            Colors[index, i+1] := clYellow;
          end;
        end else begin
          CellProperties[index, i+1].ReadOnly := True;
        end;
        inc(index);

        Cells[index, i+1] := list.list[i].planElementName;
        CellProperties[index, i+1].ReadOnly := True;
        inc(index);

        if(list.list[i].planYearGen <> Low(Integer)) then
          Cells[index, i+1] := IntToStr(list.list[i].planYearGen)
        else
          Cells[index, i+1] := '';
        CellProperties[index, i+1].ReadOnly := True;
        inc(index);

        if(list.list[i].planMonthGen <> Low(Integer)) then
          Cells[index, i+1] := MonthesNames[list.list[i].planMonthGen]
        else
          Cells[index, i+1] := '';
        CellProperties[index, i+1].ReadOnly := True;
        inc(index);


        Cells[index, i+1] := list.list[i].planFormName;
        CellProperties[index, i+1].ReadOnly := True;
        inc(index);
        Cells[index, i+1] := list.list[i].planStateName;
        CellProperties[index, i+1].ReadOnly := True;
        inc(index);
        Cells[index, i+1] := list.list[i].planTypeName;
        CellProperties[index, i+1].ReadOnly := True;
        inc(index);
        Cells[index, i+1] := list.list[i].planBudgetName;
        CellProperties[index, i+1].ReadOnly := True;
        inc(index);
        Cells[index, i+1] := list.list[i].kartaRefNumber + ' ' + list.list[i].kartaRefName;
        CellProperties[index, i+1].ReadOnly := True;
        inc(index);

        if list.list[i].cost = nil then
          Cells[index,i+1] := ''
        else
          Cells[index,i+1] := list.list[i].cost.DecimalString;
        CellProperties[index, i+1].ReadOnly := True;
        inc(index);

        Objects[0, i+1] :=  TObject(list.list[i]);
        LastRow:=i+1;
        sgENEstimateItem2RQPackingListItem.RowCount:=LastRow + 1;
      end;
      sgENEstimateItem2RQPackingListItem.Row := 1;

end;

procedure TfrmRQPackingListItemEdit.FormShow(Sender: TObject);

begin

  DisableControls([edtMaterialName, edtCountGen, edtCountFact, edtCode]);

   if DialogState = dsInsert then
  begin
    raise Exception.Create('Эта форма не используется в режиме для добавления');
  end;
  if DialogState = dsView then
  begin
    DisableActions([actEdit, actDelete]);
//     DisableControls([
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
	readObject;
  end;

  initializeElementsByMode;

end;

procedure TfrmRQPackingListItemEdit.actCancelExecute(Sender: TObject);
begin
  Self.setMode(Base);
  inherited;
end;



procedure TfrmRQPackingListItemEdit.actDeleteExecute(Sender: TObject);
begin
  inherited;
  Self.setMode(Removing);
end;

procedure TfrmRQPackingListItemEdit.actDeselectAllExecute(Sender: TObject);
begin
  inherited;
  Self.checkMode(Removing);
  checkGrid(sgENEstimateItem2RQPackingListItem, COLUMN_COUNTGEN_INDEX, false);
  calculateCountsRemoving;
end;

procedure TfrmRQPackingListItemEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPackingListItem: RQPackingListItemControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtMaterialName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempRQPackingListItem := HTTPRIORQPackingListItem as RQPackingListItemControllerSoapPort;


    {if DialogState = dsInsert then
    begin
      RQPackingListItemObj.code:=low(Integer);
    end
    else
    if DialogState = dsEdit then
    begin
      TempRQPackingListItem.save(RQPackingListItemObj);
    end;}
  end;
end;


end.