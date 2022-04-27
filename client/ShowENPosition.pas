
unit ShowENPosition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENPositionController, AdvObj ;


type
  TfrmENPositionShow = class(TChildForm)  
  HTTPRIOENPosition: THTTPRIO;
    ImageList1: TImageList;
    sgENPosition: TAdvStringGrid;
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
procedure sgENPositionTopLeftChanged(Sender: TObject);
procedure sgENPositionDblClick(Sender: TObject);
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
 frmENPositionShow : TfrmENPositionShow;
 // ENPositionObj: ENPosition;
 // ENPositionFilterObj: ENPositionFilter;
  
  
implementation

uses Main, EditENPosition, EditENPositionFilter;


{$R *.dfm}

var
  //frmENPositionShow : TfrmENPositionShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENPositionHeaders: array [1..2] of String =
        ( 'Код'
          ,'Посада'
        );
   

procedure TfrmENPositionShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENPositionShow:=nil;
    inherited;
  end;


procedure TfrmENPositionShow.FormShow(Sender: TObject);
var
  TempENPosition: ENPositionControllerSoapPort;
  i: Integer;
  ENPositionList: ENPositionShortList;
  begin
  SetGridHeaders(ENPositionHeaders, sgENPosition.ColumnHeaders);
  ColCount:=100;
  TempENPosition :=  HTTPRIOENPosition as ENPositionControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENPositionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPositionList := TempENPosition.getScrollableFilteredList(ENPositionFilter(FilterObject),0,ColCount);


  LastCount:=High(ENPositionList.list);

  if LastCount > -1 then
     sgENPosition.RowCount:=LastCount+2
  else
     sgENPosition.RowCount:=2;

   with sgENPosition do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPositionList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENPositionList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENPositionList.list[i].name;
        LastRow:=i+1;
        sgENPosition.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENPosition.Row:=1;
end;

procedure TfrmENPositionShow.sgENPositionTopLeftChanged(Sender: TObject);
var
  TempENPosition: ENPositionControllerSoapPort;
  i,CurrentRow: Integer;
  ENPositionList: ENPositionShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENPosition.TopRow + sgENPosition.VisibleRowCount) = ColCount
  then
    begin
      TempENPosition :=  HTTPRIOENPosition as ENPositionControllerSoapPort;
      CurrentRow:=sgENPosition.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENPositionFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENPositionList := TempENPosition.getScrollableFilteredList(ENPositionFilter(FilterObject),ColCount-1, 100);



  sgENPosition.RowCount:=sgENPosition.RowCount+100;
  LastCount:=High(ENPositionList.list);
  with sgENPosition do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENPositionList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENPositionList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENPositionList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENPosition.Row:=CurrentRow-5;
   sgENPosition.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENPositionShow.sgENPositionDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENPosition,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENPositionShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENPosition.RowCount-1 do
   for j:=0 to sgENPosition.ColCount-1 do
     sgENPosition.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENPositionShow.actViewExecute(Sender: TObject);
Var TempENPosition: ENPositionControllerSoapPort;
begin
 TempENPosition := HTTPRIOENPosition as ENPositionControllerSoapPort;
   try
     ENPositionObj := TempENPosition.getObject(StrToInt(sgENPosition.Cells[0,sgENPosition.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPositionEdit:=TfrmENPositionEdit.Create(Application, dsView);
  try
    frmENPositionEdit.ShowModal;
  finally
    frmENPositionEdit.Free;
    frmENPositionEdit:=nil;
  end;
end;

procedure TfrmENPositionShow.actEditExecute(Sender: TObject);
Var TempENPosition: ENPositionControllerSoapPort;
begin
 TempENPosition := HTTPRIOENPosition as ENPositionControllerSoapPort;
   try
     ENPositionObj := TempENPosition.getObject(StrToInt(sgENPosition.Cells[0,sgENPosition.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENPositionEdit:=TfrmENPositionEdit.Create(Application, dsEdit);
  try
    if frmENPositionEdit.ShowModal= mrOk then
      begin
        //TempENPosition.save(ENPositionObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENPositionEdit.Free;
    frmENPositionEdit:=nil;
  end;
end;

procedure TfrmENPositionShow.actDeleteExecute(Sender: TObject);
Var TempENPosition: ENPositionControllerSoapPort;
  ObjCode: Integer;
begin
 TempENPosition := HTTPRIOENPosition as ENPositionControllerSoapPort;
   try
     ObjCode := StrToInt(sgENPosition.Cells[0,sgENPosition.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Штатні посади) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENPosition.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENPositionShow.actInsertExecute(Sender: TObject);
Var TempENPosition: ENPositionControllerSoapPort;
begin
  TempENPosition := HTTPRIOENPosition as ENPositionControllerSoapPort;
  ENPositionObj:=ENPosition.Create;



  try
    frmENPositionEdit:=TfrmENPositionEdit.Create(Application, dsInsert);
    try
      if frmENPositionEdit.ShowModal = mrOk then
      begin
        if ENPositionObj<>nil then
            //TempENPosition.add(ENPositionObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENPositionEdit.Free;
      frmENPositionEdit:=nil;
    end;
  finally
    ENPositionObj.Free;
  end;
end;

procedure TfrmENPositionShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENPositionShow.actFilterExecute(Sender: TObject);
begin
{frmENPositionFilterEdit:=TfrmENPositionFilterEdit.Create(Application, dsEdit);
  try
    ENPositionFilterObj := ENPositionFilter.Create;
    SetNullIntProps(ENPositionFilterObj);
    SetNullXSProps(ENPositionFilterObj);

    if frmENPositionFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENPositionFilter.Create;
      FilterObject := ENPositionFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENPositionFilterEdit.Free;
    frmENPositionFilterEdit:=nil;
  end;}
end;

procedure TfrmENPositionShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.