
unit ShowENPlanProjectCalculation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENPlanProjectCalculationController, AdvObj ;


type
    TfrmENPlanProjectCalculationShow = class(TChildForm)  
    HTTPRIOENPlanProjectCalculation: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanProjectCalculation: TAdvStringGrid;
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
    procedure sgENPlanProjectCalculationTopLeftChanged(Sender: TObject);
    procedure sgENPlanProjectCalculationDblClick(Sender: TObject);
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
   selectedRow : Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

var
 frmENPlanProjectCalculationShow : TfrmENPlanProjectCalculationShow;
 // ENPlanProjectCalculationObj: ENPlanProjectCalculation;
 // ENPlanProjectCalculationFilterObj: ENPlanProjectCalculationFilter;
  
  
implementation

uses Main, EditENPlanProjectCalculation, EditENPlanProjectCalculationFilter;


{$R *.dfm}

var
  //frmENPlanProjectCalculationShow : TfrmENPlanProjectCalculationShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanProjectCalculationHeaders: array [1..2] of String =
        ( 'Код' , 'Розрахунок'
        );
   

procedure TfrmENPlanProjectCalculationShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENPlanProjectCalculationShow:=nil;
  inherited;
end;


procedure TfrmENPlanProjectCalculationShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENPlanProjectCalculationShow.FormShow(Sender: TObject);
var
  TempENPlanProjectCalculation: ENPlanProjectCalculationControllerSoapPort;
  i: Integer;
  ENPlanProjectCalculationList: ENPlanProjectCalculationShortList;
begin
  SetGridHeaders(ENPlanProjectCalculationHeaders, sgENPlanProjectCalculation.ColumnHeaders);
  ColCount:=100;
  TempENPlanProjectCalculation :=  HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanProjectCalculationFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanProjectCalculationList := TempENPlanProjectCalculation.getScrollableFilteredList(ENPlanProjectCalculationFilter(FilterObject),0,ColCount);
  LastCount:=High(ENPlanProjectCalculationList.list);

  if LastCount > -1 then
     sgENPlanProjectCalculation.RowCount:=LastCount+2
  else
     sgENPlanProjectCalculation.RowCount:=2;

   with sgENPlanProjectCalculation do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanProjectCalculationList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanProjectCalculationList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPlanProjectCalculationList.list[i].tkProjWorkCalculationName;
        LastRow:=i+1;
        sgENPlanProjectCalculation.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENPlanProjectCalculation.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENPlanProjectCalculation.RowCount > selectedRow then
      sgENPlanProjectCalculation.Row := selectedRow
    else
      sgENPlanProjectCalculation.Row := sgENPlanProjectCalculation.RowCount - 1;
    end
    else
      sgENPlanProjectCalculation.Row:=1;   
end;


procedure TfrmENPlanProjectCalculationShow.sgENPlanProjectCalculationTopLeftChanged(Sender: TObject);
var
  TempENPlanProjectCalculation: ENPlanProjectCalculationControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanProjectCalculationList: ENPlanProjectCalculationShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanProjectCalculation.TopRow + sgENPlanProjectCalculation.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanProjectCalculation :=  HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;
      CurrentRow:=sgENPlanProjectCalculation.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanProjectCalculationFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanProjectCalculationList := TempENPlanProjectCalculation.getScrollableFilteredList(ENPlanProjectCalculationFilter(FilterObject),ColCount-1, 100);


  sgENPlanProjectCalculation.RowCount:=sgENPlanProjectCalculation.RowCount+100;
  LastCount:=High(ENPlanProjectCalculationList.list);
  with sgENPlanProjectCalculation do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanProjectCalculationList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanProjectCalculationList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPlanProjectCalculationList.list[i].tkProjWorkCalculationName;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanProjectCalculation.Row:=CurrentRow-5;
   sgENPlanProjectCalculation.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanProjectCalculationShow.sgENPlanProjectCalculationDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanProjectCalculation,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENPlanProjectCalculationShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENPlanProjectCalculation.RowCount-1 do
   for j:=0 to sgENPlanProjectCalculation.ColCount-1 do
     sgENPlanProjectCalculation.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENPlanProjectCalculationShow.actViewExecute(Sender: TObject);
var 
  TempENPlanProjectCalculation: ENPlanProjectCalculationControllerSoapPort;
begin
  TempENPlanProjectCalculation := HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;
  try
    ENPlanProjectCalculationObj := TempENPlanProjectCalculation.getObject(StrToInt(sgENPlanProjectCalculation.Cells[0,sgENPlanProjectCalculation.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPlanProjectCalculation.Row;
  frmENPlanProjectCalculationEdit:=TfrmENPlanProjectCalculationEdit.Create(Application, dsView);
  
  try
    frmENPlanProjectCalculationEdit.ShowModal;
  finally
    frmENPlanProjectCalculationEdit.Free;
    frmENPlanProjectCalculationEdit:=nil;
  end;

  if sgENPlanProjectCalculation.RowCount > selectedRow then
    sgENPlanProjectCalculation.Row := selectedRow
  else
    sgENPlanProjectCalculation.Row := sgENPlanProjectCalculation.RowCount - 1;
  
end;


procedure TfrmENPlanProjectCalculationShow.actEditExecute(Sender: TObject);
var 
  TempENPlanProjectCalculation: ENPlanProjectCalculationControllerSoapPort;
begin
  TempENPlanProjectCalculation := HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;
  try
    ENPlanProjectCalculationObj := TempENPlanProjectCalculation.getObject(StrToInt(sgENPlanProjectCalculation.Cells[0,sgENPlanProjectCalculation.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENPlanProjectCalculation.Row;
  frmENPlanProjectCalculationEdit:=TfrmENPlanProjectCalculationEdit.Create(Application, dsEdit);
  
  try
    if frmENPlanProjectCalculationEdit.ShowModal= mrOk then
      begin
        //TempENPlanProjectCalculation.save(ENPlanProjectCalculationObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanProjectCalculationEdit.Free;
    frmENPlanProjectCalculationEdit:=nil;
  end;

  if sgENPlanProjectCalculation.RowCount > selectedRow then
    sgENPlanProjectCalculation.Row := selectedRow
  else
    sgENPlanProjectCalculation.Row := sgENPlanProjectCalculation.RowCount - 1;
  
end;


procedure TfrmENPlanProjectCalculationShow.actDeleteExecute(Sender: TObject);
Var TempENPlanProjectCalculation: ENPlanProjectCalculationControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanProjectCalculation := HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanProjectCalculation.Cells[0,sgENPlanProjectCalculation.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Розрахунки в проекті) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanProjectCalculation.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanProjectCalculationShow.actInsertExecute(Sender: TObject);
// Var TempENPlanProjectCalculation: ENPlanProjectCalculationControllerSoapPort; 
begin
  // TempENPlanProjectCalculation := HTTPRIOENPlanProjectCalculation as ENPlanProjectCalculationControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPlanProjectCalculationObj:=ENPlanProjectCalculation.Create;
  SetNullIntProps(ENPlanProjectCalculationObj);
  SetNullXSProps(ENPlanProjectCalculationObj);



  try
    frmENPlanProjectCalculationEdit:=TfrmENPlanProjectCalculationEdit.Create(Application, dsInsert);
    try
      if frmENPlanProjectCalculationEdit.ShowModal = mrOk then
      begin
        if ENPlanProjectCalculationObj<>nil then
            //TempENPlanProjectCalculation.add(ENPlanProjectCalculationObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanProjectCalculationEdit.Free;
      frmENPlanProjectCalculationEdit:=nil;
    end;
  finally
    ENPlanProjectCalculationObj.Free;
  end;
end;


procedure TfrmENPlanProjectCalculationShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENPlanProjectCalculationShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanProjectCalculationFilterEdit:=TfrmENPlanProjectCalculationFilterEdit.Create(Application, dsInsert);
  try
    ENPlanProjectCalculationFilterObj := ENPlanProjectCalculationFilter.Create;
    SetNullIntProps(ENPlanProjectCalculationFilterObj);
    SetNullXSProps(ENPlanProjectCalculationFilterObj);

    if frmENPlanProjectCalculationFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENPlanProjectCalculationFilter.Create;
      FilterObject := ENPlanProjectCalculationFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanProjectCalculationFilterEdit.Free;
    frmENPlanProjectCalculationFilterEdit:=nil;
  end;}
end;


procedure TfrmENPlanProjectCalculationShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.