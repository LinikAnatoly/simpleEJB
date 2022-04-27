
unit ShowENPlanWork2ActFailure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPlanWork2ActFailureController ;


type
  TfrmENPlanWork2ActFailureShow = class(TChildForm)  
  HTTPRIOENPlanWork2ActFailure: THTTPRIO;
    ImageList1: TImageList;
    sgENPlanWork2ActFailure: TAdvStringGrid;
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
procedure sgENPlanWork2ActFailureTopLeftChanged(Sender: TObject);
procedure sgENPlanWork2ActFailureDblClick(Sender: TObject);
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

//var
 // ENPlanWork2ActFailureObj: ENPlanWork2ActFailure;
 // ENPlanWork2ActFailureFilterObj: ENPlanWork2ActFailureFilter;
  
  
implementation

uses Main, EditENPlanWork2ActFailure, EditENPlanWork2ActFailureFilter;


{$R *.dfm}

var
  //frmENPlanWork2ActFailureShow : TfrmENPlanWork2ActFailureShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPlanWork2ActFailureHeaders: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENPlanWork2ActFailureShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPlanWork2ActFailureShow:=nil;
    inherited;
  end;


procedure TfrmENPlanWork2ActFailureShow.FormShow(Sender: TObject);
var
  TempENPlanWork2ActFailure: ENPlanWork2ActFailureControllerSoapPort;
  i: Integer;
  ENPlanWork2ActFailureList: ENPlanWork2ActFailureShortList;
  begin
  SetGridHeaders(ENPlanWork2ActFailureHeaders, sgENPlanWork2ActFailure.ColumnHeaders);
  ColCount:=100;
  TempENPlanWork2ActFailure :=  HTTPRIOENPlanWork2ActFailure as ENPlanWork2ActFailureControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWork2ActFailureFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWork2ActFailureList := TempENPlanWork2ActFailure.getScrollableFilteredList(ENPlanWork2ActFailureFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPlanWork2ActFailureList.list);

  if LastCount > -1 then
     sgENPlanWork2ActFailure.RowCount:=LastCount+2
  else
     sgENPlanWork2ActFailure.RowCount:=2;

   with sgENPlanWork2ActFailure do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWork2ActFailureList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPlanWork2ActFailureList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENPlanWork2ActFailure.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPlanWork2ActFailure.Row:=1;
end;

procedure TfrmENPlanWork2ActFailureShow.sgENPlanWork2ActFailureTopLeftChanged(Sender: TObject);
var
  TempENPlanWork2ActFailure: ENPlanWork2ActFailureControllerSoapPort;
  i,CurrentRow: Integer;
  ENPlanWork2ActFailureList: ENPlanWork2ActFailureShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPlanWork2ActFailure.TopRow + sgENPlanWork2ActFailure.VisibleRowCount) = ColCount
  then
    begin
      TempENPlanWork2ActFailure :=  HTTPRIOENPlanWork2ActFailure as ENPlanWork2ActFailureControllerSoapPort;
      CurrentRow:=sgENPlanWork2ActFailure.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPlanWork2ActFailureFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPlanWork2ActFailureList := TempENPlanWork2ActFailure.getScrollableFilteredList(ENPlanWork2ActFailureFilter(FilterObject),ColCount-1, 100);



  sgENPlanWork2ActFailure.RowCount:=sgENPlanWork2ActFailure.RowCount+100;
  LastCount:=High(ENPlanWork2ActFailureList.list);
  with sgENPlanWork2ActFailure do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPlanWork2ActFailureList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPlanWork2ActFailureList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPlanWork2ActFailure.Row:=CurrentRow-5;
   sgENPlanWork2ActFailure.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPlanWork2ActFailureShow.sgENPlanWork2ActFailureDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPlanWork2ActFailure,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPlanWork2ActFailureShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPlanWork2ActFailure.RowCount-1 do
   for j:=0 to sgENPlanWork2ActFailure.ColCount-1 do
     sgENPlanWork2ActFailure.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPlanWork2ActFailureShow.actViewExecute(Sender: TObject);
Var TempENPlanWork2ActFailure: ENPlanWork2ActFailureControllerSoapPort;
begin
 TempENPlanWork2ActFailure := HTTPRIOENPlanWork2ActFailure as ENPlanWork2ActFailureControllerSoapPort;
   try
     ENPlanWork2ActFailureObj := TempENPlanWork2ActFailure.getObject(StrToInt(sgENPlanWork2ActFailure.Cells[0,sgENPlanWork2ActFailure.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWork2ActFailureEdit:=TfrmENPlanWork2ActFailureEdit.Create(Application, dsView);
  try
    frmENPlanWork2ActFailureEdit.ShowModal;
  finally
    frmENPlanWork2ActFailureEdit.Free;
    frmENPlanWork2ActFailureEdit:=nil;
  end;
end;

procedure TfrmENPlanWork2ActFailureShow.actEditExecute(Sender: TObject);
Var TempENPlanWork2ActFailure: ENPlanWork2ActFailureControllerSoapPort;
begin
 TempENPlanWork2ActFailure := HTTPRIOENPlanWork2ActFailure as ENPlanWork2ActFailureControllerSoapPort;
   try
     ENPlanWork2ActFailureObj := TempENPlanWork2ActFailure.getObject(StrToInt(sgENPlanWork2ActFailure.Cells[0,sgENPlanWork2ActFailure.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPlanWork2ActFailureEdit:=TfrmENPlanWork2ActFailureEdit.Create(Application, dsEdit);
  try
    if frmENPlanWork2ActFailureEdit.ShowModal= mrOk then
      begin
        //TempENPlanWork2ActFailure.save(ENPlanWork2ActFailureObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPlanWork2ActFailureEdit.Free;
    frmENPlanWork2ActFailureEdit:=nil;
  end;
end;

procedure TfrmENPlanWork2ActFailureShow.actDeleteExecute(Sender: TObject);
Var TempENPlanWork2ActFailure: ENPlanWork2ActFailureControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPlanWork2ActFailure := HTTPRIOENPlanWork2ActFailure as ENPlanWork2ActFailureControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPlanWork2ActFailure.Cells[0,sgENPlanWork2ActFailure.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Зв`язок планов з актами невиконання) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPlanWork2ActFailure.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPlanWork2ActFailureShow.actInsertExecute(Sender: TObject);
// Var TempENPlanWork2ActFailure: ENPlanWork2ActFailureControllerSoapPort; 
begin
  // TempENPlanWork2ActFailure := HTTPRIOENPlanWork2ActFailure as ENPlanWork2ActFailureControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENPlanWork2ActFailureObj:=ENPlanWork2ActFailure.Create;



  try
    frmENPlanWork2ActFailureEdit:=TfrmENPlanWork2ActFailureEdit.Create(Application, dsInsert);
    try
      if frmENPlanWork2ActFailureEdit.ShowModal = mrOk then
      begin
        if ENPlanWork2ActFailureObj<>nil then
            //TempENPlanWork2ActFailure.add(ENPlanWork2ActFailureObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPlanWork2ActFailureEdit.Free;
      frmENPlanWork2ActFailureEdit:=nil;
    end;
  finally
    ENPlanWork2ActFailureObj.Free;
  end;
end;

procedure TfrmENPlanWork2ActFailureShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPlanWork2ActFailureShow.actFilterExecute(Sender: TObject);
begin
{frmENPlanWork2ActFailureFilterEdit:=TfrmENPlanWork2ActFailureFilterEdit.Create(Application, dsInsert);
  try
    ENPlanWork2ActFailureFilterObj := ENPlanWork2ActFailureFilter.Create;
    SetNullIntProps(ENPlanWork2ActFailureFilterObj);
    SetNullXSProps(ENPlanWork2ActFailureFilterObj);

    if frmENPlanWork2ActFailureFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPlanWork2ActFailureFilter.Create;
      FilterObject := ENPlanWork2ActFailureFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPlanWork2ActFailureFilterEdit.Free;
    frmENPlanWork2ActFailureFilterEdit:=nil;
  end;}
end;

procedure TfrmENPlanWork2ActFailureShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.