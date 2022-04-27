
unit EditENTechCondResponsibles;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTechCondResponsiblesController,
  TB2Item, TB2Dock, TB2Toolbar ;

type
  TfrmENTechCondResponsiblesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblPower : TLabel;
    edtPower: TEdit;


  HTTPRIOENTechCondResponsibles: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    GroupBox1: TGroupBox;
    lblResponsibleFIO: TLabel;
    edtResponsibleFIO: TEdit;
    lblResponsibleTabNumber: TLabel;
    edtResponsibleTabNumber: TEdit;
    lblResponsiblePosition: TLabel;
    edtResponsiblePosition: TEdit;
    lblResponsibleDepName: TLabel;
    edtResponsibleDepName: TEdit;
    lblResponsibleDepCode: TLabel;
    edtResponsibleDepCode: TEdit;
    spbResponsiblePerson: TSpeedButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    gbDepartments: TGroupBox;
    tbActions: TTBToolbar;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem47: TTBItem;
    TBItem7: TTBItem;
    TBItem46: TTBItem;
    sgENDepartment: TAdvStringGrid;
    HTTPRIOENTechCondResponsibles2Dep: THTTPRIO;
    lblResponsiblePhone: TLabel;
    edtResponsiblePhone: TEdit;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbResponsiblePersonClick(Sender: TObject);
    procedure spbDepartmentClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateDepartmentsList;
  end;

var
  frmENTechCondResponsiblesEdit: TfrmENTechCondResponsiblesEdit;
  ENTechCondResponsiblesObj: ENTechCondResponsibles;

implementation

uses ShowFINWorker, FINWorkerController, ShowENDepartment,
  ENDepartmentController, ENTechCondResponsibles2DepController,
  EditENTechCondResponsibles2Dep;


{uses
    EnergyproController, EnergyproController2, ENTechCondResponsiblesController  ;
}
{$R *.dfm}

var
  ENDepartmentHeaders: array [1..2] of String =
        ('Код',
         'Назва'
        );

procedure TfrmENTechCondResponsiblesEdit.FormShow(Sender: TObject);
begin
  SetGridHeaders(ENDepartmentHeaders, sgENDepartment.ColumnHeaders);
  SetFloatStyle(edtPower);
  DisableControls([edtResponsibleFIO, edtResponsibleTabNumber, edtResponsiblePosition,
                   edtResponsibleDepName, edtResponsibleDepCode, edtCode]);

  if DialogState = dsView then
  begin
    DisableControls([spbResponsiblePerson]);
    DisableActions([actInsert, actEdit, actDelete]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtResponsibleFIO,
      edtPower
     ]);
   end;

  if DialogState = dsInsert then
  begin
    HideControls([gbDepartments]);
  end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENTechCondResponsiblesObj.code);
    edtResponsibleFIO.Text := ENTechCondResponsiblesObj.responsibleFIO;
    if ( ENTechCondResponsiblesObj.responsibleTabNumber <> Low(Integer) ) then
       edtResponsibleTabNumber.Text := IntToStr(ENTechCondResponsiblesObj.responsibleTabNumber)
    else
       edtResponsibleTabNumber.Text := '';
    edtResponsiblePosition.Text := ENTechCondResponsiblesObj.responsiblePosition;
    edtResponsibleDepName.Text := ENTechCondResponsiblesObj.responsibleDepName;
    edtResponsibleDepCode.Text := ENTechCondResponsiblesObj.responsibleDepCode;
    if ( ENTechCondResponsiblesObj.power <> Low(Integer) ) then
       edtPower.Text := IntToStr(ENTechCondResponsiblesObj.power)
    else
       edtPower.Text := '';
    edtResponsiblePhone.Text := ENTechCondResponsiblesObj.responsiblePhone;

    // Вытягиваем список подразделений
    UpdateDepartmentsList;
  end;
end;



procedure TfrmENTechCondResponsiblesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTechCondResponsibles: ENTechCondResponsiblesControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtPower
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENTechCondResponsibles := HTTPRIOENTechCondResponsibles as ENTechCondResponsiblesControllerSoapPort;


     ENTechCondResponsiblesObj.responsibleFIO := edtResponsibleFIO.Text; 

     if ( edtResponsibleTabNumber.Text <> '' ) then
       ENTechCondResponsiblesObj.responsibleTabNumber := StrToInt(edtResponsibleTabNumber.Text)
     else
       ENTechCondResponsiblesObj.responsibleTabNumber := Low(Integer) ;

     ENTechCondResponsiblesObj.responsiblePosition := edtResponsiblePosition.Text; 

     ENTechCondResponsiblesObj.responsibleDepName := edtResponsibleDepName.Text; 

     ENTechCondResponsiblesObj.responsibleDepCode := edtResponsibleDepCode.Text; 

     if ( edtPower.Text <> '' ) then
       ENTechCondResponsiblesObj.power := StrToInt(edtPower.Text)
     else
       ENTechCondResponsiblesObj.power := Low(Integer) ;

     ENTechCondResponsiblesObj.responsiblePhone := edtResponsiblePhone.Text;

    if DialogState = dsInsert then
    begin
      ENTechCondResponsiblesObj.code:=low(Integer);
      TempENTechCondResponsibles.add(ENTechCondResponsiblesObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENTechCondResponsibles.save(ENTechCondResponsiblesObj);
    end;
  end;
end;


procedure TfrmENTechCondResponsiblesEdit.spbResponsiblePersonClick(
  Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   TempFINWorker: FINWorkerControllerSoapPort;
begin
  f :=FINWorkerFilter.Create;
  SetNullIntProps(f);
  SetNullXSProps(f);

  // f.departmentCode :=  IntToStr(plan.departmentRef.code);

   frmFINWorkerShow := TfrmFINWorkerShow.Create(Application, fmNormal, f);
   try
     frmFINWorkerShow.isForTechCondResponsiblesList := true;

     // frmFINWorkerShow.dateGet := TXSDate.Create;
     // frmFINWorkerShow.dateGet.XSToNative(GetXSDate( EncodeDate(plan.dateStart.Year,plan.dateStart.Month,plan.dateStart.Day) ));

     //frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH;
     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
          try
            ENTechCondResponsiblesObj.responsibleFIO := GetReturnValue(sgFINWorker,1);
            ENTechCondResponsiblesObj.responsibleTabNumber := StrToInt(GetReturnValue(sgFINWorker,2));
            ENTechCondResponsiblesObj.responsiblePosition := GetReturnValue(sgFINWorker,3);
            //ENHumenItemObj.finWorker.positionCode := StrToInt(GetReturnValue(sgFINWorker,4));
            ENTechCondResponsiblesObj.responsibleDepName := GetReturnValue(sgFINWorker,5);
            ENTechCondResponsiblesObj.responsibleDepCode := (GetReturnValue(sgFINWorker,6));

            edtResponsibleFIO.Text := ENTechCondResponsiblesObj.responsibleFIO;
            edtResponsibleTabNumber.Text := IntToStr(ENTechCondResponsiblesObj.responsibleTabNumber);
            edtResponsiblePosition.Text := ENTechCondResponsiblesObj.responsiblePosition;
            edtResponsibleDepName.Text := ENTechCondResponsiblesObj.responsibleDepName;
            edtResponsibleDepCode.Text := ENTechCondResponsiblesObj.responsibleDepCode;
          except
            on EConvertError do Exit;
          end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;
end;

procedure TfrmENTechCondResponsiblesEdit.spbDepartmentClick(
  Sender: TObject);
var
   frmENDepartmentShow: TfrmENDepartmentShow;
   f: ENDepartmentFilter;
begin
{
   f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);

   f.code := 1;

   frmENDepartmentShow := TfrmENDepartmentShow.Create(Application, fmNormal, f);
   try
      frmENDepartmentShow.isCheckPodr := true;
      with frmENDepartmentShow do
      begin
   //     DisableActions([ actNoFilter, actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
               if ENTechCondResponsiblesObj.departmentRef = nil then ENTechCondResponsiblesObj.departmentRef := ENDepartmentRef.Create();
               ENTechCondResponsiblesObj.departmentRef.code := ENDepartmentShort(tvDep.Selected.Data).code;
               edtDepartment.Text:= ENDepartmentShort(tvDep.Selected.Data).shortName;
            except
               on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;
}
end;

procedure TfrmENTechCondResponsiblesEdit.UpdateDepartmentsList;
var TempENTechCondResponsibles2Dep: ENTechCondResponsibles2DepControllerSoapPort;
    resp2DepFilter: ENTechCondResponsibles2DepFilter;
    resp2DepList: ENTechCondResponsibles2DepShortList;
    i: Integer;
begin
  ClearGrid(sgENDepartment);

  TempENTechCondResponsibles2Dep := HTTPRIOENTechCondResponsibles2Dep as ENTechCondResponsibles2DepControllerSoapPort;

  resp2DepFilter := ENTechCondResponsibles2DepFilter.Create;
  SetNullIntProps(resp2DepFilter);
  SetNullXSProps(resp2DepFilter);

  resp2DepFilter.techCondResponsiblesRef := ENTechCondResponsiblesRef.Create;
  resp2DepFilter.techCondResponsiblesRef.code := ENTechCondResponsiblesObj.code;

  resp2DepList := TempENTechCondResponsibles2Dep.getScrollableFilteredList(resp2DepFilter, 0, -1);

  if High(resp2DepList.list) > -1 then
    sgENDepartment.RowCount := High(resp2DepList.list) + 2
  else
    sgENDepartment.RowCount := 2;

  with sgENDepartment do
    for i := 0 to High(resp2DepList.list) do
    begin
      Application.ProcessMessages;
      if resp2DepList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(resp2DepList.list[i].code)
      else
        Cells[0,i+1] := '';
      Cells[1,i+1] := resp2DepList.list[i].departmentRefShortName;
      sgENDepartment.RowCount := i + 2;
    end;

  sgENDepartment.Row := 1;
end;

procedure TfrmENTechCondResponsiblesEdit.actInsertExecute(Sender: TObject);
begin
  ENTechCondResponsibles2DepObj := ENTechCondResponsibles2Dep.Create;

  ENTechCondResponsibles2DepObj.techCondResponsiblesRef := ENTechCondResponsiblesRef.Create;
  ENTechCondResponsibles2DepObj.techCondResponsiblesRef.code := ENTechCondResponsiblesObj.code;
  ENTechCondResponsibles2DepObj.departmentRef := ENDepartmentRef.Create;

  frmENTechCondResponsibles2DepEdit := TfrmENTechCondResponsibles2DepEdit.Create(Application, dsInsert);
  try
    frmENTechCondResponsibles2DepEdit.edtENTechCondResponsiblesFIO.Text := ENTechCondResponsiblesObj.responsibleFIO;

    if frmENTechCondResponsibles2DepEdit.ShowModal = mrOk then
      UpdateDepartmentsList;
  finally
    frmENTechCondResponsibles2DepEdit.Free;
  end;
end;

procedure TfrmENTechCondResponsiblesEdit.actViewExecute(Sender: TObject);
var TempENTechCondResponsibles2Dep: ENTechCondResponsibles2DepControllerSoapPort;
begin
  TempENTechCondResponsibles2Dep := HTTPRIOENTechCondResponsibles2Dep as ENTechCondResponsibles2DepControllerSoapPort;
  try
    ENTechCondResponsibles2DepObj := TempENTechCondResponsibles2Dep.getObject(StrToInt(sgENDepartment.Cells[0, sgENDepartment.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENTechCondResponsibles2DepEdit := TfrmENTechCondResponsibles2DepEdit.Create(Application, dsView);
  try
    frmENTechCondResponsibles2DepEdit.ShowModal;
  finally
    frmENTechCondResponsibles2DepEdit.Free;
  end;
end;

procedure TfrmENTechCondResponsiblesEdit.actEditExecute(Sender: TObject);
var TempENTechCondResponsibles2Dep: ENTechCondResponsibles2DepControllerSoapPort;
begin
  TempENTechCondResponsibles2Dep := HTTPRIOENTechCondResponsibles2Dep as ENTechCondResponsibles2DepControllerSoapPort;
  try
    ENTechCondResponsibles2DepObj := TempENTechCondResponsibles2Dep.getObject(StrToInt(sgENDepartment.Cells[0, sgENDepartment.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENTechCondResponsibles2DepEdit := TfrmENTechCondResponsibles2DepEdit.Create(Application, dsEdit);
  try
    if frmENTechCondResponsibles2DepEdit.ShowModal = mrOk then
      UpdateDepartmentsList;
  finally
    frmENTechCondResponsibles2DepEdit.Free;
  end;
end;

procedure TfrmENTechCondResponsiblesEdit.actDeleteExecute(Sender: TObject);
var ObjCode: Integer;
    TempENTechCondResponsibles2Dep: ENTechCondResponsibles2DepControllerSoapPort;
begin
  TempENTechCondResponsibles2Dep := HTTPRIOENTechCondResponsibles2Dep as ENTechCondResponsibles2DepControllerSoapPort;
  try
    ObjCode := StrToInt(sgENDepartment.Cells[0, sgENDepartment.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENTechCondResponsibles2Dep.remove(ObjCode);
    UpdateDepartmentsList;
  end;
end;

procedure TfrmENTechCondResponsiblesEdit.actUpdateExecute(Sender: TObject);
begin
  UpdateDepartmentsList;
end;

end.