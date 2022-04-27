unit EditENSynchronizeMolsAddition;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolController, TB2Item,
  TB2Dock, TB2Toolbar, AdvObj, HTMLabel, Generics.Collections
  , ENDepartmentController;

const
 MOL_ID_COLUMN_NUMBER = 0;
 MOLCODE_COLUMN_NUMBER = 1;
 MOLNAME_COLUMN_NUMBER = 2;
 MOLTABNUMBER_COLUMN_NUMBER = 3;
 MOLSTATUS_COLUMN_NUMBER = 4;
 MOLTYPE_COLUMN_NUMBER = 5;
 MOLDEPARTMENT_COLUMN_NUMBER = 6;

type
  TfrmSynchronizeMolsAdditionEdit = class(TDialogForm)
    btnOk: TButton;
    btnCancel: TButton;
    ActionList1: TActionList;
    actDelete: TAction;
    ImageList1: TImageList;
    gbENMolsAddition: TGroupBox;
    tbActions: TTBToolbar;
    btnView: TTBItem;
    sgENMolsAddition: TAdvStringGrid;
    HTTPRIOENMolType: THTTPRIO;
    lblOverallQty: TLabel;
    HTTPRIOENMol: THTTPRIO;
    actSelectAll: TAction;
    actDeselectAll: TAction;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    actSetENDepartmentToSelectedMOL: TAction;
    actUnSetENDepartmentToSelectedMOL: TAction;
    TBSubmenuItem2: TTBSubmenuItem;
    TBItem4: TTBItem;
    TBItem3: TTBItem;
    HTTPRIOENDepartment: THTTPRIO;
    htmlHelp: THTMLabel;
    procedure FormShow(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure sgENMolsAdditionGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure FormCreate(Sender: TObject);
    procedure sgENMolsAdditionGetEditorProp(Sender: TObject; ACol,
      ARow: Integer; AEditLink: TEditLink);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENMolsAdditionCellValidate(Sender: TObject; ACol, ARow: Integer;
      var Value: string; var Valid: Boolean);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actDeselectAllExecute(Sender: TObject);
    procedure actSetENDepartmentToSelectedMOLExecute(Sender: TObject);
    procedure actUnSetENDepartmentToSelectedMOLExecute(Sender: TObject);
  private
    { Private declarations }
	dictTypes : TDictionary<String, Integer>;
	lstTypes : TStringList;
	dictMols : TDictionary<String, ENMol>;
  dictDepartments : TDictionary<Integer, ENDepartmentShort>;
  dictMolsDepartments : TDictionary<String, Integer>;
  dictFinRenCodesAndDepartments : TDictionary<String, Integer>;
  function checkAndFillDepartmentsForMol(mol : ENMol) : ENDepartmentShort;
  procedure OnSelectDepartment(Sender : TObject);
  procedure fillDepartments();
	procedure fillGrid();
	procedure getMolTypes();
	procedure setLabelQty();
	procedure deleteMolsFromGrid(rowIndexes : TList<Integer>);
  procedure setENDepartmentInGrid(department : ENDepartmentShort; rowIndexes : TList<Integer>);
  public
    molList : ENMolShortList;
    { Public declarations }
  end;

var
  frmSynchronizeMolsAdditionEdit: TfrmSynchronizeMolsAdditionEdit;


implementation
uses Generics.Defaults, ENMolTypeController, ENMolStatusController
, BaseUtilsUnit, ShowENDepartment, ENDepartmentTypeController, ENConsts;

{$R *.dfm}

procedure TfrmSynchronizeMolsAdditionEdit.setLabelQty();
begin
	if Assigned(dictMols) then begin
		lblOverallQty.Caption := 'Всього: ' + IntToStr(dictMols.Count);
	end;
end;

procedure TfrmSynchronizeMolsAdditionEdit.getMolTypes();
var TempENMolType : ENMolTypeControllerSoapPort;
filter : ENMolTypeFilter;
list : ENMolTypeShortList;
i : Integer;
begin
	if lstTypes = nil then begin
		lstTypes := TStringList.Create;
    dictTypes := TDictionary<String, Integer>.Create;
		filter := ENMolTypeFilter.Create;
		SetNullXSProps(filter);
		SetNullIntProps(filter);
		TempENMolType := HTTPRIOENMolType as ENMolTypeControllerSoapPort;
		list := TempENMolType.getScrollableFilteredList(filter, 0, -1);
		for i := 0 to list.totalCount-1 do begin
			lstTypes.add(list.list[i].name);
			dictTypes.add(list.list[i].name, list.list[i].code);
		end;
	end;
end;

procedure TfrmSynchronizeMolsAdditionEdit.actDeleteExecute(Sender: TObject);
var selIndexes : TList<Integer>;
begin
  inherited;
  selIndexes := BaseUtils.getCheckedIndexes(Self.sgENMolsAddition, MOLCODE_COLUMN_NUMBER);
  if(selIndexes.Count = 0) then begin
	if (sgENMolsAddition.Row > 0)
    and (sgENMolsAddition.Row < sgENMolsAddition.RowCount) then begin
		selIndexes.Add(sgENMolsAddition.Row);
	end;
  end;
  if (selIndexes.Count > 0) then begin
		Self.deleteMolsFromGrid(selIndexes);
  end;
end;

procedure TfrmSynchronizeMolsAdditionEdit.deleteMolsFromGrid(rowIndexes : TList<Integer>);
var strQuestion, strTemp, strMolCodes : String;
itemIndex : Integer;
molCodes : TStringList;
molCode : String;
begin
	if(rowIndexes.Count = 0) then Exit;
	if(rowIndexes.Count > 1) then begin
		strTemp := 'кодами'
	end else begin
		strTemp := 'кодом'
	end;
	molCodes := TStringList.Create;
	for itemIndex in rowIndexes do begin
		molCodes.Add(sgENMolsAddition.Cells[MOLCODE_COLUMN_NUMBER, itemIndex]);
	end;
  strMolCodes := BaseUtils.getAndAlsoString(molCodes, 3, ',', 'код', 'коди(-ів)');
	strQuestion := 'Ви дійсно бажаєте видалити МВО з ' + strTemp + ' ' + strMolCodes + ' із цього списку?';
	
    if Application.MessageBox(PChar(strQuestion),
                        PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then begin
				for itemIndex in rowIndexes do begin
  	      molCode := sgENMolsAddition.Cells[MOLCODE_COLUMN_NUMBER, itemIndex];
	        dictMols.Remove(molCode);
          if dictMolsDepartments.ContainsKey(molCode) then dictMolsDepartments.Remove(molCode);

				end;
        BaseUtils.removeRowsInGridFromList(sgENMolsAddition, rowIndexes);
			  setLabelQty;
	end;
end;

procedure TfrmSynchronizeMolsAdditionEdit.setENDepartmentInGrid(department : ENDepartmentShort;
    rowIndexes : TList<Integer>);
var strQuestion, strTemp, strMolCodes, strAction : String;
itemIndex : Integer;
molCodes : TStringList;
molCode : String;
isSet : Boolean;
begin
  isSet := Assigned(department);
  if isSet then begin
    strAction := 'встановити підрозділ "' + department.shortName + '"';
  end else begin
    strAction := 'видалити підрозділ';
  end;
	if(rowIndexes.Count = 0) then Exit;
	if(rowIndexes.Count > 1) then begin
		strTemp := 'кодами'
	end else begin
		strTemp := 'кодом'
	end;
	molCodes := TStringList.Create;
	for itemIndex in rowIndexes do begin
		molCodes.Add(sgENMolsAddition.Cells[MOLCODE_COLUMN_NUMBER, itemIndex]);
	end;
  strMolCodes := BaseUtils.getAndAlsoString(molCodes, 3, ',', 'код', 'коди(-ів)');
	strQuestion := Format('Ви дійсно бажаєте %s для МВО з %s %s ?', [strAction, strTemp, strMolCodes]);

    if Application.MessageBox(PChar(strQuestion),
                        PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then begin
				for itemIndex in rowIndexes do begin
          molCode := sgENMolsAddition.Cells[MOLCODE_COLUMN_NUMBER, itemIndex];
          if isSet then begin
            sgENMolsAddition.Cells[MOLDEPARTMENT_COLUMN_NUMBER, itemIndex] := department.shortName;
            if dictMolsDepartments.ContainsKey(molCode) then
              dictMolsDepartments[molCode] := department.code
            else dictMolsDepartments.Add(molCode, department.code);
            if not dictDepartments.ContainsKey(department.code) then begin
              dictDepartments.Add(department.code, department);
            end;
          end else begin
            sgENMolsAddition.Cells[MOLDEPARTMENT_COLUMN_NUMBER, itemIndex] := '';
            if dictMolsDepartments.ContainsKey(molCode) then begin
              dictMolsDepartments.Remove(molCode);
            end;

          end;
				end;
	end;
  checkGrid(sgENMolsAddition, MOLCODE_COLUMN_NUMBER, false);
end;

procedure TfrmSynchronizeMolsAdditionEdit.actDeselectAllExecute(
  Sender: TObject);
begin
  inherited;
  checkGrid(sgENMolsAddition, MOLCODE_COLUMN_NUMBER, false);
end;

procedure TfrmSynchronizeMolsAdditionEdit.actSelectAllExecute(Sender: TObject);
begin
  inherited;
  checkGrid(sgENMolsAddition, MOLCODE_COLUMN_NUMBER, true);
end;

procedure TfrmSynchronizeMolsAdditionEdit.actSetENDepartmentToSelectedMOLExecute(
  Sender: TObject);
var selIndexes : TList<Integer>;
begin
  inherited;
  TfrmENDepartmentShow.chooseFromList(true, procedure(selectedObj : ENDepartmentShort)
  begin
    selIndexes := BaseUtils.getCheckedIndexes(Self.sgENMolsAddition, MOLCODE_COLUMN_NUMBER);
    if(selIndexes.Count = 0) then begin
    if (sgENMolsAddition.Row > 0)
      and (sgENMolsAddition.Row < sgENMolsAddition.RowCount) then begin
      selIndexes.Add(sgENMolsAddition.Row);
    end;
    end;
    if (selIndexes.Count > 0) then begin
      Self.setENDepartmentInGrid(selectedObj, selIndexes);
    end;
  end);
end;

procedure TfrmSynchronizeMolsAdditionEdit.actUnSetENDepartmentToSelectedMOLExecute(
  Sender: TObject);
var selIndexes : TList<Integer>;
begin
  inherited;
  selIndexes := BaseUtils.getCheckedIndexes(Self.sgENMolsAddition, MOLCODE_COLUMN_NUMBER);
  if(selIndexes.Count = 0) then begin
	if (sgENMolsAddition.Row > 0)
    and (sgENMolsAddition.Row < sgENMolsAddition.RowCount) then begin
		selIndexes.Add(sgENMolsAddition.Row);
	end;
  end;
  if (selIndexes.Count > 0) then begin
		Self.setENDepartmentInGrid(nil, selIndexes);
  end;
end;

procedure TfrmSynchronizeMolsAdditionEdit.fillDepartments();
var
	TempENDepartment : ENDepartmentControllerSoapPort;
	depFilter : ENDepartmentFilter;
	depList : ENDepartmentShortList;
  dep : ENDepartmentShort;
begin
   dictDepartments := TDictionary<Integer, ENDepartmentShort>.Create;
   TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
   depFilter := ENDepartmentFilter.Create;
   SetNullXSProps(depFilter);
   SetNullIntProps(depFilter);
   depFilter.typeRef := ENDepartmentTypeRef.Create;
   depFilter.typeRef.code := ENDEPARTMENTTYPE_DEPARTMENT;
   depFilter.parentRef := ENDepartmentRef.Create;
   depFilter.parentRef.code := ENDEPARTMENT_REM;
   depFilter.orderBySQL := 'ENDEPARTMENT.SHORTNAME ASC';
   depList := TempENDepartment.getScrollableFilteredList(depFilter, 0, -1);
   for dep in depList.list do begin
     dictDepartments.Add(dep.code, dep);
   end;
end;

function TfrmSynchronizeMolsAdditionEdit.checkAndFillDepartmentsForMol(mol : ENMol) : ENDepartmentShort;
var
finRenCode : String;
TempENDepartment : ENDepartmentControllerSoapPort;
depFilter : ENDepartmentFilter;
depList : ENDepartmentShortList;
dep : ENDepartmentShort;
begin
 if not Assigned(mol) then Exit;
 finRenCode := copy(mol.finCode, 1, 2);
 finRenCode := '0' + finRenCode;

 if (Assigned(dictFinRenCodesAndDepartments))
   and (dictFinRenCodesAndDepartments.ContainsKey(finRenCode)) then begin
   Result := dictDepartments[dictFinRenCodesAndDepartments[finRenCode]];
   Exit;
 end;


 TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;

 depFilter := ENDepartmentFilter.Create;
 SetNullXSProps(depFilter);
 SetNullIntProps(depFilter);
 depFilter.parentRef := ENDepartmentRef.Create;
 depFilter.parentRef.code := ENDEPARTMENT_REM;
 depFilter.typeRef := ENDepartmentTypeRef.Create;
 depFilter.typeRef.code := ENDEPARTMENTTYPE_DEPARTMENT;
 depFilter.conditionSQL := Format(' exists (select 1 from endepartment2epren as deep1 ' +
     ' where deep1.finrencode = ''%s'' and deep1.departmentrefcode = ENDEPARTMENT.CODE)'
     , [finRenCode]);

 depList := TempENDepartment.getScrollableFilteredList(depFilter, 0, -1);

 if depList.totalCount > 0 then begin
  dep := depList.list[0];
  if not Assigned(dictFinRenCodesAndDepartments) then
   dictFinRenCodesAndDepartments := TDictionary<String, Integer>.Create;
  dictFinRenCodesAndDepartments.Add(finRenCode, dep.code);
  if not dictDepartments.ContainsKey(dep.code) then begin
    dictDepartments.Add(dep.code, dep);
  end;
  Result := dep;
 end else begin
   Result := nil;
 end;
end;

procedure TfrmSynchronizeMolsAdditionEdit.fillGrid();
var i, itemCode : Integer;
item : ENMolShort;
obj : ENMol;
dep : ENDepartmentShort;
begin
  dictMols := TDictionary<String, ENMol>.Create;
  Self.getMolTypes();
  for i := 0 to Self.molList.totalCount-1 do begin
    item := Self.molList.list[i];
    itemCode := i + 1;
    sgENMolsAddition.Cells[MOL_ID_COLUMN_NUMBER, itemCode] := '';
    sgENMolsAddition.Cells[MOLCODE_COLUMN_NUMBER, itemCode] := item.finCode;
    sgENMolsAddition.Cells[MOLNAME_COLUMN_NUMBER, itemCode] := item.name;
    sgENMolsAddition.Cells[MOLSTATUS_COLUMN_NUMBER, itemCode] := item.statusRefName;
    sgENMolsAddition.Cells[MOLTYPE_COLUMN_NUMBER, itemCode] := Self.lstTypes[0];

    sgENMolsAddition.CellProperties[MOL_ID_COLUMN_NUMBER, itemCode].ReadOnly := True;
    sgENMolsAddition.CellProperties[MOLCODE_COLUMN_NUMBER, itemCode].ReadOnly := False;
    sgENMolsAddition.CellProperties[MOLNAME_COLUMN_NUMBER, itemCode].ReadOnly := True;
    sgENMolsAddition.CellProperties[MOLSTATUS_COLUMN_NUMBER, itemCode].ReadOnly := True;
    sgENMolsAddition.CellProperties[MOLTYPE_COLUMN_NUMBER, itemCode].ReadOnly := False;
    sgENMolsAddition.AddCheckBox(MOLCODE_COLUMN_NUMBER,itemCode, false, false);

    if i > 0 then sgENMolsAddition.RowCount := sgENMolsAddition.RowCount + 1;
	
	{Запись в хэш}
	obj := ENMol.Create;
	SetNullXSProps(obj);
	SetNullIntProps(obj);
	obj.statusRef := ENMolStatusRef.Create;
	obj.typeRef := ENMolTypeRef.Create;
	obj.statusRef.code := item.statusRefCode;
	obj.finCode := item.finCode;
	obj.name := item.name;
	dictMols.Add(item.finCode, obj);
  dep := checkAndFillDepartmentsForMol(obj);
  if Assigned(dep) then begin
    dictMolsDepartments.Add(item.finCode, dep.code);
    sgENMolsAddition.Cells[MOLDEPARTMENT_COLUMN_NUMBER, itemCode] := dep.shortName;
  end;

  end;
  setLabelQty;
end;

procedure TfrmSynchronizeMolsAdditionEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var i : Integer;
  molCode, typeName, tabNumber, dictKey : String;
  TempENMol : ENMolControllerSoapPort;
begin
  inherited;
  if (ModalResult = mrOk) then begin
  			  if (not Assigned(dictMols))
				  or (dictMols.Count = 0) then begin
						Application.MessageBox(PChar('Список МВО порожній!'), PChar('Увага !'),MB_ICONWARNING);
						Action := caNone;
						Exit;
			    end;
          if Application.MessageBox(PChar('Ви дійсно бажаєте додати ' + IntToStr(dictMols.Count) + ' МВО із списку?'),
                        PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then begin
			TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;
			for i := 1 to sgENMolsAddition.RowCount - 1 do begin
				typeName := sgENMolsAddition.Cells[MOLTYPE_COLUMN_NUMBER, i];
        molCode := sgENMolsAddition.Cells[MOLCODE_COLUMN_NUMBER, i];
        tabNumber := sgENMolsAddition.Cells[MOLTABNUMBER_COLUMN_NUMBER, i];
        if dictMolsDepartments.ContainsKey(molCode) then begin
          if dictDepartments.ContainsKey(dictMolsDepartments[molCode]) then begin
            dictMols[molCode].departmentRef := ENDepartmentRef.Create;
            dictMols[molCode].departmentRef.code := dictMolsDepartments[molCode];
          end else begin
              raise Exception.Create(Format('Не знайдено підрозділ із кодом %d', [dictMolsDepartments[molCode]]));
          end;

        end;
				if molCode <> '' then begin
					if not dictTypes.ContainsKey(typeName) then begin
						Application.MessageBox(PChar('Неможливо визначити тип (' + typeName + ') для МВО з кодом ''' + molCode +'''!'), PChar('Увага !'),MB_ICONWARNING);
						Action := caNone;
						Exit;
					end;
					dictMols[molCode].typeRef.code := dictTypes[typeName];
          dictMols[molCode].tabNumber := tabNumber;
				end;
			end;
			for dictKey in dictMols.Keys do begin
				TempENMol.add(dictMols[dictKey]);
			end;
          end else begin
            Action := caNone;
            Exit;
          end;
  end;
end;

procedure TfrmSynchronizeMolsAdditionEdit.FormCreate(Sender: TObject);
begin
  inherited;
  dictTypes := nil;
  lstTypes := nil;
  dictMols := nil;
  dictMolsDepartments := TDictionary<String, Integer>.Create;
  dictDepartments := nil;
  fillDepartments;
end;

procedure TfrmSynchronizeMolsAdditionEdit.FormShow(Sender: TObject);
begin
  inherited;
  sgENMolsAddition.Options := sgENMolsAddition.Options - [goColMoving];
  sgENMolsAddition.Options := sgENMolsAddition.Options + [goEditing];
  fillGrid;
end;

procedure TfrmSynchronizeMolsAdditionEdit.sgENMolsAdditionCellValidate(
  Sender: TObject; ACol, ARow: Integer; var Value: string; var Valid: Boolean);
begin
  inherited;
  if (ACol <> MOLTYPE_COLUMN_NUMBER) then Exit;
end;

procedure TfrmSynchronizeMolsAdditionEdit.OnSelectDepartment(Sender : TObject);
var
depCode : Integer;
molCode : String;
begin
  depCode := Integer(sgENMolsAddition.Combobox.Items.Objects[sgENMolsAddition.Combobox.ItemIndex]);
  molCode := sgENMolsAddition.Cells[MOLCODE_COLUMN_NUMBER, sgENMolsAddition.Row];
  if depCode <> Low(Integer) then begin
    if dictMolsDepartments.ContainsKey(molCode) then begin
       dictMolsDepartments[molCode] := depCode;
    end else begin
       dictMolsDepartments.Add(molCode, depCode);
    end;
  end else begin
    if dictMolsDepartments.ContainsKey(molCode) then begin
       dictMolsDepartments.Remove(molCode);
    end;
  end;
end;

procedure TfrmSynchronizeMolsAdditionEdit.sgENMolsAdditionGetEditorProp(
  Sender: TObject; ACol, ARow: Integer; AEditLink: TEditLink);
  var dep : ENDepartmentShort;
  listDepartments : TList<ENDepartmentShort>;
  cmpDepartmentShortName : TComparison<ENDepartmentShort>;
begin
  inherited;

  cmpDepartmentShortName :=
   function(const Left, Right: ENDepartmentShort): Integer begin
      Result := AnsiCompareStr(Left.shortName, Right.shortName);
    end;

  sgENMolsAddition.ClearComboString;
  if Assigned(sgENMolsAddition.Combobox.OnSelect) then
    sgENMolsAddition.Combobox.OnSelect := nil;

	if ACol = MOLTYPE_COLUMN_NUMBER then begin
    sgENMolsAddition.Combobox.Items.AddStrings(Self.lstTypes);
	end;
	if ACol = MOLDEPARTMENT_COLUMN_NUMBER then begin
    sgENMolsAddition.Combobox.Items.AddObject('', TObject(Low(Integer)));
    listDepartments := TList<ENDepartmentShort>.Create(dictDepartments.Values);

    listDepartments.Sort(TComparer<ENDepartmentShort>
      .Construct(cmpDepartmentShortName));

    for dep in listDepartments do
    sgENMolsAddition.Combobox.Items.AddObject(dep.shortName, TObject(dep.code));
    sgENMolsAddition.Combobox.OnSelect := Self.OnSelectDepartment;
	end;
end;

procedure TfrmSynchronizeMolsAdditionEdit.sgENMolsAdditionGetEditorType(
  Sender: TObject; ACol, ARow: Integer; var AEditor: TEditorType);
begin
  inherited;
	if ACol in [MOLTYPE_COLUMN_NUMBER, MOLDEPARTMENT_COLUMN_NUMBER] then begin
		AEditor := edComboList;
	end;
end;

end.
