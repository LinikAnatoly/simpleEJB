
unit ShowENLowVoltBoard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENLowVoltBoardController, AdvObj ;


type
  TfrmENLowVoltBoardShow = class(TChildForm)  
  HTTPRIOENLowVoltBoard: THTTPRIO;
    ImageList1: TImageList;
    sgENLowVoltBoard: TAdvStringGrid;
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
procedure sgENLowVoltBoardTopLeftChanged(Sender: TObject);
procedure sgENLowVoltBoardDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
  frmENLowVoltBoardShow : TfrmENLowVoltBoardShow;
  lvbCode: Integer;
 // ENLowVoltBoardObj: ENLowVoltBoard;
 // ENLowVoltBoardFilterObj: ENLowVoltBoardFilter;


implementation

uses Main, EditENLowVoltBoard, EditENLowVoltBoardFilter;


{$R *.dfm}

var
  //frmENLowVoltBoardShow : TfrmENLowVoltBoardShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENLowVoltBoardHeaders: array [1..4] of String =
        ( 'Код'
          ,'НВЩ'
          ,'Трансформатор'
          ,'Код трансформатора'
        );
   

procedure TfrmENLowVoltBoardShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENLowVoltBoardShow:=nil;
    inherited;
  end;


procedure TfrmENLowVoltBoardShow.FormShow(Sender: TObject);
var TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  i: Integer; ENLowVoltBoardList: ENLowVoltBoardShortList;
begin
  SetGridHeaders(ENLowVoltBoardHeaders, sgENLowVoltBoard.ColumnHeaders);
  ColCount := 100;
  TempENLowVoltBoard :=
    HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;

  if FilterObject = nil then
    begin
      FilterObject := ENLowVoltBoardFilter.Create;
      SetNullIntProps(FilterObject);
      SetNullXSProps(FilterObject);
    end;

  ENLowVoltBoardList := TempENLowVoltBoard.getScrollableFilteredList(
    ENLowVoltBoardFilter(FilterObject), 0, ColCount);


  LastCount := High(ENLowVoltBoardList.list);

  if LastCount > -1 then
    sgENLowVoltBoard.RowCount := LastCount + 2
  else
    sgENLowVoltBoard.RowCount := 2;

  with sgENLowVoltBoard do
    for i := 0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLowVoltBoardList.list[i].code <> Low(Integer) then
          Cells[0, i + 1] := IntToStr(ENLowVoltBoardList.list[i].code)
        else
          Cells[0, i + 1] := '';
        Cells[1, i + 1] := ENLowVoltBoardList.list[i].name;
        //Трансформатор
        Cells[2, i + 1] := ENLowVoltBoardList.list[i].transformerRefName;
        if ENLowVoltBoardList.list[i].transformerRefNominalPower <> nil then
          Cells[2, i + 1] := Cells[2, i + 1] + ', P = ' +
            ENLowVoltBoardList.list[i].transformerRefNominalPower.DecimalString
            + 'кВА';
        if ENLowVoltBoardList.list[i].transformerRefInvNumber <> '' then
          Cells[2, i + 1] := Cells[2, i + 1] + ', Інв. № ' +
            ENLowVoltBoardList.list[i].transformerRefInvNumber;
        //Код трансформатора
        if ENLowVoltBoardList.list[i].transformerRefCode <> low(Integer) then
          Cells[3, i + 1] := IntToStr(ENLowVoltBoardList.list[i].transformerRefCode)
        else
          Cells[3, i + 1] := '';
        LastRow := i + 1;
        sgENLowVoltBoard.RowCount := LastRow + 1;
      end;
  ColCount := ColCount + 1;
  sgENLowVoltBoard.Row := 1;
end;

procedure TfrmENLowVoltBoardShow.sgENLowVoltBoardTopLeftChanged(Sender: TObject);
var
  TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  i,CurrentRow: Integer;
  ENLowVoltBoardList: ENLowVoltBoardShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENLowVoltBoard.TopRow + sgENLowVoltBoard.VisibleRowCount) = ColCount
  then
    begin
      TempENLowVoltBoard :=  HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
      CurrentRow:=sgENLowVoltBoard.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENLowVoltBoardFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENLowVoltBoardList := TempENLowVoltBoard.getScrollableFilteredList(ENLowVoltBoardFilter(FilterObject),ColCount-1, 100);



  sgENLowVoltBoard.RowCount:=sgENLowVoltBoard.RowCount+100;
  LastCount:=High(ENLowVoltBoardList.list);
  with sgENLowVoltBoard do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENLowVoltBoardList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENLowVoltBoardList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENLowVoltBoardList.list[i].name;

        //Трансформатор
        Cells[2, i + CurrentRow] := ENLowVoltBoardList.list[i].transformerRefName;
        if ENLowVoltBoardList.list[i].transformerRefNominalPower <> nil then
          Cells[2, i + CurrentRow] := Cells[2, i + CurrentRow] + ', P = ' +
            ENLowVoltBoardList.list[i].transformerRefNominalPower.DecimalString
            + 'кВА';
        if ENLowVoltBoardList.list[i].transformerRefInvNumber <> '' then
          Cells[2, i + CurrentRow] := Cells[2, i + CurrentRow] + ', Інв. № ' +
            ENLowVoltBoardList.list[i].transformerRefInvNumber;
        //Код трансформатора
        if ENLowVoltBoardList.list[i].transformerRefCode <> low(Integer) then
          Cells[3, i + CurrentRow] :=
            IntToStr(ENLowVoltBoardList.list[i].transformerRefCode)
        else
          Cells[3, i + CurrentRow] := '';
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENLowVoltBoard.Row:=CurrentRow-5;
   sgENLowVoltBoard.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENLowVoltBoardShow.sgENLowVoltBoardDblClick(Sender: TObject);
begin
  if (FormMode = fmNormal) or (FormMode = fmFiltered) then
    begin
      try
        lvbCode:=StrToInt(GetReturnValue(sgENLowVoltBoard,0));
      except
        on EConvertError do Exit;
      end;
      ModalResult := mrOk;
    end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENLowVoltBoardShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENLowVoltBoard.RowCount-1 do
   for j:=0 to sgENLowVoltBoard.ColCount-1 do
     sgENLowVoltBoard.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENLowVoltBoardShow.actViewExecute(Sender: TObject);
Var TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
begin
 TempENLowVoltBoard := HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
   try
     ENLowVoltBoardObj := TempENLowVoltBoard.getObject(StrToInt(sgENLowVoltBoard.Cells[0,sgENLowVoltBoard.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLowVoltBoardEdit:=TfrmENLowVoltBoardEdit.Create(Application, dsView);
  try
    frmENLowVoltBoardEdit.ShowModal;
  finally
    frmENLowVoltBoardEdit.Free;
    frmENLowVoltBoardEdit:=nil;
  end;
end;

procedure TfrmENLowVoltBoardShow.actEditExecute(Sender: TObject);
Var TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
begin
 TempENLowVoltBoard := HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
   try
     ENLowVoltBoardObj := TempENLowVoltBoard.getObject(StrToInt(sgENLowVoltBoard.Cells[0,sgENLowVoltBoard.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENLowVoltBoardEdit:=TfrmENLowVoltBoardEdit.Create(Application, dsEdit);
  try
    if frmENLowVoltBoardEdit.ShowModal= mrOk then
      begin
        //TempENLowVoltBoard.save(ENLowVoltBoardObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENLowVoltBoardEdit.Free;
    frmENLowVoltBoardEdit:=nil;
  end;
end;

procedure TfrmENLowVoltBoardShow.actDeleteExecute(Sender: TObject);
Var TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort;
  ObjCode: Integer;
begin
 TempENLowVoltBoard := HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;
   try
     ObjCode := StrToInt(sgENLowVoltBoard.Cells[0,sgENLowVoltBoard.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Низковольтный щит) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENLowVoltBoard.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENLowVoltBoardShow.actInsertExecute(Sender: TObject);
// Var TempENLowVoltBoard: ENLowVoltBoardControllerSoapPort; 
begin
  // TempENLowVoltBoard := HTTPRIOENLowVoltBoard as ENLowVoltBoardControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENLowVoltBoardObj:=ENLowVoltBoard.Create;



  try
    frmENLowVoltBoardEdit:=TfrmENLowVoltBoardEdit.Create(Application, dsInsert);
    try
      if frmENLowVoltBoardEdit.ShowModal = mrOk then
      begin
        if ENLowVoltBoardObj<>nil then
            //TempENLowVoltBoard.add(ENLowVoltBoardObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENLowVoltBoardEdit.Free;
      frmENLowVoltBoardEdit:=nil;
    end;
  finally
    ENLowVoltBoardObj.Free;
  end;
end;

procedure TfrmENLowVoltBoardShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENLowVoltBoardShow.actFilterExecute(Sender: TObject);
begin
{frmENLowVoltBoardFilterEdit:=TfrmENLowVoltBoardFilterEdit.Create(Application, dsInsert);
  try
    ENLowVoltBoardFilterObj := ENLowVoltBoardFilter.Create;
    SetNullIntProps(ENLowVoltBoardFilterObj);
    SetNullXSProps(ENLowVoltBoardFilterObj);

    if frmENLowVoltBoardFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENLowVoltBoardFilter.Create;
      FilterObject := ENLowVoltBoardFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENLowVoltBoardFilterEdit.Free;
    frmENLowVoltBoardFilterEdit:=nil;
  end;}
end;

procedure TfrmENLowVoltBoardShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.