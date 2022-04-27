
unit ShowENDestinationPoint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDestinationPointController, AdvObj ;


type
  TfrmENDestinationPointShow = class(TChildForm)  
  HTTPRIOENDestinationPoint: THTTPRIO;
    ImageList1: TImageList;
    sgENDestinationPoint: TAdvStringGrid;
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
procedure sgENDestinationPointTopLeftChanged(Sender: TObject);
procedure sgENDestinationPointDblClick(Sender: TObject);
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
 frmENDestinationPointShow : TfrmENDestinationPointShow;
 // ENDestinationPointObj: ENDestinationPoint;
 // ENDestinationPointFilterObj: ENDestinationPointFilter;
  
  
implementation

uses Main, EditENDestinationPoint, EditENDestinationPointFilter;


{$R *.dfm}

var
  //frmENDestinationPointShow : TfrmENDestinationPointShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDestinationPointHeaders: array [1..6] of String =
        ( 'Код'
          ,'Найменування'
          ,'Дата зміни'
          ,'користувач'
          ,'код елементу'
          ,'Підрозділ'
        );
   

procedure TfrmENDestinationPointShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDestinationPointShow:=nil;
    inherited;
  end;


procedure TfrmENDestinationPointShow.FormShow(Sender: TObject);
var
  TempENDestinationPoint: ENDestinationPointControllerSoapPort;
  i: Integer;
  ENDestinationPointList: ENDestinationPointShortList;
  begin
  SetGridHeaders(ENDestinationPointHeaders, sgENDestinationPoint.ColumnHeaders);
  ColCount:=100;
  TempENDestinationPoint :=  HTTPRIOENDestinationPoint as ENDestinationPointControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDestinationPointFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDestinationPointList := TempENDestinationPoint.getScrollableFilteredList(ENDestinationPointFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDestinationPointList.list);

  if LastCount > -1 then
     sgENDestinationPoint.RowCount:=LastCount+2
  else
     sgENDestinationPoint.RowCount:=2;

   with sgENDestinationPoint do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDestinationPointList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDestinationPointList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENDestinationPointList.list[i].name;

        if ENDestinationPointList.list[i].dateEdit = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDateTimeWithDate2String(ENDestinationPointList.list[i].dateEdit);
        Cells[3,i+1] := ENDestinationPointList.list[i].userGen;

        if ENDestinationPointList.list[i].elementRefCode <> Low(Integer) then
          Cells[4,i+1] := IntToStr(ENDestinationPointList.list[i].elementRefCode)
        else
          Cells[4,i+1] := '';

        Cells[5,i+1] := ENDestinationPointList.list[i].departmentRefShortName;

        LastRow:=i+1;
        sgENDestinationPoint.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDestinationPoint.Row:=1;
end;

procedure TfrmENDestinationPointShow.sgENDestinationPointTopLeftChanged(Sender: TObject);
var
  TempENDestinationPoint: ENDestinationPointControllerSoapPort;
  i,CurrentRow: Integer;
  ENDestinationPointList: ENDestinationPointShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDestinationPoint.TopRow + sgENDestinationPoint.VisibleRowCount) = ColCount
  then
    begin
      TempENDestinationPoint :=  HTTPRIOENDestinationPoint as ENDestinationPointControllerSoapPort;
      CurrentRow:=sgENDestinationPoint.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDestinationPointFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDestinationPointList := TempENDestinationPoint.getScrollableFilteredList(ENDestinationPointFilter(FilterObject),ColCount-1, 100);



  sgENDestinationPoint.RowCount:=sgENDestinationPoint.RowCount+100;
  LastCount:=High(ENDestinationPointList.list);
  with sgENDestinationPoint do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDestinationPointList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDestinationPointList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENDestinationPointList.list[i].name;

        if ENDestinationPointList.list[i].dateEdit = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDateTimeWithDate2String(ENDestinationPointList.list[i].dateEdit);
        Cells[3,i+CurrentRow] := ENDestinationPointList.list[i].userGen;

        if ENDestinationPointList.list[i].elementRefCode <> Low(Integer) then
          Cells[4,i+CurrentRow] := IntToStr(ENDestinationPointList.list[i].elementRefCode)
        else
          Cells[4,i+CurrentRow] := '';

        Cells[5,i+CurrentRow] := ENDestinationPointList.list[i].departmentRefShortName;

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDestinationPoint.Row:=CurrentRow-5;
   sgENDestinationPoint.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDestinationPointShow.sgENDestinationPointDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDestinationPoint,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDestinationPointShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDestinationPoint.RowCount-1 do
   for j:=0 to sgENDestinationPoint.ColCount-1 do
     sgENDestinationPoint.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDestinationPointShow.actViewExecute(Sender: TObject);
Var TempENDestinationPoint: ENDestinationPointControllerSoapPort;
begin
 TempENDestinationPoint := HTTPRIOENDestinationPoint as ENDestinationPointControllerSoapPort;
   try
     ENDestinationPointObj := TempENDestinationPoint.getObject(StrToInt(sgENDestinationPoint.Cells[0,sgENDestinationPoint.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDestinationPointEdit:=TfrmENDestinationPointEdit.Create(Application, dsView);
  try
    frmENDestinationPointEdit.ShowModal;
  finally
    frmENDestinationPointEdit.Free;
    frmENDestinationPointEdit:=nil;
  end;
end;

procedure TfrmENDestinationPointShow.actEditExecute(Sender: TObject);
Var TempENDestinationPoint: ENDestinationPointControllerSoapPort;
begin
 TempENDestinationPoint := HTTPRIOENDestinationPoint as ENDestinationPointControllerSoapPort;
   try
     ENDestinationPointObj := TempENDestinationPoint.getObject(StrToInt(sgENDestinationPoint.Cells[0,sgENDestinationPoint.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDestinationPointEdit:=TfrmENDestinationPointEdit.Create(Application, dsEdit);
  try
    if frmENDestinationPointEdit.ShowModal= mrOk then
      begin
        //TempENDestinationPoint.save(ENDestinationPointObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDestinationPointEdit.Free;
    frmENDestinationPointEdit:=nil;
  end;
end;

procedure TfrmENDestinationPointShow.actDeleteExecute(Sender: TObject);
Var TempENDestinationPoint: ENDestinationPointControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDestinationPoint := HTTPRIOENDestinationPoint as ENDestinationPointControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDestinationPoint.Cells[0,sgENDestinationPoint.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Пункт призначення) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDestinationPoint.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDestinationPointShow.actInsertExecute(Sender: TObject);
// Var TempENDestinationPoint: ENDestinationPointControllerSoapPort; 
begin
  // TempENDestinationPoint := HTTPRIOENDestinationPoint as ENDestinationPointControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDestinationPointObj:=ENDestinationPoint.Create;

   //ENDestinationPointObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENDestinationPointEdit:=TfrmENDestinationPointEdit.Create(Application, dsInsert);
    try
      if frmENDestinationPointEdit.ShowModal = mrOk then
      begin
        if ENDestinationPointObj<>nil then
            //TempENDestinationPoint.add(ENDestinationPointObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDestinationPointEdit.Free;
      frmENDestinationPointEdit:=nil;
    end;
  finally
    ENDestinationPointObj.Free;
  end;
end;

procedure TfrmENDestinationPointShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDestinationPointShow.actFilterExecute(Sender: TObject);
begin
frmENDestinationPointFilterEdit:=TfrmENDestinationPointFilterEdit.Create(Application, dsInsert);
  try
    ENDestinationPointFilterObj := ENDestinationPointFilter.Create;
    SetNullIntProps(ENDestinationPointFilterObj);
    SetNullXSProps(ENDestinationPointFilterObj);

    if frmENDestinationPointFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDestinationPointFilter.Create;
      FilterObject := ENDestinationPointFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDestinationPointFilterEdit.Free;
    frmENDestinationPointFilterEdit:=nil;
  end;
end;

procedure TfrmENDestinationPointShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.