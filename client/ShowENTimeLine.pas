
unit ShowENTimeLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTimeLineController ;


type
  TfrmENTimeLineShow = class(TChildForm)  
  HTTPRIOENTimeLine: THTTPRIO;
    ImageList1: TImageList;
    sgENTimeLine: TAdvStringGrid;
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
procedure sgENTimeLineTopLeftChanged(Sender: TObject);
procedure sgENTimeLineDblClick(Sender: TObject);
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
 // ENTimeLineObj: ENTimeLine;
 // ENTimeLineFilterObj: ENTimeLineFilter;
  
  
implementation

uses Main, EditENTimeLine, EditENTimeLineFilter;


{$R *.dfm}

var
  //frmENTimeLineShow : TfrmENTimeLineShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTimeLineHeaders: array [1..6] of String =
        ( 'Код'
          ,'Дата'
          ,'Час початку виконання робіт'
          ,'Час закінчення виконання робіт'
          ,'Час перевезення до объекту'
          ,'Час перевезення з объекту'
        );
   

procedure TfrmENTimeLineShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTimeLineShow:=nil;
    inherited;
  end;


procedure TfrmENTimeLineShow.FormShow(Sender: TObject);
var
  TempENTimeLine: ENTimeLineControllerSoapPort;
  i: Integer;
  ENTimeLineList: ENTimeLineShortList;
  begin
  SetGridHeaders(ENTimeLineHeaders, sgENTimeLine.ColumnHeaders);
  ColCount:=100;
  TempENTimeLine :=  HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTimeLineFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTimeLineList := TempENTimeLine.getScrollableFilteredList(ENTimeLineFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTimeLineList.list);

  if LastCount > -1 then
     sgENTimeLine.RowCount:=LastCount+2
  else
     sgENTimeLine.RowCount:=2;

   with sgENTimeLine do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTimeLineList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTimeLineList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENTimeLineList.list[i].dateGen = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENTimeLineList.list[i].dateGen);
        if ENTimeLineList.list[i].timeStart = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENTimeLineList.list[i].timeStart);
        if ENTimeLineList.list[i].timeFinal = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDateTimeWithDate2String(ENTimeLineList.list[i].timeFinal);
        if ENTimeLineList.list[i].timeMoveToObject = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENTimeLineList.list[i].timeMoveToObject);
        if ENTimeLineList.list[i].timeMoveOfObject = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDateTimeWithDate2String(ENTimeLineList.list[i].timeMoveOfObject);
        LastRow:=i+1;
        sgENTimeLine.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTimeLine.Row:=1;
end;

procedure TfrmENTimeLineShow.sgENTimeLineTopLeftChanged(Sender: TObject);
var
  TempENTimeLine: ENTimeLineControllerSoapPort;
  i,CurrentRow: Integer;
  ENTimeLineList: ENTimeLineShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTimeLine.TopRow + sgENTimeLine.VisibleRowCount) = ColCount
  then
    begin
      TempENTimeLine :=  HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
      CurrentRow:=sgENTimeLine.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTimeLineFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENTimeLineList := TempENTimeLine.getScrollableFilteredList(ENTimeLineFilter(FilterObject),ColCount-1, 100);



  sgENTimeLine.RowCount:=sgENTimeLine.RowCount+100;
  LastCount:=High(ENTimeLineList.list);
  with sgENTimeLine do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTimeLineList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTimeLineList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENTimeLineList.list[i].dateGen = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENTimeLineList.list[i].dateGen);
        if ENTimeLineList.list[i].timeStart = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENTimeLineList.list[i].timeStart);		  
        if ENTimeLineList.list[i].timeFinal = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDateTimeWithDate2String(ENTimeLineList.list[i].timeFinal);		  
        if ENTimeLineList.list[i].timeMoveToObject = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(ENTimeLineList.list[i].timeMoveToObject);		  
        if ENTimeLineList.list[i].timeMoveOfObject = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDateTimeWithDate2String(ENTimeLineList.list[i].timeMoveOfObject);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTimeLine.Row:=CurrentRow-5;
   sgENTimeLine.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTimeLineShow.sgENTimeLineDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTimeLine,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTimeLineShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTimeLine.RowCount-1 do
   for j:=0 to sgENTimeLine.ColCount-1 do
     sgENTimeLine.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTimeLineShow.actViewExecute(Sender: TObject);
Var TempENTimeLine: ENTimeLineControllerSoapPort;
begin
 TempENTimeLine := HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
   try
     ENTimeLineObj := TempENTimeLine.getObject(StrToInt(sgENTimeLine.Cells[0,sgENTimeLine.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTimeLineEdit:=TfrmENTimeLineEdit.Create(Application, dsView);
  try
    frmENTimeLineEdit.ShowModal;
  finally
    frmENTimeLineEdit.Free;
    frmENTimeLineEdit:=nil;
  end;
end;

procedure TfrmENTimeLineShow.actEditExecute(Sender: TObject);
Var TempENTimeLine: ENTimeLineControllerSoapPort;
begin
 TempENTimeLine := HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
   try
     ENTimeLineObj := TempENTimeLine.getObject(StrToInt(sgENTimeLine.Cells[0,sgENTimeLine.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTimeLineEdit:=TfrmENTimeLineEdit.Create(Application, dsEdit);
  try
    if frmENTimeLineEdit.ShowModal= mrOk then
      begin
        //TempENTimeLine.save(ENTimeLineObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTimeLineEdit.Free;
    frmENTimeLineEdit:=nil;
  end;
end;

procedure TfrmENTimeLineShow.actDeleteExecute(Sender: TObject);
Var TempENTimeLine: ENTimeLineControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTimeLine := HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTimeLine.Cells[0,sgENTimeLine.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Резервування часу для виконання робіт по бригадам) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTimeLine.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTimeLineShow.actInsertExecute(Sender: TObject);
Var TempENTimeLine: ENTimeLineControllerSoapPort;
begin
  TempENTimeLine := HTTPRIOENTimeLine as ENTimeLineControllerSoapPort;
  ENTimeLineObj:=ENTimeLine.Create;

   //ENTimeLineObj.dateGen:= TXSDate.Create;
   //ENTimeLineObj.timeStart:= TXSDateTime.Create;
   
   //ENTimeLineObj.timeFinal:= TXSDateTime.Create;
   
   //ENTimeLineObj.timeMoveToObject:= TXSDateTime.Create;
   
   //ENTimeLineObj.timeMoveOfObject:= TXSDateTime.Create;
   


  try
    frmENTimeLineEdit:=TfrmENTimeLineEdit.Create(Application, dsInsert);
    try
      if frmENTimeLineEdit.ShowModal = mrOk then
      begin
        if ENTimeLineObj<>nil then
            //TempENTimeLine.add(ENTimeLineObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTimeLineEdit.Free;
      frmENTimeLineEdit:=nil;
    end;
  finally
    ENTimeLineObj.Free;
  end;
end;

procedure TfrmENTimeLineShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTimeLineShow.actFilterExecute(Sender: TObject);
begin
{frmENTimeLineFilterEdit:=TfrmENTimeLineFilterEdit.Create(Application, dsInsert);
  try
    ENTimeLineFilterObj := ENTimeLineFilter.Create;
    SetNullIntProps(ENTimeLineFilterObj);
    SetNullXSProps(ENTimeLineFilterObj);

    if frmENTimeLineFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTimeLineFilter.Create;
      FilterObject := ENTimeLineFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTimeLineFilterEdit.Free;
    frmENTimeLineFilterEdit:=nil;
  end;}
end;

procedure TfrmENTimeLineShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.