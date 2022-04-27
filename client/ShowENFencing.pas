
unit ShowENFencing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENFencingController ;


type
  TfrmENFencingShow = class(TChildForm)  
  HTTPRIOENFencing: THTTPRIO;
    ImageList1: TImageList;
    sgENFencing: TAdvStringGrid;
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
procedure sgENFencingTopLeftChanged(Sender: TObject);
procedure sgENFencingDblClick(Sender: TObject);
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
 // ENFencingObj: ENFencing;
 // ENFencingFilterObj: ENFencingFilter;
  
  
implementation

uses Main, EditENFencing, EditENFencingFilter;


{$R *.dfm}

var
  //frmENFencingShow : TfrmENFencingShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENFencingHeaders: array [1..2] of String =
        ( 'Код'
          ,'Ограда'
        );
   

procedure TfrmENFencingShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENFencingShow:=nil;
    inherited;
  end;


procedure TfrmENFencingShow.FormShow(Sender: TObject);
var
  TempENFencing: ENFencingControllerSoapPort;
  i: Integer;
  ENFencingList: ENFencingShortList;
  begin
  SetGridHeaders(ENFencingHeaders, sgENFencing.ColumnHeaders);
  ColCount:=100;
  TempENFencing :=  HTTPRIOENFencing as ENFencingControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENFencingFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFencingList := TempENFencing.getScrollableFilteredList(ENFencingFilter(FilterObject),0,ColCount);


  LastCount:=High(ENFencingList.list);

  if LastCount > -1 then
     sgENFencing.RowCount:=LastCount+2
  else
     sgENFencing.RowCount:=2;

   with sgENFencing do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFencingList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENFencingList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENFencingList.list[i].name;
        LastRow:=i+1;
        sgENFencing.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENFencing.Row:=1;
end;

procedure TfrmENFencingShow.sgENFencingTopLeftChanged(Sender: TObject);
var
  TempENFencing: ENFencingControllerSoapPort;
  i,CurrentRow: Integer;
  ENFencingList: ENFencingShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENFencing.TopRow + sgENFencing.VisibleRowCount) = ColCount
  then
    begin
      TempENFencing :=  HTTPRIOENFencing as ENFencingControllerSoapPort;
      CurrentRow:=sgENFencing.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENFencingFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENFencingList := TempENFencing.getScrollableFilteredList(ENFencingFilter(FilterObject),ColCount-1, 100);



  sgENFencing.RowCount:=sgENFencing.RowCount+100;
  LastCount:=High(ENFencingList.list);
  with sgENFencing do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENFencingList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENFencingList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENFencingList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENFencing.Row:=CurrentRow-5;
   sgENFencing.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENFencingShow.sgENFencingDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENFencing,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENFencingShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENFencing.RowCount-1 do
   for j:=0 to sgENFencing.ColCount-1 do
     sgENFencing.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENFencingShow.actViewExecute(Sender: TObject);
Var TempENFencing: ENFencingControllerSoapPort;
begin
 TempENFencing := HTTPRIOENFencing as ENFencingControllerSoapPort;
   try
     ENFencingObj := TempENFencing.getObject(StrToInt(sgENFencing.Cells[0,sgENFencing.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFencingEdit:=TfrmENFencingEdit.Create(Application, dsView);
  try
    frmENFencingEdit.ShowModal;
  finally
    frmENFencingEdit.Free;
    frmENFencingEdit:=nil;
  end;
end;

procedure TfrmENFencingShow.actEditExecute(Sender: TObject);
Var TempENFencing: ENFencingControllerSoapPort;
begin
 TempENFencing := HTTPRIOENFencing as ENFencingControllerSoapPort;
   try
     ENFencingObj := TempENFencing.getObject(StrToInt(sgENFencing.Cells[0,sgENFencing.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENFencingEdit:=TfrmENFencingEdit.Create(Application, dsEdit);
  try
    if frmENFencingEdit.ShowModal= mrOk then
      begin
        //TempENFencing.save(ENFencingObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENFencingEdit.Free;
    frmENFencingEdit:=nil;
  end;
end;

procedure TfrmENFencingShow.actDeleteExecute(Sender: TObject);
Var TempENFencing: ENFencingControllerSoapPort;
  ObjCode: Integer;
begin
 TempENFencing := HTTPRIOENFencing as ENFencingControllerSoapPort;
   try
     ObjCode := StrToInt(sgENFencing.Cells[0,sgENFencing.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Наличие ограды) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENFencing.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENFencingShow.actInsertExecute(Sender: TObject);
Var TempENFencing: ENFencingControllerSoapPort;
begin
  TempENFencing := HTTPRIOENFencing as ENFencingControllerSoapPort;
  ENFencingObj:=ENFencing.Create;



  try
    frmENFencingEdit:=TfrmENFencingEdit.Create(Application, dsInsert);
    try
      if frmENFencingEdit.ShowModal = mrOk then
      begin
        if ENFencingObj<>nil then
            //TempENFencing.add(ENFencingObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENFencingEdit.Free;
      frmENFencingEdit:=nil;
    end;
  finally
    ENFencingObj.Free;
  end;
end;

procedure TfrmENFencingShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENFencingShow.actFilterExecute(Sender: TObject);
begin
{frmENFencingFilterEdit:=TfrmENFencingFilterEdit.Create(Application, dsInsert);
  try
    ENFencingFilterObj := ENFencingFilter.Create;
    SetNullIntProps(ENFencingFilterObj);
    SetNullXSProps(ENFencingFilterObj);

    if frmENFencingFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENFencingFilter.Create;
      FilterObject := ENFencingFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENFencingFilterEdit.Free;
    frmENFencingFilterEdit:=nil;
  end;}
end;

procedure TfrmENFencingShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.