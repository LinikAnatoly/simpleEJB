
unit EditENMol;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolController, TB2Item,
  TB2Dock, TB2Toolbar, AdvObj ;

type
  TfrmENMolEdit = class(TDialogForm)
    lblCode : TLabel;
	  edtCode : TEdit;
    lblFinCode : TLabel;
    edtFinCode: TEdit;
    lblName : TLabel;
    edtName: TEdit;
    HTTPRIOENMol: THTTPRIO;
    btnOk: TButton;
    btnCancel: TButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    HTTPRIOENMol2Department: THTTPRIO;
    lblType: TLabel;
    edtType: TEdit;
    spbType: TSpeedButton;
    lblStatus: TLabel;
    edtStatus: TEdit;
    spbStatus: TSpeedButton;
    HTTPRIOENMolType: THTTPRIO;
    HTTPRIOENMolStatus: THTTPRIO;
    lblPhoneNumber: TLabel;
    edtPhoneNumber: TEdit;
    lblTabNumber: TLabel;
    edtTabNumber: TEdit;
    lblENDepartment: TLabel;
    edtENDepartment: TEdit;
    spbENDepartment: TSpeedButton;
    spbENDepartmentClear: TSpeedButton;
    HTTPRIOENDepartment: THTTPRIO;
    spbTabNumber: TSpeedButton;
    HTTPRIOUser2Staffing: THTTPRIO;
    spbTabNumberClear: TSpeedButton;
    lblstorage: TLabel;
    edtStorage: TEdit;
    pgc1: TPageControl;
    tspodr: TTabSheet;
    tsGeoEnDepartment: TTabSheet;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    sgENDepartment: TAdvStringGrid;
    TBToolbar1: TTBToolbar;
    TBItemGeoDepartmentView: TTBItem;
    TBItemGeoDepartmentInsert: TTBItem;
    TBItemGeoDepartmentEdit: TTBItem;
    TBItemGeoDepartmentDelete: TTBItem;
    TBItemGeoDepartmentUpdate: TTBItem;
    actlstGeoDepartment: TActionList;
    actGeoDepartmentView: TAction;
    actGeoDepartmentInsert: TAction;
    actGeoDepartmentEdit: TAction;
    actGeoDepartmentDelete: TAction;
    actGeoDepartmentUpdate: TAction;
    HTTPRIOENMol2GeoDepartment: THTTPRIO;
    sgENMol2GeoDepartment: TAdvStringGrid;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTypeClick(Sender: TObject);
    procedure spbStatusClick(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure spbENDepartmentClick(Sender: TObject);
    procedure spbENDepartmentClearClick(Sender: TObject);
    procedure spbTabNumberClick(Sender: TObject);
    procedure spbTabNumberClearClick(Sender: TObject);
    procedure actGeoDepartmentViewExecute(Sender: TObject);
    procedure actGeoDepartmentInsertExecute(Sender: TObject);
    procedure actGeoDepartmentEditExecute(Sender: TObject);
    procedure actGeoDepartmentDeleteExecute(Sender: TObject);
    procedure actGeoDepartmentUpdateExecute(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateDepartmentsList;
    procedure UpdateGeoDepartmentsList;
  public
    { Public declarations }
  end;

var
  frmENMolEdit: TfrmENMolEdit;
  ENMolObj: ENMol;

implementation

uses ENMol2DepartmentController, ShowENMolType, ShowENMolStatus,
  ENMolTypeController, ENMolStatusController, EditENMol2Department,
  ENDepartmentController, ShowENDepartment, User2StaffingController,
  ShowUser2Staffing, Globals, ENMol2GeoDepartmentController,
  EditENMol2GeoDepartment, ENGeographicDepartmentController;

{uses
    EnergyproController, EnergyproController2, ENMolController  ;
}

{$R *.dfm}

var
  ENDepartmentHeaders: array [1..2] of String =
        ('Код',
         'Назва'
        );


procedure TfrmENMolEdit.FormShow(Sender: TObject);
var TempENMolType: ENMolTypeControllerSoapPort;
    TempENMolStatus: ENMolStatusControllerSoapPort;
    TempENDepartment : ENDepartmentControllerSoapPort;
    molType: ENMolType;
    molStatus: ENMolStatus;
    department : ENDepartment;
begin
  SetGridHeaders(ENDepartmentHeaders, sgENDepartment.ColumnHeaders);
  //DisableControls([edtType, edtStatus, spbStatus]); // Статус пока не будем давать менять
  DisableControls([edtType, edtStatus, edtCode, edtENDepartment, edtTabNumber]); // Пусть меняют статус!!!
  SetFloatStyle([edtTabNumber]);

  if DialogState = dsView then
  begin
    DisableControls([spbType, spbStatus, spbENDepartment, spbENDepartmentClear,
                     spbTabNumber, spbTabNumberClear , edtStorage]);
    DisableActions([actInsert, actEdit, actDelete]);
  end;

  if DialogState = dsInsert then
  begin
    HideControls([pgc1]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtFinCode
      ,edtName
      ,edtType
      ,edtStatus
     ]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENMolObj.code);
    edtFinCode.Text := ENMolObj.finCode;
    edtName.Text := ENMolObj.name;
    edtPhoneNumber.Text := ENMolObj.phoneNumber;
    edtTabNumber.Text := ENMolObj.tabNumber;
    edtStorage.Text:= ENMolObj.storage;

    TempENMolType := HTTPRIOENMolType as ENMolTypeControllerSoapPort;
    molType := TempENMolType.getObject(ENMolObj.typeRef.code);
    if molType <> nil then
      edtType.Text := molType.name;

    TempENMolStatus := HTTPRIOENMolStatus as ENMolStatusControllerSoapPort;
    molStatus := TempENMolStatus.getObject(ENMolObj.statusRef.code);
    if molStatus <> nil then
      edtStatus.Text := molStatus.name;

    TempENDepartment := HTTPRIOENDepartment as ENDepartmentControllerSoapPort;
    if  ((Assigned(ENMolObj)) and (Assigned(ENMolObj.departmentRef)) and (ENMolObj.departmentRef.code <> Low(Integer))) then begin
      department := TempENDepartment.getObject(ENMolObj.departmentRef.code);
      edtENDepartment.Text := department.shortName;
	end;
    

    // Вытягиваем список подразделений
    UpdateDepartmentsList;

    UpdateGeoDepartmentsList;
  end;
end;



procedure TfrmENMolEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMol: ENMolControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtFinCode
      ,edtName
      ,edtType
      ,edtStatus      
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end

  else if Length(edtTabNumber.Text) > 6 then
  begin
    Application.MessageBox(PChar('Поле "Табельний номер" Перевищує допустиму довжину!'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
    Action:=caNone;
  end

  else
  begin
    TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;

    ENMolObj.finCode := edtFinCode.Text;
    ENMolObj.name := edtName.Text;
    ENMolObj.phoneNumber := edtPhoneNumber.Text;
    ENMolObj.storage := edtStorage.Text;
    ENMolObj.tabNumber := edtTabNumber.Text;

    if DialogState = dsInsert then
    begin
      ENMolObj.code:=low(Integer);
      TempENMol.add(ENMolObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENMol.save(ENMolObj);
    end;
  end;
end;


procedure TfrmENMolEdit.spbTabNumberClearClick(Sender: TObject);
begin
  edtTabNumber.Text := '';
end;

procedure TfrmENMolEdit.spbTabNumberClick(Sender: TObject);
var
  userFilter: User2StaffingFilter;
  frmUser2StaffingShow: TfrmUser2StaffingShow;
  TempUser2Staffing: User2StaffingControllerSoapPort;
begin
  TempUser2Staffing := HTTPRIOUser2Staffing as User2StaffingControllerSoapPort;

  userFilter := User2StaffingFilter.Create;
  SetNullIntProps(userFilter);
  SetNullXSProps(userFilter);
  userFilter.conditionSQL :=
    ' user2staffing.xoe = ' + IntToStr(YES) +
    ' and user2staffing.usercode in ( ' +
    ' select u.user_code from auth_user u where u.statuscode = ' + IntToStr(USER_STATUS_LEGAL) + ')';

  userFilter.orderBySQL := ' fio';

  frmUser2StaffingShow := TfrmUser2StaffingShow.Create(Application, fmNormal, userFilter);
  try
    if frmUser2StaffingShow.ShowModal = mrOk then
    begin
      edtTabNumber.Text := frmUser2StaffingShow.GetReturnValue(frmUser2StaffingShow.sgUser2Staffing, 1);
    end;
  finally
    frmUser2StaffingShow.Free;
  end;
end;

procedure TfrmENMolEdit.spbTypeClick(Sender: TObject);
var 
   frmENMolTypeShow: TfrmENMolTypeShow;
begin
   frmENMolTypeShow := TfrmENMolTypeShow.Create(Application, fmNormal);
   try
      with frmENMolTypeShow do
      begin
        DisableActions([actInsert, actDelete, actEdit]);
        if ShowModal = mrOk then
        begin
            try
               if ENMolObj.typeRef = nil then ENMolObj.typeRef := ENMolTypeRef.Create();
               ENMolObj.typeRef.code := StrToInt(GetReturnValue(sgENMolType, 0));
               edtType.Text := GetReturnValue(sgENMolType, 1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENMolTypeShow.Free;
   end;
end;

procedure TfrmENMolEdit.spbENDepartmentClearClick(Sender: TObject);
begin
  inherited;
  if (not Assigned(ENMolObj))
    or (not Assigned(ENMolObj.departmentRef)) then begin
    Exit;
  end;

  ENMolObj.departmentRef.code := Low(Integer);
  edtENDepartment.Text := '';
end;

procedure TfrmENMolEdit.spbENDepartmentClick(Sender: TObject);
begin
  inherited;
  TfrmENDepartmentShow.chooseFromList(true, procedure(selectedObj : ENDepartmentShort)
  begin
       if not Assigned(ENMolObj) then begin
		       ENMolObj := ENMol.Create;
		   end;

		   if not Assigned(ENMolObj.departmentRef) then begin
		       ENMolObj.departmentRef := ENDepartmentRef.Create;
		   end;

       ENMolObj.departmentRef.code := selectedObj.code;
       edtENDepartment.Text := selectedObj.shortName;
  end);
end;

procedure TfrmENMolEdit.spbStatusClick(Sender: TObject);
var
   frmENMolStatusShow: TfrmENMolStatusShow;
begin
   frmENMolStatusShow := TfrmENMolStatusShow.Create(Application, fmNormal);
   try
      with frmENMolStatusShow do
      begin
        DisableActions([actInsert, actDelete, actEdit]);
        if ShowModal = mrOk then
        begin
            try
               if ENMolObj.statusRef = nil then ENMolObj.statusRef := ENMolStatusRef.Create();
               ENMolObj.statusRef.code := StrToInt(GetReturnValue(sgENMolStatus, 0));
               edtStatus.Text := GetReturnValue(sgENMolStatus, 1);
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENMolStatusShow.Free;
   end;
end;

procedure TfrmENMolEdit.UpdateDepartmentsList;
var TempENMol2Department: ENMol2DepartmentControllerSoapPort;
    mol2DepFilter: ENMol2DepartmentFilter;
    mol2DepList: ENMol2DepartmentShortList;
    i: Integer;
begin
  ClearGrid(sgENDepartment);

  TempENMol2Department := HTTPRIOENMol2Department as ENMol2DepartmentControllerSoapPort;

  mol2DepFilter := ENMol2DepartmentFilter.Create;
  SetNullIntProps(mol2DepFilter);
  SetNullXSProps(mol2DepFilter);

  mol2DepFilter.mol := ENMol.Create;
  mol2DepFilter.mol.code := ENMolObj.code;

  mol2DepList := TempENMol2Department.getScrollableFilteredList(mol2DepFilter, 0, -1);

  if High(mol2DepList.list) > -1 then
    sgENDepartment.RowCount := High(mol2DepList.list) + 2
  else
    sgENDepartment.RowCount := 2;

  with sgENDepartment do
    for i := 0 to High(mol2DepList.list) do
      begin
        Application.ProcessMessages;
        if mol2DepList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(mol2DepList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := mol2DepList.list[i].departmentRefShortName;
        sgENDepartment.RowCount := i + 2;
      end;

  sgENDepartment.Row := 1;
end;


procedure TfrmENMolEdit.UpdateGeoDepartmentsList;
var TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort;
    mol2GeoDepFilter: ENMol2GeoDepartmentFilter;
    mol2GeoDepList: ENMol2GeoDepartmentShortList;
    i: Integer;
begin
  ClearGrid(sgENMol2GeoDepartment);

  TempENMol2GeoDepartment := HTTPRIOENMol2GeoDepartment as ENMol2GeoDepartmentControllerSoapPort;

  mol2GeoDepFilter := ENMol2GeoDepartmentFilter.Create;
  SetNullIntProps(mol2GeoDepFilter);
  SetNullXSProps(mol2GeoDepFilter);

  mol2GeoDepFilter.mol := ENMol.Create;
  mol2GeoDepFilter.mol.code := ENMolObj.code;

  mol2GeoDepList := TempENMol2GeoDepartment.getScrollableFilteredList(mol2GeoDepFilter, 0, -1);

  if High(mol2GeoDepList.list) > -1 then
    sgENMol2GeoDepartment.RowCount := High(mol2GeoDepList.list) + 2
  else
    sgENMol2GeoDepartment.RowCount := 2;

  with sgENMol2GeoDepartment do
    for i := 0 to High(mol2GeoDepList.list) do
      begin
        Application.ProcessMessages;
        if mol2GeoDepList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(mol2GeoDepList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := mol2GeoDepList.list[i].geoDepartmentName;
        sgENMol2GeoDepartment.RowCount := i + 2;
      end;

  sgENMol2GeoDepartment.Row := 1;
end;

procedure TfrmENMolEdit.actEditExecute(Sender: TObject);
var TempENMol2Department: ENMol2DepartmentControllerSoapPort;
begin
  TempENMol2Department := HTTPRIOENMol2Department as ENMol2DepartmentControllerSoapPort;
  try
    ENMol2DepartmentObj := TempENMol2Department.getObject(StrToInt(sgENDepartment.Cells[0, sgENDepartment.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENMol2DepartmentEdit := TfrmENMol2DepartmentEdit.Create(Application, dsEdit);
  try
    if frmENMol2DepartmentEdit.ShowModal = mrOk then
      UpdateDepartmentsList;
  finally
    frmENMol2DepartmentEdit.Free;
  end;
end;

procedure TfrmENMolEdit.actGeoDepartmentDeleteExecute(Sender: TObject);
var ObjCode: Integer;
    TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort;
begin
  TempENMol2GeoDepartment := HTTPRIOENMol2GeoDepartment as ENMol2GeoDepartmentControllerSoapPort;
  try
    ObjCode := StrToInt(sgENMol2GeoDepartment.Cells[0, sgENMol2GeoDepartment.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENMol2GeoDepartment.remove(ObjCode);
    UpdateGeoDepartmentsList;
  end;
end;

procedure TfrmENMolEdit.actGeoDepartmentEditExecute(Sender: TObject);
var TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort;
begin
  TempENMol2GeoDepartment := HTTPRIOENMol2GeoDepartment as ENMol2GeoDepartmentControllerSoapPort;
  try
    ENMol2GeoDepartmentObj := TempENMol2GeoDepartment.getObject(StrToInt(sgENMol2GeoDepartment.Cells[0, sgENMol2GeoDepartment.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENMol2GeoDepartmentEdit := TfrmENMol2GeoDepartmentEdit.Create(Application, dsEdit);
  try
    if frmENMol2GeoDepartmentEdit.ShowModal = mrOk then
      UpdateGeoDepartmentsList;
  finally
    frmENMol2GeoDepartmentEdit.Free;
  end;
end;

procedure TfrmENMolEdit.actGeoDepartmentInsertExecute(Sender: TObject);
begin
  ENMol2GeoDepartmentObj := ENMol2GeoDepartment.Create;
  ENMol2GeoDepartmentObj.mol := ENMol.Create;
  ENMol2GeoDepartmentObj.mol.code := ENMolObj.code;
  ENMol2GeoDepartmentObj.geoDepartment := ENGeographicDepartmentRef.Create;

  frmENMol2GeoDepartmentEdit := TfrmENMol2GeoDepartmentEdit.Create(Application, dsInsert);
  try

    frmENMol2GeoDepartmentEdit.edtENMolMolName.Text := ENMolObj.name;

    if frmENMol2GeoDepartmentEdit.ShowModal = mrOk then
      UpdateGeoDepartmentsList;
  finally
    frmENMol2GeoDepartmentEdit.Free;
  end;
end;

procedure TfrmENMolEdit.actGeoDepartmentUpdateExecute(Sender: TObject);
begin
  inherited;
   UpdateGeoDepartmentsList;
end;

procedure TfrmENMolEdit.actGeoDepartmentViewExecute(Sender: TObject);
var TempENMol2GeoDepartment: ENMol2GeoDepartmentControllerSoapPort;
begin
  TempENMol2GeoDepartment := HTTPRIOENMol2Department as ENMol2GeoDepartmentControllerSoapPort;
  try
    ENMol2GeoDepartmentObj := TempENMol2GeoDepartment.getObject(StrToInt(sgENMol2GeoDepartment.Cells[0, sgENMol2GeoDepartment.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENMol2GeoDepartmentEdit := TfrmENMol2GeoDepartmentEdit.Create(Application, dsView);
  try
    frmENMol2GeoDepartmentEdit.ShowModal;
  finally
    frmENMol2GeoDepartmentEdit.Free;
  end;
end;

procedure TfrmENMolEdit.actInsertExecute(Sender: TObject);
begin
  ENMol2DepartmentObj := ENMol2Department.Create;
  ENMol2DepartmentObj.mol := ENMol.Create;
  ENMol2DepartmentObj.mol.code := ENMolObj.code;
  ENMol2DepartmentObj.departmentRef := ENDepartmentRef.Create;

  frmENMol2DepartmentEdit := TfrmENMol2DepartmentEdit.Create(Application, dsInsert);
  try
    //frmENMol2DepartmentEdit.enMolCode := ENMolObj.code;
    frmENMol2DepartmentEdit.edtENMolMolName.Text := ENMolObj.name;

    if frmENMol2DepartmentEdit.ShowModal = mrOk then
      UpdateDepartmentsList;
  finally
    frmENMol2DepartmentEdit.Free;
  end;
end;

procedure TfrmENMolEdit.actUpdateExecute(Sender: TObject);
begin
  UpdateDepartmentsList;
end;

procedure TfrmENMolEdit.actViewExecute(Sender: TObject);
var TempENMol2Department: ENMol2DepartmentControllerSoapPort;
begin
  TempENMol2Department := HTTPRIOENMol2Department as ENMol2DepartmentControllerSoapPort;
  try
    ENMol2DepartmentObj := TempENMol2Department.getObject(StrToInt(sgENDepartment.Cells[0, sgENDepartment.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENMol2DepartmentEdit := TfrmENMol2DepartmentEdit.Create(Application, dsView);
  try
    frmENMol2DepartmentEdit.ShowModal;
  finally
    frmENMol2DepartmentEdit.Free;
  end;
end;

procedure TfrmENMolEdit.actDeleteExecute(Sender: TObject);
var ObjCode: Integer;
    TempENMol2Department: ENMol2DepartmentControllerSoapPort;
begin
  TempENMol2Department := HTTPRIOENMol2Department as ENMol2DepartmentControllerSoapPort;
  try
    ObjCode := StrToInt(sgENDepartment.Cells[0, sgENDepartment.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENMol2Department.remove(ObjCode);
    UpdateDepartmentsList;
  end;
end;

end.