
unit ShowSCUsageInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  SCUsageInputController, AdvObj ;


type
  TfrmSCUsageInputShow = class(TChildForm)
  HTTPRIOSCUsageInput: THTTPRIO;
    ImageList1: TImageList;
    sgSCUsageInput: TAdvStringGrid;
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
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    actExportExcel: TAction;
    Excel1: TMenuItem;
    actSetFinKodIst: TAction;
    N5: TMenuItem;
    ToolButton4: TToolButton;
    actSetIsDocsReceived: TAction;
    N9: TMenuItem;
    N10: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgSCUsageInputTopLeftChanged(Sender: TObject);
procedure sgSCUsageInputDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
procedure actExportExcelExecute(Sender: TObject);
    procedure actSetFinKodIstExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actSetIsDocsReceivedExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   isZKU:Boolean;

   constructor Create(AOwner: TComponent;
                       FormMode: TFormMode;
                       pZKU: Boolean;
                       AFilter: TObject = nil); reintroduce; overload;
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmSCUsageInputShow : TfrmSCUsageInputShow;
 frmSCUsageInputZKUShow : TfrmSCUsageInputShow;
 // SCUsageInputObj: SCUsageInput;
 // SCUsageInputFilterObj: SCUsageInputFilter;
  
implementation

uses Main, EditSCUsageInput, EditSCUsageInputFilter, ENConsts,
  DMReportsUnit, EditSetFinKodIst;


{$R *.dfm}

var
  //frmSCUsageInputShow : TfrmSCUsageInputShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  SCUsageInputHeaders: array [1..12] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата складання'
          ,'Дата початку'
          ,'Дата закінчення'
          ,'Код МВО'
          ,'ПІБ МВО'
          ,'Підрозділ'
          ,'Статус'
          ,'Отримано первинні документи'
          ,'Дата зміни'
          ,'Користувач'
        );
   

procedure TfrmSCUsageInputShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then begin
      if Self.isZKU then begin
      frmSCUsageInputZKUShow:=nil;
       end else begin
      frmSCUsageInputShow:=nil;
    end;
    inherited;
  end;
  end;


procedure TfrmSCUsageInputShow.FormShow(Sender: TObject);
var
  TempSCUsageInput: SCUsageInputControllerSoapPort;
  i: Integer;
  SCUsageInputList: SCUsageInputShortList;
  begin
  SetGridHeaders(SCUsageInputHeaders, sgSCUsageInput.ColumnHeaders);
  ColCount:=100;
  TempSCUsageInput :=  HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

 if (Self.isZKU = True) then
     if SCUsageInputFilter(FilterObject).conditionSQL<>''
        then SCUsageInputFilter(FilterObject).conditionSQL:=SCUsageInputFilter(FilterObject).conditionSQL+'and scusageinput.iszku=1'
        else SCUsageInputFilter(FilterObject).conditionSQL:=' scusageinput.iszku=1'
     else
     if SCUsageInputFilter(FilterObject).conditionSQL<>''
        then SCUsageInputFilter(FilterObject).conditionSQL:=
             SCUsageInputFilter(FilterObject).conditionSQL+' and (scusageinput.iszku is null or scusageinput.iszku<>1)'
        else SCUsageInputFilter(FilterObject).conditionSQL:=' (scusageinput.iszku is null or scusageinput.iszku<>1)';

  SCUsageInputFilter(FilterObject).orderBySQL := 'SCUSAGEINPUT.DATEGEN DESC, SCUSAGEINPUT.CODE DESC';

  SCUsageInputList := TempSCUsageInput.getScrollableFilteredList(SCUsageInputFilter(FilterObject),0,ColCount);


  LastCount:=High(SCUsageInputList.list);

  if LastCount > -1 then
     sgSCUsageInput.RowCount:=LastCount+2
  else
     sgSCUsageInput.RowCount:=2;

   with sgSCUsageInput do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(SCUsageInputList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := SCUsageInputList.list[i].numberDoc;
        if SCUsageInputList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(SCUsageInputList.list[i].dateGen);
        if SCUsageInputList.list[i].dateStart = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(SCUsageInputList.list[i].dateStart);
        if SCUsageInputList.list[i].dateFinal = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(SCUsageInputList.list[i].dateFinal);
        Cells[5,i+1] := SCUsageInputList.list[i].molCode;
        Cells[6,i+1] := SCUsageInputList.list[i].molName;

        Cells[7, i+1] := SCUsageInputList.list[i].departmentShortName;
        Objects[7,i+1] := TObject(SCUsageInputList.list[i].statusRefCode);

        Cells[8,i+1] := SCUsageInputList.list[i].statusRefName;

        if SCUsageInputList.list[i].isDocsReceived = YES then
          Cells[9,i+1] := 'Так';

        if SCUsageInputList.list[i].dateEdit = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDateTimeWithDate2String(SCUsageInputList.list[i].dateEdit);
        Cells[11,i+1] := SCUsageInputList.list[i].userGen;

        LastRow:=i+1;
        sgSCUsageInput.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgSCUsageInput.Row:=1;
end;

procedure TfrmSCUsageInputShow.PopupMenu1Popup(Sender: TObject);
var
  scUsageInputCode: Integer;
  TempSCUsageInput: SCUsageInputControllerSoapPort;
  SCUsageInputObj: SCUsageInput;
begin
  try
    scUsageInputCode := StrToInt(sgSCUsageInput.Cells[0, sgSCUsageInput.Row]);
  except
    on EConvertError do Exit;
  end;

  TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;
  SCUsageInputObj := TempSCUsageInput.getObject(scUsageInputCode);

  if SCUsageInputObj = nil then Exit;

  if SCUsageInputObj.isDocsReceived = YES then
    actSetIsDocsReceived.Caption := 'Зняти ознаку отримання первинних документів'
  else
    actSetIsDocsReceived.Caption := 'Встановити ознаку отримання первинних документів';
end;

procedure TfrmSCUsageInputShow.sgSCUsageInputTopLeftChanged(Sender: TObject);
var
  TempSCUsageInput: SCUsageInputControllerSoapPort;
  i,CurrentRow: Integer;
  SCUsageInputList: SCUsageInputShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgSCUsageInput.TopRow + sgSCUsageInput.VisibleRowCount) = ColCount
  then
    begin
      TempSCUsageInput :=  HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;
      CurrentRow:=sgSCUsageInput.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := SCUsageInputFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

    if (Self.isZKU = True) then
     if SCUsageInputFilter(FilterObject).conditionSQL<>''
        then SCUsageInputFilter(FilterObject).conditionSQL:=SCUsageInputFilter(FilterObject).conditionSQL+'and scusageinput.iszku=1'
        else SCUsageInputFilter(FilterObject).conditionSQL:=' scusageinput.iszku=1'
     else
     if SCUsageInputFilter(FilterObject).conditionSQL<>''
        then SCUsageInputFilter(FilterObject).conditionSQL:=
             SCUsageInputFilter(FilterObject).conditionSQL+' and (scusageinput.iszku is null or scusageinput.iszku<>1)'
        else SCUsageInputFilter(FilterObject).conditionSQL:=' (scusageinput.iszku is null or scusageinput.iszku<>1)';



  SCUsageInputList := TempSCUsageInput.getScrollableFilteredList(SCUsageInputFilter(FilterObject),ColCount-1, 100);

  sgSCUsageInput.RowCount:=sgSCUsageInput.RowCount+100;
  LastCount:=High(SCUsageInputList.list);
  with sgSCUsageInput do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if SCUsageInputList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(SCUsageInputList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := SCUsageInputList.list[i].numberDoc;
        if SCUsageInputList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(SCUsageInputList.list[i].dateGen);
        if SCUsageInputList.list[i].dateStart = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(SCUsageInputList.list[i].dateStart);
        if SCUsageInputList.list[i].dateFinal = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(SCUsageInputList.list[i].dateFinal);
        Cells[5,i+CurrentRow] := SCUsageInputList.list[i].molCode;
        Cells[6,i+CurrentRow] := SCUsageInputList.list[i].molName;

        Cells[7, i + CurrentRow] := SCUsageInputList.list[i].departmentShortName;
        Objects[7,i+CurrentRow] := TObject(SCUsageInputList.list[i].statusRefCode);

        Cells[8,i+CurrentRow] := SCUsageInputList.list[i].statusRefName;

        if SCUsageInputList.list[i].isDocsReceived = YES then
          Cells[9,i+CurrentRow] := 'Так';

        if SCUsageInputList.list[i].dateEdit = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := XSDateTimeWithDate2String(SCUsageInputList.list[i].dateEdit);
        Cells[11,i+CurrentRow] := SCUsageInputList.list[i].userGen;
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgSCUsageInput.Row:=CurrentRow-5;
   sgSCUsageInput.RowCount:=LastRow+1;
  end;
end;

procedure TfrmSCUsageInputShow.sgSCUsageInputDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgSCUsageInput,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmSCUsageInputShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgSCUsageInput.RowCount-1 do
   for j:=0 to sgSCUsageInput.ColCount-1 do
     sgSCUsageInput.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmSCUsageInputShow.actViewExecute(Sender: TObject);
Var TempSCUsageInput: SCUsageInputControllerSoapPort;
begin
  TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;

  frmSCUsageInputEdit := TfrmSCUsageInputEdit.Create(Application, dsView);
  try
    try
      frmSCUsageInputEdit.SCUsageInputObj := TempSCUsageInput.getObject(StrToInt(sgSCUsageInput.Cells[0, sgSCUsageInput.Row]));
    except
      on EConvertError do Exit;
    end;
    frmSCUsageInputEdit.isZKU := Self.isZKU;
    frmSCUsageInputEdit.ShowModal;
  finally
    frmSCUsageInputEdit.Free;
    frmSCUsageInputEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputShow.actEditExecute(Sender: TObject);
Var TempSCUsageInput: SCUsageInputControllerSoapPort;
    result: Integer;
begin
  TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;

  frmSCUsageInputEdit := TfrmSCUsageInputEdit.Create(Application, dsEdit);
  try
    try
      frmSCUsageInputEdit.SCUsageInputObj := TempSCUsageInput.getObject(StrToInt(sgSCUsageInput.Cells[0, sgSCUsageInput.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmSCUsageInputEdit.SCUsageInputObj.statusRef.code = SC_USAGE_INPUT_CLOSED then
    begin
      Application.MessageBox(PChar('Цей документ вже затверджено! Редагування заборонено!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    frmSCUsageInputEdit.isZKU := Self.isZKU;
    result := frmSCUsageInputEdit.ShowModal;
    //if frmSCUsageInputEdit.ShowModal= mrOk then
    if (result = mrOk) or (result = mrYes) then 
      begin
        //TempSCUsageInput.save(SCUsageInputObj);
        UpdateGrid(Sender);
      end;
  finally
    frmSCUsageInputEdit.Free;
    frmSCUsageInputEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputShow.actDeleteExecute(Sender: TObject);
Var TempSCUsageInput: SCUsageInputControllerSoapPort;
  ObjCode: Integer;
begin
 TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;
   try
     ObjCode := StrToInt(sgSCUsageInput.Cells[0,sgSCUsageInput.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити документ?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
      TempSCUsageInput.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmSCUsageInputShow.actInsertExecute(Sender: TObject);
Var TempSCUsageInput: SCUsageInputControllerSoapPort;
begin
  TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;

  frmSCUsageInputEdit := TfrmSCUsageInputEdit.Create(Application, dsInsert);
  try
    frmSCUsageInputEdit.SCUsageInputObj := SCUsageInput.Create;
    frmSCUsageInputEdit.isZKU := Self.isZKU;
    if frmSCUsageInputEdit.ShowModal = mrOk then
    begin
      if frmSCUsageInputEdit.SCUsageInputObj <> nil then
          //TempSCUsageInput.add(SCUsageInputObj);
          UpdateGrid(Sender);
    end;
  finally
    frmSCUsageInputEdit.Free;
    frmSCUsageInputEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmSCUsageInputShow.actFilterExecute(Sender: TObject);
var
  autoCreated : Integer;
begin
  frmSCUsageInputFilterEdit:=TfrmSCUsageInputFilterEdit.Create(Application, dsInsert);
  try
    SCUsageInputFilterObj := SCUsageInputFilter.Create;
    SetNullIntProps(SCUsageInputFilterObj);
    SetNullXSProps(SCUsageInputFilterObj);

    if FilterObject <> nil then
    if SCUsageInputFilter(FilterObject).autoCreated <> LOW_INT then
      autoCreated := SCUsageInputFilter(FilterObject).autoCreated;

    SCUsageInputFilterObj.autoCreated := autoCreated;

    if frmSCUsageInputFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := SCUsageInputFilter.Create;
      FilterObject := SCUsageInputFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmSCUsageInputFilterEdit.Free;
    frmSCUsageInputFilterEdit:=nil;
  end;
end;

procedure TfrmSCUsageInputShow.actNoFilterExecute(Sender: TObject);
var
  autoCreated : Integer;
begin
  if FilterObject <> nil then
    if SCUsageInputFilter(FilterObject).autoCreated <> LOW_INT then
      autoCreated := SCUsageInputFilter(FilterObject).autoCreated;

  FilterObject.Free;
  FilterObject := nil;

  FilterObject := SCUsageInputFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);

  SCUsageInputFilter(FilterObject).autoCreated := autoCreated;

  UpdateGrid(Sender);
end;

procedure TfrmSCUsageInputShow.actSetFinKodIstExecute(Sender: TObject);
var ObjCode : Integer;
begin
  // TempENAct2FinKodIst := HTTPRIOENAct2FinKodIst as ENAct2FinKodIstControllerSoapPort;  /// Это здесь уже лишнее!!!
//  ENAct2FinKodIstObj:=ENAct2FinKodIst.Create;
//  ENAct2FinKodIstObj.actRef := ENActRef.Create;
//  ENAct2FinKodIstObj.actRef.code := ENActObj.code;

   try
     ObjCode := StrToInt(sgSCUsageInput.Cells[0,sgSCUsageInput.Row]);
   except
   on EConvertError do Exit;
  end;

  try
    frmSetFinKodIstEdit:=TfrmSetFinKodIstEdit.Create(Application, dsInsert);
    frmSetFinKodIstEdit.ozCode := ObjCode;
    try
      if frmSetFinKodIstEdit.ShowModal = mrOk then
      begin
        if frmSetFinKodIstEdit<>nil then
            UpdateGrid(sender);
      end;
    finally
      frmSetFinKodIstEdit.Free;
      frmSetFinKodIstEdit:=nil;
    end;
  finally
    frmSetFinKodIstEdit.Free;
  end;
end;

procedure TfrmSCUsageInputShow.actSetIsDocsReceivedExecute(Sender: TObject);
var
  scUsageInputCode: Integer;
  TempSCUsageInput: SCUsageInputControllerSoapPort;
  SCUsageInputObj: SCUsageInput;
begin
  try
    scUsageInputCode := StrToInt(sgSCUsageInput.Cells[0, sgSCUsageInput.Row]);
  except
    on EConvertError do Exit;
  end;

  TempSCUsageInput := HTTPRIOSCUsageInput as SCUsageInputControllerSoapPort;
  SCUsageInputObj := TempSCUsageInput.getObject(scUsageInputCode);

  if SCUsageInputObj = nil then Exit;

  if SCUsageInputObj.isDocsReceived = YES then
    TempSCUsageInput.setIsDocsReceived(scUsageInputCode, NO)
  else
    TempSCUsageInput.setIsDocsReceived(scUsageInputCode, YES);

  UpdateGrid(Sender);
end;

procedure TfrmSCUsageInputShow.actExportExcelExecute(Sender: TObject);
begin
  inherited;
  if Application.MessageBox(PChar('Цей список може бути не весь (вибираються по 100 записів)... долистайте до кінця списку ... '+#10#13+' Зберегти в Ексель ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    DMReports.exportGrid(sgSCUsageInput, 'Список_документів_');
  end;
end;

constructor TfrmSCUsageInputShow.Create(AOwner: TComponent; FormMode: TFormMode;
                              pZKU: Boolean;
                              AFilter: TObject = nil);
//var OnShowProc: TNotifyEvent;
//    OnShowProcAddr: Pointer;
begin
  Self.isZKU := pZKU;
  inherited Create(AOwner, FormMode, AFilter);
end;

end.