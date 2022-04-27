
unit ShowENWarrant4Department;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENWarrant4DepartmentController, AdvObj;


type
    TfrmENWarrant4DepartmentShow = class(TChildForm)  
    HTTPRIOENWarrant4Department: THTTPRIO;
    ImageList1: TImageList;
    sgENWarrant4Department: TAdvStringGrid;
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

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENWarrant4DepartmentTopLeftChanged(Sender: TObject);
    procedure sgENWarrant4DepartmentDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENWarrant4DepartmentShort; overload; stdcall; static;
 end;


var
  frmENWarrant4DepartmentShow: TfrmENWarrant4DepartmentShow;
  
  
implementation

uses Main, EditENWarrant4Department, EditENWarrant4DepartmentFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENWarrant4DepartmentHeaders: array [1..8] of String =
        ( 'Код'
          , 'Назва підрозділу'
          , 'Номер довіреності'
          , 'П.І.Б. довіреної особи'
          , 'Посада довіреної особи'
          , 'Вид договору'
          , 'Користувач, який вніс зміни'
          , 'Дата зміни'
        );


class function TfrmENWarrant4DepartmentShow.chooseFromList : ENWarrant4DepartmentShort;
var
  f1 : ENWarrant4DepartmentFilter;
  frmENWarrant4DepartmentShow : TfrmENWarrant4DepartmentShow;
  selected : ENWarrant4DepartmentShort;
begin
  inherited;
     selected := nil;
     f1 := ENWarrant4DepartmentFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENWarrant4DepartmentShow := TfrmENWarrant4DepartmentShow.Create(Application, fmNormal, f1);
       try
          with frmENWarrant4DepartmentShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENWarrant4DepartmentShort(sgENWarrant4Department.Objects[0, sgENWarrant4Department.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENWarrant4DepartmentShow.Free;
       end;
end;


procedure TfrmENWarrant4DepartmentShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENWarrant4DepartmentShow:=nil;
  inherited;
end;


procedure TfrmENWarrant4DepartmentShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENWarrant4DepartmentShow.FormShow(Sender: TObject);
var
  TempENWarrant4Department: ENWarrant4DepartmentControllerSoapPort;
  i: Integer;
  ENWarrant4DepartmentList: ENWarrant4DepartmentShortList;
begin
  SetGridHeaders(ENWarrant4DepartmentHeaders, sgENWarrant4Department.ColumnHeaders);
  ColCount:=100;
  TempENWarrant4Department :=  HTTPRIOENWarrant4Department as ENWarrant4DepartmentControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENWarrant4DepartmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENWarrant4DepartmentList := TempENWarrant4Department.getScrollableFilteredList(ENWarrant4DepartmentFilter(FilterObject),0,ColCount);
  LastCount:=High(ENWarrant4DepartmentList.list);

  if LastCount > -1 then
     sgENWarrant4Department.RowCount:=LastCount+2
  else
     sgENWarrant4Department.RowCount:=2;

   with sgENWarrant4Department do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWarrant4DepartmentList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENWarrant4DepartmentList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENWarrant4DepartmentList.list[i].departmentRefShortName;
        Cells[2,i+1] := ENWarrant4DepartmentList.list[i].warrantRefNumbergen;
        Cells[3,i+1] := ENWarrant4DepartmentList.list[i].warrantRefWarrantFIO;
        Cells[4,i+1] := ENWarrant4DepartmentList.list[i].warrantRefWarrantPosition;
        Cells[5,i+1] := ENWarrant4DepartmentList.list[i].agreementKindRefName;
        Cells[6,i+1] := ENWarrant4DepartmentList.list[i].userGen;

        if ENWarrant4DepartmentList.list[i].dateEdit = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := XSDateTimeWithDate2String(ENWarrant4DepartmentList.list[i].dateEdit);


        LastRow:=i+1;
        sgENWarrant4Department.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENWarrant4Department.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENWarrant4Department.RowCount > selectedRow then
      sgENWarrant4Department.Row := selectedRow
    else
      sgENWarrant4Department.Row := sgENWarrant4Department.RowCount - 1;
    end
    else
      sgENWarrant4Department.Row:=1;   
end;


procedure TfrmENWarrant4DepartmentShow.sgENWarrant4DepartmentTopLeftChanged(Sender: TObject);
var
  TempENWarrant4Department: ENWarrant4DepartmentControllerSoapPort;
  i,CurrentRow: Integer;
  ENWarrant4DepartmentList: ENWarrant4DepartmentShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENWarrant4Department.TopRow + sgENWarrant4Department.VisibleRowCount) = ColCount
  then
  begin
    TempENWarrant4Department :=  HTTPRIOENWarrant4Department as ENWarrant4DepartmentControllerSoapPort;
    CurrentRow:=sgENWarrant4Department.RowCount;

    if FilterObject = nil then
    begin
       FilterObject := ENWarrant4DepartmentFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end;

    ENWarrant4DepartmentList := TempENWarrant4Department.getScrollableFilteredList(ENWarrant4DepartmentFilter(FilterObject),ColCount-1, 100);

    sgENWarrant4Department.RowCount:=sgENWarrant4Department.RowCount+100;
    LastCount:=High(ENWarrant4DepartmentList.list);
    with sgENWarrant4Department do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENWarrant4DepartmentList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENWarrant4DepartmentList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENWarrant4DepartmentList.list[i].departmentRefShortName;
        Cells[2,i+CurrentRow] := ENWarrant4DepartmentList.list[i].warrantRefNumbergen;
        Cells[3,i+CurrentRow] := ENWarrant4DepartmentList.list[i].warrantRefWarrantFIO;
        Cells[4,i+CurrentRow] := ENWarrant4DepartmentList.list[i].warrantRefWarrantPosition;
        Cells[5,i+CurrentRow] := ENWarrant4DepartmentList.list[i].agreementKindRefName;
        Cells[6,i+CurrentRow] := ENWarrant4DepartmentList.list[i].userGen;

        if ENWarrant4DepartmentList.list[i].dateEdit = nil then
          Cells[7,i+CurrentRow] := ''
        else
          Cells[7,i+CurrentRow] := XSDateTimeWithDate2String(ENWarrant4DepartmentList.list[i].dateEdit);

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENWarrant4Department.Row:=CurrentRow-5;
   sgENWarrant4Department.RowCount:=LastRow+1;
  end;
end;


procedure TfrmENWarrant4DepartmentShow.sgENWarrant4DepartmentDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENWarrant4Department,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENWarrant4DepartmentShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENWarrant4Department.RowCount-1 do
   for j:=0 to sgENWarrant4Department.ColCount-1 do
     sgENWarrant4Department.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENWarrant4DepartmentShow.actViewExecute(Sender: TObject);
var 
  TempENWarrant4Department: ENWarrant4DepartmentControllerSoapPort;
begin
  TempENWarrant4Department := HTTPRIOENWarrant4Department as ENWarrant4DepartmentControllerSoapPort;
  try
    ENWarrant4DepartmentObj := TempENWarrant4Department.getObject(StrToInt(sgENWarrant4Department.Cells[0,sgENWarrant4Department.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENWarrant4Department.Row;
  frmENWarrant4DepartmentEdit:=TfrmENWarrant4DepartmentEdit.Create(Application, dsView);
  
  try
    frmENWarrant4DepartmentEdit.ShowModal;
  finally
    frmENWarrant4DepartmentEdit.Free;
    frmENWarrant4DepartmentEdit:=nil;
  end;

  if sgENWarrant4Department.RowCount > selectedRow then
    sgENWarrant4Department.Row := selectedRow
  else
    sgENWarrant4Department.Row := sgENWarrant4Department.RowCount - 1;
  
end;


procedure TfrmENWarrant4DepartmentShow.actEditExecute(Sender: TObject);
var 
  TempENWarrant4Department: ENWarrant4DepartmentControllerSoapPort;
begin
  TempENWarrant4Department := HTTPRIOENWarrant4Department as ENWarrant4DepartmentControllerSoapPort;
  try
    ENWarrant4DepartmentObj := TempENWarrant4Department.getObject(StrToInt(sgENWarrant4Department.Cells[0,sgENWarrant4Department.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENWarrant4Department.Row;
  frmENWarrant4DepartmentEdit:=TfrmENWarrant4DepartmentEdit.Create(Application, dsEdit);
  
  try
    if frmENWarrant4DepartmentEdit.ShowModal= mrOk then
      begin
        //TempENWarrant4Department.save(ENWarrant4DepartmentObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENWarrant4DepartmentEdit.Free;
    frmENWarrant4DepartmentEdit:=nil;
  end;

  if sgENWarrant4Department.RowCount > selectedRow then
    sgENWarrant4Department.Row := selectedRow
  else
    sgENWarrant4Department.Row := sgENWarrant4Department.RowCount - 1;
  
end;


procedure TfrmENWarrant4DepartmentShow.actDeleteExecute(Sender: TObject);
Var TempENWarrant4Department: ENWarrant4DepartmentControllerSoapPort;
  ObjCode: Integer;
begin
 TempENWarrant4Department := HTTPRIOENWarrant4Department as ENWarrant4DepartmentControllerSoapPort;
   try
     ObjCode := StrToInt(sgENWarrant4Department.Cells[0,sgENWarrant4Department.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Довіреності в підрозділі)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENWarrant4Department.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENWarrant4DepartmentShow.actInsertExecute(Sender: TObject);
// Var TempENWarrant4Department: ENWarrant4DepartmentControllerSoapPort; 
begin
  // TempENWarrant4Department := HTTPRIOENWarrant4Department as ENWarrant4DepartmentControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENWarrant4DepartmentObj:=ENWarrant4Department.Create;
  SetNullIntProps(ENWarrant4DepartmentObj);
  SetNullXSProps(ENWarrant4DepartmentObj);



  try
    frmENWarrant4DepartmentEdit:=TfrmENWarrant4DepartmentEdit.Create(Application, dsInsert);
    try
      if frmENWarrant4DepartmentEdit.ShowModal = mrOk then
      begin
        if ENWarrant4DepartmentObj<>nil then
            //TempENWarrant4Department.add(ENWarrant4DepartmentObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENWarrant4DepartmentEdit.Free;
      frmENWarrant4DepartmentEdit:=nil;
    end;
  finally
    ENWarrant4DepartmentObj.Free;
  end;
end;


procedure TfrmENWarrant4DepartmentShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENWarrant4DepartmentShow.actFilterExecute(Sender: TObject);
begin
{frmENWarrant4DepartmentFilterEdit:=TfrmENWarrant4DepartmentFilterEdit.Create(Application, dsInsert);
  try
    ENWarrant4DepartmentFilterObj := ENWarrant4DepartmentFilter.Create;
    SetNullIntProps(ENWarrant4DepartmentFilterObj);
    SetNullXSProps(ENWarrant4DepartmentFilterObj);

    if frmENWarrant4DepartmentFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENWarrant4DepartmentFilter.Create;
      FilterObject := ENWarrant4DepartmentFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENWarrant4DepartmentFilterEdit.Free;
    frmENWarrant4DepartmentFilterEdit:=nil;
  end;}
end;


procedure TfrmENWarrant4DepartmentShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.