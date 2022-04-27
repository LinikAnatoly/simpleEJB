
unit ShowRQActCounterExpertise;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  RQActCounterExpertiseController, AdvObj, RQFKOrderController ;


type
    TfrmRQActCounterExpertiseShow = class(TChildForm)
    HTTPRIORQActCounterExpertise: THTTPRIO;
    ImageList1: TImageList;
    sgRQActCounterExpertise: TAdvStringGrid;
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
    N5: TMenuItem;
    mniMoveToFK: TMenuItem;
    HTTPRIORQFKOrder: THTTPRIO;
    actMoveToFKRQFKOrder: TAction;
    actUndoMoveToFKRQFKOrder: TAction;
    mniUndoMoveToFK: TMenuItem;

    constructor Create(AOwner: TComponent;
                       FormMode: TFormMode;
                       isIncome : Boolean;
                       AFilter: TObject = nil); reintroduce; overload;


    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgRQActCounterExpertiseTopLeftChanged(Sender: TObject);
    procedure sgRQActCounterExpertiseDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actMoveToFKRQFKOrderExecute(Sender: TObject);
    procedure moveFKOrderOrUndoMove(Sender: TObject; isMove : Boolean);
    procedure actUndoMoveToFKRQFKOrderExecute(Sender: TObject);

  private
   { Private declarations }
   selectedRow : Integer;
   selectedFKOrder : RQFKOrder;
 public
   { Public declarations }
   isIncome : Boolean;
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // RQActCounterExpertiseObj: RQActCounterExpertise;
 // RQActCounterExpertiseFilterObj: RQActCounterExpertiseFilter;
  
  
implementation

uses Main, EditRQActCounterExpertise, EditRQActCounterExpertiseFilter, ENConsts
, ShowRQFKOrder;


{$R *.dfm}

const PURPOSE_COLUMN_TITLE = 'Мета приймання';

var
  //frmRQActCounterExpertiseShow : TfrmRQActCounterExpertiseShow;


  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQActCounterExpertiseHeaders: array [1..12] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'Особовий рахунок'
          ,'Особовий рахунок найменування'
          , 'Стан ордеру'
          , 'Підрозділ'
          , 'Тип лічильника'
          , 'Серійний номер'
          , 'МВО для прибуткування'
          , 'Тип споживача'
          , PURPOSE_COLUMN_TITLE
        );
   
constructor TfrmRQActCounterExpertiseShow.Create(AOwner: TComponent; FormMode: TFormMode;
                              isIncome: Boolean; AFilter: TObject = nil);
begin
    Self.isIncome := isIncome;
    inherited Create(AOwner, fmChild);
    if Self.isIncome then begin
              Self.Caption := 'Прибуткування лічильника від абонента';
    end else begin
              Self.Caption := 'Повернення лічильника абоненту';
    end;
    Self.UpdateCaption;
end;
procedure TfrmRQActCounterExpertiseShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then begin
    if isIncome then begin
          frmRQActCounterExpertiseIncomeShow:=nil;
    end else begin
          frmRQActCounterExpertiseOutcomeShow:=nil;
    end;
  end;
  inherited;
end;


procedure TfrmRQActCounterExpertiseShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedFKOrder := nil;
  selectedRow := 1;
end;


procedure TfrmRQActCounterExpertiseShow.FormShow(Sender: TObject);
var
  TempRQActCounterExpertise: RQActCounterExpertiseControllerSoapPort;
  i: Integer;
  RQActCounterExpertiseList: RQActCounterExpertiseShortList;
begin
  SetGridHeaders(RQActCounterExpertiseHeaders, sgRQActCounterExpertise.ColumnHeaders);
  ColCount:=100;
  TempRQActCounterExpertise :=  HTTPRIORQActCounterExpertise as RQActCounterExpertiseControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQActCounterExpertiseFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;
  RQActCounterExpertiseFilter(FilterObject).orderBySQL := 'dategen desc';

  RQActCounterExpertiseList := TempRQActCounterExpertise.getScrollableFilteredList(RQActCounterExpertiseFilter(FilterObject),0,ColCount, Self.isIncome);
  LastCount:=High(RQActCounterExpertiseList.list);

  if not isIncome then begin
    sgRQActCounterExpertise.HideColumn(sgRQActCounterExpertise.ColumnHeaders.IndexOf(PURPOSE_COLUMN_TITLE));
  end;

  if LastCount > -1 then
     sgRQActCounterExpertise.RowCount:=LastCount+2
  else
     sgRQActCounterExpertise.RowCount:=2;

   with sgRQActCounterExpertise do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQActCounterExpertiseList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQActCounterExpertiseList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQActCounterExpertiseList.list[i].numberGen;
        if RQActCounterExpertiseList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(RQActCounterExpertiseList.list[i].dateGen);
        Cells[3,i+1] := RQActCounterExpertiseList.list[i].personalAccountNumber;
        Cells[4,i+1] := RQActCounterExpertiseList.list[i].personalAccountName;
        Cells[5,i+1] := RQActCounterExpertiseList.list[i].fkOrderStatusName;
        Cells[6, i+1] := RQActCounterExpertiseList.list[i].departmentShortName;
        Cells[7, i+1] := RQActCounterExpertiseList.list[i].counterCounterType;
        Cells[8, i+1] := RQActCounterExpertiseList.list[i].counterBuildNumber;
        Cells[9, i+1] := RQActCounterExpertiseList.list[i].fkOrderMolOutCode + ' ' + RQActCounterExpertiseList.list[i].fkOrderMolOutName;
        if (RQActCounterExpertiseList.list[i].isByt <> nil) and (RQActCounterExpertiseList.list[i].isByt.asBoolean) then begin
          Cells[10, i+1] := 'Побутовий';
        end else begin
          Cells[10, i+1] := 'Юридичний';
        end;
        Cells[11, i+1] :=  RQActCounterExpertiseList.list[i].purposeName;
        LastRow:=i+1;
        sgRQActCounterExpertise.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgRQActCounterExpertise.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgRQActCounterExpertise.RowCount > selectedRow then
      sgRQActCounterExpertise.Row := selectedRow
    else
      sgRQActCounterExpertise.Row := sgRQActCounterExpertise.RowCount - 1;
    end
    else
      sgRQActCounterExpertise.Row:=1;   
end;


procedure TfrmRQActCounterExpertiseShow.PopupMenu1Popup(Sender: TObject);
var
  fkOrder : RQFKOrder;
  act : RQActCounterExpertise;
  TempRQFKOrder : RQFKOrderControllerSoapPort;
  TempAct : RQActCounterExpertiseControllerSoapPort;
  ObjCode : Integer;
begin
  inherited;
   mniMoveToFK.Visible := false;
   mniUndoMoveToFK.Visible := false;
   selectedFKOrder := nil;
   TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
   TempAct := HTTPRIORQActCounterExpertise as RQActCounterExpertiseControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQActCounterExpertise.Cells[0,sgRQActCounterExpertise.Row]);
   except
     on EConvertError do Exit;
   end;
   act := TempAct.getObject(ObjCode);
   if  act = nil  then Exit;
   fkOrder := TempRQFKOrder.getObjectNoSegr(act.fkOrder.code);

   if  fkOrder = nil  then Exit;

   selectedFKOrder := fkOrder;

  mniMoveToFK.Visible := fkOrder.status.code in [RQFKORDER_STATUS_CREATED
    , RQFKORDER_STATUS_IN_WORK_ON_WAREHOUSE];
  mniUndoMoveToFK.Visible := fkOrder.status.code = RQFKORDER_STATUS_COUNTER_IN_FK;
end;

procedure TfrmRQActCounterExpertiseShow.sgRQActCounterExpertiseTopLeftChanged(Sender: TObject);
var
  TempRQActCounterExpertise: RQActCounterExpertiseControllerSoapPort;
  i,CurrentRow: Integer;
  RQActCounterExpertiseList: RQActCounterExpertiseShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQActCounterExpertise.TopRow + sgRQActCounterExpertise.VisibleRowCount) = ColCount
  then
    begin
      TempRQActCounterExpertise :=  HTTPRIORQActCounterExpertise as RQActCounterExpertiseControllerSoapPort;
      CurrentRow:=sgRQActCounterExpertise.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQActCounterExpertiseFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;
  RQActCounterExpertiseFilter(FilterObject).orderBySQL := 'dategen desc';

  RQActCounterExpertiseList := TempRQActCounterExpertise.getScrollableFilteredList(RQActCounterExpertiseFilter(FilterObject),ColCount-1, 100, Self.isIncome);


  sgRQActCounterExpertise.RowCount:=sgRQActCounterExpertise.RowCount+100;
  LastCount:=High(RQActCounterExpertiseList.list);
  with sgRQActCounterExpertise do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQActCounterExpertiseList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQActCounterExpertiseList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQActCounterExpertiseList.list[i].numberGen;
        if RQActCounterExpertiseList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(RQActCounterExpertiseList.list[i].dateGen);
         Cells[3,i+CurrentRow] := RQActCounterExpertiseList.list[i].personalAccountNumber;
        Cells[4,i+CurrentRow] := RQActCounterExpertiseList.list[i].personalAccountName;
        Cells[5,i+CurrentRow] := RQActCounterExpertiseList.list[i].fkOrderStatusName;
        Cells[6, i+CurrentRow] := RQActCounterExpertiseList.list[i].departmentShortName;
        Cells[7, i+CurrentRow] := RQActCounterExpertiseList.list[i].counterCounterType;
        Cells[8, i+CurrentRow] := RQActCounterExpertiseList.list[i].counterBuildNumber;
        Cells[9, i+CurrentRow] := RQActCounterExpertiseList.list[i].fkOrderMolOutCode + RQActCounterExpertiseList.list[i].fkOrderMolOutName;
        if (RQActCounterExpertiseList.list[i].isByt <> nil) and (RQActCounterExpertiseList.list[i].isByt.asBoolean) then begin
          Cells[10, i+CurrentRow] := 'Побутовий';
        end else begin
          Cells[10, i+CurrentRow] := 'Юридичний';
        end;
        Cells[11, i+CurrentRow] :=  RQActCounterExpertiseList.list[i].purposeName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQActCounterExpertise.Row:=CurrentRow-5;
   sgRQActCounterExpertise.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQActCounterExpertiseShow.sgRQActCounterExpertiseDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQActCounterExpertise,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmRQActCounterExpertiseShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgRQActCounterExpertise.RowCount-1 do
   for j:=0 to sgRQActCounterExpertise.ColCount-1 do
     sgRQActCounterExpertise.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmRQActCounterExpertiseShow.actViewExecute(Sender: TObject);
var 
  TempRQActCounterExpertise: RQActCounterExpertiseControllerSoapPort;
begin
  TempRQActCounterExpertise := HTTPRIORQActCounterExpertise as RQActCounterExpertiseControllerSoapPort;
  try
    RQActCounterExpertiseObj := TempRQActCounterExpertise.getObject(StrToInt(sgRQActCounterExpertise.Cells[0,sgRQActCounterExpertise.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgRQActCounterExpertise.Row;
  frmRQActCounterExpertiseEdit:=TfrmRQActCounterExpertiseEdit.Create(Application, dsView);
  frmRQActCounterExpertiseEdit.isIncome := Self.isIncome;
  try
    frmRQActCounterExpertiseEdit.ShowModal;
  finally
    frmRQActCounterExpertiseEdit.Free;
    frmRQActCounterExpertiseEdit:=nil;
  end;

  if sgRQActCounterExpertise.RowCount > selectedRow then
    sgRQActCounterExpertise.Row := selectedRow
  else
    sgRQActCounterExpertise.Row := sgRQActCounterExpertise.RowCount - 1;
  
end;


procedure TfrmRQActCounterExpertiseShow.actEditExecute(Sender: TObject);
var 
  TempRQActCounterExpertise: RQActCounterExpertiseControllerSoapPort;
begin
  TempRQActCounterExpertise := HTTPRIORQActCounterExpertise as RQActCounterExpertiseControllerSoapPort;
  try
    RQActCounterExpertiseObj := TempRQActCounterExpertise.getObject(StrToInt(sgRQActCounterExpertise.Cells[0,sgRQActCounterExpertise.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgRQActCounterExpertise.Row;
  frmRQActCounterExpertiseEdit:=TfrmRQActCounterExpertiseEdit.Create(Application, dsEdit);
  frmRQActCounterExpertiseEdit.isIncome := Self.isIncome;
  try
    if frmRQActCounterExpertiseEdit.ShowModal= mrOk then
      begin
        //TempRQActCounterExpertise.save(RQActCounterExpertiseObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQActCounterExpertiseEdit.Free;
    frmRQActCounterExpertiseEdit:=nil;
  end;

  if sgRQActCounterExpertise.RowCount > selectedRow then
    sgRQActCounterExpertise.Row := selectedRow
  else
    sgRQActCounterExpertise.Row := sgRQActCounterExpertise.RowCount - 1;
  
end;


procedure TfrmRQActCounterExpertiseShow.actDeleteExecute(Sender: TObject);
Var TempRQActCounterExpertise: RQActCounterExpertiseControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQActCounterExpertise := HTTPRIORQActCounterExpertise as RQActCounterExpertiseControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQActCounterExpertise.Cells[0,sgRQActCounterExpertise.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Акт приймання - передачі лічильників на експертизу) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQActCounterExpertise.remove(ObjCode, Self.isIncome);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQActCounterExpertiseShow.actInsertExecute(Sender: TObject);
// Var TempRQActCounterExpertise: RQActCounterExpertiseControllerSoapPort; 
begin
  // TempRQActCounterExpertise := HTTPRIORQActCounterExpertise as RQActCounterExpertiseControllerSoapPort;  /// Это здесь уже лишнее!!!
  RQActCounterExpertiseObj:=RQActCounterExpertise.Create;
  SetNullIntProps(RQActCounterExpertiseObj);
  SetNullXSProps(RQActCounterExpertiseObj);

   //RQActCounterExpertiseObj.dateGen:= TXSDate.Create;


  try
    frmRQActCounterExpertiseEdit:=TfrmRQActCounterExpertiseEdit.Create(Application, dsInsert);
    frmRQActCounterExpertiseEdit.isIncome := Self.isIncome;
    try
      if frmRQActCounterExpertiseEdit.ShowModal = mrOk then
      begin
        if RQActCounterExpertiseObj<>nil then
            //TempRQActCounterExpertise.add(RQActCounterExpertiseObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQActCounterExpertiseEdit.Free;
      frmRQActCounterExpertiseEdit:=nil;
    end;
  finally
    RQActCounterExpertiseObj.Free;
  end;
end;


procedure TfrmRQActCounterExpertiseShow.actMoveToFKRQFKOrderExecute(
  Sender: TObject);
begin
    moveFKOrderOrUndoMove(Sender, true);
end;

procedure TfrmRQActCounterExpertiseShow.moveFKOrderOrUndoMove(
  Sender: TObject; isMove : Boolean);
  begin
  inherited;
  if not Assigned(selectedFKOrder) then begin
    Application.MessageBox(PChar('Не заданий ордер'), PChar('Увага'), MB_ICONINFORMATION);
  end;

  if isMove then begin
    TfrmRQFKOrderShow.moveToFK(selectedFKOrder.code, HTTPRIORQFKOrder, procedure() begin
      actUpdateExecute(Sender);
    end);
  end else begin
      TfrmRQFKOrderShow.unMoveToFK(selectedFKOrder.code, HTTPRIORQFKOrder, procedure() begin
        actUpdateExecute(Sender);
      end);
  end;


end;

procedure TfrmRQActCounterExpertiseShow.actUndoMoveToFKRQFKOrderExecute(
  Sender: TObject);
begin
  inherited;
  moveFKOrderOrUndoMove(Sender, false);
end;

procedure TfrmRQActCounterExpertiseShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmRQActCounterExpertiseShow.actFilterExecute(Sender: TObject);
begin
frmRQActCounterExpertiseFilterEdit:=TfrmRQActCounterExpertiseFilterEdit.Create(Application, dsInsert);
  try
    RQActCounterExpertiseFilterObj := RQActCounterExpertiseFilter.Create;
    SetNullIntProps(RQActCounterExpertiseFilterObj);
    SetNullXSProps(RQActCounterExpertiseFilterObj);
    frmRQActCounterExpertiseFilterEdit.isIncome := Self.isIncome;
    if frmRQActCounterExpertiseFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      FilterObject := RQActCounterExpertiseFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQActCounterExpertiseFilterEdit.Free;
    frmRQActCounterExpertiseFilterEdit:=nil;
  end;
end;


procedure TfrmRQActCounterExpertiseShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.