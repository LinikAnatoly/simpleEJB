
unit EditRQAllocationAdditionalParameters;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQAllocationListController, CheckLst;

type
  TfrmRQAllocationAdditionalParametersEdit = class(TDialogForm)
    lbledtNumberPriconnection: TLabel;
    edtNumberPriconnection: TEdit;

  btnOk: TButton;
  btnCancel: TButton;
    gbPackingListParameters: TGroupBox;
    ListMaterialsGroups: TCheckListBox;
    spbClearAllGroupMaterials: TSpeedButton;
    spbSelectAllGroupMaterials: TSpeedButton;
    chbOnlySelectedMaterialsGroups: TCheckBox;
    HTTPRIOTKMaterials: THTTPRIO;
    lblENDepartment: TLabel;
    edtENDepartment: TEdit;
    spbENDepartment: TSpeedButton;
    spbENDepartmentClear: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chbOnlySelectedMaterialsGroupsClick(Sender: TObject);
    procedure spbSelectAllGroupMaterialsClick(Sender: TObject);
    procedure spbClearAllGroupMaterialsClick(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbENDepartmentClearClick(Sender: TObject);
  
  
  private
    { Private declarations }
    procedure fillMaterialsGroups;
	procedure toggleMaterialsGroupsEnabled;
	procedure readMaterialGroups;
  public
    { Public declarations }
      RQAllocationAdditionalParametersObj: RQAllocationAdditionalParameters;

end;

var
  frmRQAllocationAdditionalParametersEdit: TfrmRQAllocationAdditionalParametersEdit;

implementation

uses TKMaterialsController, Generics.Collections, ENDepartmentController, ShowENDepartment, ENConsts;

{$R *.dfm}

 procedure TfrmRQAllocationAdditionalParametersEdit.chbOnlySelectedMaterialsGroupsClick(
  Sender: TObject);
begin
  inherited;
  if chbOnlySelectedMaterialsGroups.Checked then begin
      readMaterialGroups;
  end else begin
      RQAllocationAdditionalParametersObj.materialsGroups := nil;
  end;
  toggleMaterialsGroupsEnabled;
end;

procedure TfrmRQAllocationAdditionalParametersEdit.readMaterialGroups;
var list : TList<Integer>;
i : Integer;
matArr : ArrayOfTKMaterialsRef;
begin
    list := TList<Integer>.Create;
    list.Clear;
    For i:=0 to ListMaterialsGroups.Count -1  do begin
     if  ListMaterialsGroups.Checked[i] then begin
       list.Add(Integer( ListMaterialsGroups.Items.Objects[i] ));
     end;
    End;
	SetLength(matArr, list.Count);
	For i := 0 to list.Count - 1 do begin
	    matArr[i] := TKMaterialsRef.Create;
	    SetNullXSProps(matArr[i]);
		SetNullIntProps(matArr[i]);
		matArr[i].code := list[i];
	end;
	RQAllocationAdditionalParametersObj.materialsGroups := matArr;
end;

procedure TfrmRQAllocationAdditionalParametersEdit.spbClearAllGroupMaterialsClick(
  Sender: TObject);
var
    i : Integer;
begin
  inherited;

     For i:=0 to ListMaterialsGroups.Count -1  do
    Begin
           ListMaterialsGroups.Checked[i] := false;
    End;
end;

procedure TfrmRQAllocationAdditionalParametersEdit.spbENDepartmentClearClick(
  Sender: TObject);
begin
  inherited;
  RQAllocationAdditionalParametersObj.oldRem := Low(Integer);
  edtENDepartment.Text := '';
end;

procedure TfrmRQAllocationAdditionalParametersEdit.spbENDepartmentClick(
  Sender: TObject);
var department : ENDepartmentShort;
filter : ENDepartmentFilter;
begin
  inherited;
  filter := ENDepartmentFilter.Create;SetNullXSProps(filter);SetNullIntProps(filter);
  filter.parentRef := ENDepartmentRef.Create;
  filter.parentRef.code := ENDEPARTMENT_REM;
  department := TfrmENDepartmentShow.chooseFromList(true, filter);
  if Assigned(department) then begin
           if not Assigned(RQAllocationAdditionalParametersObj) then begin
		           RQAllocationAdditionalParametersObj := RQAllocationAdditionalParameters.Create;
               SetNullXSProps(RQAllocationAdditionalParametersObj);SetNullIntProps(RQAllocationAdditionalParametersObj);
		       end;
		       RQAllocationAdditionalParametersObj.oldRem := department.code;
           edtENDepartment.Text := department.shortName;
  end;
end;

procedure TfrmRQAllocationAdditionalParametersEdit.toggleMaterialsGroupsEnabled;
begin
    DisableControls([ListMaterialsGroups, spbSelectAllGroupMaterials, spbClearAllGroupMaterials]
	                  , not chbOnlySelectedMaterialsGroups.Checked);
end;

procedure TfrmRQAllocationAdditionalParametersEdit.fillMaterialsGroups;
var

  TempTKMaterials: TKMaterialsControllerSoapPort;
  TKMaterialsList: TKMaterialsShortList;
  materialsfilter : TkMaterialsFilter;
  i : Integer;
  list : TList<Integer>;
  iter : TKMaterialsRef;
begin
    {заполняем группы материалов}

     materialsfilter := TKMaterialsFilter.Create;
     SetNullIntProps(materialsfilter);
     SetNullXSProps(materialsfilter);

     materialsfilter.conditionSQL := 'tk1.parentrefcode is null and tk1.measurementcode is not null';
     materialsfilter.orderBySQL := 'TK1.NAME';


     TempTKMaterials:= HTTPRIOTKMaterials as TKMaterialsControllerSoapPort;
     TKMaterialsList := TempTKMaterials.getScrollableFilteredList(materialsfilter,0,-1);
     ListMaterialsGroups.Items.Clear;
	 
	 list := TList<Integer>.Create;
	 list.Clear;
	 
	 if Assigned(RQAllocationAdditionalParametersObj.materialsGroups) then begin
	     for iter in RQAllocationAdditionalParametersObj.materialsGroups do begin
		     list.Add(iter.code);
		 end;
	 end;

 for i:=0 to High(TKMaterialsList.list) do
      begin
        ListMaterialsGroups.Items.AddObject(TKMaterialsList.list[i].name , TObject( TKMaterialsList.list[i].code )  );
		if list.Contains(TKMaterialsList.list[i].code) then begin
		    ListMaterialsGroups.Checked[i] := True;
		end;
      end;
end;

   procedure TfrmRQAllocationAdditionalParametersEdit.spbSelectAllGroupMaterialsClick(
  Sender: TObject);
var
    i : Integer;
begin
  inherited;

     For i:=0 to ListMaterialsGroups.Count -1  do
    Begin
           ListMaterialsGroups.Checked[i] := true;
    End;
end;

procedure TfrmRQAllocationAdditionalParametersEdit.FormShow(Sender: TObject);
var TempENDepartment : ENDepartmentControllerSoapPort;
department : ENDepartment;
begin
    edtNumberPriconnection.Text := RQAllocationAdditionalParametersObj.priconnectionDoc;
    fillMaterialsGroups;
	if Assigned(RQAllocationAdditionalParametersObj.materialsGroups) then begin
	   chbOnlySelectedMaterialsGroups.Checked := True;
	end else begin
	   chbOnlySelectedMaterialsGroups.Checked := False;
	end;
	toggleMaterialsGroupsEnabled;
  DisableControls([edtENDepartment]);
  if RQAllocationAdditionalParametersObj.oldRem <> Low(Integer) then begin
    TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    department := TempENDepartment.getObject(RQAllocationAdditionalParametersObj.oldRem);
    edtENDepartment.Text := department.name;
  end;

end;

procedure TfrmRQAllocationAdditionalParametersEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var matArr : ArrayOfTKMaterialsRef;
begin
  if (ModalResult = mrOk) then begin
     RQAllocationAdditionalParametersObj.priconnectionDoc := edtNumberPriconnection.Text;
	 if chbOnlySelectedMaterialsGroups.Checked then begin
	     matArr := RQAllocationAdditionalParametersObj.materialsGroups;
		 Self.readMaterialGroups;
		 if Length(RQallocationAdditionalParametersObj.materialsGroups) = 0 then begin
			RQAllocationAdditionalParametersObj.materialsGroups := matArr;
		     Application.MessageBox(PChar('Оберіть хоча б одну группу матеріалів ' + Chr(10) 
			 + ' або уберіть флажок "Формувати розподіл тільки по матеріалах обраних груп"')
			     , PChar('Помилка'), MB_ICONERROR);
			 Action := caNone;
			 Exit;
		 end;
	 end;
	 
  end;
end;


end.